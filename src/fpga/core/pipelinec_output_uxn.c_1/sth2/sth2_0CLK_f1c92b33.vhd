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
entity sth2_0CLK_f1c92b33 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sth2_0CLK_f1c92b33;
architecture arch of sth2_0CLK_f1c92b33 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2637_c6_7802]
signal BIN_OP_EQ_uxn_opcodes_h_l2637_c6_7802_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2637_c6_7802_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2637_c6_7802_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2637_c1_30f8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2637_c1_30f8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2637_c1_30f8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2637_c1_30f8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2637_c1_30f8_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2637_c2_5559]
signal t16_MUX_uxn_opcodes_h_l2637_c2_5559_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2637_c2_5559_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2637_c2_5559_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2637_c2_5559_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2637_c2_5559]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_5559_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_5559_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_5559_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_5559_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2637_c2_5559]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_5559_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_5559_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_5559_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_5559_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2637_c2_5559]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_5559_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_5559_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_5559_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_5559_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2637_c2_5559]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_5559_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_5559_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_5559_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_5559_return_output : signed(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2637_c2_5559]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_5559_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_5559_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_5559_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_5559_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2637_c2_5559]
signal result_stack_value_MUX_uxn_opcodes_h_l2637_c2_5559_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2637_c2_5559_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2637_c2_5559_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2637_c2_5559_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2637_c2_5559]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_5559_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_5559_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_5559_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_5559_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l2638_c3_a012[uxn_opcodes_h_l2638_c3_a012]
signal printf_uxn_opcodes_h_l2638_c3_a012_uxn_opcodes_h_l2638_c3_a012_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2642_c11_28fa]
signal BIN_OP_EQ_uxn_opcodes_h_l2642_c11_28fa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2642_c11_28fa_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2642_c11_28fa_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2642_c7_61e3]
signal t16_MUX_uxn_opcodes_h_l2642_c7_61e3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2642_c7_61e3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2642_c7_61e3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2642_c7_61e3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_61e3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_61e3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_61e3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2642_c7_61e3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_61e3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_61e3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_61e3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2642_c7_61e3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_61e3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_61e3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_61e3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2642_c7_61e3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_61e3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_61e3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_61e3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output : signed(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2642_c7_61e3]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_61e3_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_61e3_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_61e3_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2642_c7_61e3]
signal result_stack_value_MUX_uxn_opcodes_h_l2642_c7_61e3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2642_c7_61e3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2642_c7_61e3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2642_c7_61e3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_61e3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_61e3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_61e3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2645_c11_3f26]
signal BIN_OP_EQ_uxn_opcodes_h_l2645_c11_3f26_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2645_c11_3f26_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2645_c11_3f26_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2645_c7_76cd]
signal t16_MUX_uxn_opcodes_h_l2645_c7_76cd_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2645_c7_76cd_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2645_c7_76cd_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2645_c7_76cd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_76cd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_76cd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_76cd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2645_c7_76cd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_76cd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_76cd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_76cd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2645_c7_76cd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_76cd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_76cd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_76cd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2645_c7_76cd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_76cd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_76cd_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_76cd_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output : signed(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2645_c7_76cd]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_76cd_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_76cd_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_76cd_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2645_c7_76cd]
signal result_stack_value_MUX_uxn_opcodes_h_l2645_c7_76cd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2645_c7_76cd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2645_c7_76cd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2645_c7_76cd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_76cd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_76cd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_76cd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2647_c3_2549]
signal CONST_SL_8_uxn_opcodes_h_l2647_c3_2549_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2647_c3_2549_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2650_c11_ee49]
signal BIN_OP_EQ_uxn_opcodes_h_l2650_c11_ee49_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2650_c11_ee49_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2650_c11_ee49_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2650_c7_4b22]
signal t16_MUX_uxn_opcodes_h_l2650_c7_4b22_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2650_c7_4b22_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2650_c7_4b22_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2650_c7_4b22]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4b22_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4b22_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4b22_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2650_c7_4b22]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4b22_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4b22_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4b22_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2650_c7_4b22]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4b22_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4b22_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4b22_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2650_c7_4b22]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4b22_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4b22_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4b22_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output : signed(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2650_c7_4b22]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4b22_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4b22_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4b22_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2650_c7_4b22]
signal result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4b22_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4b22_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4b22_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2650_c7_4b22]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4b22_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4b22_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4b22_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2653_c11_4414]
signal BIN_OP_EQ_uxn_opcodes_h_l2653_c11_4414_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2653_c11_4414_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2653_c11_4414_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2653_c7_80c2]
signal t16_MUX_uxn_opcodes_h_l2653_c7_80c2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2653_c7_80c2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2653_c7_80c2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2653_c7_80c2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_80c2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_80c2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_80c2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2653_c7_80c2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_80c2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_80c2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_80c2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2653_c7_80c2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_80c2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_80c2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_80c2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2653_c7_80c2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_80c2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_80c2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_80c2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output : signed(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2653_c7_80c2]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_80c2_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_80c2_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_80c2_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2653_c7_80c2]
signal result_stack_value_MUX_uxn_opcodes_h_l2653_c7_80c2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2653_c7_80c2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2653_c7_80c2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2653_c7_80c2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_80c2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_80c2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_80c2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2654_c3_5321]
signal BIN_OP_OR_uxn_opcodes_h_l2654_c3_5321_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2654_c3_5321_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2654_c3_5321_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2656_c32_c7f6]
signal BIN_OP_AND_uxn_opcodes_h_l2656_c32_c7f6_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2656_c32_c7f6_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2656_c32_c7f6_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2656_c32_d792]
signal BIN_OP_GT_uxn_opcodes_h_l2656_c32_d792_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2656_c32_d792_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2656_c32_d792_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2656_c32_e3df]
signal MUX_uxn_opcodes_h_l2656_c32_e3df_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2656_c32_e3df_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2656_c32_e3df_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2656_c32_e3df_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2658_c11_70db]
signal BIN_OP_EQ_uxn_opcodes_h_l2658_c11_70db_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2658_c11_70db_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2658_c11_70db_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2658_c7_8618]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_8618_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_8618_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_8618_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_8618_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2658_c7_8618]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_8618_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_8618_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_8618_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_8618_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2658_c7_8618]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_8618_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_8618_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_8618_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_8618_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2658_c7_8618]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_8618_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_8618_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_8618_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_8618_return_output : signed(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2658_c7_8618]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_8618_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_8618_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_8618_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_8618_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2658_c7_8618]
signal result_stack_value_MUX_uxn_opcodes_h_l2658_c7_8618_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2658_c7_8618_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2658_c7_8618_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2658_c7_8618_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2658_c7_8618]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_8618_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_8618_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_8618_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_8618_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2662_c11_82a2]
signal BIN_OP_EQ_uxn_opcodes_h_l2662_c11_82a2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2662_c11_82a2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2662_c11_82a2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2662_c7_f919]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f919_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f919_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f919_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f919_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2662_c7_f919]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f919_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f919_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f919_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f919_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2662_c7_f919]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f919_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f919_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f919_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f919_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2662_c7_f919]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f919_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f919_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f919_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f919_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2662_c7_f919]
signal result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f919_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f919_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f919_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f919_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2662_c7_f919]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f919_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f919_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f919_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f919_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2668_c11_7259]
signal BIN_OP_EQ_uxn_opcodes_h_l2668_c11_7259_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2668_c11_7259_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2668_c11_7259_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2668_c7_e0f3]
signal result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e0f3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e0f3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e0f3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e0f3_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2668_c7_e0f3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e0f3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e0f3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e0f3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e0f3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2668_c7_e0f3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e0f3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e0f3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e0f3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e0f3_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2668_c7_e0f3]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e0f3_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e0f3_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e0f3_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e0f3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2668_c7_e0f3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e0f3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e0f3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e0f3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e0f3_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2670_c34_8b71]
signal CONST_SR_8_uxn_opcodes_h_l2670_c34_8b71_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2670_c34_8b71_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2672_c11_5715]
signal BIN_OP_EQ_uxn_opcodes_h_l2672_c11_5715_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2672_c11_5715_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2672_c11_5715_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2672_c7_805a]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_805a_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_805a_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_805a_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_805a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2672_c7_805a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_805a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_805a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_805a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_805a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2672_c7_805a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_805a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_805a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_805a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_805a_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_6621( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.is_stack_index_flipped := ref_toks_5;
      base.stack_value := ref_toks_6;
      base.is_opc_done := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2637_c6_7802
BIN_OP_EQ_uxn_opcodes_h_l2637_c6_7802 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2637_c6_7802_left,
BIN_OP_EQ_uxn_opcodes_h_l2637_c6_7802_right,
BIN_OP_EQ_uxn_opcodes_h_l2637_c6_7802_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2637_c1_30f8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2637_c1_30f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2637_c1_30f8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2637_c1_30f8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2637_c1_30f8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2637_c1_30f8_return_output);

-- t16_MUX_uxn_opcodes_h_l2637_c2_5559
t16_MUX_uxn_opcodes_h_l2637_c2_5559 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2637_c2_5559_cond,
t16_MUX_uxn_opcodes_h_l2637_c2_5559_iftrue,
t16_MUX_uxn_opcodes_h_l2637_c2_5559_iffalse,
t16_MUX_uxn_opcodes_h_l2637_c2_5559_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_5559
result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_5559 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_5559_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_5559_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_5559_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_5559_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_5559
result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_5559 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_5559_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_5559_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_5559_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_5559_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_5559
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_5559 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_5559_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_5559_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_5559_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_5559_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_5559
result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_5559 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_5559_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_5559_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_5559_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_5559_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_5559
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_5559 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_5559_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_5559_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_5559_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_5559_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2637_c2_5559
result_stack_value_MUX_uxn_opcodes_h_l2637_c2_5559 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2637_c2_5559_cond,
result_stack_value_MUX_uxn_opcodes_h_l2637_c2_5559_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2637_c2_5559_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2637_c2_5559_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_5559
result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_5559 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_5559_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_5559_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_5559_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_5559_return_output);

-- printf_uxn_opcodes_h_l2638_c3_a012_uxn_opcodes_h_l2638_c3_a012
printf_uxn_opcodes_h_l2638_c3_a012_uxn_opcodes_h_l2638_c3_a012 : entity work.printf_uxn_opcodes_h_l2638_c3_a012_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2638_c3_a012_uxn_opcodes_h_l2638_c3_a012_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2642_c11_28fa
BIN_OP_EQ_uxn_opcodes_h_l2642_c11_28fa : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2642_c11_28fa_left,
BIN_OP_EQ_uxn_opcodes_h_l2642_c11_28fa_right,
BIN_OP_EQ_uxn_opcodes_h_l2642_c11_28fa_return_output);

-- t16_MUX_uxn_opcodes_h_l2642_c7_61e3
t16_MUX_uxn_opcodes_h_l2642_c7_61e3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2642_c7_61e3_cond,
t16_MUX_uxn_opcodes_h_l2642_c7_61e3_iftrue,
t16_MUX_uxn_opcodes_h_l2642_c7_61e3_iffalse,
t16_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_61e3
result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_61e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_61e3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_61e3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_61e3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_61e3
result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_61e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_61e3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_61e3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_61e3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_61e3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_61e3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_61e3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_61e3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_61e3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_61e3
result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_61e3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_61e3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_61e3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_61e3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_61e3
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_61e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_61e3_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_61e3_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_61e3_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2642_c7_61e3
result_stack_value_MUX_uxn_opcodes_h_l2642_c7_61e3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2642_c7_61e3_cond,
result_stack_value_MUX_uxn_opcodes_h_l2642_c7_61e3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2642_c7_61e3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_61e3
result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_61e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_61e3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_61e3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_61e3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2645_c11_3f26
BIN_OP_EQ_uxn_opcodes_h_l2645_c11_3f26 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2645_c11_3f26_left,
BIN_OP_EQ_uxn_opcodes_h_l2645_c11_3f26_right,
BIN_OP_EQ_uxn_opcodes_h_l2645_c11_3f26_return_output);

-- t16_MUX_uxn_opcodes_h_l2645_c7_76cd
t16_MUX_uxn_opcodes_h_l2645_c7_76cd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2645_c7_76cd_cond,
t16_MUX_uxn_opcodes_h_l2645_c7_76cd_iftrue,
t16_MUX_uxn_opcodes_h_l2645_c7_76cd_iffalse,
t16_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_76cd
result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_76cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_76cd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_76cd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_76cd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_76cd
result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_76cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_76cd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_76cd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_76cd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_76cd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_76cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_76cd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_76cd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_76cd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_76cd
result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_76cd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_76cd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_76cd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_76cd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_76cd
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_76cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_76cd_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_76cd_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_76cd_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2645_c7_76cd
result_stack_value_MUX_uxn_opcodes_h_l2645_c7_76cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2645_c7_76cd_cond,
result_stack_value_MUX_uxn_opcodes_h_l2645_c7_76cd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2645_c7_76cd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_76cd
result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_76cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_76cd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_76cd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_76cd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2647_c3_2549
CONST_SL_8_uxn_opcodes_h_l2647_c3_2549 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2647_c3_2549_x,
CONST_SL_8_uxn_opcodes_h_l2647_c3_2549_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2650_c11_ee49
BIN_OP_EQ_uxn_opcodes_h_l2650_c11_ee49 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2650_c11_ee49_left,
BIN_OP_EQ_uxn_opcodes_h_l2650_c11_ee49_right,
BIN_OP_EQ_uxn_opcodes_h_l2650_c11_ee49_return_output);

-- t16_MUX_uxn_opcodes_h_l2650_c7_4b22
t16_MUX_uxn_opcodes_h_l2650_c7_4b22 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2650_c7_4b22_cond,
t16_MUX_uxn_opcodes_h_l2650_c7_4b22_iftrue,
t16_MUX_uxn_opcodes_h_l2650_c7_4b22_iffalse,
t16_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4b22
result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4b22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4b22_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4b22_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4b22_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4b22
result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4b22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4b22_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4b22_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4b22_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4b22
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4b22 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4b22_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4b22_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4b22_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4b22
result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4b22 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4b22_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4b22_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4b22_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4b22
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4b22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4b22_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4b22_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4b22_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4b22
result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4b22 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4b22_cond,
result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4b22_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4b22_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4b22
result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4b22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4b22_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4b22_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4b22_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2653_c11_4414
BIN_OP_EQ_uxn_opcodes_h_l2653_c11_4414 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2653_c11_4414_left,
BIN_OP_EQ_uxn_opcodes_h_l2653_c11_4414_right,
BIN_OP_EQ_uxn_opcodes_h_l2653_c11_4414_return_output);

-- t16_MUX_uxn_opcodes_h_l2653_c7_80c2
t16_MUX_uxn_opcodes_h_l2653_c7_80c2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2653_c7_80c2_cond,
t16_MUX_uxn_opcodes_h_l2653_c7_80c2_iftrue,
t16_MUX_uxn_opcodes_h_l2653_c7_80c2_iffalse,
t16_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_80c2
result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_80c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_80c2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_80c2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_80c2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_80c2
result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_80c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_80c2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_80c2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_80c2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_80c2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_80c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_80c2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_80c2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_80c2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_80c2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_80c2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_80c2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_80c2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_80c2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_80c2
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_80c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_80c2_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_80c2_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_80c2_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2653_c7_80c2
result_stack_value_MUX_uxn_opcodes_h_l2653_c7_80c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2653_c7_80c2_cond,
result_stack_value_MUX_uxn_opcodes_h_l2653_c7_80c2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2653_c7_80c2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_80c2
result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_80c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_80c2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_80c2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_80c2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2654_c3_5321
BIN_OP_OR_uxn_opcodes_h_l2654_c3_5321 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2654_c3_5321_left,
BIN_OP_OR_uxn_opcodes_h_l2654_c3_5321_right,
BIN_OP_OR_uxn_opcodes_h_l2654_c3_5321_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2656_c32_c7f6
BIN_OP_AND_uxn_opcodes_h_l2656_c32_c7f6 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2656_c32_c7f6_left,
BIN_OP_AND_uxn_opcodes_h_l2656_c32_c7f6_right,
BIN_OP_AND_uxn_opcodes_h_l2656_c32_c7f6_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2656_c32_d792
BIN_OP_GT_uxn_opcodes_h_l2656_c32_d792 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2656_c32_d792_left,
BIN_OP_GT_uxn_opcodes_h_l2656_c32_d792_right,
BIN_OP_GT_uxn_opcodes_h_l2656_c32_d792_return_output);

-- MUX_uxn_opcodes_h_l2656_c32_e3df
MUX_uxn_opcodes_h_l2656_c32_e3df : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2656_c32_e3df_cond,
MUX_uxn_opcodes_h_l2656_c32_e3df_iftrue,
MUX_uxn_opcodes_h_l2656_c32_e3df_iffalse,
MUX_uxn_opcodes_h_l2656_c32_e3df_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2658_c11_70db
BIN_OP_EQ_uxn_opcodes_h_l2658_c11_70db : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2658_c11_70db_left,
BIN_OP_EQ_uxn_opcodes_h_l2658_c11_70db_right,
BIN_OP_EQ_uxn_opcodes_h_l2658_c11_70db_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_8618
result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_8618 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_8618_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_8618_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_8618_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_8618_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_8618
result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_8618 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_8618_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_8618_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_8618_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_8618_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_8618
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_8618 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_8618_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_8618_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_8618_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_8618_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_8618
result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_8618 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_8618_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_8618_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_8618_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_8618_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_8618
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_8618 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_8618_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_8618_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_8618_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_8618_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2658_c7_8618
result_stack_value_MUX_uxn_opcodes_h_l2658_c7_8618 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2658_c7_8618_cond,
result_stack_value_MUX_uxn_opcodes_h_l2658_c7_8618_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2658_c7_8618_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2658_c7_8618_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_8618
result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_8618 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_8618_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_8618_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_8618_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_8618_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2662_c11_82a2
BIN_OP_EQ_uxn_opcodes_h_l2662_c11_82a2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2662_c11_82a2_left,
BIN_OP_EQ_uxn_opcodes_h_l2662_c11_82a2_right,
BIN_OP_EQ_uxn_opcodes_h_l2662_c11_82a2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f919
result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f919 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f919_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f919_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f919_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f919_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f919
result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f919 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f919_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f919_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f919_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f919_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f919
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f919 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f919_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f919_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f919_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f919_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f919
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f919 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f919_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f919_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f919_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f919_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f919
result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f919 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f919_cond,
result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f919_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f919_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f919_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f919
result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f919 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f919_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f919_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f919_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f919_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2668_c11_7259
BIN_OP_EQ_uxn_opcodes_h_l2668_c11_7259 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2668_c11_7259_left,
BIN_OP_EQ_uxn_opcodes_h_l2668_c11_7259_right,
BIN_OP_EQ_uxn_opcodes_h_l2668_c11_7259_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e0f3
result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e0f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e0f3_cond,
result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e0f3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e0f3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e0f3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e0f3
result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e0f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e0f3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e0f3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e0f3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e0f3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e0f3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e0f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e0f3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e0f3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e0f3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e0f3_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e0f3
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e0f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e0f3_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e0f3_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e0f3_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e0f3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e0f3
result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e0f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e0f3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e0f3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e0f3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e0f3_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2670_c34_8b71
CONST_SR_8_uxn_opcodes_h_l2670_c34_8b71 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2670_c34_8b71_x,
CONST_SR_8_uxn_opcodes_h_l2670_c34_8b71_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2672_c11_5715
BIN_OP_EQ_uxn_opcodes_h_l2672_c11_5715 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2672_c11_5715_left,
BIN_OP_EQ_uxn_opcodes_h_l2672_c11_5715_right,
BIN_OP_EQ_uxn_opcodes_h_l2672_c11_5715_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_805a
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_805a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_805a_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_805a_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_805a_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_805a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_805a
result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_805a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_805a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_805a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_805a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_805a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_805a
result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_805a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_805a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_805a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_805a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_805a_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2637_c6_7802_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2637_c1_30f8_return_output,
 t16_MUX_uxn_opcodes_h_l2637_c2_5559_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_5559_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_5559_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_5559_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_5559_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_5559_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2637_c2_5559_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_5559_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2642_c11_28fa_return_output,
 t16_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2645_c11_3f26_return_output,
 t16_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output,
 CONST_SL_8_uxn_opcodes_h_l2647_c3_2549_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2650_c11_ee49_return_output,
 t16_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2653_c11_4414_return_output,
 t16_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2654_c3_5321_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2656_c32_c7f6_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2656_c32_d792_return_output,
 MUX_uxn_opcodes_h_l2656_c32_e3df_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2658_c11_70db_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_8618_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_8618_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_8618_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_8618_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_8618_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2658_c7_8618_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_8618_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2662_c11_82a2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f919_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f919_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f919_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f919_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f919_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f919_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2668_c11_7259_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e0f3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e0f3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e0f3_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e0f3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e0f3_return_output,
 CONST_SR_8_uxn_opcodes_h_l2670_c34_8b71_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2672_c11_5715_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_805a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_805a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_805a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2637_c6_7802_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2637_c6_7802_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2637_c6_7802_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2637_c1_30f8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2637_c1_30f8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2637_c1_30f8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2637_c1_30f8_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2637_c2_5559_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2637_c2_5559_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2637_c2_5559_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2637_c2_5559_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_5559_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_5559_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_5559_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_5559_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_5559_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_5559_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_5559_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_5559_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_5559_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2639_c3_f713 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_5559_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_5559_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_5559_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_5559_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_5559_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_5559_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_5559_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_5559_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_5559_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_5559_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_5559_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2637_c2_5559_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2637_c2_5559_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2637_c2_5559_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2637_c2_5559_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_5559_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_5559_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_5559_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_5559_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2638_c3_a012_uxn_opcodes_h_l2638_c3_a012_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2642_c11_28fa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2642_c11_28fa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2642_c11_28fa_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2642_c7_61e3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2642_c7_61e3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2642_c7_61e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_61e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_61e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_61e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_61e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_61e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_61e3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_61e3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2643_c3_746e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_61e3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_61e3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_61e3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_61e3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_61e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_61e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_61e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_61e3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2642_c7_61e3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2642_c7_61e3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2642_c7_61e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_61e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_61e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_61e3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_3f26_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_3f26_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_3f26_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2645_c7_76cd_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2645_c7_76cd_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2645_c7_76cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_76cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_76cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_76cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_76cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_76cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_76cd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_76cd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2648_c3_fef1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_76cd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_76cd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_76cd_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_76cd_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_76cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_76cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_76cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_76cd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2645_c7_76cd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2645_c7_76cd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2645_c7_76cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_76cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_76cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_76cd_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2647_c3_2549_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2647_c3_2549_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2650_c11_ee49_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2650_c11_ee49_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2650_c11_ee49_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2650_c7_4b22_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2650_c7_4b22_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2650_c7_4b22_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4b22_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4b22_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4b22_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4b22_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4b22_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4b22_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4b22_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2651_c3_4052 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4b22_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4b22_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4b22_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4b22_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4b22_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4b22_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4b22_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4b22_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4b22_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4b22_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4b22_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4b22_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4b22_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4b22_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_4414_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_4414_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_4414_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2653_c7_80c2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2653_c7_80c2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2653_c7_80c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_80c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_80c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_8618_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_80c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_80c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_80c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_8618_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_80c2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_80c2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_80c2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_8618_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_80c2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_80c2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_80c2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_8618_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_80c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_80c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_80c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_8618_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_80c2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2653_c7_80c2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2653_c7_80c2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2658_c7_8618_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2653_c7_80c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_80c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_80c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_8618_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_80c2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2654_c3_5321_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2654_c3_5321_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2654_c3_5321_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2656_c32_e3df_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2656_c32_e3df_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2656_c32_e3df_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2656_c32_c7f6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2656_c32_c7f6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2656_c32_c7f6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2656_c32_d792_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2656_c32_d792_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2656_c32_d792_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2656_c32_e3df_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_70db_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_70db_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_70db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_8618_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_8618_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f919_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_8618_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_8618_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_8618_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f919_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_8618_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_8618_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_8618_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f919_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_8618_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_8618_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2660_c3_6165 : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_8618_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_8618_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_8618_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_8618_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f919_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_8618_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2658_c7_8618_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2658_c7_8618_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f919_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2658_c7_8618_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_8618_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_8618_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f919_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_8618_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2662_c11_82a2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2662_c11_82a2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2662_c11_82a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f919_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f919_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e0f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f919_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f919_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f919_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f919_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f919_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2665_c3_ee4d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f919_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e0f3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f919_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f919_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f919_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e0f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f919_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f919_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f919_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e0f3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f919_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f919_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f919_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e0f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f919_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2666_c24_8a95_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_7259_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_7259_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_7259_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e0f3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e0f3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e0f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e0f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e0f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_805a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e0f3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e0f3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2669_c3_4350 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e0f3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e0f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e0f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e0f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_805a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e0f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e0f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e0f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_805a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e0f3_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2670_c34_8b71_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2670_c34_8b71_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2670_c24_8b4b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_5715_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_5715_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_5715_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_805a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_805a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_805a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_805a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_805a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_805a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_805a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_805a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_805a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2645_l2672_l2642_l2668_l2637_l2658_l2653_l2650_DUPLICATE_d754_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2645_l2642_l2637_l2662_l2658_l2650_DUPLICATE_0ef3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2645_l2642_l2637_l2658_l2650_DUPLICATE_f5e2_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2645_l2672_l2642_l2668_l2637_l2662_l2653_l2650_DUPLICATE_0ff7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2645_l2642_l2668_l2637_l2658_l2653_l2650_DUPLICATE_5094_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2645_l2672_l2642_l2668_l2662_l2658_l2653_l2650_DUPLICATE_b365_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2646_l2654_DUPLICATE_48e9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2658_l2653_l2668_DUPLICATE_a136_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6621_uxn_opcodes_h_l2678_l2633_DUPLICATE_f0d1_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2643_c3_746e := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_61e3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2643_c3_746e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2651_c3_4052 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4b22_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2651_c3_4052;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_3f26_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_805a_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2665_c3_ee4d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f919_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2665_c3_ee4d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2642_c11_28fa_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2648_c3_fef1 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_76cd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2648_c3_fef1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_4414_right := to_unsigned(4, 3);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2656_c32_d792_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2637_c1_30f8_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_80c2_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2650_c11_ee49_right := to_unsigned(3, 2);
     VAR_MUX_uxn_opcodes_h_l2656_c32_e3df_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f919_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2669_c3_4350 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e0f3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2669_c3_4350;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_805a_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f919_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2660_c3_6165 := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_8618_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2660_c3_6165;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2639_c3_f713 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_5559_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2639_c3_f713;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_5559_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2656_c32_e3df_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_8618_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_5715_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_7259_right := to_unsigned(7, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_805a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2656_c32_c7f6_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_70db_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2662_c11_82a2_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2637_c6_7802_right := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2637_c1_30f8_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2656_c32_c7f6_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2637_c6_7802_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2642_c11_28fa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_3f26_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2650_c11_ee49_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_4414_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_70db_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2662_c11_82a2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_7259_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_5715_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2654_c3_5321_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2670_c34_8b71_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2637_c2_5559_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2642_c7_61e3_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2650_c7_4b22_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2653_c7_80c2_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2642_c11_28fa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2642_c11_28fa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2642_c11_28fa_left;
     BIN_OP_EQ_uxn_opcodes_h_l2642_c11_28fa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2642_c11_28fa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2642_c11_28fa_return_output := BIN_OP_EQ_uxn_opcodes_h_l2642_c11_28fa_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2645_l2672_l2642_l2668_l2637_l2658_l2653_l2650_DUPLICATE_d754 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2645_l2672_l2642_l2668_l2637_l2658_l2653_l2650_DUPLICATE_d754_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2658_l2653_l2668_DUPLICATE_a136 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2658_l2653_l2668_DUPLICATE_a136_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2645_l2642_l2668_l2637_l2658_l2653_l2650_DUPLICATE_5094 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2645_l2642_l2668_l2637_l2658_l2653_l2650_DUPLICATE_5094_return_output := result.stack_value;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2666_c24_8a95] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2666_c24_8a95_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2653_c11_4414] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2653_c11_4414_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_4414_left;
     BIN_OP_EQ_uxn_opcodes_h_l2653_c11_4414_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_4414_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_4414_return_output := BIN_OP_EQ_uxn_opcodes_h_l2653_c11_4414_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2670_c34_8b71] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2670_c34_8b71_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2670_c34_8b71_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2670_c34_8b71_return_output := CONST_SR_8_uxn_opcodes_h_l2670_c34_8b71_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2646_l2654_DUPLICATE_48e9 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2646_l2654_DUPLICATE_48e9_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2645_c11_3f26] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2645_c11_3f26_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_3f26_left;
     BIN_OP_EQ_uxn_opcodes_h_l2645_c11_3f26_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_3f26_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_3f26_return_output := BIN_OP_EQ_uxn_opcodes_h_l2645_c11_3f26_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2645_l2672_l2642_l2668_l2662_l2658_l2653_l2650_DUPLICATE_b365 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2645_l2672_l2642_l2668_l2662_l2658_l2653_l2650_DUPLICATE_b365_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2645_l2672_l2642_l2668_l2637_l2662_l2653_l2650_DUPLICATE_0ff7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2645_l2672_l2642_l2668_l2637_l2662_l2653_l2650_DUPLICATE_0ff7_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2645_l2642_l2637_l2658_l2650_DUPLICATE_f5e2 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2645_l2642_l2637_l2658_l2650_DUPLICATE_f5e2_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2650_c11_ee49] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2650_c11_ee49_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2650_c11_ee49_left;
     BIN_OP_EQ_uxn_opcodes_h_l2650_c11_ee49_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2650_c11_ee49_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2650_c11_ee49_return_output := BIN_OP_EQ_uxn_opcodes_h_l2650_c11_ee49_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2662_c11_82a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2662_c11_82a2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2662_c11_82a2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2662_c11_82a2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2662_c11_82a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2662_c11_82a2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2662_c11_82a2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2668_c11_7259] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2668_c11_7259_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_7259_left;
     BIN_OP_EQ_uxn_opcodes_h_l2668_c11_7259_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_7259_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_7259_return_output := BIN_OP_EQ_uxn_opcodes_h_l2668_c11_7259_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2637_c6_7802] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2637_c6_7802_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2637_c6_7802_left;
     BIN_OP_EQ_uxn_opcodes_h_l2637_c6_7802_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2637_c6_7802_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2637_c6_7802_return_output := BIN_OP_EQ_uxn_opcodes_h_l2637_c6_7802_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2645_l2642_l2637_l2662_l2658_l2650_DUPLICATE_0ef3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2645_l2642_l2637_l2662_l2658_l2650_DUPLICATE_0ef3_return_output := result.is_sp_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l2656_c32_c7f6] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2656_c32_c7f6_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2656_c32_c7f6_left;
     BIN_OP_AND_uxn_opcodes_h_l2656_c32_c7f6_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2656_c32_c7f6_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2656_c32_c7f6_return_output := BIN_OP_AND_uxn_opcodes_h_l2656_c32_c7f6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2658_c11_70db] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2658_c11_70db_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_70db_left;
     BIN_OP_EQ_uxn_opcodes_h_l2658_c11_70db_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_70db_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_70db_return_output := BIN_OP_EQ_uxn_opcodes_h_l2658_c11_70db_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2672_c11_5715] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2672_c11_5715_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_5715_left;
     BIN_OP_EQ_uxn_opcodes_h_l2672_c11_5715_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_5715_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_5715_return_output := BIN_OP_EQ_uxn_opcodes_h_l2672_c11_5715_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2656_c32_d792_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2656_c32_c7f6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2637_c1_30f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2637_c6_7802_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_5559_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2637_c6_7802_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_5559_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2637_c6_7802_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_5559_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2637_c6_7802_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_5559_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2637_c6_7802_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_5559_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2637_c6_7802_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_5559_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2637_c6_7802_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2637_c2_5559_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2637_c6_7802_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2637_c2_5559_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2637_c6_7802_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_61e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2642_c11_28fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_61e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2642_c11_28fa_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_61e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2642_c11_28fa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_61e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2642_c11_28fa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_61e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2642_c11_28fa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_61e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2642_c11_28fa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2642_c7_61e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2642_c11_28fa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2642_c7_61e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2642_c11_28fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_76cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_3f26_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_76cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_3f26_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_76cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_3f26_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_76cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_3f26_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_76cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_3f26_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_76cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_3f26_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2645_c7_76cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_3f26_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2645_c7_76cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_3f26_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4b22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2650_c11_ee49_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4b22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2650_c11_ee49_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4b22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2650_c11_ee49_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4b22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2650_c11_ee49_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4b22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2650_c11_ee49_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4b22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2650_c11_ee49_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4b22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2650_c11_ee49_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2650_c7_4b22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2650_c11_ee49_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_80c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_4414_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_80c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_4414_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_80c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_4414_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_80c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_4414_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_80c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_4414_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_80c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_4414_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2653_c7_80c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_4414_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2653_c7_80c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_4414_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_8618_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_70db_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_8618_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_70db_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_8618_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_70db_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_8618_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_70db_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_8618_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_70db_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_8618_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_70db_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2658_c7_8618_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_70db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f919_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2662_c11_82a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f919_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2662_c11_82a2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f919_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2662_c11_82a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f919_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2662_c11_82a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f919_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2662_c11_82a2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f919_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2662_c11_82a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e0f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_7259_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e0f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_7259_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e0f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_7259_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e0f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_7259_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e0f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_7259_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_805a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_5715_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_805a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_5715_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_805a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_5715_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2654_c3_5321_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2646_l2654_DUPLICATE_48e9_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2647_c3_2549_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2646_l2654_DUPLICATE_48e9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f919_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2666_c24_8a95_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_5559_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2645_l2642_l2637_l2658_l2650_DUPLICATE_f5e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_61e3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2645_l2642_l2637_l2658_l2650_DUPLICATE_f5e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_76cd_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2645_l2642_l2637_l2658_l2650_DUPLICATE_f5e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4b22_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2645_l2642_l2637_l2658_l2650_DUPLICATE_f5e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_8618_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2645_l2642_l2637_l2658_l2650_DUPLICATE_f5e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_61e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2645_l2672_l2642_l2668_l2662_l2658_l2653_l2650_DUPLICATE_b365_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_76cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2645_l2672_l2642_l2668_l2662_l2658_l2653_l2650_DUPLICATE_b365_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4b22_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2645_l2672_l2642_l2668_l2662_l2658_l2653_l2650_DUPLICATE_b365_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_80c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2645_l2672_l2642_l2668_l2662_l2658_l2653_l2650_DUPLICATE_b365_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_8618_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2645_l2672_l2642_l2668_l2662_l2658_l2653_l2650_DUPLICATE_b365_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f919_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2645_l2672_l2642_l2668_l2662_l2658_l2653_l2650_DUPLICATE_b365_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e0f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2645_l2672_l2642_l2668_l2662_l2658_l2653_l2650_DUPLICATE_b365_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_805a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2645_l2672_l2642_l2668_l2662_l2658_l2653_l2650_DUPLICATE_b365_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_5559_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2645_l2642_l2637_l2662_l2658_l2650_DUPLICATE_0ef3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_61e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2645_l2642_l2637_l2662_l2658_l2650_DUPLICATE_0ef3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_76cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2645_l2642_l2637_l2662_l2658_l2650_DUPLICATE_0ef3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4b22_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2645_l2642_l2637_l2662_l2658_l2650_DUPLICATE_0ef3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_8618_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2645_l2642_l2637_l2662_l2658_l2650_DUPLICATE_0ef3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f919_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2645_l2642_l2637_l2662_l2658_l2650_DUPLICATE_0ef3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_5559_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2645_l2672_l2642_l2668_l2637_l2662_l2653_l2650_DUPLICATE_0ff7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_61e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2645_l2672_l2642_l2668_l2637_l2662_l2653_l2650_DUPLICATE_0ff7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_76cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2645_l2672_l2642_l2668_l2637_l2662_l2653_l2650_DUPLICATE_0ff7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4b22_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2645_l2672_l2642_l2668_l2637_l2662_l2653_l2650_DUPLICATE_0ff7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_80c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2645_l2672_l2642_l2668_l2637_l2662_l2653_l2650_DUPLICATE_0ff7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f919_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2645_l2672_l2642_l2668_l2637_l2662_l2653_l2650_DUPLICATE_0ff7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e0f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2645_l2672_l2642_l2668_l2637_l2662_l2653_l2650_DUPLICATE_0ff7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_805a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2645_l2672_l2642_l2668_l2637_l2662_l2653_l2650_DUPLICATE_0ff7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_5559_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2645_l2672_l2642_l2668_l2637_l2658_l2653_l2650_DUPLICATE_d754_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_61e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2645_l2672_l2642_l2668_l2637_l2658_l2653_l2650_DUPLICATE_d754_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_76cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2645_l2672_l2642_l2668_l2637_l2658_l2653_l2650_DUPLICATE_d754_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4b22_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2645_l2672_l2642_l2668_l2637_l2658_l2653_l2650_DUPLICATE_d754_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_80c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2645_l2672_l2642_l2668_l2637_l2658_l2653_l2650_DUPLICATE_d754_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_8618_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2645_l2672_l2642_l2668_l2637_l2658_l2653_l2650_DUPLICATE_d754_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e0f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2645_l2672_l2642_l2668_l2637_l2658_l2653_l2650_DUPLICATE_d754_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_805a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2645_l2672_l2642_l2668_l2637_l2658_l2653_l2650_DUPLICATE_d754_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_80c2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2658_l2653_l2668_DUPLICATE_a136_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_8618_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2658_l2653_l2668_DUPLICATE_a136_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e0f3_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2658_l2653_l2668_DUPLICATE_a136_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2637_c2_5559_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2645_l2642_l2668_l2637_l2658_l2653_l2650_DUPLICATE_5094_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2642_c7_61e3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2645_l2642_l2668_l2637_l2658_l2653_l2650_DUPLICATE_5094_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2645_c7_76cd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2645_l2642_l2668_l2637_l2658_l2653_l2650_DUPLICATE_5094_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4b22_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2645_l2642_l2668_l2637_l2658_l2653_l2650_DUPLICATE_5094_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2653_c7_80c2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2645_l2642_l2668_l2637_l2658_l2653_l2650_DUPLICATE_5094_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2658_c7_8618_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2645_l2642_l2668_l2637_l2658_l2653_l2650_DUPLICATE_5094_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e0f3_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2645_l2642_l2668_l2637_l2658_l2653_l2650_DUPLICATE_5094_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2672_c7_805a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_805a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_805a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_805a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_805a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_805a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_805a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_805a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_805a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2668_c7_e0f3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e0f3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e0f3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e0f3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e0f3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e0f3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e0f3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e0f3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e0f3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2637_c1_30f8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2637_c1_30f8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2637_c1_30f8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2637_c1_30f8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2637_c1_30f8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2637_c1_30f8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2637_c1_30f8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2637_c1_30f8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2637_c1_30f8_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2654_c3_5321] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2654_c3_5321_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2654_c3_5321_left;
     BIN_OP_OR_uxn_opcodes_h_l2654_c3_5321_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2654_c3_5321_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2654_c3_5321_return_output := BIN_OP_OR_uxn_opcodes_h_l2654_c3_5321_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2662_c7_f919] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f919_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f919_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f919_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f919_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f919_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f919_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f919_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f919_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2672_c7_805a] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_805a_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_805a_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_805a_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_805a_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_805a_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_805a_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_805a_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_805a_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2656_c32_d792] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2656_c32_d792_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2656_c32_d792_left;
     BIN_OP_GT_uxn_opcodes_h_l2656_c32_d792_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2656_c32_d792_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2656_c32_d792_return_output := BIN_OP_GT_uxn_opcodes_h_l2656_c32_d792_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2658_c7_8618] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_8618_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_8618_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_8618_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_8618_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_8618_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_8618_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_8618_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_8618_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2647_c3_2549] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2647_c3_2549_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2647_c3_2549_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2647_c3_2549_return_output := CONST_SL_8_uxn_opcodes_h_l2647_c3_2549_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2670_c24_8b4b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2670_c24_8b4b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2670_c34_8b71_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2672_c7_805a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_805a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_805a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_805a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_805a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_805a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_805a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_805a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_805a_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2656_c32_e3df_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2656_c32_d792_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2653_c7_80c2_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2654_c3_5321_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e0f3_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2670_c24_8b4b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2645_c7_76cd_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2647_c3_2549_return_output;
     VAR_printf_uxn_opcodes_h_l2638_c3_a012_uxn_opcodes_h_l2638_c3_a012_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2637_c1_30f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e0f3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_805a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_8618_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2662_c7_f919_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e0f3_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2672_c7_805a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e0f3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_805a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_80c2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_8618_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f919_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_e0f3_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2668_c7_e0f3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e0f3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e0f3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e0f3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e0f3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e0f3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e0f3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e0f3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e0f3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2668_c7_e0f3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e0f3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e0f3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e0f3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e0f3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e0f3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e0f3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e0f3_return_output := result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e0f3_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2668_c7_e0f3] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e0f3_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e0f3_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e0f3_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e0f3_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e0f3_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e0f3_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e0f3_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e0f3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2662_c7_f919] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f919_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f919_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f919_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f919_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f919_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f919_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f919_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f919_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2668_c7_e0f3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e0f3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e0f3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e0f3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e0f3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e0f3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e0f3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e0f3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e0f3_return_output;

     -- MUX[uxn_opcodes_h_l2656_c32_e3df] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2656_c32_e3df_cond <= VAR_MUX_uxn_opcodes_h_l2656_c32_e3df_cond;
     MUX_uxn_opcodes_h_l2656_c32_e3df_iftrue <= VAR_MUX_uxn_opcodes_h_l2656_c32_e3df_iftrue;
     MUX_uxn_opcodes_h_l2656_c32_e3df_iffalse <= VAR_MUX_uxn_opcodes_h_l2656_c32_e3df_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2656_c32_e3df_return_output := MUX_uxn_opcodes_h_l2656_c32_e3df_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2658_c7_8618] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_8618_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_8618_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_8618_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_8618_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_8618_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_8618_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_8618_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_8618_return_output;

     -- printf_uxn_opcodes_h_l2638_c3_a012[uxn_opcodes_h_l2638_c3_a012] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2638_c3_a012_uxn_opcodes_h_l2638_c3_a012_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2638_c3_a012_uxn_opcodes_h_l2638_c3_a012_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t16_MUX[uxn_opcodes_h_l2653_c7_80c2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2653_c7_80c2_cond <= VAR_t16_MUX_uxn_opcodes_h_l2653_c7_80c2_cond;
     t16_MUX_uxn_opcodes_h_l2653_c7_80c2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2653_c7_80c2_iftrue;
     t16_MUX_uxn_opcodes_h_l2653_c7_80c2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2653_c7_80c2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output := t16_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_80c2_iftrue := VAR_MUX_uxn_opcodes_h_l2656_c32_e3df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f919_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e0f3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_80c2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_8618_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f919_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e0f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f919_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e0f3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_8618_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2662_c7_f919_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f919_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2668_c7_e0f3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2650_c7_4b22_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2662_c7_f919] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f919_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f919_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f919_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f919_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f919_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f919_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f919_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f919_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2662_c7_f919] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f919_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f919_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f919_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f919_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f919_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f919_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f919_return_output := result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f919_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2662_c7_f919] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f919_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f919_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f919_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f919_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f919_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f919_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f919_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f919_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2653_c7_80c2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_80c2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_80c2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_80c2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_80c2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_80c2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_80c2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2653_c7_80c2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_80c2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_80c2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_80c2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_80c2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_80c2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_80c2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2658_c7_8618] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_8618_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_8618_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_8618_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_8618_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_8618_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_8618_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_8618_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_8618_return_output;

     -- t16_MUX[uxn_opcodes_h_l2650_c7_4b22] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2650_c7_4b22_cond <= VAR_t16_MUX_uxn_opcodes_h_l2650_c7_4b22_cond;
     t16_MUX_uxn_opcodes_h_l2650_c7_4b22_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2650_c7_4b22_iftrue;
     t16_MUX_uxn_opcodes_h_l2650_c7_4b22_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2650_c7_4b22_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output := t16_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2662_c7_f919] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f919_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f919_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f919_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f919_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f919_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f919_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f919_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f919_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_8618_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2662_c7_f919_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4b22_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_8618_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2662_c7_f919_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_8618_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2662_c7_f919_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4b22_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_80c2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_8618_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2658_c7_8618_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2662_c7_f919_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2645_c7_76cd_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output;
     -- t16_MUX[uxn_opcodes_h_l2645_c7_76cd] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2645_c7_76cd_cond <= VAR_t16_MUX_uxn_opcodes_h_l2645_c7_76cd_cond;
     t16_MUX_uxn_opcodes_h_l2645_c7_76cd_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2645_c7_76cd_iftrue;
     t16_MUX_uxn_opcodes_h_l2645_c7_76cd_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2645_c7_76cd_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output := t16_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2658_c7_8618] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_8618_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_8618_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_8618_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_8618_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_8618_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_8618_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_8618_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_8618_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2658_c7_8618] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_8618_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_8618_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_8618_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_8618_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_8618_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_8618_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_8618_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_8618_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2658_c7_8618] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_8618_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_8618_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_8618_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_8618_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_8618_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_8618_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_8618_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_8618_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2658_c7_8618] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2658_c7_8618_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2658_c7_8618_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2658_c7_8618_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2658_c7_8618_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2658_c7_8618_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2658_c7_8618_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2658_c7_8618_return_output := result_stack_value_MUX_uxn_opcodes_h_l2658_c7_8618_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2650_c7_4b22] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4b22_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4b22_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4b22_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4b22_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4b22_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4b22_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2650_c7_4b22] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4b22_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4b22_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4b22_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4b22_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4b22_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4b22_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2653_c7_80c2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_80c2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_80c2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_80c2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_80c2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_80c2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_80c2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_80c2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_8618_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_76cd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_80c2_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_8618_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_80c2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_8618_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_76cd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4b22_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2653_c7_80c2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2658_c7_8618_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2642_c7_61e3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2650_c7_4b22] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4b22_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4b22_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4b22_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4b22_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4b22_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4b22_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2653_c7_80c2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_80c2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_80c2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_80c2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_80c2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_80c2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_80c2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2645_c7_76cd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_76cd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_76cd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_76cd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_76cd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_76cd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_76cd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2653_c7_80c2] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_80c2_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_80c2_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_80c2_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_80c2_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_80c2_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_80c2_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output;

     -- t16_MUX[uxn_opcodes_h_l2642_c7_61e3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2642_c7_61e3_cond <= VAR_t16_MUX_uxn_opcodes_h_l2642_c7_61e3_cond;
     t16_MUX_uxn_opcodes_h_l2642_c7_61e3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2642_c7_61e3_iftrue;
     t16_MUX_uxn_opcodes_h_l2642_c7_61e3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2642_c7_61e3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output := t16_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2645_c7_76cd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_76cd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_76cd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_76cd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_76cd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_76cd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_76cd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2653_c7_80c2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_80c2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_80c2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_80c2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_80c2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_80c2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_80c2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2653_c7_80c2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2653_c7_80c2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2653_c7_80c2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2653_c7_80c2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2653_c7_80c2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2653_c7_80c2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2653_c7_80c2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output := result_stack_value_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4b22_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_61e3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4b22_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4b22_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_61e3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_76cd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4b22_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2653_c7_80c2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2637_c2_5559_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2642_c7_61e3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_61e3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_61e3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_61e3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_61e3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_61e3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_61e3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2650_c7_4b22] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4b22_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4b22_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4b22_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4b22_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4b22_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4b22_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output;

     -- t16_MUX[uxn_opcodes_h_l2637_c2_5559] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2637_c2_5559_cond <= VAR_t16_MUX_uxn_opcodes_h_l2637_c2_5559_cond;
     t16_MUX_uxn_opcodes_h_l2637_c2_5559_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2637_c2_5559_iftrue;
     t16_MUX_uxn_opcodes_h_l2637_c2_5559_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2637_c2_5559_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2637_c2_5559_return_output := t16_MUX_uxn_opcodes_h_l2637_c2_5559_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2642_c7_61e3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_61e3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_61e3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_61e3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_61e3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_61e3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_61e3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2650_c7_4b22] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4b22_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4b22_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4b22_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4b22_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4b22_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4b22_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2650_c7_4b22] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4b22_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4b22_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4b22_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4b22_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4b22_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4b22_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output := result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2650_c7_4b22] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4b22_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4b22_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4b22_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4b22_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4b22_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4b22_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2645_c7_76cd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_76cd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_76cd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_76cd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_76cd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_76cd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_76cd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_76cd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_5559_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_76cd_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_76cd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_5559_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_61e3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2645_c7_76cd_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2650_c7_4b22_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2637_c2_5559_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2645_c7_76cd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2645_c7_76cd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2645_c7_76cd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2645_c7_76cd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2645_c7_76cd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2645_c7_76cd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2645_c7_76cd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output := result_stack_value_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2642_c7_61e3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_61e3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_61e3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_61e3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_61e3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_61e3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_61e3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2637_c2_5559] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_5559_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_5559_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_5559_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_5559_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_5559_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_5559_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_5559_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_5559_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2637_c2_5559] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_5559_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_5559_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_5559_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_5559_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_5559_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_5559_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_5559_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_5559_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2645_c7_76cd] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_76cd_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_76cd_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_76cd_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_76cd_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_76cd_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_76cd_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2645_c7_76cd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_76cd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_76cd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_76cd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_76cd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_76cd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_76cd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2645_c7_76cd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_76cd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_76cd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_76cd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_76cd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_76cd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_76cd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_61e3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_61e3_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_61e3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_5559_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2642_c7_61e3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2645_c7_76cd_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2642_c7_61e3] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_61e3_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_61e3_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_61e3_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_61e3_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_61e3_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_61e3_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2642_c7_61e3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_61e3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_61e3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_61e3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_61e3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_61e3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_61e3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2637_c2_5559] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_5559_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_5559_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_5559_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_5559_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_5559_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_5559_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_5559_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_5559_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2642_c7_61e3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2642_c7_61e3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2642_c7_61e3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2642_c7_61e3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2642_c7_61e3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2642_c7_61e3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2642_c7_61e3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output := result_stack_value_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2642_c7_61e3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_61e3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_61e3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_61e3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_61e3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_61e3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_61e3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_5559_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_5559_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_5559_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2637_c2_5559_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2642_c7_61e3_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2637_c2_5559] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_5559_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_5559_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_5559_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_5559_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_5559_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_5559_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_5559_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_5559_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2637_c2_5559] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2637_c2_5559_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2637_c2_5559_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2637_c2_5559_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2637_c2_5559_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2637_c2_5559_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2637_c2_5559_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2637_c2_5559_return_output := result_stack_value_MUX_uxn_opcodes_h_l2637_c2_5559_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2637_c2_5559] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_5559_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_5559_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_5559_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_5559_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_5559_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_5559_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_5559_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_5559_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2637_c2_5559] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_5559_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_5559_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_5559_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_5559_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_5559_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_5559_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_5559_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_5559_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_6621_uxn_opcodes_h_l2678_l2633_DUPLICATE_f0d1 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6621_uxn_opcodes_h_l2678_l2633_DUPLICATE_f0d1_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6621(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2637_c2_5559_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c2_5559_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c2_5559_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c2_5559_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2637_c2_5559_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2637_c2_5559_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2637_c2_5559_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6621_uxn_opcodes_h_l2678_l2633_DUPLICATE_f0d1_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6621_uxn_opcodes_h_l2678_l2633_DUPLICATE_f0d1_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
