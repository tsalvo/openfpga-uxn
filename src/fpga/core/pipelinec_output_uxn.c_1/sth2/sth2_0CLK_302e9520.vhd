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
-- Submodules: 65
entity sth2_0CLK_302e9520 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sth2_0CLK_302e9520;
architecture arch of sth2_0CLK_302e9520 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2285_c6_69b9]
signal BIN_OP_EQ_uxn_opcodes_h_l2285_c6_69b9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2285_c6_69b9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2285_c6_69b9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2285_c1_bf6f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2285_c1_bf6f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2285_c1_bf6f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2285_c1_bf6f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2285_c1_bf6f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2285_c2_cadc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2285_c2_cadc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2285_c2_cadc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2285_c2_cadc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2285_c2_cadc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c2_cadc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c2_cadc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c2_cadc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2285_c2_cadc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c2_cadc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c2_cadc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c2_cadc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2285_c2_cadc]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2285_c2_cadc_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2285_c2_cadc_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2285_c2_cadc_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2285_c2_cadc]
signal result_u8_value_MUX_uxn_opcodes_h_l2285_c2_cadc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2285_c2_cadc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2285_c2_cadc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2285_c2_cadc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2285_c2_cadc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2285_c2_cadc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2285_c2_cadc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2285_c2_cadc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c2_cadc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c2_cadc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c2_cadc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2285_c2_cadc]
signal t16_MUX_uxn_opcodes_h_l2285_c2_cadc_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2285_c2_cadc_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2285_c2_cadc_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2286_c3_529b[uxn_opcodes_h_l2286_c3_529b]
signal printf_uxn_opcodes_h_l2286_c3_529b_uxn_opcodes_h_l2286_c3_529b_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2290_c11_8749]
signal BIN_OP_EQ_uxn_opcodes_h_l2290_c11_8749_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2290_c11_8749_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2290_c11_8749_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2290_c7_f9b7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_f9b7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_f9b7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_f9b7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2290_c7_f9b7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_f9b7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_f9b7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_f9b7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2290_c7_f9b7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2290_c7_f9b7]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2290_c7_f9b7_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2290_c7_f9b7_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2290_c7_f9b7_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2290_c7_f9b7]
signal result_u8_value_MUX_uxn_opcodes_h_l2290_c7_f9b7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2290_c7_f9b7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2290_c7_f9b7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2290_c7_f9b7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_f9b7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_f9b7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_f9b7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2290_c7_f9b7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2290_c7_f9b7]
signal t16_MUX_uxn_opcodes_h_l2290_c7_f9b7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2290_c7_f9b7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2290_c7_f9b7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2293_c11_2890]
signal BIN_OP_EQ_uxn_opcodes_h_l2293_c11_2890_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2293_c11_2890_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2293_c11_2890_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2293_c7_5680]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_5680_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_5680_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_5680_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_5680_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2293_c7_5680]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_5680_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_5680_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_5680_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_5680_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2293_c7_5680]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_5680_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_5680_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_5680_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_5680_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2293_c7_5680]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c7_5680_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c7_5680_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c7_5680_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c7_5680_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2293_c7_5680]
signal result_u8_value_MUX_uxn_opcodes_h_l2293_c7_5680_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2293_c7_5680_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2293_c7_5680_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2293_c7_5680_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2293_c7_5680]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_5680_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_5680_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_5680_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_5680_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2293_c7_5680]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_5680_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_5680_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_5680_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_5680_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2293_c7_5680]
signal t16_MUX_uxn_opcodes_h_l2293_c7_5680_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2293_c7_5680_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2293_c7_5680_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2293_c7_5680_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2295_c3_32f0]
signal CONST_SL_8_uxn_opcodes_h_l2295_c3_32f0_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2295_c3_32f0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2297_c11_21af]
signal BIN_OP_EQ_uxn_opcodes_h_l2297_c11_21af_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2297_c11_21af_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2297_c11_21af_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2297_c7_91e6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_91e6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_91e6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_91e6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2297_c7_91e6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_91e6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_91e6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_91e6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2297_c7_91e6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_91e6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_91e6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_91e6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2297_c7_91e6]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2297_c7_91e6_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2297_c7_91e6_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2297_c7_91e6_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2297_c7_91e6]
signal result_u8_value_MUX_uxn_opcodes_h_l2297_c7_91e6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2297_c7_91e6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2297_c7_91e6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2297_c7_91e6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_91e6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_91e6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_91e6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2297_c7_91e6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_91e6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_91e6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_91e6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2297_c7_91e6]
signal t16_MUX_uxn_opcodes_h_l2297_c7_91e6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2297_c7_91e6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2297_c7_91e6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2298_c3_fea6]
signal BIN_OP_OR_uxn_opcodes_h_l2298_c3_fea6_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2298_c3_fea6_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2298_c3_fea6_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2300_c30_cbe0]
signal sp_relative_shift_uxn_opcodes_h_l2300_c30_cbe0_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2300_c30_cbe0_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2300_c30_cbe0_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2300_c30_cbe0_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2302_c11_e1e6]
signal BIN_OP_EQ_uxn_opcodes_h_l2302_c11_e1e6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2302_c11_e1e6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2302_c11_e1e6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2302_c7_2667]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_2667_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_2667_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_2667_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_2667_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2302_c7_2667]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_2667_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_2667_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_2667_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_2667_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2302_c7_2667]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_2667_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_2667_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_2667_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_2667_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2302_c7_2667]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_2667_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_2667_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_2667_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_2667_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2302_c7_2667]
signal result_u8_value_MUX_uxn_opcodes_h_l2302_c7_2667_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2302_c7_2667_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2302_c7_2667_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2302_c7_2667_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2302_c7_2667]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_2667_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_2667_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_2667_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_2667_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2302_c7_2667]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_2667_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_2667_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_2667_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_2667_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2309_c11_ebbd]
signal BIN_OP_EQ_uxn_opcodes_h_l2309_c11_ebbd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2309_c11_ebbd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2309_c11_ebbd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2309_c7_f4b0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_f4b0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_f4b0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_f4b0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_f4b0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2309_c7_f4b0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2309_c7_f4b0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2309_c7_f4b0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2309_c7_f4b0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2309_c7_f4b0_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2309_c7_f4b0]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2309_c7_f4b0_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2309_c7_f4b0_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2309_c7_f4b0_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2309_c7_f4b0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2309_c7_f4b0]
signal result_u8_value_MUX_uxn_opcodes_h_l2309_c7_f4b0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2309_c7_f4b0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2309_c7_f4b0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2309_c7_f4b0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2309_c7_f4b0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_f4b0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_f4b0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_f4b0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_f4b0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2309_c7_f4b0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2309_c7_f4b0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2309_c7_f4b0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2309_c7_f4b0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2309_c7_f4b0_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2312_c31_9da6]
signal CONST_SR_8_uxn_opcodes_h_l2312_c31_9da6_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2312_c31_9da6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2314_c11_8920]
signal BIN_OP_EQ_uxn_opcodes_h_l2314_c11_8920_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2314_c11_8920_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2314_c11_8920_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2314_c7_8503]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_8503_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_8503_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_8503_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_8503_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2314_c7_8503]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_8503_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_8503_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_8503_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_8503_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2314_c7_8503]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2314_c7_8503_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2314_c7_8503_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2314_c7_8503_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2314_c7_8503_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_308d( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.is_sp_shift := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2285_c6_69b9
BIN_OP_EQ_uxn_opcodes_h_l2285_c6_69b9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2285_c6_69b9_left,
BIN_OP_EQ_uxn_opcodes_h_l2285_c6_69b9_right,
BIN_OP_EQ_uxn_opcodes_h_l2285_c6_69b9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2285_c1_bf6f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2285_c1_bf6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2285_c1_bf6f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2285_c1_bf6f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2285_c1_bf6f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2285_c1_bf6f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2285_c2_cadc
result_is_stack_write_MUX_uxn_opcodes_h_l2285_c2_cadc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2285_c2_cadc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2285_c2_cadc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2285_c2_cadc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c2_cadc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c2_cadc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c2_cadc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c2_cadc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c2_cadc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c2_cadc
result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c2_cadc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c2_cadc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c2_cadc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c2_cadc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2285_c2_cadc
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2285_c2_cadc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2285_c2_cadc_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2285_c2_cadc_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2285_c2_cadc_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2285_c2_cadc
result_u8_value_MUX_uxn_opcodes_h_l2285_c2_cadc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2285_c2_cadc_cond,
result_u8_value_MUX_uxn_opcodes_h_l2285_c2_cadc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2285_c2_cadc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2285_c2_cadc
result_is_opc_done_MUX_uxn_opcodes_h_l2285_c2_cadc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2285_c2_cadc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2285_c2_cadc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2285_c2_cadc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c2_cadc
result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c2_cadc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c2_cadc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c2_cadc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c2_cadc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output);

-- t16_MUX_uxn_opcodes_h_l2285_c2_cadc
t16_MUX_uxn_opcodes_h_l2285_c2_cadc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2285_c2_cadc_cond,
t16_MUX_uxn_opcodes_h_l2285_c2_cadc_iftrue,
t16_MUX_uxn_opcodes_h_l2285_c2_cadc_iffalse,
t16_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output);

-- printf_uxn_opcodes_h_l2286_c3_529b_uxn_opcodes_h_l2286_c3_529b
printf_uxn_opcodes_h_l2286_c3_529b_uxn_opcodes_h_l2286_c3_529b : entity work.printf_uxn_opcodes_h_l2286_c3_529b_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2286_c3_529b_uxn_opcodes_h_l2286_c3_529b_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2290_c11_8749
BIN_OP_EQ_uxn_opcodes_h_l2290_c11_8749 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2290_c11_8749_left,
BIN_OP_EQ_uxn_opcodes_h_l2290_c11_8749_right,
BIN_OP_EQ_uxn_opcodes_h_l2290_c11_8749_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_f9b7
result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_f9b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_f9b7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_f9b7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_f9b7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_f9b7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_f9b7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_f9b7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_f9b7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_f9b7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7
result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2290_c7_f9b7
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2290_c7_f9b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2290_c7_f9b7_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2290_c7_f9b7_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2290_c7_f9b7_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2290_c7_f9b7
result_u8_value_MUX_uxn_opcodes_h_l2290_c7_f9b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2290_c7_f9b7_cond,
result_u8_value_MUX_uxn_opcodes_h_l2290_c7_f9b7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2290_c7_f9b7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_f9b7
result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_f9b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_f9b7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_f9b7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_f9b7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7
result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output);

-- t16_MUX_uxn_opcodes_h_l2290_c7_f9b7
t16_MUX_uxn_opcodes_h_l2290_c7_f9b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2290_c7_f9b7_cond,
t16_MUX_uxn_opcodes_h_l2290_c7_f9b7_iftrue,
t16_MUX_uxn_opcodes_h_l2290_c7_f9b7_iffalse,
t16_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2293_c11_2890
BIN_OP_EQ_uxn_opcodes_h_l2293_c11_2890 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2293_c11_2890_left,
BIN_OP_EQ_uxn_opcodes_h_l2293_c11_2890_right,
BIN_OP_EQ_uxn_opcodes_h_l2293_c11_2890_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_5680
result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_5680 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_5680_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_5680_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_5680_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_5680_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_5680
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_5680 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_5680_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_5680_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_5680_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_5680_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_5680
result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_5680 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_5680_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_5680_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_5680_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_5680_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c7_5680
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c7_5680 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c7_5680_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c7_5680_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c7_5680_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c7_5680_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2293_c7_5680
result_u8_value_MUX_uxn_opcodes_h_l2293_c7_5680 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2293_c7_5680_cond,
result_u8_value_MUX_uxn_opcodes_h_l2293_c7_5680_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2293_c7_5680_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2293_c7_5680_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_5680
result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_5680 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_5680_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_5680_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_5680_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_5680_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_5680
result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_5680 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_5680_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_5680_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_5680_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_5680_return_output);

-- t16_MUX_uxn_opcodes_h_l2293_c7_5680
t16_MUX_uxn_opcodes_h_l2293_c7_5680 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2293_c7_5680_cond,
t16_MUX_uxn_opcodes_h_l2293_c7_5680_iftrue,
t16_MUX_uxn_opcodes_h_l2293_c7_5680_iffalse,
t16_MUX_uxn_opcodes_h_l2293_c7_5680_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2295_c3_32f0
CONST_SL_8_uxn_opcodes_h_l2295_c3_32f0 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2295_c3_32f0_x,
CONST_SL_8_uxn_opcodes_h_l2295_c3_32f0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2297_c11_21af
BIN_OP_EQ_uxn_opcodes_h_l2297_c11_21af : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2297_c11_21af_left,
BIN_OP_EQ_uxn_opcodes_h_l2297_c11_21af_right,
BIN_OP_EQ_uxn_opcodes_h_l2297_c11_21af_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_91e6
result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_91e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_91e6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_91e6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_91e6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_91e6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_91e6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_91e6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_91e6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_91e6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_91e6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_91e6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_91e6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_91e6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_91e6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2297_c7_91e6
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2297_c7_91e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2297_c7_91e6_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2297_c7_91e6_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2297_c7_91e6_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2297_c7_91e6
result_u8_value_MUX_uxn_opcodes_h_l2297_c7_91e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2297_c7_91e6_cond,
result_u8_value_MUX_uxn_opcodes_h_l2297_c7_91e6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2297_c7_91e6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_91e6
result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_91e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_91e6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_91e6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_91e6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_91e6
result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_91e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_91e6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_91e6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_91e6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output);

-- t16_MUX_uxn_opcodes_h_l2297_c7_91e6
t16_MUX_uxn_opcodes_h_l2297_c7_91e6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2297_c7_91e6_cond,
t16_MUX_uxn_opcodes_h_l2297_c7_91e6_iftrue,
t16_MUX_uxn_opcodes_h_l2297_c7_91e6_iffalse,
t16_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2298_c3_fea6
BIN_OP_OR_uxn_opcodes_h_l2298_c3_fea6 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2298_c3_fea6_left,
BIN_OP_OR_uxn_opcodes_h_l2298_c3_fea6_right,
BIN_OP_OR_uxn_opcodes_h_l2298_c3_fea6_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2300_c30_cbe0
sp_relative_shift_uxn_opcodes_h_l2300_c30_cbe0 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2300_c30_cbe0_ins,
sp_relative_shift_uxn_opcodes_h_l2300_c30_cbe0_x,
sp_relative_shift_uxn_opcodes_h_l2300_c30_cbe0_y,
sp_relative_shift_uxn_opcodes_h_l2300_c30_cbe0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2302_c11_e1e6
BIN_OP_EQ_uxn_opcodes_h_l2302_c11_e1e6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2302_c11_e1e6_left,
BIN_OP_EQ_uxn_opcodes_h_l2302_c11_e1e6_right,
BIN_OP_EQ_uxn_opcodes_h_l2302_c11_e1e6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_2667
result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_2667 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_2667_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_2667_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_2667_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_2667_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_2667
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_2667 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_2667_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_2667_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_2667_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_2667_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_2667
result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_2667 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_2667_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_2667_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_2667_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_2667_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_2667
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_2667 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_2667_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_2667_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_2667_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_2667_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2302_c7_2667
result_u8_value_MUX_uxn_opcodes_h_l2302_c7_2667 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2302_c7_2667_cond,
result_u8_value_MUX_uxn_opcodes_h_l2302_c7_2667_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2302_c7_2667_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2302_c7_2667_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_2667
result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_2667 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_2667_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_2667_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_2667_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_2667_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_2667
result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_2667 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_2667_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_2667_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_2667_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_2667_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2309_c11_ebbd
BIN_OP_EQ_uxn_opcodes_h_l2309_c11_ebbd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2309_c11_ebbd_left,
BIN_OP_EQ_uxn_opcodes_h_l2309_c11_ebbd_right,
BIN_OP_EQ_uxn_opcodes_h_l2309_c11_ebbd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_f4b0
result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_f4b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_f4b0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_f4b0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_f4b0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_f4b0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2309_c7_f4b0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2309_c7_f4b0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2309_c7_f4b0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2309_c7_f4b0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2309_c7_f4b0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2309_c7_f4b0_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2309_c7_f4b0
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2309_c7_f4b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2309_c7_f4b0_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2309_c7_f4b0_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2309_c7_f4b0_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2309_c7_f4b0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2309_c7_f4b0
result_u8_value_MUX_uxn_opcodes_h_l2309_c7_f4b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2309_c7_f4b0_cond,
result_u8_value_MUX_uxn_opcodes_h_l2309_c7_f4b0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2309_c7_f4b0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2309_c7_f4b0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_f4b0
result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_f4b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_f4b0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_f4b0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_f4b0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_f4b0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2309_c7_f4b0
result_is_sp_shift_MUX_uxn_opcodes_h_l2309_c7_f4b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2309_c7_f4b0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2309_c7_f4b0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2309_c7_f4b0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2309_c7_f4b0_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2312_c31_9da6
CONST_SR_8_uxn_opcodes_h_l2312_c31_9da6 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2312_c31_9da6_x,
CONST_SR_8_uxn_opcodes_h_l2312_c31_9da6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2314_c11_8920
BIN_OP_EQ_uxn_opcodes_h_l2314_c11_8920 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2314_c11_8920_left,
BIN_OP_EQ_uxn_opcodes_h_l2314_c11_8920_right,
BIN_OP_EQ_uxn_opcodes_h_l2314_c11_8920_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_8503
result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_8503 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_8503_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_8503_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_8503_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_8503_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_8503
result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_8503 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_8503_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_8503_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_8503_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_8503_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2314_c7_8503
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2314_c7_8503 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2314_c7_8503_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2314_c7_8503_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2314_c7_8503_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2314_c7_8503_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2285_c6_69b9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2285_c1_bf6f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output,
 t16_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2290_c11_8749_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output,
 t16_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2293_c11_2890_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_5680_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_5680_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_5680_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c7_5680_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2293_c7_5680_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_5680_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_5680_return_output,
 t16_MUX_uxn_opcodes_h_l2293_c7_5680_return_output,
 CONST_SL_8_uxn_opcodes_h_l2295_c3_32f0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2297_c11_21af_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output,
 t16_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2298_c3_fea6_return_output,
 sp_relative_shift_uxn_opcodes_h_l2300_c30_cbe0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2302_c11_e1e6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_2667_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_2667_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_2667_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_2667_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2302_c7_2667_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_2667_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_2667_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2309_c11_ebbd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_f4b0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2309_c7_f4b0_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2309_c7_f4b0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2309_c7_f4b0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_f4b0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2309_c7_f4b0_return_output,
 CONST_SR_8_uxn_opcodes_h_l2312_c31_9da6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2314_c11_8920_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_8503_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_8503_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2314_c7_8503_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2285_c6_69b9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2285_c6_69b9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2285_c6_69b9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2285_c1_bf6f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2285_c1_bf6f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2285_c1_bf6f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2285_c1_bf6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2285_c2_cadc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2285_c2_cadc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2285_c2_cadc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c2_cadc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2287_c3_d866 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c2_cadc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c2_cadc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c2_cadc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c2_cadc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c2_cadc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2285_c2_cadc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2285_c2_cadc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2285_c2_cadc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2285_c2_cadc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2285_c2_cadc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2285_c2_cadc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2285_c2_cadc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2285_c2_cadc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2285_c2_cadc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c2_cadc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c2_cadc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c2_cadc_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2285_c2_cadc_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2285_c2_cadc_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2285_c2_cadc_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2286_c3_529b_uxn_opcodes_h_l2286_c3_529b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_8749_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_8749_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_8749_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_f9b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_f9b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_5680_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_f9b7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_f9b7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2291_c3_7344 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_f9b7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_5680_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_f9b7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_5680_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2290_c7_f9b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2290_c7_f9b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c7_5680_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2290_c7_f9b7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2290_c7_f9b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2290_c7_f9b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c7_5680_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2290_c7_f9b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_f9b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_f9b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_5680_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_f9b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_5680_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2290_c7_f9b7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2290_c7_f9b7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2293_c7_5680_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2290_c7_f9b7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_2890_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_2890_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_2890_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_5680_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_5680_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_5680_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_5680_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_5680_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_5680_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_5680_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_5680_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_5680_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c7_5680_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c7_5680_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c7_5680_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c7_5680_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c7_5680_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c7_5680_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_5680_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_5680_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_5680_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_5680_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_5680_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_5680_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2293_c7_5680_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2293_c7_5680_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2293_c7_5680_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2295_c3_32f0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2295_c3_32f0_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_21af_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_21af_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_21af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_91e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_91e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_2667_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_91e6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_91e6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_91e6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_2667_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_91e6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_91e6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_91e6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_2667_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_91e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2297_c7_91e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2297_c7_91e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_2667_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2297_c7_91e6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2297_c7_91e6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2297_c7_91e6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2302_c7_2667_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2297_c7_91e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_91e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_91e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_2667_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_91e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_91e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_91e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_2667_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_91e6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2297_c7_91e6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2297_c7_91e6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2297_c7_91e6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2298_c3_fea6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2298_c3_fea6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2298_c3_fea6_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2300_c30_cbe0_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2300_c30_cbe0_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2300_c30_cbe0_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2300_c30_cbe0_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_e1e6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_e1e6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_e1e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_2667_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_2667_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_f4b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_2667_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_2667_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2306_c3_ca92 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_2667_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2309_c7_f4b0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_2667_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_2667_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2304_c3_a6bb : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_2667_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_2667_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_2667_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_2667_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2309_c7_f4b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_2667_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2302_c7_2667_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2302_c7_2667_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2309_c7_f4b0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2302_c7_2667_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_2667_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_2667_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_f4b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_2667_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_2667_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_2667_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2309_c7_f4b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_2667_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2307_c21_8eff_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2309_c11_ebbd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2309_c11_ebbd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2309_c11_ebbd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_f4b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_f4b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_8503_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_f4b0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2309_c7_f4b0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2311_c3_edec : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2309_c7_f4b0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2309_c7_f4b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2309_c7_f4b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2309_c7_f4b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2314_c7_8503_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2309_c7_f4b0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2309_c7_f4b0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2309_c7_f4b0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2309_c7_f4b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_f4b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_f4b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_8503_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_f4b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2309_c7_f4b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2309_c7_f4b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2309_c7_f4b0_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2312_c31_9da6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2312_c31_9da6_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2312_c21_c623_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2314_c11_8920_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2314_c11_8920_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2314_c11_8920_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_8503_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_8503_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_8503_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_8503_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_8503_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_8503_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2314_c7_8503_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2314_c7_8503_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2314_c7_8503_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2297_l2293_l2290_l2285_l2314_l2309_DUPLICATE_f026_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2293_l2285_l2290_l2302_DUPLICATE_085a_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2297_l2293_l2290_l2285_l2314_l2309_DUPLICATE_817f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2297_l2293_l2290_l2285_l2309_DUPLICATE_24a9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2293_l2290_l2285_l2309_l2302_DUPLICATE_9e6e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2297_l2293_l2290_l2314_l2309_l2302_DUPLICATE_7902_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2294_l2298_DUPLICATE_c5a1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2293_l2309_l2297_DUPLICATE_eb5e_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_308d_uxn_opcodes_h_l2320_l2281_DUPLICATE_1f1b_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_2667_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2309_c11_ebbd_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2285_c6_69b9_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_8503_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2314_c11_8920_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_2890_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_e1e6_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2306_c3_ca92 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_2667_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2306_c3_ca92;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2314_c7_8503_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_8503_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2311_c3_edec := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2309_c7_f4b0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2311_c3_edec;
     VAR_sp_relative_shift_uxn_opcodes_h_l2300_c30_cbe0_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_2667_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2300_c30_cbe0_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2285_c1_bf6f_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2287_c3_d866 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c2_cadc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2287_c3_d866;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_21af_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_91e6_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_8749_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2309_c7_f4b0_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2291_c3_7344 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_f9b7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2291_c3_7344;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2285_c2_cadc_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2304_c3_a6bb := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_2667_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2304_c3_a6bb;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2285_c1_bf6f_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2300_c30_cbe0_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2285_c6_69b9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_8749_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_2890_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_21af_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_e1e6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2309_c11_ebbd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2314_c11_8920_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2298_c3_fea6_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2312_c31_9da6_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2285_c2_cadc_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2290_c7_f9b7_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2297_c7_91e6_iffalse := t16;
     -- sp_relative_shift[uxn_opcodes_h_l2300_c30_cbe0] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2300_c30_cbe0_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2300_c30_cbe0_ins;
     sp_relative_shift_uxn_opcodes_h_l2300_c30_cbe0_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2300_c30_cbe0_x;
     sp_relative_shift_uxn_opcodes_h_l2300_c30_cbe0_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2300_c30_cbe0_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2300_c30_cbe0_return_output := sp_relative_shift_uxn_opcodes_h_l2300_c30_cbe0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2297_l2293_l2290_l2285_l2314_l2309_DUPLICATE_817f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2297_l2293_l2290_l2285_l2314_l2309_DUPLICATE_817f_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l2297_c11_21af] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2297_c11_21af_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_21af_left;
     BIN_OP_EQ_uxn_opcodes_h_l2297_c11_21af_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_21af_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_21af_return_output := BIN_OP_EQ_uxn_opcodes_h_l2297_c11_21af_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2293_l2309_l2297_DUPLICATE_eb5e LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2293_l2309_l2297_DUPLICATE_eb5e_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2297_l2293_l2290_l2285_l2309_DUPLICATE_24a9 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2297_l2293_l2290_l2285_l2309_DUPLICATE_24a9_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2297_l2293_l2290_l2285_l2314_l2309_DUPLICATE_f026 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2297_l2293_l2290_l2285_l2314_l2309_DUPLICATE_f026_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2309_c11_ebbd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2309_c11_ebbd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2309_c11_ebbd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2309_c11_ebbd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2309_c11_ebbd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2309_c11_ebbd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2309_c11_ebbd_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2294_l2298_DUPLICATE_c5a1 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2294_l2298_DUPLICATE_c5a1_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2293_c11_2890] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2293_c11_2890_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_2890_left;
     BIN_OP_EQ_uxn_opcodes_h_l2293_c11_2890_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_2890_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_2890_return_output := BIN_OP_EQ_uxn_opcodes_h_l2293_c11_2890_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2312_c31_9da6] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2312_c31_9da6_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2312_c31_9da6_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2312_c31_9da6_return_output := CONST_SR_8_uxn_opcodes_h_l2312_c31_9da6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2290_c11_8749] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2290_c11_8749_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_8749_left;
     BIN_OP_EQ_uxn_opcodes_h_l2290_c11_8749_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_8749_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_8749_return_output := BIN_OP_EQ_uxn_opcodes_h_l2290_c11_8749_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2285_c6_69b9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2285_c6_69b9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2285_c6_69b9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2285_c6_69b9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2285_c6_69b9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2285_c6_69b9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2285_c6_69b9_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2307_c21_8eff] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2307_c21_8eff_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2314_c11_8920] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2314_c11_8920_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2314_c11_8920_left;
     BIN_OP_EQ_uxn_opcodes_h_l2314_c11_8920_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2314_c11_8920_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2314_c11_8920_return_output := BIN_OP_EQ_uxn_opcodes_h_l2314_c11_8920_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2293_l2285_l2290_l2302_DUPLICATE_085a LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2293_l2285_l2290_l2302_DUPLICATE_085a_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2297_l2293_l2290_l2314_l2309_l2302_DUPLICATE_7902 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2297_l2293_l2290_l2314_l2309_l2302_DUPLICATE_7902_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2293_l2290_l2285_l2309_l2302_DUPLICATE_9e6e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2293_l2290_l2285_l2309_l2302_DUPLICATE_9e6e_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2302_c11_e1e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2302_c11_e1e6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_e1e6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2302_c11_e1e6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_e1e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_e1e6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2302_c11_e1e6_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2285_c1_bf6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2285_c6_69b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2285_c2_cadc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2285_c6_69b9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c2_cadc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2285_c6_69b9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2285_c2_cadc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2285_c6_69b9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2285_c2_cadc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2285_c6_69b9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c2_cadc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2285_c6_69b9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c2_cadc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2285_c6_69b9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2285_c2_cadc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2285_c6_69b9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2285_c2_cadc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2285_c6_69b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_f9b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_8749_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_8749_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2290_c7_f9b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_8749_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_f9b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_8749_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_8749_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_f9b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_8749_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2290_c7_f9b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_8749_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2290_c7_f9b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_8749_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_5680_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_2890_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_5680_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_2890_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c7_5680_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_2890_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_5680_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_2890_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_5680_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_2890_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_5680_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_2890_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c7_5680_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_2890_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2293_c7_5680_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_2890_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_91e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_21af_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_91e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_21af_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2297_c7_91e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_21af_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_91e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_21af_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_91e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_21af_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_91e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_21af_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2297_c7_91e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_21af_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2297_c7_91e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_21af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_2667_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_e1e6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_2667_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_e1e6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_2667_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_e1e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_2667_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_e1e6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_2667_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_e1e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_2667_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_e1e6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2302_c7_2667_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_e1e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_f4b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2309_c11_ebbd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2309_c7_f4b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2309_c11_ebbd_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2309_c7_f4b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2309_c11_ebbd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_f4b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2309_c11_ebbd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2309_c7_f4b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2309_c11_ebbd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2309_c7_f4b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2309_c11_ebbd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_8503_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2314_c11_8920_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2314_c7_8503_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2314_c11_8920_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_8503_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2314_c11_8920_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2298_c3_fea6_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2294_l2298_DUPLICATE_c5a1_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2295_c3_32f0_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2294_l2298_DUPLICATE_c5a1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2302_c7_2667_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2307_c21_8eff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c2_cadc_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2293_l2285_l2290_l2302_DUPLICATE_085a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2293_l2285_l2290_l2302_DUPLICATE_085a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_5680_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2293_l2285_l2290_l2302_DUPLICATE_085a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_2667_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2293_l2285_l2290_l2302_DUPLICATE_085a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_f9b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2297_l2293_l2290_l2314_l2309_l2302_DUPLICATE_7902_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_5680_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2297_l2293_l2290_l2314_l2309_l2302_DUPLICATE_7902_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_91e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2297_l2293_l2290_l2314_l2309_l2302_DUPLICATE_7902_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_2667_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2297_l2293_l2290_l2314_l2309_l2302_DUPLICATE_7902_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_f4b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2297_l2293_l2290_l2314_l2309_l2302_DUPLICATE_7902_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_8503_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2297_l2293_l2290_l2314_l2309_l2302_DUPLICATE_7902_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c2_cadc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2293_l2290_l2285_l2309_l2302_DUPLICATE_9e6e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2293_l2290_l2285_l2309_l2302_DUPLICATE_9e6e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_5680_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2293_l2290_l2285_l2309_l2302_DUPLICATE_9e6e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_2667_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2293_l2290_l2285_l2309_l2302_DUPLICATE_9e6e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2309_c7_f4b0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2293_l2290_l2285_l2309_l2302_DUPLICATE_9e6e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2285_c2_cadc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2297_l2293_l2290_l2285_l2314_l2309_DUPLICATE_817f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2290_c7_f9b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2297_l2293_l2290_l2285_l2314_l2309_DUPLICATE_817f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c7_5680_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2297_l2293_l2290_l2285_l2314_l2309_DUPLICATE_817f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2297_c7_91e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2297_l2293_l2290_l2285_l2314_l2309_DUPLICATE_817f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2309_c7_f4b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2297_l2293_l2290_l2285_l2314_l2309_DUPLICATE_817f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2314_c7_8503_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2297_l2293_l2290_l2285_l2314_l2309_DUPLICATE_817f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2285_c2_cadc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2297_l2293_l2290_l2285_l2314_l2309_DUPLICATE_f026_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_f9b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2297_l2293_l2290_l2285_l2314_l2309_DUPLICATE_f026_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_5680_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2297_l2293_l2290_l2285_l2314_l2309_DUPLICATE_f026_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_91e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2297_l2293_l2290_l2285_l2314_l2309_DUPLICATE_f026_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_f4b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2297_l2293_l2290_l2285_l2314_l2309_DUPLICATE_f026_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_8503_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2297_l2293_l2290_l2285_l2314_l2309_DUPLICATE_f026_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_5680_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2293_l2309_l2297_DUPLICATE_eb5e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_91e6_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2293_l2309_l2297_DUPLICATE_eb5e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2309_c7_f4b0_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2293_l2309_l2297_DUPLICATE_eb5e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2285_c2_cadc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2297_l2293_l2290_l2285_l2309_DUPLICATE_24a9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2290_c7_f9b7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2297_l2293_l2290_l2285_l2309_DUPLICATE_24a9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c7_5680_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2297_l2293_l2290_l2285_l2309_DUPLICATE_24a9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2297_c7_91e6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2297_l2293_l2290_l2285_l2309_DUPLICATE_24a9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2309_c7_f4b0_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2297_l2293_l2290_l2285_l2309_DUPLICATE_24a9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_91e6_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2300_c30_cbe0_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2314_c7_8503] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2314_c7_8503_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2314_c7_8503_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2314_c7_8503_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2314_c7_8503_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2314_c7_8503_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2314_c7_8503_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2314_c7_8503_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2314_c7_8503_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2302_c7_2667] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_2667_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_2667_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_2667_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_2667_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_2667_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_2667_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_2667_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_2667_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2309_c7_f4b0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2309_c7_f4b0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2309_c7_f4b0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2309_c7_f4b0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2309_c7_f4b0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2309_c7_f4b0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2309_c7_f4b0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2309_c7_f4b0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2309_c7_f4b0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2314_c7_8503] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_8503_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_8503_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_8503_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_8503_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_8503_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_8503_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_8503_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_8503_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2314_c7_8503] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_8503_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_8503_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_8503_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_8503_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_8503_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_8503_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_8503_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_8503_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2298_c3_fea6] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2298_c3_fea6_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2298_c3_fea6_left;
     BIN_OP_OR_uxn_opcodes_h_l2298_c3_fea6_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2298_c3_fea6_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2298_c3_fea6_return_output := BIN_OP_OR_uxn_opcodes_h_l2298_c3_fea6_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2312_c21_c623] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2312_c21_c623_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2312_c31_9da6_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2309_c7_f4b0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2309_c7_f4b0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2309_c7_f4b0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2309_c7_f4b0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2309_c7_f4b0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2309_c7_f4b0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2309_c7_f4b0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2309_c7_f4b0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2309_c7_f4b0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2285_c1_bf6f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2285_c1_bf6f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2285_c1_bf6f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2285_c1_bf6f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2285_c1_bf6f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2285_c1_bf6f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2285_c1_bf6f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2285_c1_bf6f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2285_c1_bf6f_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2295_c3_32f0] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2295_c3_32f0_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2295_c3_32f0_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2295_c3_32f0_return_output := CONST_SL_8_uxn_opcodes_h_l2295_c3_32f0_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2297_c7_91e6_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2298_c3_fea6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2309_c7_f4b0_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2312_c21_c623_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2293_c7_5680_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2295_c3_32f0_return_output;
     VAR_printf_uxn_opcodes_h_l2286_c3_529b_uxn_opcodes_h_l2286_c3_529b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2285_c1_bf6f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_f4b0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_8503_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_2667_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2309_c7_f4b0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2309_c7_f4b0_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2314_c7_8503_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_f4b0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_8503_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_91e6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_2667_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_2667_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2309_c7_f4b0_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2309_c7_f4b0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_f4b0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_f4b0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_f4b0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_f4b0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_f4b0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_f4b0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_f4b0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_f4b0_return_output;

     -- printf_uxn_opcodes_h_l2286_c3_529b[uxn_opcodes_h_l2286_c3_529b] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2286_c3_529b_uxn_opcodes_h_l2286_c3_529b_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2286_c3_529b_uxn_opcodes_h_l2286_c3_529b_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2297_c7_91e6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_91e6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_91e6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_91e6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_91e6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_91e6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_91e6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2309_c7_f4b0] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2309_c7_f4b0_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2309_c7_f4b0_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2309_c7_f4b0_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2309_c7_f4b0_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2309_c7_f4b0_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2309_c7_f4b0_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2309_c7_f4b0_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2309_c7_f4b0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2302_c7_2667] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_2667_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_2667_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_2667_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_2667_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_2667_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_2667_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_2667_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_2667_return_output;

     -- t16_MUX[uxn_opcodes_h_l2297_c7_91e6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2297_c7_91e6_cond <= VAR_t16_MUX_uxn_opcodes_h_l2297_c7_91e6_cond;
     t16_MUX_uxn_opcodes_h_l2297_c7_91e6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2297_c7_91e6_iftrue;
     t16_MUX_uxn_opcodes_h_l2297_c7_91e6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2297_c7_91e6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output := t16_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2309_c7_f4b0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2309_c7_f4b0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2309_c7_f4b0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2309_c7_f4b0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2309_c7_f4b0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2309_c7_f4b0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2309_c7_f4b0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2309_c7_f4b0_return_output := result_u8_value_MUX_uxn_opcodes_h_l2309_c7_f4b0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2302_c7_2667] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_2667_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_2667_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_2667_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_2667_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_2667_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_2667_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_2667_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_2667_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2309_c7_f4b0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_f4b0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_f4b0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_f4b0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_f4b0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_f4b0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_f4b0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_f4b0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_f4b0_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_2667_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2309_c7_f4b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_91e6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_2667_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_2667_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2309_c7_f4b0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_2667_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2309_c7_f4b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_5680_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_91e6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_2667_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2302_c7_2667_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2309_c7_f4b0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2293_c7_5680_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2302_c7_2667] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_2667_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_2667_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_2667_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_2667_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_2667_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_2667_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_2667_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_2667_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2302_c7_2667] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2302_c7_2667_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2302_c7_2667_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2302_c7_2667_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2302_c7_2667_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2302_c7_2667_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2302_c7_2667_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2302_c7_2667_return_output := result_u8_value_MUX_uxn_opcodes_h_l2302_c7_2667_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2302_c7_2667] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_2667_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_2667_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_2667_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_2667_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_2667_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_2667_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_2667_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_2667_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2297_c7_91e6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_91e6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_91e6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_91e6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_91e6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_91e6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_91e6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output;

     -- t16_MUX[uxn_opcodes_h_l2293_c7_5680] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2293_c7_5680_cond <= VAR_t16_MUX_uxn_opcodes_h_l2293_c7_5680_cond;
     t16_MUX_uxn_opcodes_h_l2293_c7_5680_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2293_c7_5680_iftrue;
     t16_MUX_uxn_opcodes_h_l2293_c7_5680_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2293_c7_5680_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2293_c7_5680_return_output := t16_MUX_uxn_opcodes_h_l2293_c7_5680_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2302_c7_2667] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_2667_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_2667_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_2667_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_2667_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_2667_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_2667_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_2667_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_2667_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2293_c7_5680] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_5680_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_5680_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_5680_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_5680_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_5680_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_5680_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_5680_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_5680_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2297_c7_91e6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_91e6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_91e6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_91e6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_91e6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_91e6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_91e6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_91e6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_2667_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_5680_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2297_c7_91e6_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2302_c7_2667_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_91e6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_2667_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_5680_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_5680_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2297_c7_91e6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2302_c7_2667_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2290_c7_f9b7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2293_c7_5680_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2297_c7_91e6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_91e6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_91e6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_91e6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_91e6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_91e6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_91e6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2297_c7_91e6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2297_c7_91e6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2297_c7_91e6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2297_c7_91e6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2297_c7_91e6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2297_c7_91e6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2297_c7_91e6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output := result_u8_value_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2297_c7_91e6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_91e6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_91e6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_91e6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_91e6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_91e6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_91e6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2297_c7_91e6] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2297_c7_91e6_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2297_c7_91e6_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2297_c7_91e6_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2297_c7_91e6_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2297_c7_91e6_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2297_c7_91e6_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2293_c7_5680] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_5680_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_5680_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_5680_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_5680_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_5680_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_5680_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_5680_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_5680_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2293_c7_5680] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_5680_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_5680_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_5680_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_5680_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_5680_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_5680_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_5680_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_5680_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2290_c7_f9b7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output;

     -- t16_MUX[uxn_opcodes_h_l2290_c7_f9b7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2290_c7_f9b7_cond <= VAR_t16_MUX_uxn_opcodes_h_l2290_c7_f9b7_cond;
     t16_MUX_uxn_opcodes_h_l2290_c7_f9b7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2290_c7_f9b7_iftrue;
     t16_MUX_uxn_opcodes_h_l2290_c7_f9b7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2290_c7_f9b7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output := t16_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_5680_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_5680_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c7_5680_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_5680_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c2_cadc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_f9b7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_5680_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c7_5680_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2297_c7_91e6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2285_c2_cadc_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2293_c7_5680] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_5680_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_5680_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_5680_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_5680_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_5680_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_5680_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_5680_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_5680_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2293_c7_5680] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_5680_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_5680_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_5680_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_5680_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_5680_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_5680_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_5680_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_5680_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2293_c7_5680] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c7_5680_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c7_5680_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c7_5680_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c7_5680_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c7_5680_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c7_5680_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c7_5680_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c7_5680_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2290_c7_f9b7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2293_c7_5680] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2293_c7_5680_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c7_5680_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2293_c7_5680_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c7_5680_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2293_c7_5680_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c7_5680_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c7_5680_return_output := result_u8_value_MUX_uxn_opcodes_h_l2293_c7_5680_return_output;

     -- t16_MUX[uxn_opcodes_h_l2285_c2_cadc] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2285_c2_cadc_cond <= VAR_t16_MUX_uxn_opcodes_h_l2285_c2_cadc_cond;
     t16_MUX_uxn_opcodes_h_l2285_c2_cadc_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2285_c2_cadc_iftrue;
     t16_MUX_uxn_opcodes_h_l2285_c2_cadc_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2285_c2_cadc_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output := t16_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2285_c2_cadc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c2_cadc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c2_cadc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c2_cadc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c2_cadc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c2_cadc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c2_cadc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2290_c7_f9b7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_f9b7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_f9b7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_f9b7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_f9b7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_f9b7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_f9b7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_f9b7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_5680_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c2_cadc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2290_c7_f9b7_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2293_c7_5680_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_f9b7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_5680_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c2_cadc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2290_c7_f9b7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2293_c7_5680_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2285_c2_cadc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c2_cadc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c2_cadc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c2_cadc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c2_cadc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c2_cadc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c2_cadc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2290_c7_f9b7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_f9b7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_f9b7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_f9b7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_f9b7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_f9b7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_f9b7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2290_c7_f9b7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_f9b7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_f9b7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_f9b7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_f9b7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_f9b7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_f9b7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2290_c7_f9b7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2290_c7_f9b7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2290_c7_f9b7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2290_c7_f9b7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2290_c7_f9b7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2290_c7_f9b7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2290_c7_f9b7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output := result_u8_value_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2290_c7_f9b7] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2290_c7_f9b7_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2290_c7_f9b7_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2290_c7_f9b7_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2290_c7_f9b7_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2290_c7_f9b7_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2290_c7_f9b7_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2285_c2_cadc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c2_cadc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c2_cadc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c2_cadc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c2_cadc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c2_cadc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c2_cadc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2285_c2_cadc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2285_c2_cadc_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2285_c2_cadc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2285_c2_cadc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2290_c7_f9b7_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2285_c2_cadc] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2285_c2_cadc_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2285_c2_cadc_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2285_c2_cadc_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2285_c2_cadc_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2285_c2_cadc_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2285_c2_cadc_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2285_c2_cadc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2285_c2_cadc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2285_c2_cadc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2285_c2_cadc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2285_c2_cadc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2285_c2_cadc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2285_c2_cadc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2285_c2_cadc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2285_c2_cadc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2285_c2_cadc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2285_c2_cadc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2285_c2_cadc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2285_c2_cadc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2285_c2_cadc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2285_c2_cadc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2285_c2_cadc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2285_c2_cadc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2285_c2_cadc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2285_c2_cadc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2285_c2_cadc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2285_c2_cadc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output := result_u8_value_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_308d_uxn_opcodes_h_l2320_l2281_DUPLICATE_1f1b LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_308d_uxn_opcodes_h_l2320_l2281_DUPLICATE_1f1b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_308d(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c2_cadc_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_308d_uxn_opcodes_h_l2320_l2281_DUPLICATE_1f1b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_308d_uxn_opcodes_h_l2320_l2281_DUPLICATE_1f1b_return_output;
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
