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
-- -- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 163
entity rot2_0CLK_025fbec9 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end rot2_0CLK_025fbec9;
architecture arch of rot2_0CLK_025fbec9 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal l16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_l16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2869_c6_3fa3]
signal BIN_OP_EQ_uxn_opcodes_h_l2869_c6_3fa3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2869_c6_3fa3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2869_c6_3fa3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2869_c2_6985]
signal n16_MUX_uxn_opcodes_h_l2869_c2_6985_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2869_c2_6985_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2869_c2_6985]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2869_c2_6985_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2869_c2_6985_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2869_c2_6985]
signal result_u8_value_MUX_uxn_opcodes_h_l2869_c2_6985_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2869_c2_6985_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2869_c2_6985]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2869_c2_6985_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2869_c2_6985_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2869_c2_6985]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2869_c2_6985_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2869_c2_6985_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2869_c2_6985]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2869_c2_6985_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2869_c2_6985_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2869_c2_6985]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2869_c2_6985_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2869_c2_6985_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2869_c2_6985]
signal l16_MUX_uxn_opcodes_h_l2869_c2_6985_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2869_c2_6985_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2869_c2_6985]
signal t16_MUX_uxn_opcodes_h_l2869_c2_6985_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2869_c2_6985_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2874_c11_bd0c]
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_bd0c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_bd0c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_bd0c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2874_c7_4f7d]
signal n16_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2874_c7_4f7d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2874_c7_4f7d]
signal result_u8_value_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2874_c7_4f7d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2874_c7_4f7d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2874_c7_4f7d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2874_c7_4f7d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2874_c7_4f7d]
signal l16_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2874_c7_4f7d]
signal t16_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2877_c11_995e]
signal BIN_OP_EQ_uxn_opcodes_h_l2877_c11_995e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2877_c11_995e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2877_c11_995e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2877_c7_b390]
signal n16_MUX_uxn_opcodes_h_l2877_c7_b390_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2877_c7_b390_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2877_c7_b390]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2877_c7_b390_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2877_c7_b390_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2877_c7_b390]
signal result_u8_value_MUX_uxn_opcodes_h_l2877_c7_b390_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2877_c7_b390_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2877_c7_b390]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2877_c7_b390_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2877_c7_b390_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2877_c7_b390]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2877_c7_b390_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2877_c7_b390_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2877_c7_b390]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2877_c7_b390_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2877_c7_b390_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2877_c7_b390]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2877_c7_b390_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2877_c7_b390_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2877_c7_b390]
signal l16_MUX_uxn_opcodes_h_l2877_c7_b390_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2877_c7_b390_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2877_c7_b390]
signal t16_MUX_uxn_opcodes_h_l2877_c7_b390_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2877_c7_b390_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2882_c11_87bc]
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_87bc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_87bc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_87bc_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2882_c7_f9c8]
signal n16_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2882_c7_f9c8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2882_c7_f9c8]
signal result_u8_value_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2882_c7_f9c8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2882_c7_f9c8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2882_c7_f9c8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2882_c7_f9c8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2882_c7_f9c8]
signal l16_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2882_c7_f9c8]
signal t16_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2885_c11_3ffe]
signal BIN_OP_EQ_uxn_opcodes_h_l2885_c11_3ffe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2885_c11_3ffe_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2885_c11_3ffe_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2885_c7_b124]
signal n16_MUX_uxn_opcodes_h_l2885_c7_b124_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2885_c7_b124_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2885_c7_b124]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2885_c7_b124_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2885_c7_b124_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2885_c7_b124]
signal result_u8_value_MUX_uxn_opcodes_h_l2885_c7_b124_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2885_c7_b124_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2885_c7_b124]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2885_c7_b124_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2885_c7_b124_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2885_c7_b124]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2885_c7_b124_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2885_c7_b124_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2885_c7_b124]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2885_c7_b124_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2885_c7_b124_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2885_c7_b124]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2885_c7_b124_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2885_c7_b124_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2885_c7_b124]
signal l16_MUX_uxn_opcodes_h_l2885_c7_b124_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2885_c7_b124_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2885_c7_b124]
signal t16_MUX_uxn_opcodes_h_l2885_c7_b124_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2885_c7_b124_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2886_c3_baf1]
signal BIN_OP_OR_uxn_opcodes_h_l2886_c3_baf1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2886_c3_baf1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2886_c3_baf1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2889_c11_2f69]
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_2f69_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_2f69_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_2f69_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2889_c7_6957]
signal n16_MUX_uxn_opcodes_h_l2889_c7_6957_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2889_c7_6957_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2889_c7_6957_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2889_c7_6957_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2889_c7_6957]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_6957_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_6957_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_6957_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_6957_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2889_c7_6957]
signal result_u8_value_MUX_uxn_opcodes_h_l2889_c7_6957_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2889_c7_6957_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2889_c7_6957_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2889_c7_6957_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2889_c7_6957]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_6957_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_6957_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_6957_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_6957_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2889_c7_6957]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_6957_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_6957_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_6957_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_6957_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2889_c7_6957]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_6957_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_6957_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_6957_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_6957_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2889_c7_6957]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_6957_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_6957_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_6957_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_6957_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2889_c7_6957]
signal l16_MUX_uxn_opcodes_h_l2889_c7_6957_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2889_c7_6957_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2889_c7_6957_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2889_c7_6957_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2892_c11_3d2a]
signal BIN_OP_EQ_uxn_opcodes_h_l2892_c11_3d2a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2892_c11_3d2a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2892_c11_3d2a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2892_c7_5d86]
signal n16_MUX_uxn_opcodes_h_l2892_c7_5d86_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2892_c7_5d86_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2892_c7_5d86_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2892_c7_5d86]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_5d86_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_5d86_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_5d86_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2892_c7_5d86]
signal result_u8_value_MUX_uxn_opcodes_h_l2892_c7_5d86_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2892_c7_5d86_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2892_c7_5d86_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2892_c7_5d86]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_5d86_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_5d86_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_5d86_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2892_c7_5d86]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_5d86_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_5d86_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_5d86_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2892_c7_5d86]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_5d86_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_5d86_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_5d86_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2892_c7_5d86]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_5d86_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_5d86_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_5d86_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2892_c7_5d86]
signal l16_MUX_uxn_opcodes_h_l2892_c7_5d86_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2892_c7_5d86_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2892_c7_5d86_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2897_c11_1c29]
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_1c29_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_1c29_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_1c29_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2897_c7_5610]
signal n16_MUX_uxn_opcodes_h_l2897_c7_5610_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2897_c7_5610_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2897_c7_5610_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2897_c7_5610_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2897_c7_5610]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_5610_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_5610_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_5610_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_5610_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2897_c7_5610]
signal result_u8_value_MUX_uxn_opcodes_h_l2897_c7_5610_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2897_c7_5610_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2897_c7_5610_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2897_c7_5610_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2897_c7_5610]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_5610_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_5610_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_5610_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_5610_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2897_c7_5610]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_5610_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_5610_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_5610_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_5610_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2897_c7_5610]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_5610_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_5610_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_5610_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_5610_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2897_c7_5610]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_5610_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_5610_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_5610_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_5610_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2897_c7_5610]
signal l16_MUX_uxn_opcodes_h_l2897_c7_5610_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2897_c7_5610_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2897_c7_5610_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2897_c7_5610_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2900_c11_30e6]
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_30e6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_30e6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_30e6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2900_c7_ea37]
signal n16_MUX_uxn_opcodes_h_l2900_c7_ea37_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2900_c7_ea37_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2900_c7_ea37_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2900_c7_ea37]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_ea37_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_ea37_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_ea37_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2900_c7_ea37]
signal result_u8_value_MUX_uxn_opcodes_h_l2900_c7_ea37_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2900_c7_ea37_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2900_c7_ea37_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2900_c7_ea37]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_ea37_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_ea37_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_ea37_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2900_c7_ea37]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_ea37_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_ea37_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_ea37_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2900_c7_ea37]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_ea37_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_ea37_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_ea37_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2900_c7_ea37]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_ea37_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_ea37_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_ea37_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2900_c7_ea37]
signal l16_MUX_uxn_opcodes_h_l2900_c7_ea37_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2900_c7_ea37_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2900_c7_ea37_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2901_c3_c63e]
signal BIN_OP_OR_uxn_opcodes_h_l2901_c3_c63e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2901_c3_c63e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2901_c3_c63e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2904_c11_39aa]
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_39aa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_39aa_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_39aa_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2904_c7_e478]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_e478_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_e478_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_e478_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_e478_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2904_c7_e478]
signal result_u8_value_MUX_uxn_opcodes_h_l2904_c7_e478_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2904_c7_e478_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2904_c7_e478_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2904_c7_e478_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2904_c7_e478]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_e478_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_e478_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_e478_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_e478_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2904_c7_e478]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_e478_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_e478_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_e478_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_e478_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2904_c7_e478]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_e478_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_e478_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_e478_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_e478_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2904_c7_e478]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_e478_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_e478_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_e478_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_e478_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2904_c7_e478]
signal l16_MUX_uxn_opcodes_h_l2904_c7_e478_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2904_c7_e478_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2904_c7_e478_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2904_c7_e478_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2907_c11_8dfc]
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_8dfc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_8dfc_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_8dfc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2907_c7_4fd6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_4fd6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_4fd6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_4fd6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_4fd6_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2907_c7_4fd6]
signal result_u8_value_MUX_uxn_opcodes_h_l2907_c7_4fd6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2907_c7_4fd6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2907_c7_4fd6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2907_c7_4fd6_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2907_c7_4fd6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_4fd6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_4fd6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_4fd6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_4fd6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2907_c7_4fd6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_4fd6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_4fd6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_4fd6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_4fd6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2907_c7_4fd6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2907_c7_4fd6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2907_c7_4fd6]
signal l16_MUX_uxn_opcodes_h_l2907_c7_4fd6_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2907_c7_4fd6_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2907_c7_4fd6_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2907_c7_4fd6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2912_c11_3149]
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3149_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3149_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3149_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2912_c7_8d27]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8d27_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8d27_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8d27_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8d27_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2912_c7_8d27]
signal result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8d27_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8d27_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8d27_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8d27_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2912_c7_8d27]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8d27_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8d27_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8d27_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8d27_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2912_c7_8d27]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8d27_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8d27_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8d27_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8d27_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2912_c7_8d27]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8d27_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8d27_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8d27_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8d27_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2912_c7_8d27]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8d27_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8d27_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8d27_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8d27_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2912_c7_8d27]
signal l16_MUX_uxn_opcodes_h_l2912_c7_8d27_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2912_c7_8d27_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2912_c7_8d27_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2912_c7_8d27_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2915_c11_7054]
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_7054_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_7054_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_7054_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2915_c7_b4f4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2915_c7_b4f4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2915_c7_b4f4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2915_c7_b4f4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2915_c7_b4f4_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2915_c7_b4f4]
signal result_u8_value_MUX_uxn_opcodes_h_l2915_c7_b4f4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2915_c7_b4f4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2915_c7_b4f4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2915_c7_b4f4_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2915_c7_b4f4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2915_c7_b4f4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2915_c7_b4f4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2915_c7_b4f4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2915_c7_b4f4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2915_c7_b4f4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2915_c7_b4f4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2915_c7_b4f4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2915_c7_b4f4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2915_c7_b4f4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2915_c7_b4f4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2915_c7_b4f4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2915_c7_b4f4]
signal l16_MUX_uxn_opcodes_h_l2915_c7_b4f4_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2915_c7_b4f4_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2915_c7_b4f4_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2915_c7_b4f4_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2916_c3_9bb5]
signal BIN_OP_OR_uxn_opcodes_h_l2916_c3_9bb5_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2916_c3_9bb5_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2916_c3_9bb5_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2918_c30_7266]
signal sp_relative_shift_uxn_opcodes_h_l2918_c30_7266_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2918_c30_7266_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2918_c30_7266_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2918_c30_7266_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2923_c11_5857]
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_5857_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_5857_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_5857_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2923_c7_0624]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2923_c7_0624_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2923_c7_0624_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2923_c7_0624_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2923_c7_0624_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2923_c7_0624]
signal result_u8_value_MUX_uxn_opcodes_h_l2923_c7_0624_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2923_c7_0624_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2923_c7_0624_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2923_c7_0624_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2923_c7_0624]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2923_c7_0624_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2923_c7_0624_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2923_c7_0624_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2923_c7_0624_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2923_c7_0624]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2923_c7_0624_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2923_c7_0624_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2923_c7_0624_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2923_c7_0624_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2923_c7_0624]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2923_c7_0624_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2923_c7_0624_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2923_c7_0624_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2923_c7_0624_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2926_c31_cdb8]
signal CONST_SR_8_uxn_opcodes_h_l2926_c31_cdb8_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2926_c31_cdb8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2928_c11_4f3b]
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_4f3b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_4f3b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_4f3b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2928_c7_f882]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_f882_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_f882_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_f882_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_f882_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2928_c7_f882]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_f882_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_f882_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_f882_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_f882_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2928_c7_f882]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_f882_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_f882_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_f882_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_f882_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2928_c7_f882]
signal result_u8_value_MUX_uxn_opcodes_h_l2928_c7_f882_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2928_c7_f882_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2928_c7_f882_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2928_c7_f882_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2932_c11_3198]
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_3198_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_3198_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_3198_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2932_c7_a40f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2932_c7_a40f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2932_c7_a40f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2932_c7_a40f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2932_c7_a40f_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2932_c7_a40f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_a40f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_a40f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_a40f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_a40f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2932_c7_a40f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_a40f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_a40f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_a40f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_a40f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2932_c7_a40f]
signal result_u8_value_MUX_uxn_opcodes_h_l2932_c7_a40f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2932_c7_a40f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2932_c7_a40f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2932_c7_a40f_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2934_c31_a2d7]
signal CONST_SR_8_uxn_opcodes_h_l2934_c31_a2d7_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2934_c31_a2d7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2936_c11_0d49]
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0d49_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0d49_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0d49_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2936_c7_026a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2936_c7_026a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2936_c7_026a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2936_c7_026a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2936_c7_026a_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2936_c7_026a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2936_c7_026a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2936_c7_026a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2936_c7_026a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2936_c7_026a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2936_c7_026a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2936_c7_026a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2936_c7_026a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2936_c7_026a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2936_c7_026a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2936_c7_026a]
signal result_u8_value_MUX_uxn_opcodes_h_l2936_c7_026a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2936_c7_026a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2936_c7_026a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2936_c7_026a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2940_c11_1340]
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_1340_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_1340_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_1340_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2940_c7_5741]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_5741_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_5741_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_5741_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_5741_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2940_c7_5741]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_5741_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_5741_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_5741_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_5741_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2940_c7_5741]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_5741_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_5741_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_5741_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_5741_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2940_c7_5741]
signal result_u8_value_MUX_uxn_opcodes_h_l2940_c7_5741_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2940_c7_5741_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2940_c7_5741_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2940_c7_5741_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2942_c31_6a9f]
signal CONST_SR_8_uxn_opcodes_h_l2942_c31_6a9f_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2942_c31_6a9f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2944_c11_26dc]
signal BIN_OP_EQ_uxn_opcodes_h_l2944_c11_26dc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2944_c11_26dc_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2944_c11_26dc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2944_c7_d142]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_d142_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_d142_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_d142_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_d142_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2944_c7_d142]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_d142_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_d142_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_d142_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_d142_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2909_l2879_l2894_DUPLICATE_f811
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2909_l2879_l2894_DUPLICATE_f811_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2909_l2879_l2894_DUPLICATE_f811_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_3345( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_sp_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2869_c6_3fa3
BIN_OP_EQ_uxn_opcodes_h_l2869_c6_3fa3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2869_c6_3fa3_left,
BIN_OP_EQ_uxn_opcodes_h_l2869_c6_3fa3_right,
BIN_OP_EQ_uxn_opcodes_h_l2869_c6_3fa3_return_output);

-- n16_MUX_uxn_opcodes_h_l2869_c2_6985
n16_MUX_uxn_opcodes_h_l2869_c2_6985 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2869_c2_6985_cond,
n16_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue,
n16_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse,
n16_MUX_uxn_opcodes_h_l2869_c2_6985_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2869_c2_6985
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2869_c2_6985 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2869_c2_6985_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2869_c2_6985_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2869_c2_6985
result_u8_value_MUX_uxn_opcodes_h_l2869_c2_6985 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2869_c2_6985_cond,
result_u8_value_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2869_c2_6985_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2869_c2_6985
result_is_stack_write_MUX_uxn_opcodes_h_l2869_c2_6985 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2869_c2_6985_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2869_c2_6985_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2869_c2_6985
result_is_opc_done_MUX_uxn_opcodes_h_l2869_c2_6985 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2869_c2_6985_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2869_c2_6985_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2869_c2_6985
result_sp_relative_shift_MUX_uxn_opcodes_h_l2869_c2_6985 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2869_c2_6985_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2869_c2_6985_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2869_c2_6985
result_is_sp_shift_MUX_uxn_opcodes_h_l2869_c2_6985 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2869_c2_6985_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2869_c2_6985_return_output);

-- l16_MUX_uxn_opcodes_h_l2869_c2_6985
l16_MUX_uxn_opcodes_h_l2869_c2_6985 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2869_c2_6985_cond,
l16_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue,
l16_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse,
l16_MUX_uxn_opcodes_h_l2869_c2_6985_return_output);

-- t16_MUX_uxn_opcodes_h_l2869_c2_6985
t16_MUX_uxn_opcodes_h_l2869_c2_6985 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2869_c2_6985_cond,
t16_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue,
t16_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse,
t16_MUX_uxn_opcodes_h_l2869_c2_6985_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2874_c11_bd0c
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_bd0c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_bd0c_left,
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_bd0c_right,
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_bd0c_return_output);

-- n16_MUX_uxn_opcodes_h_l2874_c7_4f7d
n16_MUX_uxn_opcodes_h_l2874_c7_4f7d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond,
n16_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue,
n16_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse,
n16_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_4f7d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_4f7d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2874_c7_4f7d
result_u8_value_MUX_uxn_opcodes_h_l2874_c7_4f7d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_4f7d
result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_4f7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_4f7d
result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_4f7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d
result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output);

-- l16_MUX_uxn_opcodes_h_l2874_c7_4f7d
l16_MUX_uxn_opcodes_h_l2874_c7_4f7d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond,
l16_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue,
l16_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse,
l16_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output);

-- t16_MUX_uxn_opcodes_h_l2874_c7_4f7d
t16_MUX_uxn_opcodes_h_l2874_c7_4f7d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond,
t16_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue,
t16_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse,
t16_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2877_c11_995e
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_995e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_995e_left,
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_995e_right,
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_995e_return_output);

-- n16_MUX_uxn_opcodes_h_l2877_c7_b390
n16_MUX_uxn_opcodes_h_l2877_c7_b390 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2877_c7_b390_cond,
n16_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue,
n16_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse,
n16_MUX_uxn_opcodes_h_l2877_c7_b390_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2877_c7_b390
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2877_c7_b390 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2877_c7_b390_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2877_c7_b390_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2877_c7_b390
result_u8_value_MUX_uxn_opcodes_h_l2877_c7_b390 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2877_c7_b390_cond,
result_u8_value_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2877_c7_b390_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2877_c7_b390
result_is_stack_write_MUX_uxn_opcodes_h_l2877_c7_b390 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2877_c7_b390_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2877_c7_b390_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2877_c7_b390
result_is_opc_done_MUX_uxn_opcodes_h_l2877_c7_b390 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2877_c7_b390_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2877_c7_b390_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2877_c7_b390
result_sp_relative_shift_MUX_uxn_opcodes_h_l2877_c7_b390 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2877_c7_b390_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2877_c7_b390_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2877_c7_b390
result_is_sp_shift_MUX_uxn_opcodes_h_l2877_c7_b390 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2877_c7_b390_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2877_c7_b390_return_output);

-- l16_MUX_uxn_opcodes_h_l2877_c7_b390
l16_MUX_uxn_opcodes_h_l2877_c7_b390 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2877_c7_b390_cond,
l16_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue,
l16_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse,
l16_MUX_uxn_opcodes_h_l2877_c7_b390_return_output);

-- t16_MUX_uxn_opcodes_h_l2877_c7_b390
t16_MUX_uxn_opcodes_h_l2877_c7_b390 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2877_c7_b390_cond,
t16_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue,
t16_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse,
t16_MUX_uxn_opcodes_h_l2877_c7_b390_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2882_c11_87bc
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_87bc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_87bc_left,
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_87bc_right,
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_87bc_return_output);

-- n16_MUX_uxn_opcodes_h_l2882_c7_f9c8
n16_MUX_uxn_opcodes_h_l2882_c7_f9c8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond,
n16_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue,
n16_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse,
n16_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_f9c8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_f9c8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2882_c7_f9c8
result_u8_value_MUX_uxn_opcodes_h_l2882_c7_f9c8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond,
result_u8_value_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_f9c8
result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_f9c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_f9c8
result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_f9c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8
result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output);

-- l16_MUX_uxn_opcodes_h_l2882_c7_f9c8
l16_MUX_uxn_opcodes_h_l2882_c7_f9c8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond,
l16_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue,
l16_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse,
l16_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output);

-- t16_MUX_uxn_opcodes_h_l2882_c7_f9c8
t16_MUX_uxn_opcodes_h_l2882_c7_f9c8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond,
t16_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue,
t16_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse,
t16_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2885_c11_3ffe
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_3ffe : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_3ffe_left,
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_3ffe_right,
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_3ffe_return_output);

-- n16_MUX_uxn_opcodes_h_l2885_c7_b124
n16_MUX_uxn_opcodes_h_l2885_c7_b124 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2885_c7_b124_cond,
n16_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue,
n16_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse,
n16_MUX_uxn_opcodes_h_l2885_c7_b124_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2885_c7_b124
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2885_c7_b124 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2885_c7_b124_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2885_c7_b124_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2885_c7_b124
result_u8_value_MUX_uxn_opcodes_h_l2885_c7_b124 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2885_c7_b124_cond,
result_u8_value_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2885_c7_b124_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2885_c7_b124
result_is_stack_write_MUX_uxn_opcodes_h_l2885_c7_b124 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2885_c7_b124_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2885_c7_b124_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2885_c7_b124
result_is_opc_done_MUX_uxn_opcodes_h_l2885_c7_b124 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2885_c7_b124_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2885_c7_b124_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2885_c7_b124
result_sp_relative_shift_MUX_uxn_opcodes_h_l2885_c7_b124 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2885_c7_b124_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2885_c7_b124_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2885_c7_b124
result_is_sp_shift_MUX_uxn_opcodes_h_l2885_c7_b124 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2885_c7_b124_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2885_c7_b124_return_output);

-- l16_MUX_uxn_opcodes_h_l2885_c7_b124
l16_MUX_uxn_opcodes_h_l2885_c7_b124 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2885_c7_b124_cond,
l16_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue,
l16_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse,
l16_MUX_uxn_opcodes_h_l2885_c7_b124_return_output);

-- t16_MUX_uxn_opcodes_h_l2885_c7_b124
t16_MUX_uxn_opcodes_h_l2885_c7_b124 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2885_c7_b124_cond,
t16_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue,
t16_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse,
t16_MUX_uxn_opcodes_h_l2885_c7_b124_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2886_c3_baf1
BIN_OP_OR_uxn_opcodes_h_l2886_c3_baf1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2886_c3_baf1_left,
BIN_OP_OR_uxn_opcodes_h_l2886_c3_baf1_right,
BIN_OP_OR_uxn_opcodes_h_l2886_c3_baf1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2889_c11_2f69
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_2f69 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_2f69_left,
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_2f69_right,
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_2f69_return_output);

-- n16_MUX_uxn_opcodes_h_l2889_c7_6957
n16_MUX_uxn_opcodes_h_l2889_c7_6957 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2889_c7_6957_cond,
n16_MUX_uxn_opcodes_h_l2889_c7_6957_iftrue,
n16_MUX_uxn_opcodes_h_l2889_c7_6957_iffalse,
n16_MUX_uxn_opcodes_h_l2889_c7_6957_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_6957
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_6957 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_6957_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_6957_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_6957_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_6957_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2889_c7_6957
result_u8_value_MUX_uxn_opcodes_h_l2889_c7_6957 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2889_c7_6957_cond,
result_u8_value_MUX_uxn_opcodes_h_l2889_c7_6957_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2889_c7_6957_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2889_c7_6957_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_6957
result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_6957 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_6957_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_6957_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_6957_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_6957_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_6957
result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_6957 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_6957_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_6957_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_6957_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_6957_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_6957
result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_6957 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_6957_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_6957_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_6957_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_6957_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_6957
result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_6957 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_6957_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_6957_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_6957_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_6957_return_output);

-- l16_MUX_uxn_opcodes_h_l2889_c7_6957
l16_MUX_uxn_opcodes_h_l2889_c7_6957 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2889_c7_6957_cond,
l16_MUX_uxn_opcodes_h_l2889_c7_6957_iftrue,
l16_MUX_uxn_opcodes_h_l2889_c7_6957_iffalse,
l16_MUX_uxn_opcodes_h_l2889_c7_6957_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2892_c11_3d2a
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_3d2a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_3d2a_left,
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_3d2a_right,
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_3d2a_return_output);

-- n16_MUX_uxn_opcodes_h_l2892_c7_5d86
n16_MUX_uxn_opcodes_h_l2892_c7_5d86 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2892_c7_5d86_cond,
n16_MUX_uxn_opcodes_h_l2892_c7_5d86_iftrue,
n16_MUX_uxn_opcodes_h_l2892_c7_5d86_iffalse,
n16_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_5d86
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_5d86 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_5d86_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_5d86_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_5d86_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2892_c7_5d86
result_u8_value_MUX_uxn_opcodes_h_l2892_c7_5d86 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2892_c7_5d86_cond,
result_u8_value_MUX_uxn_opcodes_h_l2892_c7_5d86_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2892_c7_5d86_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_5d86
result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_5d86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_5d86_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_5d86_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_5d86_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_5d86
result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_5d86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_5d86_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_5d86_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_5d86_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_5d86
result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_5d86 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_5d86_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_5d86_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_5d86_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_5d86
result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_5d86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_5d86_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_5d86_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_5d86_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output);

-- l16_MUX_uxn_opcodes_h_l2892_c7_5d86
l16_MUX_uxn_opcodes_h_l2892_c7_5d86 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2892_c7_5d86_cond,
l16_MUX_uxn_opcodes_h_l2892_c7_5d86_iftrue,
l16_MUX_uxn_opcodes_h_l2892_c7_5d86_iffalse,
l16_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2897_c11_1c29
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_1c29 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_1c29_left,
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_1c29_right,
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_1c29_return_output);

-- n16_MUX_uxn_opcodes_h_l2897_c7_5610
n16_MUX_uxn_opcodes_h_l2897_c7_5610 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2897_c7_5610_cond,
n16_MUX_uxn_opcodes_h_l2897_c7_5610_iftrue,
n16_MUX_uxn_opcodes_h_l2897_c7_5610_iffalse,
n16_MUX_uxn_opcodes_h_l2897_c7_5610_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_5610
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_5610 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_5610_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_5610_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_5610_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_5610_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2897_c7_5610
result_u8_value_MUX_uxn_opcodes_h_l2897_c7_5610 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2897_c7_5610_cond,
result_u8_value_MUX_uxn_opcodes_h_l2897_c7_5610_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2897_c7_5610_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2897_c7_5610_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_5610
result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_5610 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_5610_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_5610_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_5610_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_5610_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_5610
result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_5610 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_5610_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_5610_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_5610_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_5610_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_5610
result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_5610 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_5610_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_5610_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_5610_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_5610_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_5610
result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_5610 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_5610_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_5610_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_5610_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_5610_return_output);

-- l16_MUX_uxn_opcodes_h_l2897_c7_5610
l16_MUX_uxn_opcodes_h_l2897_c7_5610 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2897_c7_5610_cond,
l16_MUX_uxn_opcodes_h_l2897_c7_5610_iftrue,
l16_MUX_uxn_opcodes_h_l2897_c7_5610_iffalse,
l16_MUX_uxn_opcodes_h_l2897_c7_5610_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2900_c11_30e6
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_30e6 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_30e6_left,
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_30e6_right,
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_30e6_return_output);

-- n16_MUX_uxn_opcodes_h_l2900_c7_ea37
n16_MUX_uxn_opcodes_h_l2900_c7_ea37 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2900_c7_ea37_cond,
n16_MUX_uxn_opcodes_h_l2900_c7_ea37_iftrue,
n16_MUX_uxn_opcodes_h_l2900_c7_ea37_iffalse,
n16_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_ea37
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_ea37 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_ea37_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_ea37_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_ea37_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2900_c7_ea37
result_u8_value_MUX_uxn_opcodes_h_l2900_c7_ea37 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2900_c7_ea37_cond,
result_u8_value_MUX_uxn_opcodes_h_l2900_c7_ea37_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2900_c7_ea37_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_ea37
result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_ea37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_ea37_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_ea37_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_ea37_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_ea37
result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_ea37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_ea37_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_ea37_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_ea37_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_ea37
result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_ea37 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_ea37_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_ea37_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_ea37_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_ea37
result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_ea37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_ea37_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_ea37_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_ea37_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output);

-- l16_MUX_uxn_opcodes_h_l2900_c7_ea37
l16_MUX_uxn_opcodes_h_l2900_c7_ea37 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2900_c7_ea37_cond,
l16_MUX_uxn_opcodes_h_l2900_c7_ea37_iftrue,
l16_MUX_uxn_opcodes_h_l2900_c7_ea37_iffalse,
l16_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2901_c3_c63e
BIN_OP_OR_uxn_opcodes_h_l2901_c3_c63e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2901_c3_c63e_left,
BIN_OP_OR_uxn_opcodes_h_l2901_c3_c63e_right,
BIN_OP_OR_uxn_opcodes_h_l2901_c3_c63e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2904_c11_39aa
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_39aa : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_39aa_left,
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_39aa_right,
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_39aa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_e478
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_e478 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_e478_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_e478_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_e478_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_e478_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2904_c7_e478
result_u8_value_MUX_uxn_opcodes_h_l2904_c7_e478 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2904_c7_e478_cond,
result_u8_value_MUX_uxn_opcodes_h_l2904_c7_e478_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2904_c7_e478_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2904_c7_e478_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_e478
result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_e478 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_e478_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_e478_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_e478_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_e478_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_e478
result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_e478 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_e478_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_e478_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_e478_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_e478_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_e478
result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_e478 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_e478_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_e478_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_e478_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_e478_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_e478
result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_e478 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_e478_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_e478_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_e478_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_e478_return_output);

-- l16_MUX_uxn_opcodes_h_l2904_c7_e478
l16_MUX_uxn_opcodes_h_l2904_c7_e478 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2904_c7_e478_cond,
l16_MUX_uxn_opcodes_h_l2904_c7_e478_iftrue,
l16_MUX_uxn_opcodes_h_l2904_c7_e478_iffalse,
l16_MUX_uxn_opcodes_h_l2904_c7_e478_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2907_c11_8dfc
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_8dfc : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_8dfc_left,
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_8dfc_right,
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_8dfc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_4fd6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_4fd6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_4fd6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_4fd6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_4fd6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_4fd6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2907_c7_4fd6
result_u8_value_MUX_uxn_opcodes_h_l2907_c7_4fd6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2907_c7_4fd6_cond,
result_u8_value_MUX_uxn_opcodes_h_l2907_c7_4fd6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2907_c7_4fd6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2907_c7_4fd6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_4fd6
result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_4fd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_4fd6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_4fd6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_4fd6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_4fd6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_4fd6
result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_4fd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_4fd6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_4fd6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_4fd6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_4fd6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6
result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6_return_output);

-- l16_MUX_uxn_opcodes_h_l2907_c7_4fd6
l16_MUX_uxn_opcodes_h_l2907_c7_4fd6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2907_c7_4fd6_cond,
l16_MUX_uxn_opcodes_h_l2907_c7_4fd6_iftrue,
l16_MUX_uxn_opcodes_h_l2907_c7_4fd6_iffalse,
l16_MUX_uxn_opcodes_h_l2907_c7_4fd6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3149
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3149 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3149_left,
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3149_right,
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3149_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8d27
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8d27 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8d27_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8d27_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8d27_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8d27_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8d27
result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8d27 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8d27_cond,
result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8d27_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8d27_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8d27_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8d27
result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8d27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8d27_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8d27_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8d27_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8d27_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8d27
result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8d27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8d27_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8d27_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8d27_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8d27_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8d27
result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8d27 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8d27_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8d27_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8d27_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8d27_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8d27
result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8d27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8d27_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8d27_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8d27_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8d27_return_output);

-- l16_MUX_uxn_opcodes_h_l2912_c7_8d27
l16_MUX_uxn_opcodes_h_l2912_c7_8d27 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2912_c7_8d27_cond,
l16_MUX_uxn_opcodes_h_l2912_c7_8d27_iftrue,
l16_MUX_uxn_opcodes_h_l2912_c7_8d27_iffalse,
l16_MUX_uxn_opcodes_h_l2912_c7_8d27_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2915_c11_7054
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_7054 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_7054_left,
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_7054_right,
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_7054_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2915_c7_b4f4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2915_c7_b4f4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2915_c7_b4f4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2915_c7_b4f4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2915_c7_b4f4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2915_c7_b4f4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2915_c7_b4f4
result_u8_value_MUX_uxn_opcodes_h_l2915_c7_b4f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2915_c7_b4f4_cond,
result_u8_value_MUX_uxn_opcodes_h_l2915_c7_b4f4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2915_c7_b4f4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2915_c7_b4f4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2915_c7_b4f4
result_is_stack_write_MUX_uxn_opcodes_h_l2915_c7_b4f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2915_c7_b4f4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2915_c7_b4f4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2915_c7_b4f4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2915_c7_b4f4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2915_c7_b4f4
result_is_opc_done_MUX_uxn_opcodes_h_l2915_c7_b4f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2915_c7_b4f4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2915_c7_b4f4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2915_c7_b4f4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2915_c7_b4f4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4
result_is_sp_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4_return_output);

-- l16_MUX_uxn_opcodes_h_l2915_c7_b4f4
l16_MUX_uxn_opcodes_h_l2915_c7_b4f4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2915_c7_b4f4_cond,
l16_MUX_uxn_opcodes_h_l2915_c7_b4f4_iftrue,
l16_MUX_uxn_opcodes_h_l2915_c7_b4f4_iffalse,
l16_MUX_uxn_opcodes_h_l2915_c7_b4f4_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2916_c3_9bb5
BIN_OP_OR_uxn_opcodes_h_l2916_c3_9bb5 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2916_c3_9bb5_left,
BIN_OP_OR_uxn_opcodes_h_l2916_c3_9bb5_right,
BIN_OP_OR_uxn_opcodes_h_l2916_c3_9bb5_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2918_c30_7266
sp_relative_shift_uxn_opcodes_h_l2918_c30_7266 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2918_c30_7266_ins,
sp_relative_shift_uxn_opcodes_h_l2918_c30_7266_x,
sp_relative_shift_uxn_opcodes_h_l2918_c30_7266_y,
sp_relative_shift_uxn_opcodes_h_l2918_c30_7266_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2923_c11_5857
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_5857 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_5857_left,
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_5857_right,
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_5857_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2923_c7_0624
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2923_c7_0624 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2923_c7_0624_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2923_c7_0624_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2923_c7_0624_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2923_c7_0624_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2923_c7_0624
result_u8_value_MUX_uxn_opcodes_h_l2923_c7_0624 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2923_c7_0624_cond,
result_u8_value_MUX_uxn_opcodes_h_l2923_c7_0624_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2923_c7_0624_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2923_c7_0624_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2923_c7_0624
result_is_stack_write_MUX_uxn_opcodes_h_l2923_c7_0624 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2923_c7_0624_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2923_c7_0624_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2923_c7_0624_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2923_c7_0624_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2923_c7_0624
result_is_opc_done_MUX_uxn_opcodes_h_l2923_c7_0624 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2923_c7_0624_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2923_c7_0624_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2923_c7_0624_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2923_c7_0624_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2923_c7_0624
result_is_sp_shift_MUX_uxn_opcodes_h_l2923_c7_0624 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2923_c7_0624_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2923_c7_0624_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2923_c7_0624_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2923_c7_0624_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2926_c31_cdb8
CONST_SR_8_uxn_opcodes_h_l2926_c31_cdb8 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2926_c31_cdb8_x,
CONST_SR_8_uxn_opcodes_h_l2926_c31_cdb8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2928_c11_4f3b
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_4f3b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_4f3b_left,
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_4f3b_right,
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_4f3b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_f882
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_f882 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_f882_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_f882_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_f882_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_f882_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_f882
result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_f882 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_f882_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_f882_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_f882_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_f882_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_f882
result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_f882 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_f882_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_f882_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_f882_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_f882_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2928_c7_f882
result_u8_value_MUX_uxn_opcodes_h_l2928_c7_f882 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2928_c7_f882_cond,
result_u8_value_MUX_uxn_opcodes_h_l2928_c7_f882_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2928_c7_f882_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2928_c7_f882_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2932_c11_3198
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_3198 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_3198_left,
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_3198_right,
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_3198_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2932_c7_a40f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2932_c7_a40f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2932_c7_a40f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2932_c7_a40f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2932_c7_a40f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2932_c7_a40f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_a40f
result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_a40f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_a40f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_a40f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_a40f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_a40f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_a40f
result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_a40f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_a40f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_a40f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_a40f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_a40f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2932_c7_a40f
result_u8_value_MUX_uxn_opcodes_h_l2932_c7_a40f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2932_c7_a40f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2932_c7_a40f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2932_c7_a40f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2932_c7_a40f_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2934_c31_a2d7
CONST_SR_8_uxn_opcodes_h_l2934_c31_a2d7 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2934_c31_a2d7_x,
CONST_SR_8_uxn_opcodes_h_l2934_c31_a2d7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0d49
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0d49 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0d49_left,
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0d49_right,
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0d49_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2936_c7_026a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2936_c7_026a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2936_c7_026a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2936_c7_026a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2936_c7_026a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2936_c7_026a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2936_c7_026a
result_is_stack_write_MUX_uxn_opcodes_h_l2936_c7_026a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2936_c7_026a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2936_c7_026a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2936_c7_026a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2936_c7_026a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2936_c7_026a
result_is_opc_done_MUX_uxn_opcodes_h_l2936_c7_026a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2936_c7_026a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2936_c7_026a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2936_c7_026a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2936_c7_026a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2936_c7_026a
result_u8_value_MUX_uxn_opcodes_h_l2936_c7_026a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2936_c7_026a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2936_c7_026a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2936_c7_026a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2936_c7_026a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2940_c11_1340
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_1340 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_1340_left,
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_1340_right,
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_1340_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_5741
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_5741 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_5741_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_5741_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_5741_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_5741_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_5741
result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_5741 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_5741_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_5741_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_5741_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_5741_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_5741
result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_5741 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_5741_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_5741_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_5741_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_5741_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2940_c7_5741
result_u8_value_MUX_uxn_opcodes_h_l2940_c7_5741 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2940_c7_5741_cond,
result_u8_value_MUX_uxn_opcodes_h_l2940_c7_5741_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2940_c7_5741_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2940_c7_5741_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2942_c31_6a9f
CONST_SR_8_uxn_opcodes_h_l2942_c31_6a9f : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2942_c31_6a9f_x,
CONST_SR_8_uxn_opcodes_h_l2942_c31_6a9f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2944_c11_26dc
BIN_OP_EQ_uxn_opcodes_h_l2944_c11_26dc : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2944_c11_26dc_left,
BIN_OP_EQ_uxn_opcodes_h_l2944_c11_26dc_right,
BIN_OP_EQ_uxn_opcodes_h_l2944_c11_26dc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_d142
result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_d142 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_d142_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_d142_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_d142_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_d142_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_d142
result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_d142 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_d142_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_d142_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_d142_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_d142_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2909_l2879_l2894_DUPLICATE_f811
CONST_SL_8_uint16_t_uxn_opcodes_h_l2909_l2879_l2894_DUPLICATE_f811 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2909_l2879_l2894_DUPLICATE_f811_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2909_l2879_l2894_DUPLICATE_f811_return_output);



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
 l16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2869_c6_3fa3_return_output,
 n16_MUX_uxn_opcodes_h_l2869_c2_6985_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2869_c2_6985_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2869_c2_6985_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2869_c2_6985_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2869_c2_6985_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2869_c2_6985_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2869_c2_6985_return_output,
 l16_MUX_uxn_opcodes_h_l2869_c2_6985_return_output,
 t16_MUX_uxn_opcodes_h_l2869_c2_6985_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2874_c11_bd0c_return_output,
 n16_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output,
 l16_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output,
 t16_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2877_c11_995e_return_output,
 n16_MUX_uxn_opcodes_h_l2877_c7_b390_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2877_c7_b390_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2877_c7_b390_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2877_c7_b390_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2877_c7_b390_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2877_c7_b390_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2877_c7_b390_return_output,
 l16_MUX_uxn_opcodes_h_l2877_c7_b390_return_output,
 t16_MUX_uxn_opcodes_h_l2877_c7_b390_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2882_c11_87bc_return_output,
 n16_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output,
 l16_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output,
 t16_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2885_c11_3ffe_return_output,
 n16_MUX_uxn_opcodes_h_l2885_c7_b124_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2885_c7_b124_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2885_c7_b124_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2885_c7_b124_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2885_c7_b124_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2885_c7_b124_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2885_c7_b124_return_output,
 l16_MUX_uxn_opcodes_h_l2885_c7_b124_return_output,
 t16_MUX_uxn_opcodes_h_l2885_c7_b124_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2886_c3_baf1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2889_c11_2f69_return_output,
 n16_MUX_uxn_opcodes_h_l2889_c7_6957_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_6957_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2889_c7_6957_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_6957_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_6957_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_6957_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_6957_return_output,
 l16_MUX_uxn_opcodes_h_l2889_c7_6957_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2892_c11_3d2a_return_output,
 n16_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output,
 l16_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2897_c11_1c29_return_output,
 n16_MUX_uxn_opcodes_h_l2897_c7_5610_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_5610_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2897_c7_5610_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_5610_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_5610_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_5610_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_5610_return_output,
 l16_MUX_uxn_opcodes_h_l2897_c7_5610_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2900_c11_30e6_return_output,
 n16_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output,
 l16_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2901_c3_c63e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2904_c11_39aa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_e478_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2904_c7_e478_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_e478_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_e478_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_e478_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_e478_return_output,
 l16_MUX_uxn_opcodes_h_l2904_c7_e478_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2907_c11_8dfc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_4fd6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2907_c7_4fd6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_4fd6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_4fd6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6_return_output,
 l16_MUX_uxn_opcodes_h_l2907_c7_4fd6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3149_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8d27_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8d27_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8d27_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8d27_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8d27_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8d27_return_output,
 l16_MUX_uxn_opcodes_h_l2912_c7_8d27_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2915_c11_7054_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2915_c7_b4f4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2915_c7_b4f4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2915_c7_b4f4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2915_c7_b4f4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4_return_output,
 l16_MUX_uxn_opcodes_h_l2915_c7_b4f4_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2916_c3_9bb5_return_output,
 sp_relative_shift_uxn_opcodes_h_l2918_c30_7266_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2923_c11_5857_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2923_c7_0624_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2923_c7_0624_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2923_c7_0624_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2923_c7_0624_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2923_c7_0624_return_output,
 CONST_SR_8_uxn_opcodes_h_l2926_c31_cdb8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2928_c11_4f3b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_f882_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_f882_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_f882_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2928_c7_f882_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2932_c11_3198_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2932_c7_a40f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_a40f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_a40f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2932_c7_a40f_return_output,
 CONST_SR_8_uxn_opcodes_h_l2934_c31_a2d7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0d49_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2936_c7_026a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2936_c7_026a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2936_c7_026a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2936_c7_026a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2940_c11_1340_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_5741_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_5741_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_5741_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2940_c7_5741_return_output,
 CONST_SR_8_uxn_opcodes_h_l2942_c31_6a9f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2944_c11_26dc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_d142_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_d142_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2909_l2879_l2894_DUPLICATE_f811_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2869_c6_3fa3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2869_c6_3fa3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2869_c6_3fa3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2869_c2_6985_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2869_c2_6985_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2871_c3_3031 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2869_c2_6985_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2869_c2_6985_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2869_c2_6985_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2869_c2_6985_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2869_c2_6985_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2869_c2_6985_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2869_c2_6985_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2869_c2_6985_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2869_c2_6985_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2869_c2_6985_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2869_c2_6985_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2869_c2_6985_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2869_c2_6985_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2869_c2_6985_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2869_c2_6985_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2869_c2_6985_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_bd0c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_bd0c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_bd0c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2877_c7_b390_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2875_c3_e30e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2877_c7_b390_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2877_c7_b390_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2877_c7_b390_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2877_c7_b390_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2877_c7_b390_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2877_c7_b390_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2877_c7_b390_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2877_c7_b390_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_995e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_995e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_995e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2877_c7_b390_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2880_c3_c01f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2877_c7_b390_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2877_c7_b390_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2877_c7_b390_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2877_c7_b390_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2877_c7_b390_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2877_c7_b390_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2877_c7_b390_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2877_c7_b390_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_87bc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_87bc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_87bc_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2885_c7_b124_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2883_c3_2672 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2885_c7_b124_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2885_c7_b124_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2885_c7_b124_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2885_c7_b124_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2885_c7_b124_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2885_c7_b124_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2885_c7_b124_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2885_c7_b124_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_3ffe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_3ffe_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_3ffe_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2889_c7_6957_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2885_c7_b124_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2887_c3_7e20 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_6957_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2885_c7_b124_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2889_c7_6957_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2885_c7_b124_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_6957_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2885_c7_b124_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_6957_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2885_c7_b124_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_6957_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2885_c7_b124_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_6957_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2885_c7_b124_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2889_c7_6957_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2885_c7_b124_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2885_c7_b124_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2886_c3_baf1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2886_c3_baf1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2886_c3_baf1_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_2f69_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_2f69_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_2f69_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2889_c7_6957_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2889_c7_6957_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2889_c7_6957_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_6957_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2890_c3_fee1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_6957_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_6957_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2889_c7_6957_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2889_c7_6957_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2889_c7_6957_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_6957_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_6957_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_6957_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_6957_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_6957_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_6957_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_6957_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_6957_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_6957_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_6957_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_6957_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_6957_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2889_c7_6957_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2889_c7_6957_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2889_c7_6957_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_3d2a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_3d2a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_3d2a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2892_c7_5d86_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2892_c7_5d86_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2897_c7_5610_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2892_c7_5d86_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_5d86_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2895_c3_32d4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_5d86_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_5610_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_5d86_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2892_c7_5d86_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2892_c7_5d86_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2897_c7_5610_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2892_c7_5d86_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_5d86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_5d86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_5610_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_5d86_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_5d86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_5d86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_5610_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_5d86_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_5d86_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_5d86_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_5610_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_5d86_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_5d86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_5d86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_5610_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_5d86_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2892_c7_5d86_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2892_c7_5d86_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2897_c7_5610_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2892_c7_5d86_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_1c29_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_1c29_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_1c29_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2897_c7_5610_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2897_c7_5610_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2897_c7_5610_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_5610_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2898_c3_7f8b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_5610_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_5610_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2897_c7_5610_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2897_c7_5610_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2897_c7_5610_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_5610_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_5610_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_5610_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_5610_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_5610_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_5610_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_5610_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_5610_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_5610_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_5610_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_5610_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_5610_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2897_c7_5610_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2897_c7_5610_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2897_c7_5610_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_30e6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_30e6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_30e6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2900_c7_ea37_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2900_c7_ea37_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2900_c7_ea37_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_ea37_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2902_c3_ca68 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_ea37_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_e478_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_ea37_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2900_c7_ea37_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2900_c7_ea37_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2904_c7_e478_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2900_c7_ea37_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_ea37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_ea37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_e478_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_ea37_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_ea37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_ea37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_e478_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_ea37_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_ea37_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_ea37_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_e478_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_ea37_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_ea37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_ea37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_e478_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_ea37_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2900_c7_ea37_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2900_c7_ea37_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2904_c7_e478_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2900_c7_ea37_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2901_c3_c63e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2901_c3_c63e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2901_c3_c63e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_39aa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_39aa_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_39aa_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_e478_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2905_c3_1775 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_e478_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_4fd6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_e478_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2904_c7_e478_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2904_c7_e478_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2907_c7_4fd6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2904_c7_e478_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_e478_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_e478_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_4fd6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_e478_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_e478_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_e478_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_4fd6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_e478_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_e478_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_e478_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_e478_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_e478_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_e478_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_e478_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2904_c7_e478_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2904_c7_e478_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2907_c7_4fd6_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2904_c7_e478_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_8dfc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_8dfc_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_8dfc_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_4fd6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2910_c3_96b9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_4fd6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8d27_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_4fd6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2907_c7_4fd6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2907_c7_4fd6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8d27_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2907_c7_4fd6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_4fd6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_4fd6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8d27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_4fd6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_4fd6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_4fd6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8d27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_4fd6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8d27_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8d27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2907_c7_4fd6_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2907_c7_4fd6_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2912_c7_8d27_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2907_c7_4fd6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3149_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3149_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3149_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8d27_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2913_c3_e117 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8d27_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2915_c7_b4f4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8d27_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8d27_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8d27_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2915_c7_b4f4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8d27_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8d27_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8d27_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2915_c7_b4f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8d27_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8d27_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8d27_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2915_c7_b4f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8d27_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8d27_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8d27_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8d27_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8d27_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8d27_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8d27_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2912_c7_8d27_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2912_c7_8d27_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2915_c7_b4f4_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2912_c7_8d27_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_7054_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_7054_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_7054_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2915_c7_b4f4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2920_c3_dc00 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2915_c7_b4f4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2923_c7_0624_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2915_c7_b4f4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2915_c7_b4f4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2915_c7_b4f4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2923_c7_0624_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2915_c7_b4f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2915_c7_b4f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2915_c7_b4f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2923_c7_0624_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2915_c7_b4f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2915_c7_b4f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2915_c7_b4f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2923_c7_0624_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2915_c7_b4f4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2923_c7_0624_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2915_c7_b4f4_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2915_c7_b4f4_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2915_c7_b4f4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2916_c3_9bb5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2916_c3_9bb5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2916_c3_9bb5_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2918_c30_7266_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2918_c30_7266_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2918_c30_7266_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2918_c30_7266_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2921_c21_1df7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_5857_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_5857_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_5857_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2923_c7_0624_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2925_c3_4947 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2923_c7_0624_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_f882_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2923_c7_0624_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2923_c7_0624_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2923_c7_0624_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2928_c7_f882_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2923_c7_0624_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2923_c7_0624_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2923_c7_0624_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_f882_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2923_c7_0624_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2923_c7_0624_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2923_c7_0624_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_f882_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2923_c7_0624_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2923_c7_0624_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2923_c7_0624_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2923_c7_0624_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2926_c31_cdb8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2926_c31_cdb8_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2926_c21_73bf_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_4f3b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_4f3b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_4f3b_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_f882_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2929_c3_5355 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_f882_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2932_c7_a40f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_f882_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_f882_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_f882_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_a40f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_f882_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_f882_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_f882_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_a40f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_f882_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2928_c7_f882_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2928_c7_f882_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2932_c7_a40f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2928_c7_f882_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2930_c21_053b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_3198_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_3198_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_3198_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2932_c7_a40f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2933_c3_c1ae : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2932_c7_a40f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2936_c7_026a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2932_c7_a40f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_a40f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_a40f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2936_c7_026a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_a40f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_a40f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_a40f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2936_c7_026a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_a40f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2932_c7_a40f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2932_c7_a40f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2936_c7_026a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2932_c7_a40f_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2934_c31_a2d7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2934_c31_a2d7_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2934_c21_fd36_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0d49_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0d49_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0d49_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2936_c7_026a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2937_c3_74be : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2936_c7_026a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_5741_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2936_c7_026a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2936_c7_026a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2936_c7_026a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_5741_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2936_c7_026a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2936_c7_026a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2936_c7_026a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_5741_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2936_c7_026a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2936_c7_026a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2936_c7_026a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2940_c7_5741_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2936_c7_026a_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2938_c21_1bcf_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_1340_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_1340_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_1340_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_5741_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2941_c3_0bcb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_5741_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2940_c7_5741_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_5741_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_5741_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_5741_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_d142_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_5741_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_5741_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_5741_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_d142_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_5741_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2940_c7_5741_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2940_c7_5741_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2940_c7_5741_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2942_c31_6a9f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2942_c31_6a9f_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2942_c21_c057_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_26dc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_26dc_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_26dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_d142_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_d142_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_d142_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_d142_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_d142_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_d142_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2882_l2904_l2877_l2900_l2874_l2897_l2869_l2892_l2889_l2912_l2940_l2885_l2907_DUPLICATE_4cce_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2936_l2882_l2904_l2932_l2877_l2900_l2928_l2874_l2897_l2923_l2869_l2892_l2944_l2889_l2912_l2940_l2885_l2907_DUPLICATE_00a4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2882_l2904_l2877_l2900_l2874_l2897_l2869_l2892_l2915_l2889_l2912_l2885_l2907_DUPLICATE_bd44_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2882_l2904_l2877_l2900_l2874_l2897_l2923_l2869_l2892_l2889_l2912_l2885_l2907_DUPLICATE_28fa_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2936_l2882_l2904_l2932_l2877_l2900_l2928_l2874_l2897_l2923_l2892_l2915_l2944_l2889_l2912_l2940_l2885_l2907_DUPLICATE_8b30_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2878_l2886_l2916_l2901_l2893_l2908_DUPLICATE_61a1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2909_l2879_l2894_DUPLICATE_f811_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2909_l2879_l2894_DUPLICATE_f811_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l2949_l2865_DUPLICATE_dd7f_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_l16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_l16 := l16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_d142_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2918_c30_7266_x := signed(std_logic_vector(resize(to_unsigned(6, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2883_c3_2672 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2883_c3_2672;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_3ffe_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_1c29_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_3d2a_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2898_c3_7f8b := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_5610_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2898_c3_7f8b;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2910_c3_96b9 := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_4fd6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2910_c3_96b9;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_26dc_right := to_unsigned(18, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3149_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0d49_right := to_unsigned(16, 5);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_d142_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_5857_right := to_unsigned(13, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_7054_right := to_unsigned(12, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2925_c3_4947 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2923_c7_0624_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2925_c3_4947;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2905_c3_1775 := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_e478_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2905_c3_1775;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2902_c3_ca68 := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_ea37_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2902_c3_ca68;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2920_c3_dc00 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2915_c7_b4f4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2920_c3_dc00;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_39aa_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2875_c3_e30e := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2875_c3_e30e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2937_c3_74be := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2936_c7_026a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2937_c3_74be;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2887_c3_7e20 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2887_c3_7e20;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_bd0c_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2913_c3_e117 := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8d27_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2913_c3_e117;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_2f69_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_87bc_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_30e6_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2929_c3_5355 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_f882_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2929_c3_5355;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2871_c3_3031 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2871_c3_3031;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2941_c3_0bcb := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_5741_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2941_c3_0bcb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_8dfc_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_4f3b_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2869_c6_3fa3_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2915_c7_b4f4_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2933_c3_c1ae := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2932_c7_a40f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2933_c3_c1ae;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_3198_right := to_unsigned(15, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2890_c3_fee1 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_6957_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2890_c3_fee1;
     VAR_sp_relative_shift_uxn_opcodes_h_l2918_c30_7266_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2923_c7_0624_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_1340_right := to_unsigned(17, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_995e_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2895_c3_32d4 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_5d86_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2895_c3_32d4;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2880_c3_c01f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2880_c3_c01f;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2918_c30_7266_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2916_c3_9bb5_left := l16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2926_c31_cdb8_x := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2889_c7_6957_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2892_c7_5d86_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2897_c7_5610_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2900_c7_ea37_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2904_c7_e478_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2912_c7_8d27_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2915_c7_b4f4_iffalse := l16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2901_c3_c63e_left := n16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2942_c31_6a9f_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2889_c7_6957_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2897_c7_5610_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2900_c7_ea37_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2869_c6_3fa3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_bd0c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_995e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_87bc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_3ffe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_2f69_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_3d2a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_1c29_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_30e6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_39aa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_8dfc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3149_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_7054_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_5857_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_4f3b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_3198_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0d49_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_1340_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_26dc_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2886_c3_baf1_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2934_c31_a2d7_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse := t16;
     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2882_l2904_l2877_l2900_l2874_l2897_l2869_l2892_l2915_l2889_l2912_l2885_l2907_DUPLICATE_bd44 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2882_l2904_l2877_l2900_l2874_l2897_l2869_l2892_l2915_l2889_l2912_l2885_l2907_DUPLICATE_bd44_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2944_c11_26dc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2944_c11_26dc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_26dc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2944_c11_26dc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_26dc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_26dc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2944_c11_26dc_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2930_c21_053b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2930_c21_053b_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2938_c21_1bcf] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2938_c21_1bcf_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2936_c11_0d49] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0d49_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0d49_left;
     BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0d49_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0d49_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0d49_return_output := BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0d49_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2932_c11_3198] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2932_c11_3198_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_3198_left;
     BIN_OP_EQ_uxn_opcodes_h_l2932_c11_3198_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_3198_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_3198_return_output := BIN_OP_EQ_uxn_opcodes_h_l2932_c11_3198_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2928_c11_4f3b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2928_c11_4f3b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_4f3b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2928_c11_4f3b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_4f3b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_4f3b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2928_c11_4f3b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2936_l2882_l2904_l2932_l2877_l2900_l2928_l2874_l2897_l2923_l2892_l2915_l2944_l2889_l2912_l2940_l2885_l2907_DUPLICATE_8b30 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2936_l2882_l2904_l2932_l2877_l2900_l2928_l2874_l2897_l2923_l2892_l2915_l2944_l2889_l2912_l2940_l2885_l2907_DUPLICATE_8b30_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2940_c11_1340] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2940_c11_1340_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_1340_left;
     BIN_OP_EQ_uxn_opcodes_h_l2940_c11_1340_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_1340_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_1340_return_output := BIN_OP_EQ_uxn_opcodes_h_l2940_c11_1340_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2877_c11_995e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2877_c11_995e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_995e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2877_c11_995e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_995e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_995e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2877_c11_995e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2882_l2904_l2877_l2900_l2874_l2897_l2923_l2869_l2892_l2889_l2912_l2885_l2907_DUPLICATE_28fa LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2882_l2904_l2877_l2900_l2874_l2897_l2923_l2869_l2892_l2889_l2912_l2885_l2907_DUPLICATE_28fa_return_output := result.is_sp_shift;

     -- CONST_SR_8[uxn_opcodes_h_l2934_c31_a2d7] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2934_c31_a2d7_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2934_c31_a2d7_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2934_c31_a2d7_return_output := CONST_SR_8_uxn_opcodes_h_l2934_c31_a2d7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2874_c11_bd0c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2874_c11_bd0c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_bd0c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2874_c11_bd0c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_bd0c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_bd0c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2874_c11_bd0c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2892_c11_3d2a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2892_c11_3d2a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_3d2a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2892_c11_3d2a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_3d2a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_3d2a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2892_c11_3d2a_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2882_l2904_l2877_l2900_l2874_l2897_l2869_l2892_l2889_l2912_l2940_l2885_l2907_DUPLICATE_4cce LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2882_l2904_l2877_l2900_l2874_l2897_l2869_l2892_l2889_l2912_l2940_l2885_l2907_DUPLICATE_4cce_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2912_c11_3149] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3149_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3149_left;
     BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3149_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3149_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3149_return_output := BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3149_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2936_l2882_l2904_l2932_l2877_l2900_l2928_l2874_l2897_l2923_l2869_l2892_l2944_l2889_l2912_l2940_l2885_l2907_DUPLICATE_00a4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2936_l2882_l2904_l2932_l2877_l2900_l2928_l2874_l2897_l2923_l2869_l2892_l2944_l2889_l2912_l2940_l2885_l2907_DUPLICATE_00a4_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2878_l2886_l2916_l2901_l2893_l2908_DUPLICATE_61a1 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2878_l2886_l2916_l2901_l2893_l2908_DUPLICATE_61a1_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2882_c11_87bc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2882_c11_87bc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_87bc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2882_c11_87bc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_87bc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_87bc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2882_c11_87bc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2889_c11_2f69] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2889_c11_2f69_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_2f69_left;
     BIN_OP_EQ_uxn_opcodes_h_l2889_c11_2f69_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_2f69_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_2f69_return_output := BIN_OP_EQ_uxn_opcodes_h_l2889_c11_2f69_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2940_c7_5741] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2940_c7_5741_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2904_c11_39aa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2904_c11_39aa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_39aa_left;
     BIN_OP_EQ_uxn_opcodes_h_l2904_c11_39aa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_39aa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_39aa_return_output := BIN_OP_EQ_uxn_opcodes_h_l2904_c11_39aa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2885_c11_3ffe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2885_c11_3ffe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_3ffe_left;
     BIN_OP_EQ_uxn_opcodes_h_l2885_c11_3ffe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_3ffe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_3ffe_return_output := BIN_OP_EQ_uxn_opcodes_h_l2885_c11_3ffe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2900_c11_30e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2900_c11_30e6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_30e6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2900_c11_30e6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_30e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_30e6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2900_c11_30e6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2907_c11_8dfc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2907_c11_8dfc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_8dfc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2907_c11_8dfc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_8dfc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_8dfc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2907_c11_8dfc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2923_c11_5857] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2923_c11_5857_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_5857_left;
     BIN_OP_EQ_uxn_opcodes_h_l2923_c11_5857_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_5857_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_5857_return_output := BIN_OP_EQ_uxn_opcodes_h_l2923_c11_5857_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2897_c11_1c29] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2897_c11_1c29_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_1c29_left;
     BIN_OP_EQ_uxn_opcodes_h_l2897_c11_1c29_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_1c29_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_1c29_return_output := BIN_OP_EQ_uxn_opcodes_h_l2897_c11_1c29_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2918_c30_7266] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2918_c30_7266_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2918_c30_7266_ins;
     sp_relative_shift_uxn_opcodes_h_l2918_c30_7266_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2918_c30_7266_x;
     sp_relative_shift_uxn_opcodes_h_l2918_c30_7266_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2918_c30_7266_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2918_c30_7266_return_output := sp_relative_shift_uxn_opcodes_h_l2918_c30_7266_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2926_c31_cdb8] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2926_c31_cdb8_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2926_c31_cdb8_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2926_c31_cdb8_return_output := CONST_SR_8_uxn_opcodes_h_l2926_c31_cdb8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2915_c11_7054] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2915_c11_7054_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_7054_left;
     BIN_OP_EQ_uxn_opcodes_h_l2915_c11_7054_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_7054_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_7054_return_output := BIN_OP_EQ_uxn_opcodes_h_l2915_c11_7054_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2942_c31_6a9f] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2942_c31_6a9f_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2942_c31_6a9f_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2942_c31_6a9f_return_output := CONST_SR_8_uxn_opcodes_h_l2942_c31_6a9f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2869_c6_3fa3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2869_c6_3fa3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2869_c6_3fa3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2869_c6_3fa3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2869_c6_3fa3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2869_c6_3fa3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2869_c6_3fa3_return_output;

     -- Submodule level 1
     VAR_l16_MUX_uxn_opcodes_h_l2869_c2_6985_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2869_c6_3fa3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2869_c2_6985_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2869_c6_3fa3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2869_c2_6985_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2869_c6_3fa3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2869_c2_6985_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2869_c6_3fa3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2869_c2_6985_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2869_c6_3fa3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2869_c2_6985_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2869_c6_3fa3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2869_c2_6985_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2869_c6_3fa3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2869_c2_6985_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2869_c6_3fa3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2869_c2_6985_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2869_c6_3fa3_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_bd0c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_bd0c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_bd0c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_bd0c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_bd0c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_bd0c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_bd0c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_bd0c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_bd0c_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2877_c7_b390_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_995e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2877_c7_b390_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_995e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2877_c7_b390_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_995e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2877_c7_b390_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_995e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2877_c7_b390_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_995e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2877_c7_b390_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_995e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2877_c7_b390_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_995e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2877_c7_b390_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_995e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2877_c7_b390_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_995e_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_87bc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_87bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_87bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_87bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_87bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_87bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_87bc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_87bc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_87bc_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2885_c7_b124_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_3ffe_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2885_c7_b124_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_3ffe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2885_c7_b124_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_3ffe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2885_c7_b124_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_3ffe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2885_c7_b124_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_3ffe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2885_c7_b124_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_3ffe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2885_c7_b124_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_3ffe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2885_c7_b124_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_3ffe_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2885_c7_b124_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_3ffe_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2889_c7_6957_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_2f69_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2889_c7_6957_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_2f69_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_6957_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_2f69_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_6957_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_2f69_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_6957_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_2f69_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_6957_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_2f69_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_6957_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_2f69_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2889_c7_6957_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_2f69_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2892_c7_5d86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_3d2a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2892_c7_5d86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_3d2a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_5d86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_3d2a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_5d86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_3d2a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_5d86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_3d2a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_5d86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_3d2a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_5d86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_3d2a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2892_c7_5d86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_3d2a_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2897_c7_5610_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_1c29_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2897_c7_5610_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_1c29_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_5610_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_1c29_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_5610_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_1c29_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_5610_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_1c29_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_5610_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_1c29_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_5610_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_1c29_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2897_c7_5610_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_1c29_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2900_c7_ea37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_30e6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2900_c7_ea37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_30e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_ea37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_30e6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_ea37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_30e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_ea37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_30e6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_ea37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_30e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_ea37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_30e6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2900_c7_ea37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_30e6_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2904_c7_e478_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_39aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_e478_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_39aa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_e478_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_39aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_e478_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_39aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_e478_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_39aa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_e478_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_39aa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2904_c7_e478_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_39aa_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2907_c7_4fd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_8dfc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_4fd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_8dfc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_8dfc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_4fd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_8dfc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_8dfc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_4fd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_8dfc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2907_c7_4fd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_8dfc_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2912_c7_8d27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3149_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8d27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3149_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8d27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3149_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8d27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3149_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8d27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3149_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8d27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3149_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8d27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3149_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2915_c7_b4f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_7054_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2915_c7_b4f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_7054_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_7054_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2915_c7_b4f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_7054_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_7054_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2915_c7_b4f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_7054_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2915_c7_b4f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_7054_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2923_c7_0624_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_5857_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2923_c7_0624_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_5857_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2923_c7_0624_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_5857_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2923_c7_0624_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_5857_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2923_c7_0624_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_5857_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_f882_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_4f3b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_f882_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_4f3b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_f882_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_4f3b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2928_c7_f882_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_4f3b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_a40f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_3198_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_a40f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_3198_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2932_c7_a40f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_3198_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2932_c7_a40f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_3198_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2936_c7_026a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0d49_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2936_c7_026a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0d49_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2936_c7_026a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0d49_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2936_c7_026a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0d49_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_5741_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_1340_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_5741_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_1340_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_5741_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_1340_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2940_c7_5741_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_1340_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_d142_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_26dc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_d142_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_26dc_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2886_c3_baf1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2878_l2886_l2916_l2901_l2893_l2908_DUPLICATE_61a1_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2901_c3_c63e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2878_l2886_l2916_l2901_l2893_l2908_DUPLICATE_61a1_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2916_c3_9bb5_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2878_l2886_l2916_l2901_l2893_l2908_DUPLICATE_61a1_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2909_l2879_l2894_DUPLICATE_f811_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2878_l2886_l2916_l2901_l2893_l2908_DUPLICATE_61a1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2928_c7_f882_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2930_c21_053b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2936_c7_026a_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2938_c21_1bcf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2882_l2904_l2877_l2900_l2874_l2897_l2869_l2892_l2915_l2889_l2912_l2885_l2907_DUPLICATE_bd44_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2882_l2904_l2877_l2900_l2874_l2897_l2869_l2892_l2915_l2889_l2912_l2885_l2907_DUPLICATE_bd44_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2882_l2904_l2877_l2900_l2874_l2897_l2869_l2892_l2915_l2889_l2912_l2885_l2907_DUPLICATE_bd44_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2882_l2904_l2877_l2900_l2874_l2897_l2869_l2892_l2915_l2889_l2912_l2885_l2907_DUPLICATE_bd44_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2882_l2904_l2877_l2900_l2874_l2897_l2869_l2892_l2915_l2889_l2912_l2885_l2907_DUPLICATE_bd44_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_6957_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2882_l2904_l2877_l2900_l2874_l2897_l2869_l2892_l2915_l2889_l2912_l2885_l2907_DUPLICATE_bd44_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_5d86_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2882_l2904_l2877_l2900_l2874_l2897_l2869_l2892_l2915_l2889_l2912_l2885_l2907_DUPLICATE_bd44_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_5610_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2882_l2904_l2877_l2900_l2874_l2897_l2869_l2892_l2915_l2889_l2912_l2885_l2907_DUPLICATE_bd44_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_ea37_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2882_l2904_l2877_l2900_l2874_l2897_l2869_l2892_l2915_l2889_l2912_l2885_l2907_DUPLICATE_bd44_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_e478_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2882_l2904_l2877_l2900_l2874_l2897_l2869_l2892_l2915_l2889_l2912_l2885_l2907_DUPLICATE_bd44_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2882_l2904_l2877_l2900_l2874_l2897_l2869_l2892_l2915_l2889_l2912_l2885_l2907_DUPLICATE_bd44_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8d27_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2882_l2904_l2877_l2900_l2874_l2897_l2869_l2892_l2915_l2889_l2912_l2885_l2907_DUPLICATE_bd44_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2882_l2904_l2877_l2900_l2874_l2897_l2869_l2892_l2915_l2889_l2912_l2885_l2907_DUPLICATE_bd44_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2936_l2882_l2904_l2932_l2877_l2900_l2928_l2874_l2897_l2923_l2892_l2915_l2944_l2889_l2912_l2940_l2885_l2907_DUPLICATE_8b30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2936_l2882_l2904_l2932_l2877_l2900_l2928_l2874_l2897_l2923_l2892_l2915_l2944_l2889_l2912_l2940_l2885_l2907_DUPLICATE_8b30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2936_l2882_l2904_l2932_l2877_l2900_l2928_l2874_l2897_l2923_l2892_l2915_l2944_l2889_l2912_l2940_l2885_l2907_DUPLICATE_8b30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2936_l2882_l2904_l2932_l2877_l2900_l2928_l2874_l2897_l2923_l2892_l2915_l2944_l2889_l2912_l2940_l2885_l2907_DUPLICATE_8b30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_6957_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2936_l2882_l2904_l2932_l2877_l2900_l2928_l2874_l2897_l2923_l2892_l2915_l2944_l2889_l2912_l2940_l2885_l2907_DUPLICATE_8b30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_5d86_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2936_l2882_l2904_l2932_l2877_l2900_l2928_l2874_l2897_l2923_l2892_l2915_l2944_l2889_l2912_l2940_l2885_l2907_DUPLICATE_8b30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_5610_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2936_l2882_l2904_l2932_l2877_l2900_l2928_l2874_l2897_l2923_l2892_l2915_l2944_l2889_l2912_l2940_l2885_l2907_DUPLICATE_8b30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_ea37_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2936_l2882_l2904_l2932_l2877_l2900_l2928_l2874_l2897_l2923_l2892_l2915_l2944_l2889_l2912_l2940_l2885_l2907_DUPLICATE_8b30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_e478_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2936_l2882_l2904_l2932_l2877_l2900_l2928_l2874_l2897_l2923_l2892_l2915_l2944_l2889_l2912_l2940_l2885_l2907_DUPLICATE_8b30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_4fd6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2936_l2882_l2904_l2932_l2877_l2900_l2928_l2874_l2897_l2923_l2892_l2915_l2944_l2889_l2912_l2940_l2885_l2907_DUPLICATE_8b30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8d27_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2936_l2882_l2904_l2932_l2877_l2900_l2928_l2874_l2897_l2923_l2892_l2915_l2944_l2889_l2912_l2940_l2885_l2907_DUPLICATE_8b30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2915_c7_b4f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2936_l2882_l2904_l2932_l2877_l2900_l2928_l2874_l2897_l2923_l2892_l2915_l2944_l2889_l2912_l2940_l2885_l2907_DUPLICATE_8b30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2923_c7_0624_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2936_l2882_l2904_l2932_l2877_l2900_l2928_l2874_l2897_l2923_l2892_l2915_l2944_l2889_l2912_l2940_l2885_l2907_DUPLICATE_8b30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_f882_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2936_l2882_l2904_l2932_l2877_l2900_l2928_l2874_l2897_l2923_l2892_l2915_l2944_l2889_l2912_l2940_l2885_l2907_DUPLICATE_8b30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_a40f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2936_l2882_l2904_l2932_l2877_l2900_l2928_l2874_l2897_l2923_l2892_l2915_l2944_l2889_l2912_l2940_l2885_l2907_DUPLICATE_8b30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2936_c7_026a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2936_l2882_l2904_l2932_l2877_l2900_l2928_l2874_l2897_l2923_l2892_l2915_l2944_l2889_l2912_l2940_l2885_l2907_DUPLICATE_8b30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_5741_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2936_l2882_l2904_l2932_l2877_l2900_l2928_l2874_l2897_l2923_l2892_l2915_l2944_l2889_l2912_l2940_l2885_l2907_DUPLICATE_8b30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_d142_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2936_l2882_l2904_l2932_l2877_l2900_l2928_l2874_l2897_l2923_l2892_l2915_l2944_l2889_l2912_l2940_l2885_l2907_DUPLICATE_8b30_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2882_l2904_l2877_l2900_l2874_l2897_l2923_l2869_l2892_l2889_l2912_l2885_l2907_DUPLICATE_28fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2882_l2904_l2877_l2900_l2874_l2897_l2923_l2869_l2892_l2889_l2912_l2885_l2907_DUPLICATE_28fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2882_l2904_l2877_l2900_l2874_l2897_l2923_l2869_l2892_l2889_l2912_l2885_l2907_DUPLICATE_28fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2882_l2904_l2877_l2900_l2874_l2897_l2923_l2869_l2892_l2889_l2912_l2885_l2907_DUPLICATE_28fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2882_l2904_l2877_l2900_l2874_l2897_l2923_l2869_l2892_l2889_l2912_l2885_l2907_DUPLICATE_28fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_6957_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2882_l2904_l2877_l2900_l2874_l2897_l2923_l2869_l2892_l2889_l2912_l2885_l2907_DUPLICATE_28fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_5d86_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2882_l2904_l2877_l2900_l2874_l2897_l2923_l2869_l2892_l2889_l2912_l2885_l2907_DUPLICATE_28fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_5610_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2882_l2904_l2877_l2900_l2874_l2897_l2923_l2869_l2892_l2889_l2912_l2885_l2907_DUPLICATE_28fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_ea37_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2882_l2904_l2877_l2900_l2874_l2897_l2923_l2869_l2892_l2889_l2912_l2885_l2907_DUPLICATE_28fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_e478_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2882_l2904_l2877_l2900_l2874_l2897_l2923_l2869_l2892_l2889_l2912_l2885_l2907_DUPLICATE_28fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2882_l2904_l2877_l2900_l2874_l2897_l2923_l2869_l2892_l2889_l2912_l2885_l2907_DUPLICATE_28fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8d27_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2882_l2904_l2877_l2900_l2874_l2897_l2923_l2869_l2892_l2889_l2912_l2885_l2907_DUPLICATE_28fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2923_c7_0624_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2882_l2904_l2877_l2900_l2874_l2897_l2923_l2869_l2892_l2889_l2912_l2885_l2907_DUPLICATE_28fa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2936_l2882_l2904_l2932_l2877_l2900_l2928_l2874_l2897_l2923_l2869_l2892_l2944_l2889_l2912_l2940_l2885_l2907_DUPLICATE_00a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2936_l2882_l2904_l2932_l2877_l2900_l2928_l2874_l2897_l2923_l2869_l2892_l2944_l2889_l2912_l2940_l2885_l2907_DUPLICATE_00a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2936_l2882_l2904_l2932_l2877_l2900_l2928_l2874_l2897_l2923_l2869_l2892_l2944_l2889_l2912_l2940_l2885_l2907_DUPLICATE_00a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2936_l2882_l2904_l2932_l2877_l2900_l2928_l2874_l2897_l2923_l2869_l2892_l2944_l2889_l2912_l2940_l2885_l2907_DUPLICATE_00a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2936_l2882_l2904_l2932_l2877_l2900_l2928_l2874_l2897_l2923_l2869_l2892_l2944_l2889_l2912_l2940_l2885_l2907_DUPLICATE_00a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_6957_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2936_l2882_l2904_l2932_l2877_l2900_l2928_l2874_l2897_l2923_l2869_l2892_l2944_l2889_l2912_l2940_l2885_l2907_DUPLICATE_00a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_5d86_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2936_l2882_l2904_l2932_l2877_l2900_l2928_l2874_l2897_l2923_l2869_l2892_l2944_l2889_l2912_l2940_l2885_l2907_DUPLICATE_00a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_5610_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2936_l2882_l2904_l2932_l2877_l2900_l2928_l2874_l2897_l2923_l2869_l2892_l2944_l2889_l2912_l2940_l2885_l2907_DUPLICATE_00a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_ea37_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2936_l2882_l2904_l2932_l2877_l2900_l2928_l2874_l2897_l2923_l2869_l2892_l2944_l2889_l2912_l2940_l2885_l2907_DUPLICATE_00a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_e478_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2936_l2882_l2904_l2932_l2877_l2900_l2928_l2874_l2897_l2923_l2869_l2892_l2944_l2889_l2912_l2940_l2885_l2907_DUPLICATE_00a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_4fd6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2936_l2882_l2904_l2932_l2877_l2900_l2928_l2874_l2897_l2923_l2869_l2892_l2944_l2889_l2912_l2940_l2885_l2907_DUPLICATE_00a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8d27_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2936_l2882_l2904_l2932_l2877_l2900_l2928_l2874_l2897_l2923_l2869_l2892_l2944_l2889_l2912_l2940_l2885_l2907_DUPLICATE_00a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2923_c7_0624_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2936_l2882_l2904_l2932_l2877_l2900_l2928_l2874_l2897_l2923_l2869_l2892_l2944_l2889_l2912_l2940_l2885_l2907_DUPLICATE_00a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_f882_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2936_l2882_l2904_l2932_l2877_l2900_l2928_l2874_l2897_l2923_l2869_l2892_l2944_l2889_l2912_l2940_l2885_l2907_DUPLICATE_00a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_a40f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2936_l2882_l2904_l2932_l2877_l2900_l2928_l2874_l2897_l2923_l2869_l2892_l2944_l2889_l2912_l2940_l2885_l2907_DUPLICATE_00a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2936_c7_026a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2936_l2882_l2904_l2932_l2877_l2900_l2928_l2874_l2897_l2923_l2869_l2892_l2944_l2889_l2912_l2940_l2885_l2907_DUPLICATE_00a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_5741_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2936_l2882_l2904_l2932_l2877_l2900_l2928_l2874_l2897_l2923_l2869_l2892_l2944_l2889_l2912_l2940_l2885_l2907_DUPLICATE_00a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_d142_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2936_l2882_l2904_l2932_l2877_l2900_l2928_l2874_l2897_l2923_l2869_l2892_l2944_l2889_l2912_l2940_l2885_l2907_DUPLICATE_00a4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2882_l2904_l2877_l2900_l2874_l2897_l2869_l2892_l2889_l2912_l2940_l2885_l2907_DUPLICATE_4cce_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2882_l2904_l2877_l2900_l2874_l2897_l2869_l2892_l2889_l2912_l2940_l2885_l2907_DUPLICATE_4cce_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2882_l2904_l2877_l2900_l2874_l2897_l2869_l2892_l2889_l2912_l2940_l2885_l2907_DUPLICATE_4cce_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2882_l2904_l2877_l2900_l2874_l2897_l2869_l2892_l2889_l2912_l2940_l2885_l2907_DUPLICATE_4cce_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2882_l2904_l2877_l2900_l2874_l2897_l2869_l2892_l2889_l2912_l2940_l2885_l2907_DUPLICATE_4cce_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2889_c7_6957_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2882_l2904_l2877_l2900_l2874_l2897_l2869_l2892_l2889_l2912_l2940_l2885_l2907_DUPLICATE_4cce_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2892_c7_5d86_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2882_l2904_l2877_l2900_l2874_l2897_l2869_l2892_l2889_l2912_l2940_l2885_l2907_DUPLICATE_4cce_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2897_c7_5610_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2882_l2904_l2877_l2900_l2874_l2897_l2869_l2892_l2889_l2912_l2940_l2885_l2907_DUPLICATE_4cce_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2900_c7_ea37_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2882_l2904_l2877_l2900_l2874_l2897_l2869_l2892_l2889_l2912_l2940_l2885_l2907_DUPLICATE_4cce_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2904_c7_e478_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2882_l2904_l2877_l2900_l2874_l2897_l2869_l2892_l2889_l2912_l2940_l2885_l2907_DUPLICATE_4cce_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2907_c7_4fd6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2882_l2904_l2877_l2900_l2874_l2897_l2869_l2892_l2889_l2912_l2940_l2885_l2907_DUPLICATE_4cce_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8d27_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2882_l2904_l2877_l2900_l2874_l2897_l2869_l2892_l2889_l2912_l2940_l2885_l2907_DUPLICATE_4cce_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2940_c7_5741_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2882_l2904_l2877_l2900_l2874_l2897_l2869_l2892_l2889_l2912_l2940_l2885_l2907_DUPLICATE_4cce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_5741_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2940_c7_5741_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2918_c30_7266_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l2934_c21_fd36] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2934_c21_fd36_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2934_c31_a2d7_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2923_c7_0624] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2923_c7_0624_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2923_c7_0624_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2923_c7_0624_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2923_c7_0624_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2923_c7_0624_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2923_c7_0624_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2923_c7_0624_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2923_c7_0624_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2886_c3_baf1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2886_c3_baf1_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2886_c3_baf1_left;
     BIN_OP_OR_uxn_opcodes_h_l2886_c3_baf1_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2886_c3_baf1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2886_c3_baf1_return_output := BIN_OP_OR_uxn_opcodes_h_l2886_c3_baf1_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2942_c21_c057] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2942_c21_c057_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2942_c31_6a9f_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2944_c7_d142] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_d142_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_d142_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_d142_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_d142_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_d142_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_d142_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_d142_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_d142_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2901_c3_c63e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2901_c3_c63e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2901_c3_c63e_left;
     BIN_OP_OR_uxn_opcodes_h_l2901_c3_c63e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2901_c3_c63e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2901_c3_c63e_return_output := BIN_OP_OR_uxn_opcodes_h_l2901_c3_c63e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2915_c7_b4f4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2944_c7_d142] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_d142_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_d142_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_d142_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_d142_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_d142_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_d142_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_d142_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_d142_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2909_l2879_l2894_DUPLICATE_f811 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2909_l2879_l2894_DUPLICATE_f811_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2909_l2879_l2894_DUPLICATE_f811_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2909_l2879_l2894_DUPLICATE_f811_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2909_l2879_l2894_DUPLICATE_f811_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2916_c3_9bb5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2916_c3_9bb5_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2916_c3_9bb5_left;
     BIN_OP_OR_uxn_opcodes_h_l2916_c3_9bb5_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2916_c3_9bb5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2916_c3_9bb5_return_output := BIN_OP_OR_uxn_opcodes_h_l2916_c3_9bb5_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2926_c21_73bf] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2926_c21_73bf_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2926_c31_cdb8_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2940_c7_5741] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_5741_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_5741_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_5741_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_5741_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_5741_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_5741_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_5741_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_5741_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2886_c3_baf1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2900_c7_ea37_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2901_c3_c63e_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2915_c7_b4f4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2916_c3_9bb5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2923_c7_0624_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2926_c21_73bf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2932_c7_a40f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2934_c21_fd36_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2940_c7_5741_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2942_c21_c057_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2907_c7_4fd6_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2909_l2879_l2894_DUPLICATE_f811_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2892_c7_5d86_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2909_l2879_l2894_DUPLICATE_f811_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2909_l2879_l2894_DUPLICATE_f811_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_5741_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_d142_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2923_c7_0624_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_5741_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_d142_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8d27_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2936_c7_026a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c7_5741_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2912_c7_8d27] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8d27_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8d27_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8d27_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8d27_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8d27_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8d27_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8d27_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8d27_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2915_c7_b4f4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2940_c7_5741] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_5741_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_5741_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_5741_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_5741_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_5741_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_5741_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_5741_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_5741_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2921_c21_1df7] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2921_c21_1df7_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l2916_c3_9bb5_return_output);

     -- n16_MUX[uxn_opcodes_h_l2900_c7_ea37] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2900_c7_ea37_cond <= VAR_n16_MUX_uxn_opcodes_h_l2900_c7_ea37_cond;
     n16_MUX_uxn_opcodes_h_l2900_c7_ea37_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2900_c7_ea37_iftrue;
     n16_MUX_uxn_opcodes_h_l2900_c7_ea37_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2900_c7_ea37_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output := n16_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output;

     -- t16_MUX[uxn_opcodes_h_l2885_c7_b124] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2885_c7_b124_cond <= VAR_t16_MUX_uxn_opcodes_h_l2885_c7_b124_cond;
     t16_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue;
     t16_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2885_c7_b124_return_output := t16_MUX_uxn_opcodes_h_l2885_c7_b124_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2940_c7_5741] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_5741_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_5741_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_5741_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_5741_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_5741_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_5741_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_5741_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_5741_return_output;

     -- l16_MUX[uxn_opcodes_h_l2915_c7_b4f4] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2915_c7_b4f4_cond <= VAR_l16_MUX_uxn_opcodes_h_l2915_c7_b4f4_cond;
     l16_MUX_uxn_opcodes_h_l2915_c7_b4f4_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2915_c7_b4f4_iftrue;
     l16_MUX_uxn_opcodes_h_l2915_c7_b4f4_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2915_c7_b4f4_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2915_c7_b4f4_return_output := l16_MUX_uxn_opcodes_h_l2915_c7_b4f4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2936_c7_026a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2936_c7_026a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2936_c7_026a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2936_c7_026a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2936_c7_026a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2936_c7_026a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2936_c7_026a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2936_c7_026a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2936_c7_026a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2940_c7_5741] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2940_c7_5741_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2940_c7_5741_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2940_c7_5741_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2940_c7_5741_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2940_c7_5741_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2940_c7_5741_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2940_c7_5741_return_output := result_u8_value_MUX_uxn_opcodes_h_l2940_c7_5741_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2915_c7_b4f4_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2921_c21_1df7_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2912_c7_8d27_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2915_c7_b4f4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2897_c7_5610_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2936_c7_026a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2940_c7_5741_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8d27_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2915_c7_b4f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2936_c7_026a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2940_c7_5741_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8d27_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2932_c7_a40f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2936_c7_026a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2936_c7_026a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2940_c7_5741_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2885_c7_b124_return_output;
     -- l16_MUX[uxn_opcodes_h_l2912_c7_8d27] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2912_c7_8d27_cond <= VAR_l16_MUX_uxn_opcodes_h_l2912_c7_8d27_cond;
     l16_MUX_uxn_opcodes_h_l2912_c7_8d27_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2912_c7_8d27_iftrue;
     l16_MUX_uxn_opcodes_h_l2912_c7_8d27_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2912_c7_8d27_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2912_c7_8d27_return_output := l16_MUX_uxn_opcodes_h_l2912_c7_8d27_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2936_c7_026a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2936_c7_026a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2936_c7_026a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2936_c7_026a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2936_c7_026a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2936_c7_026a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2936_c7_026a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2936_c7_026a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2936_c7_026a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2936_c7_026a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2936_c7_026a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2936_c7_026a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2936_c7_026a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2936_c7_026a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2936_c7_026a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2936_c7_026a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2936_c7_026a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2936_c7_026a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2936_c7_026a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2936_c7_026a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2936_c7_026a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2936_c7_026a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2936_c7_026a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2936_c7_026a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2936_c7_026a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2936_c7_026a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2936_c7_026a_return_output;

     -- t16_MUX[uxn_opcodes_h_l2882_c7_f9c8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond <= VAR_t16_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond;
     t16_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue;
     t16_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output := t16_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output;

     -- n16_MUX[uxn_opcodes_h_l2897_c7_5610] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2897_c7_5610_cond <= VAR_n16_MUX_uxn_opcodes_h_l2897_c7_5610_cond;
     n16_MUX_uxn_opcodes_h_l2897_c7_5610_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2897_c7_5610_iftrue;
     n16_MUX_uxn_opcodes_h_l2897_c7_5610_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2897_c7_5610_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2897_c7_5610_return_output := n16_MUX_uxn_opcodes_h_l2897_c7_5610_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2932_c7_a40f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2932_c7_a40f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2932_c7_a40f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2932_c7_a40f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2932_c7_a40f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2932_c7_a40f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2932_c7_a40f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2932_c7_a40f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2932_c7_a40f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2907_c7_4fd6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2912_c7_8d27] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8d27_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8d27_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8d27_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8d27_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8d27_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8d27_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8d27_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8d27_return_output;

     -- Submodule level 4
     VAR_l16_MUX_uxn_opcodes_h_l2907_c7_4fd6_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2912_c7_8d27_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2892_c7_5d86_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2897_c7_5610_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_a40f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2936_c7_026a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8d27_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_a40f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2936_c7_026a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_e478_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_f882_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2932_c7_a40f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2932_c7_a40f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2936_c7_026a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2904_c7_e478] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_e478_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_e478_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_e478_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_e478_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_e478_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_e478_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_e478_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_e478_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2932_c7_a40f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_a40f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_a40f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_a40f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_a40f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_a40f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_a40f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_a40f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_a40f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2907_c7_4fd6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6_return_output;

     -- l16_MUX[uxn_opcodes_h_l2907_c7_4fd6] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2907_c7_4fd6_cond <= VAR_l16_MUX_uxn_opcodes_h_l2907_c7_4fd6_cond;
     l16_MUX_uxn_opcodes_h_l2907_c7_4fd6_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2907_c7_4fd6_iftrue;
     l16_MUX_uxn_opcodes_h_l2907_c7_4fd6_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2907_c7_4fd6_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2907_c7_4fd6_return_output := l16_MUX_uxn_opcodes_h_l2907_c7_4fd6_return_output;

     -- t16_MUX[uxn_opcodes_h_l2877_c7_b390] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2877_c7_b390_cond <= VAR_t16_MUX_uxn_opcodes_h_l2877_c7_b390_cond;
     t16_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue;
     t16_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2877_c7_b390_return_output := t16_MUX_uxn_opcodes_h_l2877_c7_b390_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2932_c7_a40f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_a40f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_a40f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_a40f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_a40f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_a40f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_a40f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_a40f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_a40f_return_output;

     -- n16_MUX[uxn_opcodes_h_l2892_c7_5d86] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2892_c7_5d86_cond <= VAR_n16_MUX_uxn_opcodes_h_l2892_c7_5d86_cond;
     n16_MUX_uxn_opcodes_h_l2892_c7_5d86_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2892_c7_5d86_iftrue;
     n16_MUX_uxn_opcodes_h_l2892_c7_5d86_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2892_c7_5d86_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output := n16_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2928_c7_f882] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_f882_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_f882_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_f882_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_f882_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_f882_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_f882_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_f882_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_f882_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2932_c7_a40f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2932_c7_a40f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2932_c7_a40f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2932_c7_a40f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2932_c7_a40f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2932_c7_a40f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2932_c7_a40f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2932_c7_a40f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2932_c7_a40f_return_output;

     -- Submodule level 5
     VAR_l16_MUX_uxn_opcodes_h_l2904_c7_e478_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2907_c7_4fd6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2889_c7_6957_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_f882_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_a40f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_e478_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_4fd6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_f882_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_a40f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_ea37_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_e478_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2923_c7_0624_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_f882_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2928_c7_f882_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2932_c7_a40f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2877_c7_b390_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2928_c7_f882] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_f882_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_f882_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_f882_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_f882_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_f882_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_f882_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_f882_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_f882_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2904_c7_e478] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_e478_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_e478_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_e478_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_e478_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_e478_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_e478_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_e478_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_e478_return_output;

     -- t16_MUX[uxn_opcodes_h_l2874_c7_4f7d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond <= VAR_t16_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond;
     t16_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue;
     t16_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output := t16_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output;

     -- l16_MUX[uxn_opcodes_h_l2904_c7_e478] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2904_c7_e478_cond <= VAR_l16_MUX_uxn_opcodes_h_l2904_c7_e478_cond;
     l16_MUX_uxn_opcodes_h_l2904_c7_e478_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2904_c7_e478_iftrue;
     l16_MUX_uxn_opcodes_h_l2904_c7_e478_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2904_c7_e478_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2904_c7_e478_return_output := l16_MUX_uxn_opcodes_h_l2904_c7_e478_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2928_c7_f882] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2928_c7_f882_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2928_c7_f882_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2928_c7_f882_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2928_c7_f882_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2928_c7_f882_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2928_c7_f882_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2928_c7_f882_return_output := result_u8_value_MUX_uxn_opcodes_h_l2928_c7_f882_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2900_c7_ea37] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_ea37_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_ea37_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_ea37_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_ea37_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_ea37_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_ea37_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2928_c7_f882] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_f882_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_f882_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_f882_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_f882_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_f882_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_f882_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_f882_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_f882_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2923_c7_0624] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2923_c7_0624_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2923_c7_0624_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2923_c7_0624_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2923_c7_0624_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2923_c7_0624_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2923_c7_0624_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2923_c7_0624_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2923_c7_0624_return_output;

     -- n16_MUX[uxn_opcodes_h_l2889_c7_6957] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2889_c7_6957_cond <= VAR_n16_MUX_uxn_opcodes_h_l2889_c7_6957_cond;
     n16_MUX_uxn_opcodes_h_l2889_c7_6957_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2889_c7_6957_iftrue;
     n16_MUX_uxn_opcodes_h_l2889_c7_6957_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2889_c7_6957_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2889_c7_6957_return_output := n16_MUX_uxn_opcodes_h_l2889_c7_6957_return_output;

     -- Submodule level 6
     VAR_l16_MUX_uxn_opcodes_h_l2900_c7_ea37_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2904_c7_e478_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2889_c7_6957_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2923_c7_0624_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_f882_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_ea37_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_e478_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2923_c7_0624_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_f882_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_5610_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2915_c7_b4f4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2923_c7_0624_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2923_c7_0624_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2928_c7_f882_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2923_c7_0624] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2923_c7_0624_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2923_c7_0624_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2923_c7_0624_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2923_c7_0624_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2923_c7_0624_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2923_c7_0624_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2923_c7_0624_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2923_c7_0624_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2923_c7_0624] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2923_c7_0624_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2923_c7_0624_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2923_c7_0624_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2923_c7_0624_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2923_c7_0624_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2923_c7_0624_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2923_c7_0624_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2923_c7_0624_return_output;

     -- n16_MUX[uxn_opcodes_h_l2885_c7_b124] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2885_c7_b124_cond <= VAR_n16_MUX_uxn_opcodes_h_l2885_c7_b124_cond;
     n16_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue;
     n16_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2885_c7_b124_return_output := n16_MUX_uxn_opcodes_h_l2885_c7_b124_return_output;

     -- t16_MUX[uxn_opcodes_h_l2869_c2_6985] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2869_c2_6985_cond <= VAR_t16_MUX_uxn_opcodes_h_l2869_c2_6985_cond;
     t16_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue;
     t16_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2869_c2_6985_return_output := t16_MUX_uxn_opcodes_h_l2869_c2_6985_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2900_c7_ea37] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_ea37_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_ea37_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_ea37_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_ea37_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_ea37_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_ea37_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2915_c7_b4f4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2915_c7_b4f4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2915_c7_b4f4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2915_c7_b4f4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2915_c7_b4f4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2915_c7_b4f4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2915_c7_b4f4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2915_c7_b4f4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2915_c7_b4f4_return_output;

     -- l16_MUX[uxn_opcodes_h_l2900_c7_ea37] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2900_c7_ea37_cond <= VAR_l16_MUX_uxn_opcodes_h_l2900_c7_ea37_cond;
     l16_MUX_uxn_opcodes_h_l2900_c7_ea37_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2900_c7_ea37_iftrue;
     l16_MUX_uxn_opcodes_h_l2900_c7_ea37_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2900_c7_ea37_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output := l16_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2923_c7_0624] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2923_c7_0624_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2923_c7_0624_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2923_c7_0624_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2923_c7_0624_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2923_c7_0624_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2923_c7_0624_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2923_c7_0624_return_output := result_u8_value_MUX_uxn_opcodes_h_l2923_c7_0624_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2897_c7_5610] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_5610_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_5610_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_5610_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_5610_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_5610_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_5610_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_5610_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_5610_return_output;

     -- Submodule level 7
     VAR_l16_MUX_uxn_opcodes_h_l2897_c7_5610_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2885_c7_b124_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2915_c7_b4f4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2923_c7_0624_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_5610_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2915_c7_b4f4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2923_c7_0624_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_5d86_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_5610_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8d27_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2915_c7_b4f4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2915_c7_b4f4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2923_c7_0624_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2869_c2_6985_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2915_c7_b4f4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2915_c7_b4f4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2915_c7_b4f4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2915_c7_b4f4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2915_c7_b4f4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2915_c7_b4f4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2915_c7_b4f4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2915_c7_b4f4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2915_c7_b4f4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2915_c7_b4f4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2915_c7_b4f4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2915_c7_b4f4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2915_c7_b4f4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2915_c7_b4f4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2915_c7_b4f4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2915_c7_b4f4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2915_c7_b4f4_return_output := result_u8_value_MUX_uxn_opcodes_h_l2915_c7_b4f4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2892_c7_5d86] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_5d86_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_5d86_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_5d86_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_5d86_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_5d86_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_5d86_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2912_c7_8d27] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8d27_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8d27_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8d27_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8d27_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8d27_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8d27_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8d27_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8d27_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2915_c7_b4f4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2915_c7_b4f4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2915_c7_b4f4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2915_c7_b4f4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2915_c7_b4f4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2915_c7_b4f4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2915_c7_b4f4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2915_c7_b4f4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2915_c7_b4f4_return_output;

     -- l16_MUX[uxn_opcodes_h_l2897_c7_5610] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2897_c7_5610_cond <= VAR_l16_MUX_uxn_opcodes_h_l2897_c7_5610_cond;
     l16_MUX_uxn_opcodes_h_l2897_c7_5610_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2897_c7_5610_iftrue;
     l16_MUX_uxn_opcodes_h_l2897_c7_5610_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2897_c7_5610_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2897_c7_5610_return_output := l16_MUX_uxn_opcodes_h_l2897_c7_5610_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2897_c7_5610] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_5610_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_5610_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_5610_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_5610_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_5610_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_5610_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_5610_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_5610_return_output;

     -- n16_MUX[uxn_opcodes_h_l2882_c7_f9c8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond <= VAR_n16_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond;
     n16_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue;
     n16_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output := n16_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output;

     -- Submodule level 8
     VAR_l16_MUX_uxn_opcodes_h_l2892_c7_5d86_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2897_c7_5610_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8d27_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2915_c7_b4f4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_5d86_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_5610_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8d27_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2915_c7_b4f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_6957_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_4fd6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8d27_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8d27_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2915_c7_b4f4_return_output;
     -- n16_MUX[uxn_opcodes_h_l2877_c7_b390] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2877_c7_b390_cond <= VAR_n16_MUX_uxn_opcodes_h_l2877_c7_b390_cond;
     n16_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue;
     n16_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2877_c7_b390_return_output := n16_MUX_uxn_opcodes_h_l2877_c7_b390_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2912_c7_8d27] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8d27_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8d27_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8d27_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8d27_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8d27_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8d27_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8d27_return_output := result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8d27_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2889_c7_6957] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_6957_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_6957_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_6957_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_6957_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_6957_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_6957_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_6957_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_6957_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2907_c7_4fd6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_4fd6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_4fd6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_4fd6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_4fd6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_4fd6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_4fd6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_4fd6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_4fd6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2912_c7_8d27] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8d27_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8d27_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8d27_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8d27_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8d27_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8d27_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8d27_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8d27_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2892_c7_5d86] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_5d86_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_5d86_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_5d86_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_5d86_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_5d86_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_5d86_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2912_c7_8d27] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8d27_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8d27_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8d27_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8d27_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8d27_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8d27_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8d27_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8d27_return_output;

     -- l16_MUX[uxn_opcodes_h_l2892_c7_5d86] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2892_c7_5d86_cond <= VAR_l16_MUX_uxn_opcodes_h_l2892_c7_5d86_cond;
     l16_MUX_uxn_opcodes_h_l2892_c7_5d86_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2892_c7_5d86_iftrue;
     l16_MUX_uxn_opcodes_h_l2892_c7_5d86_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2892_c7_5d86_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output := l16_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output;

     -- Submodule level 9
     VAR_l16_MUX_uxn_opcodes_h_l2889_c7_6957_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2877_c7_b390_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_4fd6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8d27_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_6957_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_4fd6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8d27_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_6957_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_e478_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_4fd6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2907_c7_4fd6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8d27_return_output;
     -- l16_MUX[uxn_opcodes_h_l2889_c7_6957] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2889_c7_6957_cond <= VAR_l16_MUX_uxn_opcodes_h_l2889_c7_6957_cond;
     l16_MUX_uxn_opcodes_h_l2889_c7_6957_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2889_c7_6957_iftrue;
     l16_MUX_uxn_opcodes_h_l2889_c7_6957_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2889_c7_6957_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2889_c7_6957_return_output := l16_MUX_uxn_opcodes_h_l2889_c7_6957_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2907_c7_4fd6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2907_c7_4fd6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2907_c7_4fd6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2907_c7_4fd6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2907_c7_4fd6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2907_c7_4fd6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2907_c7_4fd6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2907_c7_4fd6_return_output := result_u8_value_MUX_uxn_opcodes_h_l2907_c7_4fd6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2904_c7_e478] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_e478_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_e478_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_e478_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_e478_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_e478_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_e478_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_e478_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_e478_return_output;

     -- n16_MUX[uxn_opcodes_h_l2874_c7_4f7d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond;
     n16_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue;
     n16_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output := n16_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2885_c7_b124] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2885_c7_b124_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2885_c7_b124_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2885_c7_b124_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2885_c7_b124_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2889_c7_6957] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_6957_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_6957_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_6957_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_6957_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_6957_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_6957_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_6957_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_6957_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2907_c7_4fd6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_4fd6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_4fd6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_4fd6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_4fd6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_4fd6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_4fd6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_4fd6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_4fd6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2907_c7_4fd6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_4fd6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_4fd6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_4fd6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_4fd6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_4fd6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_4fd6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_4fd6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_4fd6_return_output;

     -- Submodule level 10
     VAR_l16_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2889_c7_6957_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_e478_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_4fd6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_6957_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_e478_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_4fd6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2885_c7_b124_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_ea37_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_e478_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2904_c7_e478_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2907_c7_4fd6_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2882_c7_f9c8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2900_c7_ea37] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_ea37_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_ea37_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_ea37_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_ea37_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_ea37_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_ea37_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output;

     -- l16_MUX[uxn_opcodes_h_l2885_c7_b124] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2885_c7_b124_cond <= VAR_l16_MUX_uxn_opcodes_h_l2885_c7_b124_cond;
     l16_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue;
     l16_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2885_c7_b124_return_output := l16_MUX_uxn_opcodes_h_l2885_c7_b124_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2904_c7_e478] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2904_c7_e478_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2904_c7_e478_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2904_c7_e478_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2904_c7_e478_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2904_c7_e478_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2904_c7_e478_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2904_c7_e478_return_output := result_u8_value_MUX_uxn_opcodes_h_l2904_c7_e478_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2904_c7_e478] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_e478_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_e478_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_e478_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_e478_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_e478_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_e478_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_e478_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_e478_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2904_c7_e478] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_e478_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_e478_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_e478_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_e478_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_e478_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_e478_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_e478_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_e478_return_output;

     -- n16_MUX[uxn_opcodes_h_l2869_c2_6985] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2869_c2_6985_cond <= VAR_n16_MUX_uxn_opcodes_h_l2869_c2_6985_cond;
     n16_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue;
     n16_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2869_c2_6985_return_output := n16_MUX_uxn_opcodes_h_l2869_c2_6985_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2885_c7_b124] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2885_c7_b124_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2885_c7_b124_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2885_c7_b124_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2885_c7_b124_return_output;

     -- Submodule level 11
     VAR_l16_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2885_c7_b124_return_output;
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2869_c2_6985_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_ea37_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_e478_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2885_c7_b124_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_ea37_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_e478_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_5610_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2900_c7_ea37_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2904_c7_e478_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2900_c7_ea37] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_ea37_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_ea37_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_ea37_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_ea37_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_ea37_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_ea37_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2900_c7_ea37] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2900_c7_ea37_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2900_c7_ea37_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2900_c7_ea37_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2900_c7_ea37_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2900_c7_ea37_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2900_c7_ea37_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output := result_u8_value_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2900_c7_ea37] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_ea37_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_ea37_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_ea37_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_ea37_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_ea37_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_ea37_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2882_c7_f9c8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2877_c7_b390] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2877_c7_b390_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2877_c7_b390_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2877_c7_b390_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2877_c7_b390_return_output;

     -- l16_MUX[uxn_opcodes_h_l2882_c7_f9c8] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond <= VAR_l16_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond;
     l16_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue;
     l16_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output := l16_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2897_c7_5610] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_5610_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_5610_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_5610_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_5610_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_5610_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_5610_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_5610_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_5610_return_output;

     -- Submodule level 12
     VAR_l16_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_5610_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_5610_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2877_c7_b390_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_5d86_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_5610_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2897_c7_5610_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2900_c7_ea37_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2874_c7_4f7d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2897_c7_5610] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_5610_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_5610_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_5610_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_5610_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_5610_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_5610_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_5610_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_5610_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2897_c7_5610] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_5610_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_5610_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_5610_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_5610_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_5610_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_5610_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_5610_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_5610_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2897_c7_5610] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2897_c7_5610_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2897_c7_5610_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2897_c7_5610_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2897_c7_5610_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2897_c7_5610_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2897_c7_5610_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2897_c7_5610_return_output := result_u8_value_MUX_uxn_opcodes_h_l2897_c7_5610_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2892_c7_5d86] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_5d86_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_5d86_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_5d86_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_5d86_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_5d86_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_5d86_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2877_c7_b390] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2877_c7_b390_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2877_c7_b390_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2877_c7_b390_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2877_c7_b390_return_output;

     -- l16_MUX[uxn_opcodes_h_l2877_c7_b390] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2877_c7_b390_cond <= VAR_l16_MUX_uxn_opcodes_h_l2877_c7_b390_cond;
     l16_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue;
     l16_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2877_c7_b390_return_output := l16_MUX_uxn_opcodes_h_l2877_c7_b390_return_output;

     -- Submodule level 13
     VAR_l16_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2877_c7_b390_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_5d86_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_5610_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2877_c7_b390_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_5d86_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_5610_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_6957_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2892_c7_5d86_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2897_c7_5610_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2869_c2_6985] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2869_c2_6985_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2869_c2_6985_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2869_c2_6985_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2869_c2_6985_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2892_c7_5d86] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2892_c7_5d86_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2892_c7_5d86_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2892_c7_5d86_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2892_c7_5d86_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2892_c7_5d86_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2892_c7_5d86_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output := result_u8_value_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2892_c7_5d86] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_5d86_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_5d86_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_5d86_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_5d86_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_5d86_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_5d86_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output;

     -- l16_MUX[uxn_opcodes_h_l2874_c7_4f7d] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond <= VAR_l16_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond;
     l16_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue;
     l16_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output := l16_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2889_c7_6957] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_6957_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_6957_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_6957_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_6957_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_6957_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_6957_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_6957_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_6957_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2892_c7_5d86] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_5d86_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_5d86_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_5d86_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_5d86_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_5d86_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_5d86_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2874_c7_4f7d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output;

     -- Submodule level 14
     VAR_l16_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_6957_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_6957_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_6957_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2889_c7_6957_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2892_c7_5d86_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2869_c2_6985] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2869_c2_6985_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2869_c2_6985_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2869_c2_6985_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2869_c2_6985_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2889_c7_6957] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2889_c7_6957_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2889_c7_6957_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2889_c7_6957_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2889_c7_6957_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2889_c7_6957_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2889_c7_6957_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2889_c7_6957_return_output := result_u8_value_MUX_uxn_opcodes_h_l2889_c7_6957_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2885_c7_b124] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2885_c7_b124_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2885_c7_b124_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2885_c7_b124_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2885_c7_b124_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2889_c7_6957] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_6957_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_6957_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_6957_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_6957_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_6957_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_6957_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_6957_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_6957_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2889_c7_6957] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_6957_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_6957_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_6957_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_6957_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_6957_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_6957_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_6957_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_6957_return_output;

     -- l16_MUX[uxn_opcodes_h_l2869_c2_6985] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2869_c2_6985_cond <= VAR_l16_MUX_uxn_opcodes_h_l2869_c2_6985_cond;
     l16_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue;
     l16_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2869_c2_6985_return_output := l16_MUX_uxn_opcodes_h_l2869_c2_6985_return_output;

     -- Submodule level 15
     REG_VAR_l16 := VAR_l16_MUX_uxn_opcodes_h_l2869_c2_6985_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_6957_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_6957_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2885_c7_b124_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2889_c7_6957_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2885_c7_b124] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2885_c7_b124_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2885_c7_b124_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2885_c7_b124_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2885_c7_b124_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2885_c7_b124] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2885_c7_b124_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2885_c7_b124_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2885_c7_b124_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2885_c7_b124_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2885_c7_b124] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2885_c7_b124_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2885_c7_b124_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2885_c7_b124_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2885_c7_b124_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2885_c7_b124_return_output := result_u8_value_MUX_uxn_opcodes_h_l2885_c7_b124_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2882_c7_f9c8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output;

     -- Submodule level 16
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2885_c7_b124_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2885_c7_b124_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2885_c7_b124_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2877_c7_b390] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2877_c7_b390_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2877_c7_b390_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2877_c7_b390_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2877_c7_b390_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2882_c7_f9c8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2882_c7_f9c8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2882_c7_f9c8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2882_c7_f9c8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2882_c7_f9c8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2882_c7_f9c8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output := result_u8_value_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output;

     -- Submodule level 17
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2877_c7_b390_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2882_c7_f9c8_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2877_c7_b390] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2877_c7_b390_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2877_c7_b390_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2877_c7_b390_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2877_c7_b390_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2877_c7_b390] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2877_c7_b390_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2877_c7_b390_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2877_c7_b390_return_output := result_u8_value_MUX_uxn_opcodes_h_l2877_c7_b390_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2877_c7_b390] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2877_c7_b390_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2877_c7_b390_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2877_c7_b390_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2877_c7_b390_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2877_c7_b390_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2877_c7_b390_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2874_c7_4f7d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output;

     -- Submodule level 18
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2877_c7_b390_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2877_c7_b390_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2877_c7_b390_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2869_c2_6985] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2869_c2_6985_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2869_c2_6985_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2869_c2_6985_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2869_c2_6985_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2874_c7_4f7d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2874_c7_4f7d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2874_c7_4f7d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2874_c7_4f7d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2874_c7_4f7d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2874_c7_4f7d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output;

     -- Submodule level 19
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2874_c7_4f7d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2869_c2_6985] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2869_c2_6985_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2869_c2_6985_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2869_c2_6985_return_output := result_u8_value_MUX_uxn_opcodes_h_l2869_c2_6985_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2869_c2_6985] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2869_c2_6985_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2869_c2_6985_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2869_c2_6985_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2869_c2_6985_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2869_c2_6985] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2869_c2_6985_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2869_c2_6985_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2869_c2_6985_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2869_c2_6985_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2869_c2_6985_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2869_c2_6985_return_output;

     -- Submodule level 20
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l2949_l2865_DUPLICATE_dd7f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l2949_l2865_DUPLICATE_dd7f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3345(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2869_c2_6985_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2869_c2_6985_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2869_c2_6985_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2869_c2_6985_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2869_c2_6985_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2869_c2_6985_return_output);

     -- Submodule level 21
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l2949_l2865_DUPLICATE_dd7f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l2949_l2865_DUPLICATE_dd7f_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_l16 <= REG_VAR_l16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     l16 <= REG_COMB_l16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
