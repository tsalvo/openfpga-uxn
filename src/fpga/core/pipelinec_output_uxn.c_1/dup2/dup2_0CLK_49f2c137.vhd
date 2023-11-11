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
-- Submodules: 62
entity dup2_0CLK_49f2c137 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end dup2_0CLK_49f2c137;
architecture arch of dup2_0CLK_49f2c137 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2653_c6_4013]
signal BIN_OP_EQ_uxn_opcodes_h_l2653_c6_4013_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2653_c6_4013_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2653_c6_4013_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2653_c1_abdf]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_abdf_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_abdf_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_abdf_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_abdf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2653_c2_b686]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_b686_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_b686_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_b686_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_b686_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2653_c2_b686]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_b686_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_b686_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_b686_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_b686_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2653_c2_b686]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_b686_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_b686_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_b686_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_b686_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2653_c2_b686]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_b686_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_b686_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_b686_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_b686_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2653_c2_b686]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_b686_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_b686_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_b686_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_b686_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2653_c2_b686]
signal result_u8_value_MUX_uxn_opcodes_h_l2653_c2_b686_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2653_c2_b686_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2653_c2_b686_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2653_c2_b686_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2653_c2_b686]
signal t16_MUX_uxn_opcodes_h_l2653_c2_b686_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2653_c2_b686_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2653_c2_b686_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2653_c2_b686_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2654_c3_050a[uxn_opcodes_h_l2654_c3_050a]
signal printf_uxn_opcodes_h_l2654_c3_050a_uxn_opcodes_h_l2654_c3_050a_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2658_c11_2ee7]
signal BIN_OP_EQ_uxn_opcodes_h_l2658_c11_2ee7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2658_c11_2ee7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2658_c11_2ee7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2658_c7_e09a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_e09a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_e09a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_e09a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_e09a_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2658_c7_e09a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_e09a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_e09a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_e09a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_e09a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2658_c7_e09a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_e09a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_e09a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_e09a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_e09a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2658_c7_e09a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_e09a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_e09a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_e09a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_e09a_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2658_c7_e09a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_e09a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_e09a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_e09a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_e09a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2658_c7_e09a]
signal result_u8_value_MUX_uxn_opcodes_h_l2658_c7_e09a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2658_c7_e09a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2658_c7_e09a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2658_c7_e09a_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2658_c7_e09a]
signal t16_MUX_uxn_opcodes_h_l2658_c7_e09a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2658_c7_e09a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2658_c7_e09a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2658_c7_e09a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2661_c11_f924]
signal BIN_OP_EQ_uxn_opcodes_h_l2661_c11_f924_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2661_c11_f924_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2661_c11_f924_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2661_c7_46e0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_46e0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_46e0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_46e0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_46e0_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2661_c7_46e0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_46e0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_46e0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_46e0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_46e0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2661_c7_46e0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_46e0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_46e0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_46e0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_46e0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2661_c7_46e0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_46e0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_46e0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_46e0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_46e0_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2661_c7_46e0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_46e0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_46e0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_46e0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_46e0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2661_c7_46e0]
signal result_u8_value_MUX_uxn_opcodes_h_l2661_c7_46e0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2661_c7_46e0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2661_c7_46e0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2661_c7_46e0_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2661_c7_46e0]
signal t16_MUX_uxn_opcodes_h_l2661_c7_46e0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2661_c7_46e0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2661_c7_46e0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2661_c7_46e0_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2663_c3_ac6d]
signal CONST_SL_8_uxn_opcodes_h_l2663_c3_ac6d_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2663_c3_ac6d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2665_c11_479f]
signal BIN_OP_EQ_uxn_opcodes_h_l2665_c11_479f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2665_c11_479f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2665_c11_479f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2665_c7_87de]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_87de_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_87de_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_87de_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_87de_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2665_c7_87de]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_87de_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_87de_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_87de_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_87de_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2665_c7_87de]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_87de_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_87de_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_87de_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_87de_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2665_c7_87de]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_87de_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_87de_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_87de_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_87de_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2665_c7_87de]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_87de_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_87de_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_87de_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_87de_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2665_c7_87de]
signal result_u8_value_MUX_uxn_opcodes_h_l2665_c7_87de_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2665_c7_87de_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2665_c7_87de_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2665_c7_87de_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2665_c7_87de]
signal t16_MUX_uxn_opcodes_h_l2665_c7_87de_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2665_c7_87de_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2665_c7_87de_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2665_c7_87de_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2666_c3_cacc]
signal BIN_OP_OR_uxn_opcodes_h_l2666_c3_cacc_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2666_c3_cacc_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2666_c3_cacc_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2668_c30_8d2c]
signal sp_relative_shift_uxn_opcodes_h_l2668_c30_8d2c_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2668_c30_8d2c_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2668_c30_8d2c_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2668_c30_8d2c_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2673_c11_66a4]
signal BIN_OP_EQ_uxn_opcodes_h_l2673_c11_66a4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2673_c11_66a4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2673_c11_66a4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2673_c7_282b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_282b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_282b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_282b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_282b_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2673_c7_282b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_282b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_282b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_282b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_282b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2673_c7_282b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_282b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_282b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_282b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_282b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2673_c7_282b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_282b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_282b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_282b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_282b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2673_c7_282b]
signal result_u8_value_MUX_uxn_opcodes_h_l2673_c7_282b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2673_c7_282b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2673_c7_282b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2673_c7_282b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2678_c11_eb77]
signal BIN_OP_EQ_uxn_opcodes_h_l2678_c11_eb77_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2678_c11_eb77_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2678_c11_eb77_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2678_c7_4d51]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_4d51_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_4d51_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_4d51_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_4d51_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2678_c7_4d51]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_4d51_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_4d51_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_4d51_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_4d51_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2678_c7_4d51]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_4d51_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_4d51_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_4d51_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_4d51_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2678_c7_4d51]
signal result_u8_value_MUX_uxn_opcodes_h_l2678_c7_4d51_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2678_c7_4d51_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2678_c7_4d51_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2678_c7_4d51_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2682_c11_4aa4]
signal BIN_OP_EQ_uxn_opcodes_h_l2682_c11_4aa4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2682_c11_4aa4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2682_c11_4aa4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2682_c7_a6d6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2682_c7_a6d6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2682_c7_a6d6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2682_c7_a6d6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2682_c7_a6d6_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2682_c7_a6d6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_a6d6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_a6d6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_a6d6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_a6d6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2682_c7_a6d6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_a6d6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_a6d6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_a6d6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_a6d6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2682_c7_a6d6]
signal result_u8_value_MUX_uxn_opcodes_h_l2682_c7_a6d6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2682_c7_a6d6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2682_c7_a6d6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2682_c7_a6d6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2686_c11_3bef]
signal BIN_OP_EQ_uxn_opcodes_h_l2686_c11_3bef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2686_c11_3bef_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2686_c11_3bef_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2686_c7_8ca7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_8ca7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_8ca7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_8ca7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_8ca7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2686_c7_8ca7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_8ca7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_8ca7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_8ca7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_8ca7_return_output : unsigned(0 downto 0);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l2684_l2676_DUPLICATE_d78d
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l2684_l2676_DUPLICATE_d78d_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l2684_l2676_DUPLICATE_d78d_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_4e73( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2653_c6_4013
BIN_OP_EQ_uxn_opcodes_h_l2653_c6_4013 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2653_c6_4013_left,
BIN_OP_EQ_uxn_opcodes_h_l2653_c6_4013_right,
BIN_OP_EQ_uxn_opcodes_h_l2653_c6_4013_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_abdf
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_abdf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_abdf_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_abdf_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_abdf_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_abdf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_b686
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_b686 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_b686_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_b686_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_b686_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_b686_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_b686
result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_b686 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_b686_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_b686_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_b686_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_b686_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_b686
result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_b686 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_b686_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_b686_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_b686_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_b686_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_b686
result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_b686 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_b686_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_b686_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_b686_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_b686_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_b686
result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_b686 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_b686_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_b686_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_b686_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_b686_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2653_c2_b686
result_u8_value_MUX_uxn_opcodes_h_l2653_c2_b686 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2653_c2_b686_cond,
result_u8_value_MUX_uxn_opcodes_h_l2653_c2_b686_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2653_c2_b686_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2653_c2_b686_return_output);

-- t16_MUX_uxn_opcodes_h_l2653_c2_b686
t16_MUX_uxn_opcodes_h_l2653_c2_b686 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2653_c2_b686_cond,
t16_MUX_uxn_opcodes_h_l2653_c2_b686_iftrue,
t16_MUX_uxn_opcodes_h_l2653_c2_b686_iffalse,
t16_MUX_uxn_opcodes_h_l2653_c2_b686_return_output);

-- printf_uxn_opcodes_h_l2654_c3_050a_uxn_opcodes_h_l2654_c3_050a
printf_uxn_opcodes_h_l2654_c3_050a_uxn_opcodes_h_l2654_c3_050a : entity work.printf_uxn_opcodes_h_l2654_c3_050a_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2654_c3_050a_uxn_opcodes_h_l2654_c3_050a_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2658_c11_2ee7
BIN_OP_EQ_uxn_opcodes_h_l2658_c11_2ee7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2658_c11_2ee7_left,
BIN_OP_EQ_uxn_opcodes_h_l2658_c11_2ee7_right,
BIN_OP_EQ_uxn_opcodes_h_l2658_c11_2ee7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_e09a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_e09a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_e09a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_e09a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_e09a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_e09a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_e09a
result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_e09a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_e09a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_e09a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_e09a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_e09a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_e09a
result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_e09a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_e09a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_e09a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_e09a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_e09a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_e09a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_e09a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_e09a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_e09a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_e09a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_e09a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_e09a
result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_e09a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_e09a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_e09a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_e09a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_e09a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2658_c7_e09a
result_u8_value_MUX_uxn_opcodes_h_l2658_c7_e09a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2658_c7_e09a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2658_c7_e09a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2658_c7_e09a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2658_c7_e09a_return_output);

-- t16_MUX_uxn_opcodes_h_l2658_c7_e09a
t16_MUX_uxn_opcodes_h_l2658_c7_e09a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2658_c7_e09a_cond,
t16_MUX_uxn_opcodes_h_l2658_c7_e09a_iftrue,
t16_MUX_uxn_opcodes_h_l2658_c7_e09a_iffalse,
t16_MUX_uxn_opcodes_h_l2658_c7_e09a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2661_c11_f924
BIN_OP_EQ_uxn_opcodes_h_l2661_c11_f924 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2661_c11_f924_left,
BIN_OP_EQ_uxn_opcodes_h_l2661_c11_f924_right,
BIN_OP_EQ_uxn_opcodes_h_l2661_c11_f924_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_46e0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_46e0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_46e0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_46e0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_46e0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_46e0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_46e0
result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_46e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_46e0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_46e0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_46e0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_46e0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_46e0
result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_46e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_46e0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_46e0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_46e0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_46e0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_46e0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_46e0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_46e0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_46e0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_46e0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_46e0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_46e0
result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_46e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_46e0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_46e0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_46e0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_46e0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2661_c7_46e0
result_u8_value_MUX_uxn_opcodes_h_l2661_c7_46e0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2661_c7_46e0_cond,
result_u8_value_MUX_uxn_opcodes_h_l2661_c7_46e0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2661_c7_46e0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2661_c7_46e0_return_output);

-- t16_MUX_uxn_opcodes_h_l2661_c7_46e0
t16_MUX_uxn_opcodes_h_l2661_c7_46e0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2661_c7_46e0_cond,
t16_MUX_uxn_opcodes_h_l2661_c7_46e0_iftrue,
t16_MUX_uxn_opcodes_h_l2661_c7_46e0_iffalse,
t16_MUX_uxn_opcodes_h_l2661_c7_46e0_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2663_c3_ac6d
CONST_SL_8_uxn_opcodes_h_l2663_c3_ac6d : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2663_c3_ac6d_x,
CONST_SL_8_uxn_opcodes_h_l2663_c3_ac6d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2665_c11_479f
BIN_OP_EQ_uxn_opcodes_h_l2665_c11_479f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2665_c11_479f_left,
BIN_OP_EQ_uxn_opcodes_h_l2665_c11_479f_right,
BIN_OP_EQ_uxn_opcodes_h_l2665_c11_479f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_87de
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_87de : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_87de_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_87de_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_87de_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_87de_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_87de
result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_87de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_87de_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_87de_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_87de_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_87de_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_87de
result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_87de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_87de_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_87de_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_87de_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_87de_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_87de
result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_87de : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_87de_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_87de_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_87de_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_87de_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_87de
result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_87de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_87de_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_87de_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_87de_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_87de_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2665_c7_87de
result_u8_value_MUX_uxn_opcodes_h_l2665_c7_87de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2665_c7_87de_cond,
result_u8_value_MUX_uxn_opcodes_h_l2665_c7_87de_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2665_c7_87de_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2665_c7_87de_return_output);

-- t16_MUX_uxn_opcodes_h_l2665_c7_87de
t16_MUX_uxn_opcodes_h_l2665_c7_87de : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2665_c7_87de_cond,
t16_MUX_uxn_opcodes_h_l2665_c7_87de_iftrue,
t16_MUX_uxn_opcodes_h_l2665_c7_87de_iffalse,
t16_MUX_uxn_opcodes_h_l2665_c7_87de_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2666_c3_cacc
BIN_OP_OR_uxn_opcodes_h_l2666_c3_cacc : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2666_c3_cacc_left,
BIN_OP_OR_uxn_opcodes_h_l2666_c3_cacc_right,
BIN_OP_OR_uxn_opcodes_h_l2666_c3_cacc_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2668_c30_8d2c
sp_relative_shift_uxn_opcodes_h_l2668_c30_8d2c : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2668_c30_8d2c_ins,
sp_relative_shift_uxn_opcodes_h_l2668_c30_8d2c_x,
sp_relative_shift_uxn_opcodes_h_l2668_c30_8d2c_y,
sp_relative_shift_uxn_opcodes_h_l2668_c30_8d2c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2673_c11_66a4
BIN_OP_EQ_uxn_opcodes_h_l2673_c11_66a4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2673_c11_66a4_left,
BIN_OP_EQ_uxn_opcodes_h_l2673_c11_66a4_right,
BIN_OP_EQ_uxn_opcodes_h_l2673_c11_66a4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_282b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_282b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_282b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_282b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_282b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_282b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_282b
result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_282b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_282b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_282b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_282b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_282b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_282b
result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_282b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_282b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_282b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_282b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_282b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_282b
result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_282b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_282b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_282b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_282b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_282b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2673_c7_282b
result_u8_value_MUX_uxn_opcodes_h_l2673_c7_282b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2673_c7_282b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2673_c7_282b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2673_c7_282b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2673_c7_282b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2678_c11_eb77
BIN_OP_EQ_uxn_opcodes_h_l2678_c11_eb77 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2678_c11_eb77_left,
BIN_OP_EQ_uxn_opcodes_h_l2678_c11_eb77_right,
BIN_OP_EQ_uxn_opcodes_h_l2678_c11_eb77_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_4d51
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_4d51 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_4d51_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_4d51_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_4d51_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_4d51_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_4d51
result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_4d51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_4d51_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_4d51_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_4d51_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_4d51_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_4d51
result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_4d51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_4d51_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_4d51_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_4d51_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_4d51_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2678_c7_4d51
result_u8_value_MUX_uxn_opcodes_h_l2678_c7_4d51 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2678_c7_4d51_cond,
result_u8_value_MUX_uxn_opcodes_h_l2678_c7_4d51_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2678_c7_4d51_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2678_c7_4d51_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2682_c11_4aa4
BIN_OP_EQ_uxn_opcodes_h_l2682_c11_4aa4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2682_c11_4aa4_left,
BIN_OP_EQ_uxn_opcodes_h_l2682_c11_4aa4_right,
BIN_OP_EQ_uxn_opcodes_h_l2682_c11_4aa4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2682_c7_a6d6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2682_c7_a6d6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2682_c7_a6d6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2682_c7_a6d6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2682_c7_a6d6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2682_c7_a6d6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_a6d6
result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_a6d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_a6d6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_a6d6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_a6d6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_a6d6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_a6d6
result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_a6d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_a6d6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_a6d6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_a6d6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_a6d6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2682_c7_a6d6
result_u8_value_MUX_uxn_opcodes_h_l2682_c7_a6d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2682_c7_a6d6_cond,
result_u8_value_MUX_uxn_opcodes_h_l2682_c7_a6d6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2682_c7_a6d6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2682_c7_a6d6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2686_c11_3bef
BIN_OP_EQ_uxn_opcodes_h_l2686_c11_3bef : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2686_c11_3bef_left,
BIN_OP_EQ_uxn_opcodes_h_l2686_c11_3bef_right,
BIN_OP_EQ_uxn_opcodes_h_l2686_c11_3bef_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_8ca7
result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_8ca7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_8ca7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_8ca7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_8ca7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_8ca7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_8ca7
result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_8ca7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_8ca7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_8ca7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_8ca7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_8ca7_return_output);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l2684_l2676_DUPLICATE_d78d
CONST_SR_8_uint16_t_uxn_opcodes_h_l2684_l2676_DUPLICATE_d78d : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_opcodes_h_l2684_l2676_DUPLICATE_d78d_x,
CONST_SR_8_uint16_t_uxn_opcodes_h_l2684_l2676_DUPLICATE_d78d_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2653_c6_4013_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_abdf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_b686_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_b686_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_b686_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_b686_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_b686_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2653_c2_b686_return_output,
 t16_MUX_uxn_opcodes_h_l2653_c2_b686_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2658_c11_2ee7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_e09a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_e09a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_e09a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_e09a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_e09a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2658_c7_e09a_return_output,
 t16_MUX_uxn_opcodes_h_l2658_c7_e09a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2661_c11_f924_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_46e0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_46e0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_46e0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_46e0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_46e0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2661_c7_46e0_return_output,
 t16_MUX_uxn_opcodes_h_l2661_c7_46e0_return_output,
 CONST_SL_8_uxn_opcodes_h_l2663_c3_ac6d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2665_c11_479f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_87de_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_87de_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_87de_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_87de_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_87de_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2665_c7_87de_return_output,
 t16_MUX_uxn_opcodes_h_l2665_c7_87de_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2666_c3_cacc_return_output,
 sp_relative_shift_uxn_opcodes_h_l2668_c30_8d2c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2673_c11_66a4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_282b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_282b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_282b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_282b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2673_c7_282b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2678_c11_eb77_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_4d51_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_4d51_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_4d51_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2678_c7_4d51_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2682_c11_4aa4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2682_c7_a6d6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_a6d6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_a6d6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2682_c7_a6d6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2686_c11_3bef_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_8ca7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_8ca7_return_output,
 CONST_SR_8_uint16_t_uxn_opcodes_h_l2684_l2676_DUPLICATE_d78d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c6_4013_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c6_4013_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c6_4013_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_abdf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_abdf_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_abdf_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_abdf_iffalse : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_b686_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2655_c3_1178 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_b686_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_e09a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_b686_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_b686_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_b686_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_b686_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_e09a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_b686_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_b686_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_b686_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_b686_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_e09a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_b686_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_b686_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_b686_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_b686_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_e09a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_b686_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_b686_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_b686_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_b686_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_e09a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_b686_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_b686_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c2_b686_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c2_b686_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2658_c7_e09a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c2_b686_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c2_b686_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2653_c2_b686_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2653_c2_b686_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2658_c7_e09a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2653_c2_b686_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2653_c2_b686_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2654_c3_050a_uxn_opcodes_h_l2654_c3_050a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_2ee7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_2ee7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_2ee7_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_e09a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2659_c3_0940 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_e09a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_46e0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_e09a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_e09a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_e09a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_46e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_e09a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_e09a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_e09a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_46e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_e09a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_e09a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_e09a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_46e0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_e09a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_e09a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_e09a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_46e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_e09a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2658_c7_e09a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2658_c7_e09a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_46e0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2658_c7_e09a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2658_c7_e09a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2658_c7_e09a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2661_c7_46e0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2658_c7_e09a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_f924_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_f924_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_f924_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_46e0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_46e0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_87de_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_46e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_46e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_46e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_87de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_46e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_46e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_46e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_87de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_46e0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_46e0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_46e0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_87de_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_46e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_46e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_46e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_87de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_46e0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_46e0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_46e0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2665_c7_87de_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_46e0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2661_c7_46e0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2661_c7_46e0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2665_c7_87de_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2661_c7_46e0_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2663_c3_ac6d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2663_c3_ac6d_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2665_c11_479f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2665_c11_479f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2665_c11_479f_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_87de_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2670_c3_784b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_87de_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_282b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_87de_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_87de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_87de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_282b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_87de_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_87de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_87de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_282b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_87de_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_87de_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_87de_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_87de_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_87de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_87de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_282b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_87de_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2665_c7_87de_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2665_c7_87de_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2673_c7_282b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2665_c7_87de_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2665_c7_87de_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2665_c7_87de_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2665_c7_87de_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2666_c3_cacc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2666_c3_cacc_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2666_c3_cacc_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2668_c30_8d2c_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2668_c30_8d2c_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2668_c30_8d2c_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2668_c30_8d2c_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2671_c21_f5c4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_66a4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_66a4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_66a4_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_282b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2675_c3_c2a4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_282b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_4d51_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_282b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_282b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_282b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_4d51_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_282b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_282b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_282b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_4d51_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_282b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_282b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_282b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_282b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2673_c7_282b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2673_c7_282b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2678_c7_4d51_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2673_c7_282b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_eb77_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_eb77_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_eb77_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_4d51_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2679_c3_0367 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_4d51_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2682_c7_a6d6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_4d51_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_4d51_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_4d51_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_a6d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_4d51_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_4d51_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_4d51_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_a6d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_4d51_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2678_c7_4d51_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2678_c7_4d51_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2682_c7_a6d6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2678_c7_4d51_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2680_c21_858f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2682_c11_4aa4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2682_c11_4aa4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2682_c11_4aa4_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2682_c7_a6d6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2683_c3_22d2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2682_c7_a6d6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2682_c7_a6d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_a6d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_a6d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_8ca7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_a6d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_a6d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_a6d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_8ca7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_a6d6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2682_c7_a6d6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2682_c7_a6d6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2682_c7_a6d6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_3bef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_3bef_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_3bef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_8ca7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_8ca7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_8ca7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_8ca7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_8ca7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_8ca7_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2661_l2658_l2686_l2653_l2682_l2678_l2673_DUPLICATE_072d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2661_l2653_l2658_l2673_DUPLICATE_e90c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2661_l2653_l2665_l2658_DUPLICATE_a118_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2661_l2653_l2682_l2658_DUPLICATE_864f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2665_l2661_l2658_l2686_l2682_l2678_l2673_DUPLICATE_a46c_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2662_l2666_DUPLICATE_6da9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2661_l2682_DUPLICATE_6d7d_return_output : unsigned(3 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l2684_l2676_DUPLICATE_d78d_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l2684_l2676_DUPLICATE_d78d_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l2676_l2684_DUPLICATE_47ac_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l2691_l2649_DUPLICATE_050d_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2670_c3_784b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_87de_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2670_c3_784b;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_282b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_f924_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2665_c11_479f_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_8ca7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_2ee7_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_b686_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2675_c3_c2a4 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_282b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2675_c3_c2a4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c6_4013_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2668_c30_8d2c_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2683_c3_22d2 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2682_c7_a6d6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2683_c3_22d2;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2655_c3_1178 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_b686_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2655_c3_1178;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2679_c3_0367 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_4d51_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2679_c3_0367;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_abdf_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2659_c3_0940 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_e09a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2659_c3_0940;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_87de_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2668_c30_8d2c_y := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_eb77_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_8ca7_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_3bef_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2682_c11_4aa4_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_66a4_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_87de_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_abdf_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2668_c30_8d2c_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c6_4013_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_2ee7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_f924_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2665_c11_479f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_66a4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_eb77_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2682_c11_4aa4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_3bef_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2666_c3_cacc_left := t16;
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l2684_l2676_DUPLICATE_d78d_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2653_c2_b686_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2658_c7_e09a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2665_c7_87de_iffalse := t16;
     -- sp_relative_shift[uxn_opcodes_h_l2668_c30_8d2c] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2668_c30_8d2c_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2668_c30_8d2c_ins;
     sp_relative_shift_uxn_opcodes_h_l2668_c30_8d2c_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2668_c30_8d2c_x;
     sp_relative_shift_uxn_opcodes_h_l2668_c30_8d2c_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2668_c30_8d2c_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2668_c30_8d2c_return_output := sp_relative_shift_uxn_opcodes_h_l2668_c30_8d2c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2661_l2658_l2686_l2653_l2682_l2678_l2673_DUPLICATE_072d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2661_l2658_l2686_l2653_l2682_l2678_l2673_DUPLICATE_072d_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2682_c11_4aa4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2682_c11_4aa4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2682_c11_4aa4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2682_c11_4aa4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2682_c11_4aa4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2682_c11_4aa4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2682_c11_4aa4_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2680_c21_858f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2680_c21_858f_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2661_l2682_DUPLICATE_6d7d LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2661_l2682_DUPLICATE_6d7d_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2673_c11_66a4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2673_c11_66a4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_66a4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2673_c11_66a4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_66a4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_66a4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2673_c11_66a4_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2661_l2653_l2682_l2658_DUPLICATE_864f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2661_l2653_l2682_l2658_DUPLICATE_864f_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2661_l2653_l2658_l2673_DUPLICATE_e90c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2661_l2653_l2658_l2673_DUPLICATE_e90c_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2665_l2661_l2658_l2686_l2682_l2678_l2673_DUPLICATE_a46c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2665_l2661_l2658_l2686_l2682_l2678_l2673_DUPLICATE_a46c_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2661_c11_f924] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2661_c11_f924_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_f924_left;
     BIN_OP_EQ_uxn_opcodes_h_l2661_c11_f924_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_f924_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_f924_return_output := BIN_OP_EQ_uxn_opcodes_h_l2661_c11_f924_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2661_l2653_l2665_l2658_DUPLICATE_a118 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2661_l2653_l2665_l2658_DUPLICATE_a118_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2686_c11_3bef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2686_c11_3bef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_3bef_left;
     BIN_OP_EQ_uxn_opcodes_h_l2686_c11_3bef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_3bef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_3bef_return_output := BIN_OP_EQ_uxn_opcodes_h_l2686_c11_3bef_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2653_c6_4013] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2653_c6_4013_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c6_4013_left;
     BIN_OP_EQ_uxn_opcodes_h_l2653_c6_4013_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c6_4013_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c6_4013_return_output := BIN_OP_EQ_uxn_opcodes_h_l2653_c6_4013_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2658_c11_2ee7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2658_c11_2ee7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_2ee7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2658_c11_2ee7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_2ee7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_2ee7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2658_c11_2ee7_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2662_l2666_DUPLICATE_6da9 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2662_l2666_DUPLICATE_6da9_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_SR_8_uint16_t_uxn_opcodes_h_l2684_l2676_DUPLICATE_d78d LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_opcodes_h_l2684_l2676_DUPLICATE_d78d_x <= VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l2684_l2676_DUPLICATE_d78d_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l2684_l2676_DUPLICATE_d78d_return_output := CONST_SR_8_uint16_t_uxn_opcodes_h_l2684_l2676_DUPLICATE_d78d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2678_c11_eb77] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2678_c11_eb77_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_eb77_left;
     BIN_OP_EQ_uxn_opcodes_h_l2678_c11_eb77_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_eb77_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_eb77_return_output := BIN_OP_EQ_uxn_opcodes_h_l2678_c11_eb77_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2665_c11_479f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2665_c11_479f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2665_c11_479f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2665_c11_479f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2665_c11_479f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2665_c11_479f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2665_c11_479f_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_abdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c6_4013_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_b686_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c6_4013_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_b686_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c6_4013_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_b686_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c6_4013_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_b686_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c6_4013_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_b686_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c6_4013_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c2_b686_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c6_4013_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2653_c2_b686_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c6_4013_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_e09a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_2ee7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_e09a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_2ee7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_e09a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_2ee7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_e09a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_2ee7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_e09a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_2ee7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2658_c7_e09a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_2ee7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2658_c7_e09a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_2ee7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_46e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_f924_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_46e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_f924_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_46e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_f924_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_46e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_f924_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_46e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_f924_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_46e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_f924_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2661_c7_46e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_f924_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_87de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2665_c11_479f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_87de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2665_c11_479f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_87de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2665_c11_479f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_87de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2665_c11_479f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_87de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2665_c11_479f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2665_c7_87de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2665_c11_479f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2665_c7_87de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2665_c11_479f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_282b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_66a4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_282b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_66a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_282b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_66a4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_282b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_66a4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2673_c7_282b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_66a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_4d51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_eb77_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_4d51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_eb77_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_4d51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_eb77_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2678_c7_4d51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_eb77_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_a6d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2682_c11_4aa4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_a6d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2682_c11_4aa4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2682_c7_a6d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2682_c11_4aa4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2682_c7_a6d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2682_c11_4aa4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_8ca7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_3bef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_8ca7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_3bef_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2666_c3_cacc_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2662_l2666_DUPLICATE_6da9_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2663_c3_ac6d_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2662_l2666_DUPLICATE_6da9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2678_c7_4d51_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2680_c21_858f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_b686_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2661_l2653_l2665_l2658_DUPLICATE_a118_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_e09a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2661_l2653_l2665_l2658_DUPLICATE_a118_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_46e0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2661_l2653_l2665_l2658_DUPLICATE_a118_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_87de_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2661_l2653_l2665_l2658_DUPLICATE_a118_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_e09a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2665_l2661_l2658_l2686_l2682_l2678_l2673_DUPLICATE_a46c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_46e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2665_l2661_l2658_l2686_l2682_l2678_l2673_DUPLICATE_a46c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_87de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2665_l2661_l2658_l2686_l2682_l2678_l2673_DUPLICATE_a46c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_282b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2665_l2661_l2658_l2686_l2682_l2678_l2673_DUPLICATE_a46c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_4d51_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2665_l2661_l2658_l2686_l2682_l2678_l2673_DUPLICATE_a46c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_a6d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2665_l2661_l2658_l2686_l2682_l2678_l2673_DUPLICATE_a46c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_8ca7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2665_l2661_l2658_l2686_l2682_l2678_l2673_DUPLICATE_a46c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_b686_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2661_l2653_l2658_l2673_DUPLICATE_e90c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_e09a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2661_l2653_l2658_l2673_DUPLICATE_e90c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_46e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2661_l2653_l2658_l2673_DUPLICATE_e90c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_282b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2661_l2653_l2658_l2673_DUPLICATE_e90c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_b686_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2661_l2658_l2686_l2653_l2682_l2678_l2673_DUPLICATE_072d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_e09a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2661_l2658_l2686_l2653_l2682_l2678_l2673_DUPLICATE_072d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_46e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2661_l2658_l2686_l2653_l2682_l2678_l2673_DUPLICATE_072d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_282b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2661_l2658_l2686_l2653_l2682_l2678_l2673_DUPLICATE_072d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_4d51_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2661_l2658_l2686_l2653_l2682_l2678_l2673_DUPLICATE_072d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_a6d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2661_l2658_l2686_l2653_l2682_l2678_l2673_DUPLICATE_072d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_8ca7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2661_l2658_l2686_l2653_l2682_l2678_l2673_DUPLICATE_072d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_46e0_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2661_l2682_DUPLICATE_6d7d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2682_c7_a6d6_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2661_l2682_DUPLICATE_6d7d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c2_b686_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2661_l2653_l2682_l2658_DUPLICATE_864f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2658_c7_e09a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2661_l2653_l2682_l2658_DUPLICATE_864f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_46e0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2661_l2653_l2682_l2658_DUPLICATE_864f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2682_c7_a6d6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2661_l2653_l2682_l2658_DUPLICATE_864f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_87de_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2668_c30_8d2c_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2665_c7_87de] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_87de_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_87de_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_87de_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_87de_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_87de_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_87de_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_87de_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_87de_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2686_c7_8ca7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_8ca7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_8ca7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_8ca7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_8ca7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_8ca7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_8ca7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_8ca7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_8ca7_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2663_c3_ac6d] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2663_c3_ac6d_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2663_c3_ac6d_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2663_c3_ac6d_return_output := CONST_SL_8_uxn_opcodes_h_l2663_c3_ac6d_return_output;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l2676_l2684_DUPLICATE_47ac LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l2676_l2684_DUPLICATE_47ac_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l2684_l2676_DUPLICATE_d78d_return_output);

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2653_c1_abdf] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_abdf_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_abdf_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_abdf_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_abdf_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_abdf_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_abdf_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_abdf_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_abdf_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2673_c7_282b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_282b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_282b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_282b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_282b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_282b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_282b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_282b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_282b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2682_c7_a6d6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2682_c7_a6d6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2682_c7_a6d6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2682_c7_a6d6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2682_c7_a6d6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2682_c7_a6d6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2682_c7_a6d6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2682_c7_a6d6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2682_c7_a6d6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2686_c7_8ca7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_8ca7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_8ca7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_8ca7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_8ca7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_8ca7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_8ca7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_8ca7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_8ca7_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2666_c3_cacc] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2666_c3_cacc_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2666_c3_cacc_left;
     BIN_OP_OR_uxn_opcodes_h_l2666_c3_cacc_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2666_c3_cacc_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2666_c3_cacc_return_output := BIN_OP_OR_uxn_opcodes_h_l2666_c3_cacc_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2665_c7_87de_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2666_c3_cacc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2673_c7_282b_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l2676_l2684_DUPLICATE_47ac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2682_c7_a6d6_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l2676_l2684_DUPLICATE_47ac_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2661_c7_46e0_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2663_c3_ac6d_return_output;
     VAR_printf_uxn_opcodes_h_l2654_c3_050a_uxn_opcodes_h_l2654_c3_050a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_abdf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_a6d6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_8ca7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_87de_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_282b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_a6d6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_8ca7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_46e0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_87de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_4d51_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2682_c7_a6d6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2682_c7_a6d6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_a6d6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_a6d6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_a6d6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_a6d6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_a6d6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_a6d6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_a6d6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_a6d6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2661_c7_46e0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_46e0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_46e0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_46e0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_46e0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_46e0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_46e0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_46e0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_46e0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2665_c7_87de] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_87de_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_87de_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_87de_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_87de_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_87de_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_87de_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_87de_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_87de_return_output;

     -- t16_MUX[uxn_opcodes_h_l2665_c7_87de] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2665_c7_87de_cond <= VAR_t16_MUX_uxn_opcodes_h_l2665_c7_87de_cond;
     t16_MUX_uxn_opcodes_h_l2665_c7_87de_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2665_c7_87de_iftrue;
     t16_MUX_uxn_opcodes_h_l2665_c7_87de_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2665_c7_87de_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2665_c7_87de_return_output := t16_MUX_uxn_opcodes_h_l2665_c7_87de_return_output;

     -- printf_uxn_opcodes_h_l2654_c3_050a[uxn_opcodes_h_l2654_c3_050a] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2654_c3_050a_uxn_opcodes_h_l2654_c3_050a_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2654_c3_050a_uxn_opcodes_h_l2654_c3_050a_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_u8_value_MUX[uxn_opcodes_h_l2682_c7_a6d6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2682_c7_a6d6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2682_c7_a6d6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2682_c7_a6d6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2682_c7_a6d6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2682_c7_a6d6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2682_c7_a6d6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2682_c7_a6d6_return_output := result_u8_value_MUX_uxn_opcodes_h_l2682_c7_a6d6_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2671_c21_f5c4] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2671_c21_f5c4_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l2666_c3_cacc_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2682_c7_a6d6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_a6d6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_a6d6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_a6d6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_a6d6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_a6d6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_a6d6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_a6d6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_a6d6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2678_c7_4d51] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_4d51_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_4d51_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_4d51_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_4d51_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_4d51_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_4d51_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_4d51_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_4d51_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2665_c7_87de_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2671_c21_f5c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_4d51_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2682_c7_a6d6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_46e0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_87de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_4d51_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2682_c7_a6d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_e09a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_46e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_282b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_4d51_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2678_c7_4d51_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2682_c7_a6d6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2661_c7_46e0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2665_c7_87de_return_output;
     -- t16_MUX[uxn_opcodes_h_l2661_c7_46e0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2661_c7_46e0_cond <= VAR_t16_MUX_uxn_opcodes_h_l2661_c7_46e0_cond;
     t16_MUX_uxn_opcodes_h_l2661_c7_46e0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2661_c7_46e0_iftrue;
     t16_MUX_uxn_opcodes_h_l2661_c7_46e0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2661_c7_46e0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2661_c7_46e0_return_output := t16_MUX_uxn_opcodes_h_l2661_c7_46e0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2658_c7_e09a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_e09a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_e09a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_e09a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_e09a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_e09a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_e09a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_e09a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_e09a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2678_c7_4d51] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2678_c7_4d51_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2678_c7_4d51_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2678_c7_4d51_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2678_c7_4d51_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2678_c7_4d51_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2678_c7_4d51_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2678_c7_4d51_return_output := result_u8_value_MUX_uxn_opcodes_h_l2678_c7_4d51_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2678_c7_4d51] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_4d51_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_4d51_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_4d51_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_4d51_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_4d51_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_4d51_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_4d51_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_4d51_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2673_c7_282b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_282b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_282b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_282b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_282b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_282b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_282b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_282b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_282b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2678_c7_4d51] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_4d51_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_4d51_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_4d51_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_4d51_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_4d51_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_4d51_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_4d51_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_4d51_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2661_c7_46e0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_46e0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_46e0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_46e0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_46e0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_46e0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_46e0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_46e0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_46e0_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_282b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_4d51_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_e09a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_46e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_282b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_4d51_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_b686_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_e09a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_87de_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_282b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2673_c7_282b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2678_c7_4d51_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2658_c7_e09a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2661_c7_46e0_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2653_c2_b686] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_b686_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_b686_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_b686_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_b686_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_b686_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_b686_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_b686_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_b686_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2665_c7_87de] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_87de_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_87de_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_87de_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_87de_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_87de_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_87de_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_87de_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_87de_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2673_c7_282b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_282b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_282b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_282b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_282b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_282b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_282b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_282b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_282b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2673_c7_282b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2673_c7_282b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2673_c7_282b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2673_c7_282b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2673_c7_282b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2673_c7_282b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2673_c7_282b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2673_c7_282b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2673_c7_282b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2658_c7_e09a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_e09a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_e09a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_e09a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_e09a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_e09a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_e09a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_e09a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_e09a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2673_c7_282b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_282b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_282b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_282b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_282b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_282b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_282b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_282b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_282b_return_output;

     -- t16_MUX[uxn_opcodes_h_l2658_c7_e09a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2658_c7_e09a_cond <= VAR_t16_MUX_uxn_opcodes_h_l2658_c7_e09a_cond;
     t16_MUX_uxn_opcodes_h_l2658_c7_e09a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2658_c7_e09a_iftrue;
     t16_MUX_uxn_opcodes_h_l2658_c7_e09a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2658_c7_e09a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2658_c7_e09a_return_output := t16_MUX_uxn_opcodes_h_l2658_c7_e09a_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_87de_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_282b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_b686_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_e09a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_87de_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_282b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_46e0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_87de_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2665_c7_87de_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2673_c7_282b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2653_c2_b686_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2658_c7_e09a_return_output;
     -- t16_MUX[uxn_opcodes_h_l2653_c2_b686] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2653_c2_b686_cond <= VAR_t16_MUX_uxn_opcodes_h_l2653_c2_b686_cond;
     t16_MUX_uxn_opcodes_h_l2653_c2_b686_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2653_c2_b686_iftrue;
     t16_MUX_uxn_opcodes_h_l2653_c2_b686_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2653_c2_b686_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2653_c2_b686_return_output := t16_MUX_uxn_opcodes_h_l2653_c2_b686_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2661_c7_46e0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_46e0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_46e0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_46e0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_46e0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_46e0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_46e0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_46e0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_46e0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2665_c7_87de] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2665_c7_87de_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2665_c7_87de_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2665_c7_87de_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2665_c7_87de_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2665_c7_87de_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2665_c7_87de_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2665_c7_87de_return_output := result_u8_value_MUX_uxn_opcodes_h_l2665_c7_87de_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2653_c2_b686] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_b686_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_b686_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_b686_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_b686_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_b686_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_b686_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_b686_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_b686_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2665_c7_87de] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_87de_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_87de_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_87de_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_87de_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_87de_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_87de_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_87de_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_87de_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2665_c7_87de] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_87de_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_87de_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_87de_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_87de_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_87de_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_87de_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_87de_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_87de_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_46e0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_87de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_46e0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_87de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_e09a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_46e0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_46e0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2665_c7_87de_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2653_c2_b686_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2658_c7_e09a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_e09a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_e09a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_e09a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_e09a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_e09a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_e09a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_e09a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_e09a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2661_c7_46e0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_46e0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_46e0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_46e0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_46e0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_46e0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_46e0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_46e0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_46e0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2661_c7_46e0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2661_c7_46e0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_46e0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2661_c7_46e0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_46e0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2661_c7_46e0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_46e0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_46e0_return_output := result_u8_value_MUX_uxn_opcodes_h_l2661_c7_46e0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2661_c7_46e0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_46e0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_46e0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_46e0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_46e0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_46e0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_46e0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_46e0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_46e0_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_e09a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_46e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_e09a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_46e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_b686_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_e09a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2658_c7_e09a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_46e0_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2658_c7_e09a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_e09a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_e09a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_e09a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_e09a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_e09a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_e09a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_e09a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_e09a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2653_c2_b686] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_b686_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_b686_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_b686_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_b686_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_b686_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_b686_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_b686_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_b686_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2658_c7_e09a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2658_c7_e09a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2658_c7_e09a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2658_c7_e09a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2658_c7_e09a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2658_c7_e09a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2658_c7_e09a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2658_c7_e09a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2658_c7_e09a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2658_c7_e09a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_e09a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_e09a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_e09a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_e09a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_e09a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_e09a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_e09a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_e09a_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_b686_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_e09a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_b686_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_e09a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c2_b686_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2658_c7_e09a_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2653_c2_b686] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2653_c2_b686_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c2_b686_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2653_c2_b686_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c2_b686_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2653_c2_b686_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c2_b686_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c2_b686_return_output := result_u8_value_MUX_uxn_opcodes_h_l2653_c2_b686_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2653_c2_b686] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_b686_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_b686_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_b686_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_b686_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_b686_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_b686_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_b686_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_b686_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2653_c2_b686] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_b686_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_b686_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_b686_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_b686_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_b686_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_b686_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_b686_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_b686_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l2691_l2649_DUPLICATE_050d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l2691_l2649_DUPLICATE_050d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4e73(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_b686_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_b686_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_b686_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_b686_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_b686_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c2_b686_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l2691_l2649_DUPLICATE_050d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l2691_l2649_DUPLICATE_050d_return_output;
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
