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
-- Submodules: 78
entity sta_0CLK_89f6ba96 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sta_0CLK_89f6ba96;
architecture arch of sta_0CLK_89f6ba96 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2442_c6_ebb2]
signal BIN_OP_EQ_uxn_opcodes_h_l2442_c6_ebb2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2442_c6_ebb2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2442_c6_ebb2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2442_c1_e861]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_e861_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_e861_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_e861_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_e861_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2442_c2_df5d]
signal t16_MUX_uxn_opcodes_h_l2442_c2_df5d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2442_c2_df5d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_df5d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2442_c2_df5d]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2442_c2_df5d_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2442_c2_df5d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_df5d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2442_c2_df5d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_df5d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2442_c2_df5d]
signal result_u16_value_MUX_uxn_opcodes_h_l2442_c2_df5d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2442_c2_df5d]
signal result_u8_value_MUX_uxn_opcodes_h_l2442_c2_df5d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2442_c2_df5d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_df5d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l2442_c2_df5d]
signal n8_MUX_uxn_opcodes_h_l2442_c2_df5d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l2443_c3_4706[uxn_opcodes_h_l2443_c3_4706]
signal printf_uxn_opcodes_h_l2443_c3_4706_uxn_opcodes_h_l2443_c3_4706_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2447_c11_4397]
signal BIN_OP_EQ_uxn_opcodes_h_l2447_c11_4397_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2447_c11_4397_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2447_c11_4397_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2447_c7_2304]
signal t16_MUX_uxn_opcodes_h_l2447_c7_2304_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2447_c7_2304_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2447_c7_2304]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_2304_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_2304_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2447_c7_2304]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2447_c7_2304_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2447_c7_2304_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2447_c7_2304]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_2304_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_2304_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2447_c7_2304]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_2304_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_2304_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2447_c7_2304]
signal result_u16_value_MUX_uxn_opcodes_h_l2447_c7_2304_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2447_c7_2304_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2447_c7_2304]
signal result_u8_value_MUX_uxn_opcodes_h_l2447_c7_2304_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2447_c7_2304_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2447_c7_2304]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_2304_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_2304_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l2447_c7_2304]
signal n8_MUX_uxn_opcodes_h_l2447_c7_2304_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2447_c7_2304_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2450_c11_985e]
signal BIN_OP_EQ_uxn_opcodes_h_l2450_c11_985e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2450_c11_985e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2450_c11_985e_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2450_c7_e411]
signal t16_MUX_uxn_opcodes_h_l2450_c7_e411_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2450_c7_e411_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2450_c7_e411]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_e411_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_e411_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2450_c7_e411]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_e411_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_e411_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2450_c7_e411]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_e411_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_e411_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2450_c7_e411]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_e411_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_e411_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2450_c7_e411]
signal result_u16_value_MUX_uxn_opcodes_h_l2450_c7_e411_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2450_c7_e411_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2450_c7_e411]
signal result_u8_value_MUX_uxn_opcodes_h_l2450_c7_e411_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2450_c7_e411_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2450_c7_e411]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_e411_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_e411_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l2450_c7_e411]
signal n8_MUX_uxn_opcodes_h_l2450_c7_e411_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2450_c7_e411_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2452_c3_068b]
signal CONST_SL_8_uxn_opcodes_h_l2452_c3_068b_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2452_c3_068b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2455_c11_48aa]
signal BIN_OP_EQ_uxn_opcodes_h_l2455_c11_48aa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2455_c11_48aa_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2455_c11_48aa_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2455_c7_dd9b]
signal t16_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2455_c7_dd9b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2455_c7_dd9b]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2455_c7_dd9b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2455_c7_dd9b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2455_c7_dd9b]
signal result_u16_value_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2455_c7_dd9b]
signal result_u8_value_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2455_c7_dd9b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l2455_c7_dd9b]
signal n8_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2458_c11_f4b7]
signal BIN_OP_EQ_uxn_opcodes_h_l2458_c11_f4b7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2458_c11_f4b7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2458_c11_f4b7_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2458_c7_83d2]
signal t16_MUX_uxn_opcodes_h_l2458_c7_83d2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2458_c7_83d2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_83d2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2458_c7_83d2]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2458_c7_83d2_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2458_c7_83d2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_83d2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2458_c7_83d2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_83d2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2458_c7_83d2]
signal result_u16_value_MUX_uxn_opcodes_h_l2458_c7_83d2_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2458_c7_83d2]
signal result_u8_value_MUX_uxn_opcodes_h_l2458_c7_83d2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2458_c7_83d2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_83d2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l2458_c7_83d2]
signal n8_MUX_uxn_opcodes_h_l2458_c7_83d2_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2459_c3_95c8]
signal BIN_OP_OR_uxn_opcodes_h_l2459_c3_95c8_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2459_c3_95c8_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2459_c3_95c8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2462_c11_c74d]
signal BIN_OP_EQ_uxn_opcodes_h_l2462_c11_c74d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2462_c11_c74d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2462_c11_c74d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2462_c7_34b7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_34b7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_34b7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_34b7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2462_c7_34b7]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2462_c7_34b7_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2462_c7_34b7_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2462_c7_34b7_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2462_c7_34b7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_34b7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_34b7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_34b7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2462_c7_34b7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_34b7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_34b7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_34b7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2462_c7_34b7]
signal result_u16_value_MUX_uxn_opcodes_h_l2462_c7_34b7_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2462_c7_34b7_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2462_c7_34b7_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2462_c7_34b7]
signal result_u8_value_MUX_uxn_opcodes_h_l2462_c7_34b7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2462_c7_34b7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2462_c7_34b7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2462_c7_34b7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_34b7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_34b7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_34b7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l2462_c7_34b7]
signal n8_MUX_uxn_opcodes_h_l2462_c7_34b7_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2462_c7_34b7_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2462_c7_34b7_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2465_c11_e0ff]
signal BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e0ff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e0ff_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e0ff_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2465_c7_c7ff]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2465_c7_c7ff_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2465_c7_c7ff_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2465_c7_c7ff_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2465_c7_c7ff_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2465_c7_c7ff]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2465_c7_c7ff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_c7ff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_c7ff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_c7ff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_c7ff_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2465_c7_c7ff]
signal result_u16_value_MUX_uxn_opcodes_h_l2465_c7_c7ff_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2465_c7_c7ff_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2465_c7_c7ff_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2465_c7_c7ff_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2465_c7_c7ff]
signal result_u8_value_MUX_uxn_opcodes_h_l2465_c7_c7ff_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2465_c7_c7ff_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2465_c7_c7ff_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2465_c7_c7ff_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2465_c7_c7ff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l2465_c7_c7ff]
signal n8_MUX_uxn_opcodes_h_l2465_c7_c7ff_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2465_c7_c7ff_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2465_c7_c7ff_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2465_c7_c7ff_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2468_c30_a7a1]
signal sp_relative_shift_uxn_opcodes_h_l2468_c30_a7a1_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2468_c30_a7a1_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2468_c30_a7a1_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2468_c30_a7a1_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2473_c11_075b]
signal BIN_OP_EQ_uxn_opcodes_h_l2473_c11_075b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2473_c11_075b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2473_c11_075b_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2473_c7_6b55]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2473_c7_6b55_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2473_c7_6b55_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2473_c7_6b55_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2473_c7_6b55_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2473_c7_6b55]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2473_c7_6b55_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2473_c7_6b55_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2473_c7_6b55_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2473_c7_6b55_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2473_c7_6b55]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2473_c7_6b55_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2473_c7_6b55_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2473_c7_6b55_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2473_c7_6b55_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_5abb( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.u16_value := ref_toks_5;
      base.u8_value := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2442_c6_ebb2
BIN_OP_EQ_uxn_opcodes_h_l2442_c6_ebb2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2442_c6_ebb2_left,
BIN_OP_EQ_uxn_opcodes_h_l2442_c6_ebb2_right,
BIN_OP_EQ_uxn_opcodes_h_l2442_c6_ebb2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_e861
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_e861 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_e861_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_e861_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_e861_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_e861_return_output);

-- t16_MUX_uxn_opcodes_h_l2442_c2_df5d
t16_MUX_uxn_opcodes_h_l2442_c2_df5d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2442_c2_df5d_cond,
t16_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue,
t16_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse,
t16_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_df5d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_df5d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_df5d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2442_c2_df5d
result_is_ram_write_MUX_uxn_opcodes_h_l2442_c2_df5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2442_c2_df5d_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_df5d
result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_df5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_df5d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_df5d
result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_df5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_df5d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2442_c2_df5d
result_u16_value_MUX_uxn_opcodes_h_l2442_c2_df5d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2442_c2_df5d_cond,
result_u16_value_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2442_c2_df5d
result_u8_value_MUX_uxn_opcodes_h_l2442_c2_df5d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2442_c2_df5d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_df5d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_df5d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_df5d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output);

-- n8_MUX_uxn_opcodes_h_l2442_c2_df5d
n8_MUX_uxn_opcodes_h_l2442_c2_df5d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2442_c2_df5d_cond,
n8_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue,
n8_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse,
n8_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output);

-- printf_uxn_opcodes_h_l2443_c3_4706_uxn_opcodes_h_l2443_c3_4706
printf_uxn_opcodes_h_l2443_c3_4706_uxn_opcodes_h_l2443_c3_4706 : entity work.printf_uxn_opcodes_h_l2443_c3_4706_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2443_c3_4706_uxn_opcodes_h_l2443_c3_4706_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2447_c11_4397
BIN_OP_EQ_uxn_opcodes_h_l2447_c11_4397 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2447_c11_4397_left,
BIN_OP_EQ_uxn_opcodes_h_l2447_c11_4397_right,
BIN_OP_EQ_uxn_opcodes_h_l2447_c11_4397_return_output);

-- t16_MUX_uxn_opcodes_h_l2447_c7_2304
t16_MUX_uxn_opcodes_h_l2447_c7_2304 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2447_c7_2304_cond,
t16_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue,
t16_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse,
t16_MUX_uxn_opcodes_h_l2447_c7_2304_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_2304
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_2304 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_2304_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_2304_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2447_c7_2304
result_is_ram_write_MUX_uxn_opcodes_h_l2447_c7_2304 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2447_c7_2304_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2447_c7_2304_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_2304
result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_2304 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_2304_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_2304_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_2304
result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_2304 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_2304_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_2304_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2447_c7_2304
result_u16_value_MUX_uxn_opcodes_h_l2447_c7_2304 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2447_c7_2304_cond,
result_u16_value_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2447_c7_2304_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2447_c7_2304
result_u8_value_MUX_uxn_opcodes_h_l2447_c7_2304 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2447_c7_2304_cond,
result_u8_value_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2447_c7_2304_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_2304
result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_2304 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_2304_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_2304_return_output);

-- n8_MUX_uxn_opcodes_h_l2447_c7_2304
n8_MUX_uxn_opcodes_h_l2447_c7_2304 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2447_c7_2304_cond,
n8_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue,
n8_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse,
n8_MUX_uxn_opcodes_h_l2447_c7_2304_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2450_c11_985e
BIN_OP_EQ_uxn_opcodes_h_l2450_c11_985e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2450_c11_985e_left,
BIN_OP_EQ_uxn_opcodes_h_l2450_c11_985e_right,
BIN_OP_EQ_uxn_opcodes_h_l2450_c11_985e_return_output);

-- t16_MUX_uxn_opcodes_h_l2450_c7_e411
t16_MUX_uxn_opcodes_h_l2450_c7_e411 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2450_c7_e411_cond,
t16_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue,
t16_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse,
t16_MUX_uxn_opcodes_h_l2450_c7_e411_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_e411
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_e411 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_e411_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_e411_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_e411
result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_e411 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_e411_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_e411_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_e411
result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_e411 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_e411_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_e411_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_e411
result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_e411 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_e411_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_e411_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2450_c7_e411
result_u16_value_MUX_uxn_opcodes_h_l2450_c7_e411 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2450_c7_e411_cond,
result_u16_value_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2450_c7_e411_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2450_c7_e411
result_u8_value_MUX_uxn_opcodes_h_l2450_c7_e411 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2450_c7_e411_cond,
result_u8_value_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2450_c7_e411_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_e411
result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_e411 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_e411_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_e411_return_output);

-- n8_MUX_uxn_opcodes_h_l2450_c7_e411
n8_MUX_uxn_opcodes_h_l2450_c7_e411 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2450_c7_e411_cond,
n8_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue,
n8_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse,
n8_MUX_uxn_opcodes_h_l2450_c7_e411_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2452_c3_068b
CONST_SL_8_uxn_opcodes_h_l2452_c3_068b : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2452_c3_068b_x,
CONST_SL_8_uxn_opcodes_h_l2452_c3_068b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2455_c11_48aa
BIN_OP_EQ_uxn_opcodes_h_l2455_c11_48aa : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2455_c11_48aa_left,
BIN_OP_EQ_uxn_opcodes_h_l2455_c11_48aa_right,
BIN_OP_EQ_uxn_opcodes_h_l2455_c11_48aa_return_output);

-- t16_MUX_uxn_opcodes_h_l2455_c7_dd9b
t16_MUX_uxn_opcodes_h_l2455_c7_dd9b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond,
t16_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue,
t16_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse,
t16_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_dd9b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_dd9b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2455_c7_dd9b
result_is_ram_write_MUX_uxn_opcodes_h_l2455_c7_dd9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b
result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_dd9b
result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_dd9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2455_c7_dd9b
result_u16_value_MUX_uxn_opcodes_h_l2455_c7_dd9b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond,
result_u16_value_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2455_c7_dd9b
result_u8_value_MUX_uxn_opcodes_h_l2455_c7_dd9b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output);

-- n8_MUX_uxn_opcodes_h_l2455_c7_dd9b
n8_MUX_uxn_opcodes_h_l2455_c7_dd9b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond,
n8_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue,
n8_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse,
n8_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2458_c11_f4b7
BIN_OP_EQ_uxn_opcodes_h_l2458_c11_f4b7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2458_c11_f4b7_left,
BIN_OP_EQ_uxn_opcodes_h_l2458_c11_f4b7_right,
BIN_OP_EQ_uxn_opcodes_h_l2458_c11_f4b7_return_output);

-- t16_MUX_uxn_opcodes_h_l2458_c7_83d2
t16_MUX_uxn_opcodes_h_l2458_c7_83d2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2458_c7_83d2_cond,
t16_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue,
t16_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse,
t16_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_83d2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_83d2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_83d2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2458_c7_83d2
result_is_ram_write_MUX_uxn_opcodes_h_l2458_c7_83d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2458_c7_83d2_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_83d2
result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_83d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_83d2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_83d2
result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_83d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_83d2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2458_c7_83d2
result_u16_value_MUX_uxn_opcodes_h_l2458_c7_83d2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2458_c7_83d2_cond,
result_u16_value_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2458_c7_83d2
result_u8_value_MUX_uxn_opcodes_h_l2458_c7_83d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2458_c7_83d2_cond,
result_u8_value_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_83d2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_83d2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_83d2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output);

-- n8_MUX_uxn_opcodes_h_l2458_c7_83d2
n8_MUX_uxn_opcodes_h_l2458_c7_83d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2458_c7_83d2_cond,
n8_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue,
n8_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse,
n8_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2459_c3_95c8
BIN_OP_OR_uxn_opcodes_h_l2459_c3_95c8 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2459_c3_95c8_left,
BIN_OP_OR_uxn_opcodes_h_l2459_c3_95c8_right,
BIN_OP_OR_uxn_opcodes_h_l2459_c3_95c8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2462_c11_c74d
BIN_OP_EQ_uxn_opcodes_h_l2462_c11_c74d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2462_c11_c74d_left,
BIN_OP_EQ_uxn_opcodes_h_l2462_c11_c74d_right,
BIN_OP_EQ_uxn_opcodes_h_l2462_c11_c74d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_34b7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_34b7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_34b7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_34b7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_34b7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2462_c7_34b7
result_is_ram_write_MUX_uxn_opcodes_h_l2462_c7_34b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2462_c7_34b7_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2462_c7_34b7_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2462_c7_34b7_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_34b7
result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_34b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_34b7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_34b7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_34b7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_34b7
result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_34b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_34b7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_34b7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_34b7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2462_c7_34b7
result_u16_value_MUX_uxn_opcodes_h_l2462_c7_34b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2462_c7_34b7_cond,
result_u16_value_MUX_uxn_opcodes_h_l2462_c7_34b7_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2462_c7_34b7_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2462_c7_34b7
result_u8_value_MUX_uxn_opcodes_h_l2462_c7_34b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2462_c7_34b7_cond,
result_u8_value_MUX_uxn_opcodes_h_l2462_c7_34b7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2462_c7_34b7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_34b7
result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_34b7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_34b7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_34b7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_34b7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output);

-- n8_MUX_uxn_opcodes_h_l2462_c7_34b7
n8_MUX_uxn_opcodes_h_l2462_c7_34b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2462_c7_34b7_cond,
n8_MUX_uxn_opcodes_h_l2462_c7_34b7_iftrue,
n8_MUX_uxn_opcodes_h_l2462_c7_34b7_iffalse,
n8_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e0ff
BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e0ff : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e0ff_left,
BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e0ff_right,
BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e0ff_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2465_c7_c7ff
result_is_ram_write_MUX_uxn_opcodes_h_l2465_c7_c7ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2465_c7_c7ff_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2465_c7_c7ff_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2465_c7_c7ff_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2465_c7_c7ff_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff
result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_c7ff
result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_c7ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_c7ff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_c7ff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_c7ff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_c7ff_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2465_c7_c7ff
result_u16_value_MUX_uxn_opcodes_h_l2465_c7_c7ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2465_c7_c7ff_cond,
result_u16_value_MUX_uxn_opcodes_h_l2465_c7_c7ff_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2465_c7_c7ff_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2465_c7_c7ff_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2465_c7_c7ff
result_u8_value_MUX_uxn_opcodes_h_l2465_c7_c7ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2465_c7_c7ff_cond,
result_u8_value_MUX_uxn_opcodes_h_l2465_c7_c7ff_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2465_c7_c7ff_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2465_c7_c7ff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff
result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff_return_output);

-- n8_MUX_uxn_opcodes_h_l2465_c7_c7ff
n8_MUX_uxn_opcodes_h_l2465_c7_c7ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2465_c7_c7ff_cond,
n8_MUX_uxn_opcodes_h_l2465_c7_c7ff_iftrue,
n8_MUX_uxn_opcodes_h_l2465_c7_c7ff_iffalse,
n8_MUX_uxn_opcodes_h_l2465_c7_c7ff_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2468_c30_a7a1
sp_relative_shift_uxn_opcodes_h_l2468_c30_a7a1 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2468_c30_a7a1_ins,
sp_relative_shift_uxn_opcodes_h_l2468_c30_a7a1_x,
sp_relative_shift_uxn_opcodes_h_l2468_c30_a7a1_y,
sp_relative_shift_uxn_opcodes_h_l2468_c30_a7a1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2473_c11_075b
BIN_OP_EQ_uxn_opcodes_h_l2473_c11_075b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2473_c11_075b_left,
BIN_OP_EQ_uxn_opcodes_h_l2473_c11_075b_right,
BIN_OP_EQ_uxn_opcodes_h_l2473_c11_075b_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2473_c7_6b55
result_is_ram_write_MUX_uxn_opcodes_h_l2473_c7_6b55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2473_c7_6b55_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2473_c7_6b55_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2473_c7_6b55_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2473_c7_6b55_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2473_c7_6b55
result_is_sp_shift_MUX_uxn_opcodes_h_l2473_c7_6b55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2473_c7_6b55_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2473_c7_6b55_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2473_c7_6b55_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2473_c7_6b55_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2473_c7_6b55
result_is_opc_done_MUX_uxn_opcodes_h_l2473_c7_6b55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2473_c7_6b55_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2473_c7_6b55_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2473_c7_6b55_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2473_c7_6b55_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2442_c6_ebb2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_e861_return_output,
 t16_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output,
 n8_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2447_c11_4397_return_output,
 t16_MUX_uxn_opcodes_h_l2447_c7_2304_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_2304_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2447_c7_2304_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_2304_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_2304_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2447_c7_2304_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2447_c7_2304_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_2304_return_output,
 n8_MUX_uxn_opcodes_h_l2447_c7_2304_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2450_c11_985e_return_output,
 t16_MUX_uxn_opcodes_h_l2450_c7_e411_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_e411_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_e411_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_e411_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_e411_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2450_c7_e411_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2450_c7_e411_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_e411_return_output,
 n8_MUX_uxn_opcodes_h_l2450_c7_e411_return_output,
 CONST_SL_8_uxn_opcodes_h_l2452_c3_068b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2455_c11_48aa_return_output,
 t16_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output,
 n8_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2458_c11_f4b7_return_output,
 t16_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output,
 n8_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2459_c3_95c8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2462_c11_c74d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output,
 n8_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e0ff_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2465_c7_c7ff_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_c7ff_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2465_c7_c7ff_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2465_c7_c7ff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff_return_output,
 n8_MUX_uxn_opcodes_h_l2465_c7_c7ff_return_output,
 sp_relative_shift_uxn_opcodes_h_l2468_c30_a7a1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2473_c11_075b_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2473_c7_6b55_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2473_c7_6b55_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2473_c7_6b55_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c6_ebb2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c6_ebb2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c6_ebb2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_e861_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_e861_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_e861_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_e861_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2447_c7_2304_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2442_c2_df5d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2444_c3_cd47 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_2304_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_df5d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2447_c7_2304_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2442_c2_df5d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_2304_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_df5d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_2304_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_df5d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2447_c7_2304_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2442_c2_df5d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2447_c7_2304_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2442_c2_df5d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_2304_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_df5d_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2447_c7_2304_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2442_c2_df5d_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2443_c3_4706_uxn_opcodes_h_l2443_c3_4706_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2447_c11_4397_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2447_c11_4397_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2447_c11_4397_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2450_c7_e411_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2447_c7_2304_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2448_c3_8a1c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_e411_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_2304_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_e411_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2447_c7_2304_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_e411_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_2304_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_e411_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_2304_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2450_c7_e411_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2447_c7_2304_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c7_e411_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2447_c7_2304_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_e411_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_2304_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2450_c7_e411_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2447_c7_2304_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_985e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_985e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_985e_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2450_c7_e411_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2453_c3_958f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_e411_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_e411_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_e411_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_e411_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2450_c7_e411_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c7_e411_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_e411_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2450_c7_e411_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2452_c3_068b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2452_c3_068b_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_48aa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_48aa_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_48aa_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2456_c3_f377 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_f4b7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_f4b7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_f4b7_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2458_c7_83d2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2460_c3_1592 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_83d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2458_c7_83d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_83d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_83d2_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2458_c7_83d2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2458_c7_83d2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_83d2_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2458_c7_83d2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2459_c3_95c8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2459_c3_95c8_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2459_c3_95c8_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2462_c11_c74d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2462_c11_c74d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2462_c11_c74d_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_34b7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2463_c3_b07e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_34b7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2462_c7_34b7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_34b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2462_c7_34b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2462_c7_34b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2465_c7_c7ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2462_c7_34b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_34b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_34b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_34b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_34b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_34b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_c7ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_34b7_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2462_c7_34b7_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2462_c7_34b7_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2465_c7_c7ff_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2462_c7_34b7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2462_c7_34b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2462_c7_34b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2465_c7_c7ff_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2462_c7_34b7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_34b7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_34b7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_34b7_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2462_c7_34b7_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2462_c7_34b7_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2465_c7_c7ff_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2462_c7_34b7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e0ff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e0ff_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e0ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2465_c7_c7ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2465_c7_c7ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2473_c7_6b55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2465_c7_c7ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2473_c7_6b55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_c7ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_c7ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2473_c7_6b55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_c7ff_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2465_c7_c7ff_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2465_c7_c7ff_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2465_c7_c7ff_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2465_c7_c7ff_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2465_c7_c7ff_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2465_c7_c7ff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2465_c7_c7ff_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2465_c7_c7ff_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2465_c7_c7ff_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2468_c30_a7a1_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2468_c30_a7a1_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2468_c30_a7a1_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2468_c30_a7a1_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2473_c11_075b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2473_c11_075b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2473_c11_075b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2473_c7_6b55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2473_c7_6b55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2473_c7_6b55_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2473_c7_6b55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2473_c7_6b55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2473_c7_6b55_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2473_c7_6b55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2473_c7_6b55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2473_c7_6b55_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2473_l2442_l2462_l2458_DUPLICATE_3488_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2473_l2442_l2462_l2458_DUPLICATE_d228_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2442_l2465_l2462_l2458_DUPLICATE_96c1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2442_l2465_l2462_l2458_DUPLICATE_b746_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2442_l2465_l2462_l2458_DUPLICATE_c234_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2473_l2465_l2462_l2458_DUPLICATE_7293_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2451_l2459_DUPLICATE_555d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5abb_uxn_opcodes_h_l2437_l2479_DUPLICATE_4b18_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_48aa_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l2468_c30_a7a1_y := resize(to_signed(-3, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2453_c3_958f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2453_c3_958f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2462_c11_c74d_right := to_unsigned(5, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2465_c7_c7ff_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2473_c7_6b55_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c6_ebb2_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2456_c3_f377 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2456_c3_f377;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_985e_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e0ff_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2473_c7_6b55_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2448_c3_8a1c := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2448_c3_8a1c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2473_c11_075b_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2460_c3_1592 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2460_c3_1592;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2444_c3_cd47 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2444_c3_cd47;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_f4b7_right := to_unsigned(4, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_e861_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2447_c11_4397_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2463_c3_b07e := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_34b7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2463_c3_b07e;
     VAR_sp_relative_shift_uxn_opcodes_h_l2468_c30_a7a1_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2473_c7_6b55_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_e861_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2468_c30_a7a1_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2462_c7_34b7_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2465_c7_c7ff_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c6_ebb2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2447_c11_4397_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_985e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_48aa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_f4b7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2462_c11_c74d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e0ff_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2473_c11_075b_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2465_c7_c7ff_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2465_c7_c7ff_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2459_c3_95c8_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2465_c7_c7ff_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2462_c11_c74d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2462_c11_c74d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2462_c11_c74d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2462_c11_c74d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2462_c11_c74d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2462_c11_c74d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2462_c11_c74d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2473_l2465_l2462_l2458_DUPLICATE_7293 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2473_l2465_l2462_l2458_DUPLICATE_7293_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2442_l2465_l2462_l2458_DUPLICATE_b746 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2442_l2465_l2462_l2458_DUPLICATE_b746_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2455_c11_48aa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2455_c11_48aa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_48aa_left;
     BIN_OP_EQ_uxn_opcodes_h_l2455_c11_48aa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_48aa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_48aa_return_output := BIN_OP_EQ_uxn_opcodes_h_l2455_c11_48aa_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2473_l2442_l2462_l2458_DUPLICATE_3488 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2473_l2442_l2462_l2458_DUPLICATE_3488_return_output := result.is_ram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2442_l2465_l2462_l2458_DUPLICATE_c234 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2442_l2465_l2462_l2458_DUPLICATE_c234_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2473_c11_075b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2473_c11_075b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2473_c11_075b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2473_c11_075b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2473_c11_075b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2473_c11_075b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2473_c11_075b_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2468_c30_a7a1] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2468_c30_a7a1_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2468_c30_a7a1_ins;
     sp_relative_shift_uxn_opcodes_h_l2468_c30_a7a1_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2468_c30_a7a1_x;
     sp_relative_shift_uxn_opcodes_h_l2468_c30_a7a1_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2468_c30_a7a1_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2468_c30_a7a1_return_output := sp_relative_shift_uxn_opcodes_h_l2468_c30_a7a1_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2451_l2459_DUPLICATE_555d LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2451_l2459_DUPLICATE_555d_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2447_c11_4397] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2447_c11_4397_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2447_c11_4397_left;
     BIN_OP_EQ_uxn_opcodes_h_l2447_c11_4397_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2447_c11_4397_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2447_c11_4397_return_output := BIN_OP_EQ_uxn_opcodes_h_l2447_c11_4397_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2442_l2465_l2462_l2458_DUPLICATE_96c1 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2442_l2465_l2462_l2458_DUPLICATE_96c1_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2458_c11_f4b7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2458_c11_f4b7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_f4b7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2458_c11_f4b7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_f4b7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_f4b7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2458_c11_f4b7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2465_c11_e0ff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e0ff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e0ff_left;
     BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e0ff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e0ff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e0ff_return_output := BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e0ff_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2462_c7_34b7] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2462_c7_34b7_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2473_l2442_l2462_l2458_DUPLICATE_d228 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2473_l2442_l2462_l2458_DUPLICATE_d228_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2442_c6_ebb2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2442_c6_ebb2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c6_ebb2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2442_c6_ebb2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c6_ebb2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c6_ebb2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2442_c6_ebb2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2450_c11_985e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2450_c11_985e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_985e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2450_c11_985e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_985e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_985e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2450_c11_985e_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_e861_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c6_ebb2_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2442_c2_df5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c6_ebb2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_df5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c6_ebb2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2442_c2_df5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c6_ebb2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_df5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c6_ebb2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_df5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c6_ebb2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_df5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c6_ebb2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2442_c2_df5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c6_ebb2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2442_c2_df5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c6_ebb2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2442_c2_df5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c6_ebb2_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2447_c7_2304_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2447_c11_4397_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_2304_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2447_c11_4397_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2447_c7_2304_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2447_c11_4397_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_2304_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2447_c11_4397_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_2304_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2447_c11_4397_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_2304_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2447_c11_4397_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2447_c7_2304_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2447_c11_4397_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2447_c7_2304_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2447_c11_4397_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2447_c7_2304_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2447_c11_4397_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2450_c7_e411_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_985e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_e411_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_985e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_e411_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_985e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_e411_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_985e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_e411_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_985e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_e411_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_985e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2450_c7_e411_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_985e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c7_e411_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_985e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2450_c7_e411_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_985e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_48aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_48aa_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_48aa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_48aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_48aa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_48aa_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_48aa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_48aa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_48aa_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2458_c7_83d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_f4b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_83d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_f4b7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2458_c7_83d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_f4b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_83d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_f4b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_83d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_f4b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_83d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_f4b7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2458_c7_83d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_f4b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2458_c7_83d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_f4b7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2458_c7_83d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_f4b7_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2462_c7_34b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2462_c11_c74d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_34b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2462_c11_c74d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2462_c7_34b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2462_c11_c74d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_34b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2462_c11_c74d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_34b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2462_c11_c74d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_34b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2462_c11_c74d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2462_c7_34b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2462_c11_c74d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2462_c7_34b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2462_c11_c74d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2465_c7_c7ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e0ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_c7ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e0ff_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2465_c7_c7ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e0ff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e0ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e0ff_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2465_c7_c7ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e0ff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2465_c7_c7ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e0ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2473_c7_6b55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2473_c11_075b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2473_c7_6b55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2473_c11_075b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2473_c7_6b55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2473_c11_075b_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2459_c3_95c8_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2451_l2459_DUPLICATE_555d_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2452_c3_068b_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2451_l2459_DUPLICATE_555d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2442_l2465_l2462_l2458_DUPLICATE_c234_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2442_l2465_l2462_l2458_DUPLICATE_c234_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2442_l2465_l2462_l2458_DUPLICATE_c234_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2442_l2465_l2462_l2458_DUPLICATE_c234_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2442_l2465_l2462_l2458_DUPLICATE_c234_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_34b7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2442_l2465_l2462_l2458_DUPLICATE_c234_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2442_l2465_l2462_l2458_DUPLICATE_c234_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2442_l2465_l2462_l2458_DUPLICATE_96c1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2442_l2465_l2462_l2458_DUPLICATE_96c1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2442_l2465_l2462_l2458_DUPLICATE_96c1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2442_l2465_l2462_l2458_DUPLICATE_96c1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2442_l2465_l2462_l2458_DUPLICATE_96c1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2462_c7_34b7_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2442_l2465_l2462_l2458_DUPLICATE_96c1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2465_c7_c7ff_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2442_l2465_l2462_l2458_DUPLICATE_96c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2473_l2465_l2462_l2458_DUPLICATE_7293_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2473_l2465_l2462_l2458_DUPLICATE_7293_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2473_l2465_l2462_l2458_DUPLICATE_7293_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2473_l2465_l2462_l2458_DUPLICATE_7293_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_34b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2473_l2465_l2462_l2458_DUPLICATE_7293_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_c7ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2473_l2465_l2462_l2458_DUPLICATE_7293_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2473_c7_6b55_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2473_l2465_l2462_l2458_DUPLICATE_7293_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2473_l2442_l2462_l2458_DUPLICATE_3488_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2473_l2442_l2462_l2458_DUPLICATE_3488_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2473_l2442_l2462_l2458_DUPLICATE_3488_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2473_l2442_l2462_l2458_DUPLICATE_3488_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2473_l2442_l2462_l2458_DUPLICATE_3488_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2462_c7_34b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2473_l2442_l2462_l2458_DUPLICATE_3488_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2473_c7_6b55_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2473_l2442_l2462_l2458_DUPLICATE_3488_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2473_l2442_l2462_l2458_DUPLICATE_d228_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2473_l2442_l2462_l2458_DUPLICATE_d228_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2473_l2442_l2462_l2458_DUPLICATE_d228_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2473_l2442_l2462_l2458_DUPLICATE_d228_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2473_l2442_l2462_l2458_DUPLICATE_d228_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_34b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2473_l2442_l2462_l2458_DUPLICATE_d228_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2473_c7_6b55_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2473_l2442_l2462_l2458_DUPLICATE_d228_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2442_l2465_l2462_l2458_DUPLICATE_b746_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2442_l2465_l2462_l2458_DUPLICATE_b746_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2442_l2465_l2462_l2458_DUPLICATE_b746_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2442_l2465_l2462_l2458_DUPLICATE_b746_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2442_l2465_l2462_l2458_DUPLICATE_b746_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2462_c7_34b7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2442_l2465_l2462_l2458_DUPLICATE_b746_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2465_c7_c7ff_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2455_l2450_l2447_l2442_l2465_l2462_l2458_DUPLICATE_b746_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_34b7_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2462_c7_34b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2468_c30_a7a1_return_output;
     -- CONST_SL_8[uxn_opcodes_h_l2452_c3_068b] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2452_c3_068b_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2452_c3_068b_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2452_c3_068b_return_output := CONST_SL_8_uxn_opcodes_h_l2452_c3_068b_return_output;

     -- n8_MUX[uxn_opcodes_h_l2465_c7_c7ff] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2465_c7_c7ff_cond <= VAR_n8_MUX_uxn_opcodes_h_l2465_c7_c7ff_cond;
     n8_MUX_uxn_opcodes_h_l2465_c7_c7ff_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2465_c7_c7ff_iftrue;
     n8_MUX_uxn_opcodes_h_l2465_c7_c7ff_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2465_c7_c7ff_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2465_c7_c7ff_return_output := n8_MUX_uxn_opcodes_h_l2465_c7_c7ff_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2459_c3_95c8] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2459_c3_95c8_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2459_c3_95c8_left;
     BIN_OP_OR_uxn_opcodes_h_l2459_c3_95c8_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2459_c3_95c8_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2459_c3_95c8_return_output := BIN_OP_OR_uxn_opcodes_h_l2459_c3_95c8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2465_c7_c7ff] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2465_c7_c7ff_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2465_c7_c7ff_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2465_c7_c7ff_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2465_c7_c7ff_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2465_c7_c7ff_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2465_c7_c7ff_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2465_c7_c7ff_return_output := result_u8_value_MUX_uxn_opcodes_h_l2465_c7_c7ff_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2465_c7_c7ff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2465_c7_c7ff] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2465_c7_c7ff_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2465_c7_c7ff_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2465_c7_c7ff_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2465_c7_c7ff_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2465_c7_c7ff_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2465_c7_c7ff_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2465_c7_c7ff_return_output := result_u16_value_MUX_uxn_opcodes_h_l2465_c7_c7ff_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2442_c1_e861] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_e861_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_e861_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_e861_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_e861_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_e861_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_e861_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_e861_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_e861_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2473_c7_6b55] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2473_c7_6b55_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2473_c7_6b55_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2473_c7_6b55_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2473_c7_6b55_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2473_c7_6b55_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2473_c7_6b55_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2473_c7_6b55_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2473_c7_6b55_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2473_c7_6b55] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2473_c7_6b55_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2473_c7_6b55_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2473_c7_6b55_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2473_c7_6b55_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2473_c7_6b55_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2473_c7_6b55_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2473_c7_6b55_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2473_c7_6b55_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2473_c7_6b55] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2473_c7_6b55_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2473_c7_6b55_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2473_c7_6b55_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2473_c7_6b55_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2473_c7_6b55_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2473_c7_6b55_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2473_c7_6b55_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2473_c7_6b55_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2462_c7_34b7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_34b7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_34b7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_34b7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_34b7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_34b7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_34b7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2459_c3_95c8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2452_c3_068b_return_output;
     VAR_printf_uxn_opcodes_h_l2443_c3_4706_uxn_opcodes_h_l2443_c3_4706_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_e861_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2462_c7_34b7_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2465_c7_c7ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_c7ff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2473_c7_6b55_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2465_c7_c7ff_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2473_c7_6b55_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2473_c7_6b55_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_34b7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2462_c7_34b7_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2465_c7_c7ff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2462_c7_34b7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2465_c7_c7ff_return_output;
     -- t16_MUX[uxn_opcodes_h_l2458_c7_83d2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2458_c7_83d2_cond <= VAR_t16_MUX_uxn_opcodes_h_l2458_c7_83d2_cond;
     t16_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue;
     t16_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output := t16_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2458_c7_83d2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_83d2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_83d2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output;

     -- printf_uxn_opcodes_h_l2443_c3_4706[uxn_opcodes_h_l2443_c3_4706] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2443_c3_4706_uxn_opcodes_h_l2443_c3_4706_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2443_c3_4706_uxn_opcodes_h_l2443_c3_4706_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2465_c7_c7ff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_c7ff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_c7ff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_c7ff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_c7ff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_c7ff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_c7ff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_c7ff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_c7ff_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2462_c7_34b7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2462_c7_34b7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2462_c7_34b7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2462_c7_34b7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2462_c7_34b7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2462_c7_34b7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2462_c7_34b7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output := result_u8_value_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2465_c7_c7ff] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2465_c7_c7ff_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2465_c7_c7ff_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2465_c7_c7ff_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2465_c7_c7ff_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2465_c7_c7ff_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2465_c7_c7ff_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2465_c7_c7ff_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2465_c7_c7ff_return_output;

     -- n8_MUX[uxn_opcodes_h_l2462_c7_34b7] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2462_c7_34b7_cond <= VAR_n8_MUX_uxn_opcodes_h_l2462_c7_34b7_cond;
     n8_MUX_uxn_opcodes_h_l2462_c7_34b7_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2462_c7_34b7_iftrue;
     n8_MUX_uxn_opcodes_h_l2462_c7_34b7_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2462_c7_34b7_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output := n8_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2462_c7_34b7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_34b7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_34b7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_34b7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_34b7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_34b7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_34b7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2462_c7_34b7] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2462_c7_34b7_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2462_c7_34b7_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2462_c7_34b7_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2462_c7_34b7_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2462_c7_34b7_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2462_c7_34b7_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output := result_u16_value_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2465_c7_c7ff] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_34b7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_c7ff_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2462_c7_34b7_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2465_c7_c7ff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_34b7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_c7ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2462_c7_34b7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_34b7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_34b7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_34b7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_34b7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_34b7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_34b7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2458_c7_83d2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2458_c7_83d2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2458_c7_83d2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output := result_u8_value_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2458_c7_83d2] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2458_c7_83d2_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2458_c7_83d2_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output := result_u16_value_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2462_c7_34b7] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2462_c7_34b7_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2462_c7_34b7_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2462_c7_34b7_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2462_c7_34b7_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2462_c7_34b7_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2462_c7_34b7_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2462_c7_34b7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_34b7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_34b7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_34b7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_34b7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_34b7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_34b7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output;

     -- n8_MUX[uxn_opcodes_h_l2458_c7_83d2] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2458_c7_83d2_cond <= VAR_n8_MUX_uxn_opcodes_h_l2458_c7_83d2_cond;
     n8_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue;
     n8_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output := n8_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output;

     -- t16_MUX[uxn_opcodes_h_l2455_c7_dd9b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond <= VAR_t16_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond;
     t16_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue;
     t16_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output := t16_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2455_c7_dd9b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2458_c7_83d2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_83d2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_83d2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_34b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2455_c7_dd9b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2450_c7_e411] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_e411_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_e411_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_e411_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_e411_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2458_c7_83d2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_83d2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_83d2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output;

     -- t16_MUX[uxn_opcodes_h_l2450_c7_e411] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2450_c7_e411_cond <= VAR_t16_MUX_uxn_opcodes_h_l2450_c7_e411_cond;
     t16_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue;
     t16_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2450_c7_e411_return_output := t16_MUX_uxn_opcodes_h_l2450_c7_e411_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2455_c7_dd9b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output := result_u16_value_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output;

     -- n8_MUX[uxn_opcodes_h_l2455_c7_dd9b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond <= VAR_n8_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond;
     n8_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue;
     n8_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output := n8_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2455_c7_dd9b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2458_c7_83d2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_83d2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_83d2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2458_c7_83d2] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2458_c7_83d2_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2458_c7_83d2_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2458_c7_83d2_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2458_c7_83d2_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_83d2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_e411_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2450_c7_e411_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2455_c7_dd9b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2455_c7_dd9b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2450_c7_e411] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2450_c7_e411_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c7_e411_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c7_e411_return_output := result_u8_value_MUX_uxn_opcodes_h_l2450_c7_e411_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2455_c7_dd9b] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2455_c7_dd9b_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2455_c7_dd9b_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2455_c7_dd9b_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2447_c7_2304] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_2304_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_2304_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_2304_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_2304_return_output;

     -- t16_MUX[uxn_opcodes_h_l2447_c7_2304] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2447_c7_2304_cond <= VAR_t16_MUX_uxn_opcodes_h_l2447_c7_2304_cond;
     t16_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue;
     t16_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2447_c7_2304_return_output := t16_MUX_uxn_opcodes_h_l2447_c7_2304_return_output;

     -- n8_MUX[uxn_opcodes_h_l2450_c7_e411] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2450_c7_e411_cond <= VAR_n8_MUX_uxn_opcodes_h_l2450_c7_e411_cond;
     n8_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue;
     n8_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2450_c7_e411_return_output := n8_MUX_uxn_opcodes_h_l2450_c7_e411_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2450_c7_e411] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_e411_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_e411_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_e411_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_e411_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2450_c7_e411] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2450_c7_e411_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2450_c7_e411_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2450_c7_e411_return_output := result_u16_value_MUX_uxn_opcodes_h_l2450_c7_e411_return_output;

     -- Submodule level 6
     VAR_n8_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2450_c7_e411_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_dd9b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_e411_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_2304_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2450_c7_e411_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c7_e411_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2447_c7_2304_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2450_c7_e411] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_e411_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_e411_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_e411_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_e411_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2447_c7_2304] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_2304_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_2304_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_2304_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_2304_return_output;

     -- n8_MUX[uxn_opcodes_h_l2447_c7_2304] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2447_c7_2304_cond <= VAR_n8_MUX_uxn_opcodes_h_l2447_c7_2304_cond;
     n8_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue;
     n8_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2447_c7_2304_return_output := n8_MUX_uxn_opcodes_h_l2447_c7_2304_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2450_c7_e411] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_e411_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_e411_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_e411_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_e411_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2442_c2_df5d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_df5d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_df5d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2450_c7_e411] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_e411_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_e411_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_e411_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_e411_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_e411_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_e411_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2447_c7_2304] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2447_c7_2304_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2447_c7_2304_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2447_c7_2304_return_output := result_u8_value_MUX_uxn_opcodes_h_l2447_c7_2304_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2447_c7_2304] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2447_c7_2304_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2447_c7_2304_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2447_c7_2304_return_output := result_u16_value_MUX_uxn_opcodes_h_l2447_c7_2304_return_output;

     -- t16_MUX[uxn_opcodes_h_l2442_c2_df5d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2442_c2_df5d_cond <= VAR_t16_MUX_uxn_opcodes_h_l2442_c2_df5d_cond;
     t16_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue;
     t16_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output := t16_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output;

     -- Submodule level 7
     VAR_n8_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2447_c7_2304_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_e411_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_e411_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_e411_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_2304_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2447_c7_2304_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2447_c7_2304_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2442_c2_df5d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_df5d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_df5d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2447_c7_2304] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2447_c7_2304_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2447_c7_2304_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2447_c7_2304_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2447_c7_2304_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2447_c7_2304] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_2304_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_2304_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_2304_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_2304_return_output;

     -- n8_MUX[uxn_opcodes_h_l2442_c2_df5d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2442_c2_df5d_cond <= VAR_n8_MUX_uxn_opcodes_h_l2442_c2_df5d_cond;
     n8_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue;
     n8_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output := n8_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2447_c7_2304] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_2304_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_2304_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_2304_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_2304_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_2304_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_2304_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2442_c2_df5d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2442_c2_df5d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2442_c2_df5d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2442_c2_df5d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2442_c2_df5d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2442_c2_df5d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output := result_u16_value_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output;

     -- Submodule level 8
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_2304_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2447_c7_2304_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_2304_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2442_c2_df5d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_df5d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_df5d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2442_c2_df5d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_df5d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_df5d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2442_c2_df5d] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2442_c2_df5d_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2442_c2_df5d_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2442_c2_df5d_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2442_c2_df5d_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5abb_uxn_opcodes_h_l2437_l2479_DUPLICATE_4b18 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5abb_uxn_opcodes_h_l2437_l2479_DUPLICATE_4b18_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5abb(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_df5d_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5abb_uxn_opcodes_h_l2437_l2479_DUPLICATE_4b18_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5abb_uxn_opcodes_h_l2437_l2479_DUPLICATE_4b18_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
