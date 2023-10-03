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
-- Submodules: 114
entity sft2_0CLK_51ffd248 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sft2_0CLK_51ffd248;
architecture arch of sft2_0CLK_51ffd248 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1423_c6_36f9]
signal BIN_OP_EQ_uxn_opcodes_h_l1423_c6_36f9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1423_c6_36f9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1423_c6_36f9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1423_c1_6572]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_6572_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_6572_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_6572_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_6572_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1423_c2_7a4d]
signal n16_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1423_c2_7a4d]
signal tmp16_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1423_c2_7a4d]
signal t8_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1423_c2_7a4d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1423_c2_7a4d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1423_c2_7a4d]
signal result_stack_value_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1423_c2_7a4d]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1423_c2_7a4d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1423_c2_7a4d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1423_c2_7a4d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1423_c2_7a4d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1424_c3_3bb4[uxn_opcodes_h_l1424_c3_3bb4]
signal printf_uxn_opcodes_h_l1424_c3_3bb4_uxn_opcodes_h_l1424_c3_3bb4_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1431_c11_6f76]
signal BIN_OP_EQ_uxn_opcodes_h_l1431_c11_6f76_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1431_c11_6f76_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1431_c11_6f76_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1431_c7_f941]
signal n16_MUX_uxn_opcodes_h_l1431_c7_f941_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1431_c7_f941_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1431_c7_f941]
signal tmp16_MUX_uxn_opcodes_h_l1431_c7_f941_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1431_c7_f941_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1431_c7_f941]
signal t8_MUX_uxn_opcodes_h_l1431_c7_f941_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1431_c7_f941_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1431_c7_f941]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_f941_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_f941_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1431_c7_f941]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_f941_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_f941_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1431_c7_f941]
signal result_stack_value_MUX_uxn_opcodes_h_l1431_c7_f941_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1431_c7_f941_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1431_c7_f941]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_f941_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_f941_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1431_c7_f941]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_f941_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_f941_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1431_c7_f941]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_f941_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_f941_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1431_c7_f941]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_f941_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_f941_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1431_c7_f941]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_f941_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_f941_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1435_c11_b843]
signal BIN_OP_EQ_uxn_opcodes_h_l1435_c11_b843_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1435_c11_b843_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1435_c11_b843_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1435_c7_5951]
signal n16_MUX_uxn_opcodes_h_l1435_c7_5951_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1435_c7_5951_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1435_c7_5951]
signal tmp16_MUX_uxn_opcodes_h_l1435_c7_5951_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1435_c7_5951_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1435_c7_5951]
signal t8_MUX_uxn_opcodes_h_l1435_c7_5951_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1435_c7_5951_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1435_c7_5951]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_5951_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_5951_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1435_c7_5951]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_5951_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_5951_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1435_c7_5951]
signal result_stack_value_MUX_uxn_opcodes_h_l1435_c7_5951_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1435_c7_5951_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1435_c7_5951]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_5951_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_5951_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1435_c7_5951]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_5951_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_5951_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1435_c7_5951]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_5951_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_5951_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1435_c7_5951]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_5951_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_5951_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1435_c7_5951]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_5951_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_5951_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1440_c11_15b8]
signal BIN_OP_EQ_uxn_opcodes_h_l1440_c11_15b8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1440_c11_15b8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1440_c11_15b8_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1440_c7_80fe]
signal n16_MUX_uxn_opcodes_h_l1440_c7_80fe_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1440_c7_80fe]
signal tmp16_MUX_uxn_opcodes_h_l1440_c7_80fe_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1440_c7_80fe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_80fe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1440_c7_80fe]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_80fe_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1440_c7_80fe]
signal result_stack_value_MUX_uxn_opcodes_h_l1440_c7_80fe_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1440_c7_80fe]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_80fe_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1440_c7_80fe]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_80fe_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1440_c7_80fe]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_80fe_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1440_c7_80fe]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_80fe_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1440_c7_80fe]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_80fe_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1444_c11_f6f0]
signal BIN_OP_EQ_uxn_opcodes_h_l1444_c11_f6f0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1444_c11_f6f0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1444_c11_f6f0_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1444_c7_4706]
signal n16_MUX_uxn_opcodes_h_l1444_c7_4706_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1444_c7_4706_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1444_c7_4706]
signal tmp16_MUX_uxn_opcodes_h_l1444_c7_4706_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1444_c7_4706_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1444_c7_4706]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4706_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4706_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1444_c7_4706]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4706_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4706_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1444_c7_4706]
signal result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4706_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4706_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1444_c7_4706]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4706_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4706_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1444_c7_4706]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4706_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4706_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1444_c7_4706]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4706_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4706_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1444_c7_4706]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4706_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4706_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1444_c7_4706]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4706_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4706_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1446_c3_93f1]
signal CONST_SL_8_uxn_opcodes_h_l1446_c3_93f1_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1446_c3_93f1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1450_c11_7c33]
signal BIN_OP_EQ_uxn_opcodes_h_l1450_c11_7c33_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1450_c11_7c33_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1450_c11_7c33_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1450_c7_d868]
signal n16_MUX_uxn_opcodes_h_l1450_c7_d868_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1450_c7_d868_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1450_c7_d868]
signal tmp16_MUX_uxn_opcodes_h_l1450_c7_d868_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1450_c7_d868_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1450_c7_d868]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_d868_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_d868_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1450_c7_d868]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_d868_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_d868_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1450_c7_d868]
signal result_stack_value_MUX_uxn_opcodes_h_l1450_c7_d868_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1450_c7_d868_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1450_c7_d868]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_d868_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_d868_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1450_c7_d868]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_d868_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_d868_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1450_c7_d868]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_d868_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_d868_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1450_c7_d868]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_d868_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_d868_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1450_c7_d868]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_d868_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_d868_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1454_c11_6102]
signal BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6102_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6102_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6102_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1454_c7_00d9]
signal n16_MUX_uxn_opcodes_h_l1454_c7_00d9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1454_c7_00d9]
signal tmp16_MUX_uxn_opcodes_h_l1454_c7_00d9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1454_c7_00d9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_00d9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1454_c7_00d9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_00d9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1454_c7_00d9]
signal result_stack_value_MUX_uxn_opcodes_h_l1454_c7_00d9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1454_c7_00d9]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_00d9_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1454_c7_00d9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_00d9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1454_c7_00d9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_00d9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1454_c7_00d9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_00d9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1454_c7_00d9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_00d9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1455_c3_dc62]
signal BIN_OP_OR_uxn_opcodes_h_l1455_c3_dc62_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1455_c3_dc62_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1455_c3_dc62_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1458_c32_1ad8]
signal BIN_OP_AND_uxn_opcodes_h_l1458_c32_1ad8_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1458_c32_1ad8_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1458_c32_1ad8_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1458_c32_618d]
signal BIN_OP_GT_uxn_opcodes_h_l1458_c32_618d_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1458_c32_618d_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1458_c32_618d_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1458_c32_d392]
signal MUX_uxn_opcodes_h_l1458_c32_d392_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1458_c32_d392_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1458_c32_d392_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1458_c32_d392_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1460_c11_a801]
signal BIN_OP_EQ_uxn_opcodes_h_l1460_c11_a801_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1460_c11_a801_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1460_c11_a801_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1460_c7_b24f]
signal tmp16_MUX_uxn_opcodes_h_l1460_c7_b24f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1460_c7_b24f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1460_c7_b24f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1460_c7_b24f_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1460_c7_b24f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_b24f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_b24f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_b24f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_b24f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1460_c7_b24f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_b24f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_b24f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_b24f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_b24f_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1460_c7_b24f]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_b24f_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_b24f_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_b24f_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_b24f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1460_c7_b24f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_b24f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_b24f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_b24f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_b24f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1460_c7_b24f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_b24f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_b24f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_b24f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_b24f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1460_c7_b24f]
signal result_stack_value_MUX_uxn_opcodes_h_l1460_c7_b24f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1460_c7_b24f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1460_c7_b24f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1460_c7_b24f_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1461_c20_3bb1]
signal BIN_OP_AND_uxn_opcodes_h_l1461_c20_3bb1_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1461_c20_3bb1_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1461_c20_3bb1_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l1461_c12_b17a]
signal BIN_OP_SR_uxn_opcodes_h_l1461_c12_b17a_left : unsigned(15 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l1461_c12_b17a_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l1461_c12_b17a_return_output : unsigned(15 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l1461_c36_8864]
signal CONST_SR_4_uxn_opcodes_h_l1461_c36_8864_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l1461_c36_8864_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l1461_c12_a59c]
signal BIN_OP_SL_uxn_opcodes_h_l1461_c12_a59c_left : unsigned(15 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l1461_c12_a59c_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l1461_c12_a59c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1467_c11_2af3]
signal BIN_OP_EQ_uxn_opcodes_h_l1467_c11_2af3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1467_c11_2af3_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1467_c11_2af3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1467_c7_95b7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_95b7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_95b7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_95b7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_95b7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1467_c7_95b7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_95b7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_95b7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_95b7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_95b7_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1467_c7_95b7]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_95b7_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_95b7_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_95b7_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_95b7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1467_c7_95b7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_95b7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_95b7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_95b7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_95b7_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1467_c7_95b7]
signal result_stack_value_MUX_uxn_opcodes_h_l1467_c7_95b7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1467_c7_95b7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1467_c7_95b7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1467_c7_95b7_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1470_c34_dacc]
signal CONST_SR_8_uxn_opcodes_h_l1470_c34_dacc_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1470_c34_dacc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1472_c11_aeb4]
signal BIN_OP_EQ_uxn_opcodes_h_l1472_c11_aeb4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1472_c11_aeb4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1472_c11_aeb4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1472_c7_f4f2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_f4f2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_f4f2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_f4f2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_f4f2_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1472_c7_f4f2]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_f4f2_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_f4f2_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_f4f2_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_f4f2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1472_c7_f4f2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_f4f2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_f4f2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_f4f2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_f4f2_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_49dd( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.stack_value := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_read := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_sp_shift := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1423_c6_36f9
BIN_OP_EQ_uxn_opcodes_h_l1423_c6_36f9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1423_c6_36f9_left,
BIN_OP_EQ_uxn_opcodes_h_l1423_c6_36f9_right,
BIN_OP_EQ_uxn_opcodes_h_l1423_c6_36f9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_6572
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_6572 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_6572_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_6572_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_6572_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_6572_return_output);

-- n16_MUX_uxn_opcodes_h_l1423_c2_7a4d
n16_MUX_uxn_opcodes_h_l1423_c2_7a4d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond,
n16_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue,
n16_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse,
n16_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1423_c2_7a4d
tmp16_MUX_uxn_opcodes_h_l1423_c2_7a4d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond,
tmp16_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue,
tmp16_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse,
tmp16_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output);

-- t8_MUX_uxn_opcodes_h_l1423_c2_7a4d
t8_MUX_uxn_opcodes_h_l1423_c2_7a4d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond,
t8_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue,
t8_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse,
t8_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_7a4d
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_7a4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_7a4d
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_7a4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1423_c2_7a4d
result_stack_value_MUX_uxn_opcodes_h_l1423_c2_7a4d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_7a4d
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_7a4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_7a4d
result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_7a4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_7a4d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_7a4d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d
result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output);

-- printf_uxn_opcodes_h_l1424_c3_3bb4_uxn_opcodes_h_l1424_c3_3bb4
printf_uxn_opcodes_h_l1424_c3_3bb4_uxn_opcodes_h_l1424_c3_3bb4 : entity work.printf_uxn_opcodes_h_l1424_c3_3bb4_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1424_c3_3bb4_uxn_opcodes_h_l1424_c3_3bb4_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1431_c11_6f76
BIN_OP_EQ_uxn_opcodes_h_l1431_c11_6f76 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1431_c11_6f76_left,
BIN_OP_EQ_uxn_opcodes_h_l1431_c11_6f76_right,
BIN_OP_EQ_uxn_opcodes_h_l1431_c11_6f76_return_output);

-- n16_MUX_uxn_opcodes_h_l1431_c7_f941
n16_MUX_uxn_opcodes_h_l1431_c7_f941 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1431_c7_f941_cond,
n16_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue,
n16_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse,
n16_MUX_uxn_opcodes_h_l1431_c7_f941_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1431_c7_f941
tmp16_MUX_uxn_opcodes_h_l1431_c7_f941 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1431_c7_f941_cond,
tmp16_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue,
tmp16_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse,
tmp16_MUX_uxn_opcodes_h_l1431_c7_f941_return_output);

-- t8_MUX_uxn_opcodes_h_l1431_c7_f941
t8_MUX_uxn_opcodes_h_l1431_c7_f941 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1431_c7_f941_cond,
t8_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue,
t8_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse,
t8_MUX_uxn_opcodes_h_l1431_c7_f941_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_f941
result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_f941 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_f941_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_f941_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_f941
result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_f941 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_f941_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_f941_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1431_c7_f941
result_stack_value_MUX_uxn_opcodes_h_l1431_c7_f941 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1431_c7_f941_cond,
result_stack_value_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1431_c7_f941_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_f941
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_f941 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_f941_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_f941_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_f941
result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_f941 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_f941_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_f941_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_f941
result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_f941 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_f941_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_f941_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_f941
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_f941 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_f941_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_f941_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_f941
result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_f941 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_f941_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_f941_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1435_c11_b843
BIN_OP_EQ_uxn_opcodes_h_l1435_c11_b843 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1435_c11_b843_left,
BIN_OP_EQ_uxn_opcodes_h_l1435_c11_b843_right,
BIN_OP_EQ_uxn_opcodes_h_l1435_c11_b843_return_output);

-- n16_MUX_uxn_opcodes_h_l1435_c7_5951
n16_MUX_uxn_opcodes_h_l1435_c7_5951 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1435_c7_5951_cond,
n16_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue,
n16_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse,
n16_MUX_uxn_opcodes_h_l1435_c7_5951_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1435_c7_5951
tmp16_MUX_uxn_opcodes_h_l1435_c7_5951 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1435_c7_5951_cond,
tmp16_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue,
tmp16_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse,
tmp16_MUX_uxn_opcodes_h_l1435_c7_5951_return_output);

-- t8_MUX_uxn_opcodes_h_l1435_c7_5951
t8_MUX_uxn_opcodes_h_l1435_c7_5951 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1435_c7_5951_cond,
t8_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue,
t8_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse,
t8_MUX_uxn_opcodes_h_l1435_c7_5951_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_5951
result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_5951 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_5951_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_5951_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_5951
result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_5951 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_5951_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_5951_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1435_c7_5951
result_stack_value_MUX_uxn_opcodes_h_l1435_c7_5951 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1435_c7_5951_cond,
result_stack_value_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1435_c7_5951_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_5951
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_5951 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_5951_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_5951_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_5951
result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_5951 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_5951_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_5951_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_5951
result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_5951 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_5951_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_5951_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_5951
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_5951 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_5951_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_5951_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_5951
result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_5951 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_5951_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_5951_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1440_c11_15b8
BIN_OP_EQ_uxn_opcodes_h_l1440_c11_15b8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1440_c11_15b8_left,
BIN_OP_EQ_uxn_opcodes_h_l1440_c11_15b8_right,
BIN_OP_EQ_uxn_opcodes_h_l1440_c11_15b8_return_output);

-- n16_MUX_uxn_opcodes_h_l1440_c7_80fe
n16_MUX_uxn_opcodes_h_l1440_c7_80fe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1440_c7_80fe_cond,
n16_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue,
n16_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse,
n16_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1440_c7_80fe
tmp16_MUX_uxn_opcodes_h_l1440_c7_80fe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1440_c7_80fe_cond,
tmp16_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue,
tmp16_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse,
tmp16_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_80fe
result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_80fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_80fe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_80fe
result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_80fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_80fe_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1440_c7_80fe
result_stack_value_MUX_uxn_opcodes_h_l1440_c7_80fe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1440_c7_80fe_cond,
result_stack_value_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_80fe
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_80fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_80fe_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_80fe
result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_80fe : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_80fe_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_80fe
result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_80fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_80fe_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_80fe
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_80fe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_80fe_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_80fe
result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_80fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_80fe_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1444_c11_f6f0
BIN_OP_EQ_uxn_opcodes_h_l1444_c11_f6f0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1444_c11_f6f0_left,
BIN_OP_EQ_uxn_opcodes_h_l1444_c11_f6f0_right,
BIN_OP_EQ_uxn_opcodes_h_l1444_c11_f6f0_return_output);

-- n16_MUX_uxn_opcodes_h_l1444_c7_4706
n16_MUX_uxn_opcodes_h_l1444_c7_4706 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1444_c7_4706_cond,
n16_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue,
n16_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse,
n16_MUX_uxn_opcodes_h_l1444_c7_4706_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1444_c7_4706
tmp16_MUX_uxn_opcodes_h_l1444_c7_4706 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1444_c7_4706_cond,
tmp16_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue,
tmp16_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse,
tmp16_MUX_uxn_opcodes_h_l1444_c7_4706_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4706
result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4706 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4706_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4706_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4706
result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4706 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4706_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4706_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4706
result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4706 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4706_cond,
result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4706_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4706
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4706 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4706_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4706_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4706
result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4706 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4706_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4706_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4706
result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4706 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4706_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4706_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4706
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4706 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4706_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4706_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4706
result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4706 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4706_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4706_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1446_c3_93f1
CONST_SL_8_uxn_opcodes_h_l1446_c3_93f1 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1446_c3_93f1_x,
CONST_SL_8_uxn_opcodes_h_l1446_c3_93f1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1450_c11_7c33
BIN_OP_EQ_uxn_opcodes_h_l1450_c11_7c33 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1450_c11_7c33_left,
BIN_OP_EQ_uxn_opcodes_h_l1450_c11_7c33_right,
BIN_OP_EQ_uxn_opcodes_h_l1450_c11_7c33_return_output);

-- n16_MUX_uxn_opcodes_h_l1450_c7_d868
n16_MUX_uxn_opcodes_h_l1450_c7_d868 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1450_c7_d868_cond,
n16_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue,
n16_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse,
n16_MUX_uxn_opcodes_h_l1450_c7_d868_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1450_c7_d868
tmp16_MUX_uxn_opcodes_h_l1450_c7_d868 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1450_c7_d868_cond,
tmp16_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue,
tmp16_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse,
tmp16_MUX_uxn_opcodes_h_l1450_c7_d868_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_d868
result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_d868 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_d868_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_d868_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_d868
result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_d868 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_d868_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_d868_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1450_c7_d868
result_stack_value_MUX_uxn_opcodes_h_l1450_c7_d868 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1450_c7_d868_cond,
result_stack_value_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1450_c7_d868_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_d868
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_d868 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_d868_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_d868_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_d868
result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_d868 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_d868_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_d868_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_d868
result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_d868 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_d868_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_d868_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_d868
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_d868 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_d868_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_d868_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_d868
result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_d868 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_d868_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_d868_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6102
BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6102 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6102_left,
BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6102_right,
BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6102_return_output);

-- n16_MUX_uxn_opcodes_h_l1454_c7_00d9
n16_MUX_uxn_opcodes_h_l1454_c7_00d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1454_c7_00d9_cond,
n16_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue,
n16_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse,
n16_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1454_c7_00d9
tmp16_MUX_uxn_opcodes_h_l1454_c7_00d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1454_c7_00d9_cond,
tmp16_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue,
tmp16_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse,
tmp16_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_00d9
result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_00d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_00d9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_00d9
result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_00d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_00d9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1454_c7_00d9
result_stack_value_MUX_uxn_opcodes_h_l1454_c7_00d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1454_c7_00d9_cond,
result_stack_value_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_00d9
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_00d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_00d9_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_00d9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_00d9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_00d9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_00d9
result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_00d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_00d9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_00d9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_00d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_00d9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_00d9
result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_00d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_00d9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1455_c3_dc62
BIN_OP_OR_uxn_opcodes_h_l1455_c3_dc62 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1455_c3_dc62_left,
BIN_OP_OR_uxn_opcodes_h_l1455_c3_dc62_right,
BIN_OP_OR_uxn_opcodes_h_l1455_c3_dc62_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1458_c32_1ad8
BIN_OP_AND_uxn_opcodes_h_l1458_c32_1ad8 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1458_c32_1ad8_left,
BIN_OP_AND_uxn_opcodes_h_l1458_c32_1ad8_right,
BIN_OP_AND_uxn_opcodes_h_l1458_c32_1ad8_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1458_c32_618d
BIN_OP_GT_uxn_opcodes_h_l1458_c32_618d : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1458_c32_618d_left,
BIN_OP_GT_uxn_opcodes_h_l1458_c32_618d_right,
BIN_OP_GT_uxn_opcodes_h_l1458_c32_618d_return_output);

-- MUX_uxn_opcodes_h_l1458_c32_d392
MUX_uxn_opcodes_h_l1458_c32_d392 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1458_c32_d392_cond,
MUX_uxn_opcodes_h_l1458_c32_d392_iftrue,
MUX_uxn_opcodes_h_l1458_c32_d392_iffalse,
MUX_uxn_opcodes_h_l1458_c32_d392_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1460_c11_a801
BIN_OP_EQ_uxn_opcodes_h_l1460_c11_a801 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1460_c11_a801_left,
BIN_OP_EQ_uxn_opcodes_h_l1460_c11_a801_right,
BIN_OP_EQ_uxn_opcodes_h_l1460_c11_a801_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1460_c7_b24f
tmp16_MUX_uxn_opcodes_h_l1460_c7_b24f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1460_c7_b24f_cond,
tmp16_MUX_uxn_opcodes_h_l1460_c7_b24f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1460_c7_b24f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1460_c7_b24f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_b24f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_b24f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_b24f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_b24f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_b24f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_b24f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_b24f
result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_b24f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_b24f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_b24f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_b24f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_b24f_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_b24f
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_b24f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_b24f_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_b24f_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_b24f_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_b24f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_b24f
result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_b24f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_b24f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_b24f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_b24f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_b24f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_b24f
result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_b24f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_b24f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_b24f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_b24f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_b24f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1460_c7_b24f
result_stack_value_MUX_uxn_opcodes_h_l1460_c7_b24f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1460_c7_b24f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1460_c7_b24f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1460_c7_b24f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1460_c7_b24f_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1461_c20_3bb1
BIN_OP_AND_uxn_opcodes_h_l1461_c20_3bb1 : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1461_c20_3bb1_left,
BIN_OP_AND_uxn_opcodes_h_l1461_c20_3bb1_right,
BIN_OP_AND_uxn_opcodes_h_l1461_c20_3bb1_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l1461_c12_b17a
BIN_OP_SR_uxn_opcodes_h_l1461_c12_b17a : entity work.BIN_OP_SR_uint16_t_uint8_t_0CLK_295015b8 port map (
BIN_OP_SR_uxn_opcodes_h_l1461_c12_b17a_left,
BIN_OP_SR_uxn_opcodes_h_l1461_c12_b17a_right,
BIN_OP_SR_uxn_opcodes_h_l1461_c12_b17a_return_output);

-- CONST_SR_4_uxn_opcodes_h_l1461_c36_8864
CONST_SR_4_uxn_opcodes_h_l1461_c36_8864 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l1461_c36_8864_x,
CONST_SR_4_uxn_opcodes_h_l1461_c36_8864_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l1461_c12_a59c
BIN_OP_SL_uxn_opcodes_h_l1461_c12_a59c : entity work.BIN_OP_SL_uint16_t_uint8_t_0CLK_b6546dec port map (
BIN_OP_SL_uxn_opcodes_h_l1461_c12_a59c_left,
BIN_OP_SL_uxn_opcodes_h_l1461_c12_a59c_right,
BIN_OP_SL_uxn_opcodes_h_l1461_c12_a59c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1467_c11_2af3
BIN_OP_EQ_uxn_opcodes_h_l1467_c11_2af3 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1467_c11_2af3_left,
BIN_OP_EQ_uxn_opcodes_h_l1467_c11_2af3_right,
BIN_OP_EQ_uxn_opcodes_h_l1467_c11_2af3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_95b7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_95b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_95b7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_95b7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_95b7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_95b7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_95b7
result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_95b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_95b7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_95b7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_95b7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_95b7_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_95b7
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_95b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_95b7_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_95b7_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_95b7_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_95b7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_95b7
result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_95b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_95b7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_95b7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_95b7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_95b7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1467_c7_95b7
result_stack_value_MUX_uxn_opcodes_h_l1467_c7_95b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1467_c7_95b7_cond,
result_stack_value_MUX_uxn_opcodes_h_l1467_c7_95b7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1467_c7_95b7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1467_c7_95b7_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1470_c34_dacc
CONST_SR_8_uxn_opcodes_h_l1470_c34_dacc : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1470_c34_dacc_x,
CONST_SR_8_uxn_opcodes_h_l1470_c34_dacc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1472_c11_aeb4
BIN_OP_EQ_uxn_opcodes_h_l1472_c11_aeb4 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1472_c11_aeb4_left,
BIN_OP_EQ_uxn_opcodes_h_l1472_c11_aeb4_right,
BIN_OP_EQ_uxn_opcodes_h_l1472_c11_aeb4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_f4f2
result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_f4f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_f4f2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_f4f2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_f4f2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_f4f2_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_f4f2
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_f4f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_f4f2_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_f4f2_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_f4f2_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_f4f2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_f4f2
result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_f4f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_f4f2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_f4f2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_f4f2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_f4f2_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t8,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1423_c6_36f9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_6572_return_output,
 n16_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output,
 t8_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1431_c11_6f76_return_output,
 n16_MUX_uxn_opcodes_h_l1431_c7_f941_return_output,
 tmp16_MUX_uxn_opcodes_h_l1431_c7_f941_return_output,
 t8_MUX_uxn_opcodes_h_l1431_c7_f941_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_f941_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_f941_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1431_c7_f941_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_f941_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_f941_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_f941_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_f941_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_f941_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1435_c11_b843_return_output,
 n16_MUX_uxn_opcodes_h_l1435_c7_5951_return_output,
 tmp16_MUX_uxn_opcodes_h_l1435_c7_5951_return_output,
 t8_MUX_uxn_opcodes_h_l1435_c7_5951_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_5951_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_5951_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1435_c7_5951_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_5951_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_5951_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_5951_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_5951_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_5951_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1440_c11_15b8_return_output,
 n16_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output,
 tmp16_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1444_c11_f6f0_return_output,
 n16_MUX_uxn_opcodes_h_l1444_c7_4706_return_output,
 tmp16_MUX_uxn_opcodes_h_l1444_c7_4706_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4706_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4706_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4706_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4706_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4706_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4706_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4706_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4706_return_output,
 CONST_SL_8_uxn_opcodes_h_l1446_c3_93f1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1450_c11_7c33_return_output,
 n16_MUX_uxn_opcodes_h_l1450_c7_d868_return_output,
 tmp16_MUX_uxn_opcodes_h_l1450_c7_d868_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_d868_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_d868_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1450_c7_d868_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_d868_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_d868_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_d868_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_d868_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_d868_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6102_return_output,
 n16_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output,
 tmp16_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1455_c3_dc62_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1458_c32_1ad8_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1458_c32_618d_return_output,
 MUX_uxn_opcodes_h_l1458_c32_d392_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1460_c11_a801_return_output,
 tmp16_MUX_uxn_opcodes_h_l1460_c7_b24f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_b24f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_b24f_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_b24f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_b24f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_b24f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1460_c7_b24f_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1461_c20_3bb1_return_output,
 BIN_OP_SR_uxn_opcodes_h_l1461_c12_b17a_return_output,
 CONST_SR_4_uxn_opcodes_h_l1461_c36_8864_return_output,
 BIN_OP_SL_uxn_opcodes_h_l1461_c12_a59c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1467_c11_2af3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_95b7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_95b7_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_95b7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_95b7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1467_c7_95b7_return_output,
 CONST_SR_8_uxn_opcodes_h_l1470_c34_dacc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1472_c11_aeb4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_f4f2_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_f4f2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_f4f2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_36f9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_36f9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_36f9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_6572_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_6572_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_6572_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_6572_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1431_c7_f941_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1431_c7_f941_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1431_c7_f941_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_f941_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_f941_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c7_f941_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_f941_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_f941_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_f941_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1427_c3_b0eb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_f941_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_f941_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1424_c3_3bb4_uxn_opcodes_h_l1424_c3_3bb4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_6f76_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_6f76_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_6f76_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1435_c7_5951_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1431_c7_f941_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1435_c7_5951_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1431_c7_f941_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1435_c7_5951_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1431_c7_f941_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_5951_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_f941_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_5951_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_f941_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1435_c7_5951_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c7_f941_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_5951_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_f941_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_5951_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_f941_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_5951_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_f941_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1433_c3_0058 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_5951_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_f941_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_5951_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_f941_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_b843_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_b843_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_b843_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1435_c7_5951_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1435_c7_5951_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1435_c7_5951_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_5951_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_5951_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1435_c7_5951_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_5951_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_5951_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_5951_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1438_c3_738c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_5951_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_5951_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_15b8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_15b8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_15b8_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1444_c7_4706_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1440_c7_80fe_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_4706_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1440_c7_80fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4706_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_80fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4706_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_80fe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4706_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_80fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4706_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_80fe_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4706_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_80fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4706_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_80fe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1442_c3_dfce : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4706_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_80fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4706_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_80fe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_f6f0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_f6f0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_f6f0_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1450_c7_d868_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1444_c7_4706_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_d868_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_4706_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_d868_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4706_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_d868_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4706_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_d868_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4706_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_d868_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4706_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_d868_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4706_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_d868_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4706_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1448_c3_5f3a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_d868_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4706_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_d868_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4706_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1446_c3_93f1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1446_c3_93f1_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_7c33_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_7c33_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_7c33_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1450_c7_d868_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_d868_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_d868_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_d868_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_d868_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_d868_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_d868_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_d868_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1452_c3_46b8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_d868_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_d868_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6102_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6102_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6102_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1454_c7_00d9_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1460_c7_b24f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1454_c7_00d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_b24f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_00d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_b24f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_00d9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1460_c7_b24f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_00d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_b24f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_00d9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_00d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1454_c7_00d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_00d9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_b24f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_00d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_b24f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_00d9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1455_c3_dc62_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1455_c3_dc62_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1455_c3_dc62_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1458_c32_d392_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1458_c32_d392_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1458_c32_d392_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1458_c32_1ad8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1458_c32_1ad8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1458_c32_1ad8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1458_c32_618d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1458_c32_618d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1458_c32_618d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1458_c32_d392_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_a801_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_a801_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_a801_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1460_c7_b24f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1460_c7_b24f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1460_c7_b24f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_b24f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1464_c3_3c19 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_b24f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_95b7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_b24f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_b24f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_b24f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_95b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_b24f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_b24f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_b24f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_95b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_b24f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_b24f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_b24f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_95b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_b24f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_b24f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_b24f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_b24f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1460_c7_b24f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1460_c7_b24f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1467_c7_95b7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1460_c7_b24f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l1461_c12_b17a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1461_c20_3bb1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1461_c20_3bb1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1461_c20_3bb1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l1461_c12_b17a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l1461_c12_b17a_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l1461_c12_a59c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l1461_c12_a59c_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l1461_c36_8864_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l1461_c36_8864_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l1461_c12_a59c_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1465_c24_7cea_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_2af3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_2af3_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_2af3_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_95b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1469_c3_b09b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_95b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_95b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_95b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_95b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_f4f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_95b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_95b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_95b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_f4f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_95b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_95b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_95b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_f4f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_95b7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1467_c7_95b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1467_c7_95b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1467_c7_95b7_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1470_c34_dacc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1470_c34_dacc_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1470_c24_0dfd_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1472_c11_aeb4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1472_c11_aeb4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1472_c11_aeb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_f4f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_f4f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_f4f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_f4f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_f4f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_f4f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_f4f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_f4f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_f4f2_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1467_l1423_DUPLICATE_1bbc_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1423_DUPLICATE_06ae_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1440_l1444_l1423_DUPLICATE_f4bf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1454_l1440_l1444_l1467_l1472_DUPLICATE_7eb9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1472_DUPLICATE_9fb7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1454_l1440_l1444_l1467_l1472_DUPLICATE_d4cf_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1445_l1455_DUPLICATE_bcf3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1467_l1454_DUPLICATE_b760_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1478_l1418_DUPLICATE_ac0d_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1427_c3_b0eb := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1427_c3_b0eb;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1438_c3_738c := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1438_c3_738c;
     VAR_MUX_uxn_opcodes_h_l1458_c32_d392_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_36f9_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6102_right := to_unsigned(6, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_b24f_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1442_c3_dfce := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1442_c3_dfce;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_a801_right := to_unsigned(7, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_f4f2_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1458_c32_d392_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1448_c3_5f3a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1448_c3_5f3a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_2af3_right := to_unsigned(8, 4);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1458_c32_1ad8_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1464_c3_3c19 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_b24f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1464_c3_3c19;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1433_c3_0058 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1433_c3_0058;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_6572_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_f6f0_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_7c33_right := to_unsigned(5, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_f4f2_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1461_c20_3bb1_right := to_unsigned(15, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_b843_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_f4f2_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1469_c3_b09b := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_95b7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1469_c3_b09b;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_95b7_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1452_c3_46b8 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1452_c3_46b8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_15b8_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1472_c11_aeb4_right := to_unsigned(9, 4);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1458_c32_618d_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_6f76_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_b24f_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_6572_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1458_c32_1ad8_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1455_c3_dc62_left := n16;
     VAR_BIN_OP_SR_uxn_opcodes_h_l1461_c12_b17a_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_36f9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_6f76_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_b843_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_15b8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_f6f0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_7c33_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6102_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_a801_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_2af3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1472_c11_aeb4_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1461_c20_3bb1_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l1461_c36_8864_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse := t8;
     VAR_CONST_SR_8_uxn_opcodes_h_l1470_c34_dacc_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1460_c7_b24f_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1440_c11_15b8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1440_c11_15b8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_15b8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1440_c11_15b8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_15b8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_15b8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1440_c11_15b8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1454_l1440_l1444_l1467_l1472_DUPLICATE_7eb9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1454_l1440_l1444_l1467_l1472_DUPLICATE_7eb9_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1444_c11_f6f0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1444_c11_f6f0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_f6f0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1444_c11_f6f0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_f6f0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_f6f0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1444_c11_f6f0_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1467_l1423_DUPLICATE_1bbc LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1467_l1423_DUPLICATE_1bbc_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1440_l1444_l1423_DUPLICATE_f4bf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1440_l1444_l1423_DUPLICATE_f4bf_return_output := result.is_sp_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1445_l1455_DUPLICATE_bcf3 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1445_l1455_DUPLICATE_bcf3_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1450_c11_7c33] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1450_c11_7c33_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_7c33_left;
     BIN_OP_EQ_uxn_opcodes_h_l1450_c11_7c33_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_7c33_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_7c33_return_output := BIN_OP_EQ_uxn_opcodes_h_l1450_c11_7c33_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1470_c34_dacc] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1470_c34_dacc_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1470_c34_dacc_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1470_c34_dacc_return_output := CONST_SR_8_uxn_opcodes_h_l1470_c34_dacc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1431_c11_6f76] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1431_c11_6f76_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_6f76_left;
     BIN_OP_EQ_uxn_opcodes_h_l1431_c11_6f76_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_6f76_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_6f76_return_output := BIN_OP_EQ_uxn_opcodes_h_l1431_c11_6f76_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1423_DUPLICATE_06ae LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1423_DUPLICATE_06ae_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1467_l1454_DUPLICATE_b760 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1467_l1454_DUPLICATE_b760_return_output := result.stack_address_sp_offset;

     -- BIN_OP_AND[uxn_opcodes_h_l1458_c32_1ad8] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1458_c32_1ad8_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1458_c32_1ad8_left;
     BIN_OP_AND_uxn_opcodes_h_l1458_c32_1ad8_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1458_c32_1ad8_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1458_c32_1ad8_return_output := BIN_OP_AND_uxn_opcodes_h_l1458_c32_1ad8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1472_c11_aeb4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1472_c11_aeb4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1472_c11_aeb4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1472_c11_aeb4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1472_c11_aeb4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1472_c11_aeb4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1472_c11_aeb4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1435_c11_b843] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1435_c11_b843_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_b843_left;
     BIN_OP_EQ_uxn_opcodes_h_l1435_c11_b843_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_b843_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_b843_return_output := BIN_OP_EQ_uxn_opcodes_h_l1435_c11_b843_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1454_l1440_l1444_l1467_l1472_DUPLICATE_d4cf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1454_l1440_l1444_l1467_l1472_DUPLICATE_d4cf_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1467_c11_2af3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1467_c11_2af3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_2af3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1467_c11_2af3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_2af3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_2af3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1467_c11_2af3_return_output;

     -- CONST_SR_4[uxn_opcodes_h_l1461_c36_8864] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l1461_c36_8864_x <= VAR_CONST_SR_4_uxn_opcodes_h_l1461_c36_8864_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l1461_c36_8864_return_output := CONST_SR_4_uxn_opcodes_h_l1461_c36_8864_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1460_c11_a801] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1460_c11_a801_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_a801_left;
     BIN_OP_EQ_uxn_opcodes_h_l1460_c11_a801_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_a801_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_a801_return_output := BIN_OP_EQ_uxn_opcodes_h_l1460_c11_a801_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1454_c11_6102] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6102_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6102_left;
     BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6102_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6102_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6102_return_output := BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6102_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1423_c6_36f9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1423_c6_36f9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_36f9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1423_c6_36f9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_36f9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_36f9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1423_c6_36f9_return_output;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l1454_c7_00d9] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1454_c7_00d9_return_output := result.is_stack_read;

     -- BIN_OP_AND[uxn_opcodes_h_l1461_c20_3bb1] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1461_c20_3bb1_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1461_c20_3bb1_left;
     BIN_OP_AND_uxn_opcodes_h_l1461_c20_3bb1_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1461_c20_3bb1_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1461_c20_3bb1_return_output := BIN_OP_AND_uxn_opcodes_h_l1461_c20_3bb1_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1472_DUPLICATE_9fb7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1472_DUPLICATE_9fb7_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1458_c32_618d_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1458_c32_1ad8_return_output;
     VAR_BIN_OP_SR_uxn_opcodes_h_l1461_c12_b17a_right := VAR_BIN_OP_AND_uxn_opcodes_h_l1461_c20_3bb1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_6572_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_36f9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_36f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_36f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_36f9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_36f9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_36f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_36f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_36f9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_36f9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_36f9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_36f9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_36f9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1431_c7_f941_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_6f76_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_f941_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_6f76_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_f941_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_6f76_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_f941_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_6f76_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_f941_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_6f76_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_f941_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_6f76_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_f941_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_6f76_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_f941_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_6f76_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c7_f941_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_6f76_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1431_c7_f941_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_6f76_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1431_c7_f941_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_6f76_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1435_c7_5951_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_b843_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_5951_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_b843_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_5951_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_b843_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_5951_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_b843_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_5951_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_b843_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_5951_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_b843_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_5951_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_b843_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_5951_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_b843_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1435_c7_5951_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_b843_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1435_c7_5951_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_b843_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1435_c7_5951_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_b843_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1440_c7_80fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_15b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_80fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_15b8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_80fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_15b8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_80fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_15b8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_80fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_15b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_80fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_15b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_80fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_15b8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_80fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_15b8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_80fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_15b8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1440_c7_80fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_15b8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1444_c7_4706_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_f6f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4706_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_f6f0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4706_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_f6f0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4706_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_f6f0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4706_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_f6f0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4706_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_f6f0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4706_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_f6f0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4706_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_f6f0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4706_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_f6f0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_4706_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_f6f0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1450_c7_d868_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_7c33_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_d868_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_7c33_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_d868_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_7c33_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_d868_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_7c33_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_d868_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_7c33_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_d868_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_7c33_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_d868_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_7c33_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_d868_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_7c33_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_d868_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_7c33_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_d868_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_7c33_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1454_c7_00d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6102_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_00d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6102_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_00d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6102_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_00d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6102_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_00d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6102_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_00d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6102_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_00d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6102_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_00d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6102_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_00d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6102_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1454_c7_00d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_6102_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_b24f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_a801_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_b24f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_a801_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_b24f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_a801_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_b24f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_a801_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_b24f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_a801_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1460_c7_b24f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_a801_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1460_c7_b24f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_a801_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_95b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_2af3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_95b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_2af3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_95b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_2af3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_95b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_2af3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1467_c7_95b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_2af3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_f4f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1472_c11_aeb4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_f4f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1472_c11_aeb4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_f4f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1472_c11_aeb4_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1455_c3_dc62_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1445_l1455_DUPLICATE_bcf3_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1446_c3_93f1_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1445_l1455_DUPLICATE_bcf3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1423_DUPLICATE_06ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1423_DUPLICATE_06ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1423_DUPLICATE_06ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1423_DUPLICATE_06ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1423_DUPLICATE_06ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1423_DUPLICATE_06ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1423_DUPLICATE_06ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1454_l1440_l1444_l1467_l1472_DUPLICATE_7eb9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1454_l1440_l1444_l1467_l1472_DUPLICATE_7eb9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1454_l1440_l1444_l1467_l1472_DUPLICATE_7eb9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1454_l1440_l1444_l1467_l1472_DUPLICATE_7eb9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1454_l1440_l1444_l1467_l1472_DUPLICATE_7eb9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1454_l1440_l1444_l1467_l1472_DUPLICATE_7eb9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_b24f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1454_l1440_l1444_l1467_l1472_DUPLICATE_7eb9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_95b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1454_l1440_l1444_l1467_l1472_DUPLICATE_7eb9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_f4f2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1454_l1440_l1444_l1467_l1472_DUPLICATE_7eb9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1440_l1444_l1423_DUPLICATE_f4bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1440_l1444_l1423_DUPLICATE_f4bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1440_l1444_l1423_DUPLICATE_f4bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1440_l1444_l1423_DUPLICATE_f4bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1440_l1444_l1423_DUPLICATE_f4bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1440_l1444_l1423_DUPLICATE_f4bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_b24f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1440_l1444_l1423_DUPLICATE_f4bf_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1454_l1440_l1444_l1467_l1472_DUPLICATE_d4cf_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1454_l1440_l1444_l1467_l1472_DUPLICATE_d4cf_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1454_l1440_l1444_l1467_l1472_DUPLICATE_d4cf_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1454_l1440_l1444_l1467_l1472_DUPLICATE_d4cf_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1454_l1440_l1444_l1467_l1472_DUPLICATE_d4cf_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1454_l1440_l1444_l1467_l1472_DUPLICATE_d4cf_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_b24f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1454_l1440_l1444_l1467_l1472_DUPLICATE_d4cf_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_95b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1454_l1440_l1444_l1467_l1472_DUPLICATE_d4cf_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_f4f2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1454_l1440_l1444_l1467_l1472_DUPLICATE_d4cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1472_DUPLICATE_9fb7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1472_DUPLICATE_9fb7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1472_DUPLICATE_9fb7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1472_DUPLICATE_9fb7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1472_DUPLICATE_9fb7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1472_DUPLICATE_9fb7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_f4f2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1472_DUPLICATE_9fb7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1467_l1454_DUPLICATE_b760_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_95b7_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1467_l1454_DUPLICATE_b760_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1467_l1423_DUPLICATE_1bbc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1467_l1423_DUPLICATE_1bbc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1467_l1423_DUPLICATE_1bbc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1467_l1423_DUPLICATE_1bbc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1467_l1423_DUPLICATE_1bbc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1467_l1423_DUPLICATE_1bbc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1467_l1423_DUPLICATE_1bbc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1467_c7_95b7_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1467_l1423_DUPLICATE_1bbc_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l1461_c12_a59c_right := VAR_CONST_SR_4_uxn_opcodes_h_l1461_c36_8864_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1454_c7_00d9_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l1470_c24_0dfd] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1470_c24_0dfd_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1470_c34_dacc_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1472_c7_f4f2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_f4f2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_f4f2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_f4f2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_f4f2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_f4f2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_f4f2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_f4f2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_f4f2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1460_c7_b24f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_b24f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_b24f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_b24f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_b24f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_b24f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_b24f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_b24f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_b24f_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1458_c32_618d] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1458_c32_618d_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1458_c32_618d_left;
     BIN_OP_GT_uxn_opcodes_h_l1458_c32_618d_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1458_c32_618d_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1458_c32_618d_return_output := BIN_OP_GT_uxn_opcodes_h_l1458_c32_618d_return_output;

     -- BIN_OP_SR[uxn_opcodes_h_l1461_c12_b17a] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l1461_c12_b17a_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l1461_c12_b17a_left;
     BIN_OP_SR_uxn_opcodes_h_l1461_c12_b17a_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l1461_c12_b17a_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l1461_c12_b17a_return_output := BIN_OP_SR_uxn_opcodes_h_l1461_c12_b17a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1454_c7_00d9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_00d9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_00d9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1467_c7_95b7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_95b7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_95b7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_95b7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_95b7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_95b7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_95b7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_95b7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_95b7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1472_c7_f4f2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_f4f2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_f4f2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_f4f2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_f4f2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_f4f2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_f4f2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_f4f2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_f4f2_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1446_c3_93f1] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1446_c3_93f1_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1446_c3_93f1_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1446_c3_93f1_return_output := CONST_SL_8_uxn_opcodes_h_l1446_c3_93f1_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1455_c3_dc62] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1455_c3_dc62_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1455_c3_dc62_left;
     BIN_OP_OR_uxn_opcodes_h_l1455_c3_dc62_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1455_c3_dc62_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1455_c3_dc62_return_output := BIN_OP_OR_uxn_opcodes_h_l1455_c3_dc62_return_output;

     -- t8_MUX[uxn_opcodes_h_l1435_c7_5951] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1435_c7_5951_cond <= VAR_t8_MUX_uxn_opcodes_h_l1435_c7_5951_cond;
     t8_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue;
     t8_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1435_c7_5951_return_output := t8_MUX_uxn_opcodes_h_l1435_c7_5951_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1472_c7_f4f2] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_f4f2_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_f4f2_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_f4f2_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_f4f2_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_f4f2_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_f4f2_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_f4f2_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_f4f2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1423_c1_6572] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_6572_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_6572_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_6572_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_6572_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_6572_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_6572_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_6572_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_6572_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1458_c32_d392_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1458_c32_618d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1455_c3_dc62_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l1461_c12_a59c_left := VAR_BIN_OP_SR_uxn_opcodes_h_l1461_c12_b17a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1467_c7_95b7_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1470_c24_0dfd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1446_c3_93f1_return_output;
     VAR_printf_uxn_opcodes_h_l1424_c3_3bb4_uxn_opcodes_h_l1424_c3_3bb4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_6572_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_95b7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_f4f2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_b24f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_95b7_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_f4f2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_95b7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_f4f2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_b24f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_95b7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1435_c7_5951_return_output;
     -- n16_MUX[uxn_opcodes_h_l1454_c7_00d9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1454_c7_00d9_cond <= VAR_n16_MUX_uxn_opcodes_h_l1454_c7_00d9_cond;
     n16_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue;
     n16_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output := n16_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output;

     -- t8_MUX[uxn_opcodes_h_l1431_c7_f941] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1431_c7_f941_cond <= VAR_t8_MUX_uxn_opcodes_h_l1431_c7_f941_cond;
     t8_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue;
     t8_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1431_c7_f941_return_output := t8_MUX_uxn_opcodes_h_l1431_c7_f941_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1454_c7_00d9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_00d9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_00d9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output;

     -- BIN_OP_SL[uxn_opcodes_h_l1461_c12_a59c] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l1461_c12_a59c_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l1461_c12_a59c_left;
     BIN_OP_SL_uxn_opcodes_h_l1461_c12_a59c_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l1461_c12_a59c_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l1461_c12_a59c_return_output := BIN_OP_SL_uxn_opcodes_h_l1461_c12_a59c_return_output;

     -- MUX[uxn_opcodes_h_l1458_c32_d392] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1458_c32_d392_cond <= VAR_MUX_uxn_opcodes_h_l1458_c32_d392_cond;
     MUX_uxn_opcodes_h_l1458_c32_d392_iftrue <= VAR_MUX_uxn_opcodes_h_l1458_c32_d392_iftrue;
     MUX_uxn_opcodes_h_l1458_c32_d392_iffalse <= VAR_MUX_uxn_opcodes_h_l1458_c32_d392_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1458_c32_d392_return_output := MUX_uxn_opcodes_h_l1458_c32_d392_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1450_c7_d868] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_d868_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_d868_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_d868_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_d868_return_output;

     -- printf_uxn_opcodes_h_l1424_c3_3bb4[uxn_opcodes_h_l1424_c3_3bb4] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1424_c3_3bb4_uxn_opcodes_h_l1424_c3_3bb4_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1424_c3_3bb4_uxn_opcodes_h_l1424_c3_3bb4_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1467_c7_95b7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_95b7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_95b7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_95b7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_95b7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_95b7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_95b7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_95b7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_95b7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1460_c7_b24f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_b24f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_b24f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_b24f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_b24f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_b24f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_b24f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_b24f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_b24f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1467_c7_95b7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1467_c7_95b7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1467_c7_95b7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1467_c7_95b7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1467_c7_95b7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1467_c7_95b7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1467_c7_95b7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1467_c7_95b7_return_output := result_stack_value_MUX_uxn_opcodes_h_l1467_c7_95b7_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1467_c7_95b7] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_95b7_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_95b7_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_95b7_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_95b7_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_95b7_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_95b7_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_95b7_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_95b7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1467_c7_95b7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_95b7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_95b7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_95b7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_95b7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_95b7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_95b7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_95b7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_95b7_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1460_c7_b24f_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l1461_c12_a59c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue := VAR_MUX_uxn_opcodes_h_l1458_c32_d392_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_b24f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_95b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_b24f_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_95b7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_d868_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_b24f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_95b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_b24f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1460_c7_b24f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1467_c7_95b7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1431_c7_f941_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1460_c7_b24f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_b24f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_b24f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_b24f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_b24f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_b24f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_b24f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_b24f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_b24f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1460_c7_b24f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_b24f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_b24f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_b24f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_b24f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_b24f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_b24f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_b24f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_b24f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1460_c7_b24f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1460_c7_b24f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1460_c7_b24f_cond;
     tmp16_MUX_uxn_opcodes_h_l1460_c7_b24f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1460_c7_b24f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1460_c7_b24f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1460_c7_b24f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1460_c7_b24f_return_output := tmp16_MUX_uxn_opcodes_h_l1460_c7_b24f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1454_c7_00d9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_00d9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_00d9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1460_c7_b24f] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_b24f_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_b24f_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_b24f_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_b24f_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_b24f_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_b24f_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_b24f_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_b24f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1450_c7_d868] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1450_c7_d868_cond <= VAR_n16_MUX_uxn_opcodes_h_l1450_c7_d868_cond;
     n16_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue;
     n16_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1450_c7_d868_return_output := n16_MUX_uxn_opcodes_h_l1450_c7_d868_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1444_c7_4706] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4706_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4706_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4706_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4706_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1454_c7_00d9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_00d9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_00d9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output;

     -- t8_MUX[uxn_opcodes_h_l1423_c2_7a4d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond <= VAR_t8_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond;
     t8_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue;
     t8_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output := t8_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1465_c24_7cea] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1465_c24_7cea_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_SL_uxn_opcodes_h_l1461_c12_a59c_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1450_c7_d868] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_d868_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_d868_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_d868_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_d868_return_output;

     -- Submodule level 4
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1460_c7_b24f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1465_c24_7cea_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1450_c7_d868_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_b24f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_d868_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_b24f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_4706_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_b24f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1460_c7_b24f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1454_c7_00d9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_00d9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_00d9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1450_c7_d868] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_d868_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_d868_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_d868_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_d868_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1440_c7_80fe] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_80fe_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_80fe_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1460_c7_b24f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1460_c7_b24f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1460_c7_b24f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1460_c7_b24f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1460_c7_b24f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1460_c7_b24f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1460_c7_b24f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1460_c7_b24f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1460_c7_b24f_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1454_c7_00d9] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_00d9_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_00d9_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output;

     -- n16_MUX[uxn_opcodes_h_l1444_c7_4706] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1444_c7_4706_cond <= VAR_n16_MUX_uxn_opcodes_h_l1444_c7_4706_cond;
     n16_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue;
     n16_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1444_c7_4706_return_output := n16_MUX_uxn_opcodes_h_l1444_c7_4706_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1454_c7_00d9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_00d9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_00d9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1454_c7_00d9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1454_c7_00d9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1454_c7_00d9_cond;
     tmp16_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output := tmp16_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1444_c7_4706] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4706_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4706_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4706_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4706_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1450_c7_d868] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_d868_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_d868_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_d868_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_d868_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1444_c7_4706_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_4706_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_d868_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_d868_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1460_c7_b24f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1435_c7_5951] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_5951_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_5951_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_5951_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_5951_return_output;

     -- n16_MUX[uxn_opcodes_h_l1440_c7_80fe] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1440_c7_80fe_cond <= VAR_n16_MUX_uxn_opcodes_h_l1440_c7_80fe_cond;
     n16_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue;
     n16_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output := n16_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1450_c7_d868] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_d868_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_d868_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_d868_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_d868_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1450_c7_d868] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1450_c7_d868_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_d868_cond;
     tmp16_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_d868_return_output := tmp16_MUX_uxn_opcodes_h_l1450_c7_d868_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1450_c7_d868] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_d868_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_d868_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_d868_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_d868_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1444_c7_4706] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4706_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4706_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4706_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4706_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1440_c7_80fe] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_80fe_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_80fe_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1450_c7_d868] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_d868_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_d868_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_d868_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_d868_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1444_c7_4706] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4706_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4706_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4706_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4706_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1454_c7_00d9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1454_c7_00d9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_00d9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_00d9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_00d9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output := result_stack_value_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_d868_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_d868_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_5951_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_d868_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_4706_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_4706_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_00d9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_d868_return_output;
     -- n16_MUX[uxn_opcodes_h_l1435_c7_5951] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1435_c7_5951_cond <= VAR_n16_MUX_uxn_opcodes_h_l1435_c7_5951_cond;
     n16_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue;
     n16_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1435_c7_5951_return_output := n16_MUX_uxn_opcodes_h_l1435_c7_5951_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1431_c7_f941] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_f941_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_f941_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_f941_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_f941_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1444_c7_4706] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4706_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4706_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4706_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4706_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1440_c7_80fe] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_80fe_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_80fe_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1444_c7_4706] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1444_c7_4706_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_4706_cond;
     tmp16_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_4706_return_output := tmp16_MUX_uxn_opcodes_h_l1444_c7_4706_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1444_c7_4706] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4706_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4706_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4706_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4706_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1435_c7_5951] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_5951_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_5951_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_5951_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_5951_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1450_c7_d868] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1450_c7_d868_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_d868_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_d868_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_d868_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_d868_return_output := result_stack_value_MUX_uxn_opcodes_h_l1450_c7_d868_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1444_c7_4706] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4706_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4706_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4706_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4706_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1440_c7_80fe] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_80fe_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_80fe_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1435_c7_5951_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_4706_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_5951_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_4706_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_f941_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_4706_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_d868_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_4706_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1440_c7_80fe] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_80fe_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_80fe_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1444_c7_4706] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4706_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4706_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4706_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4706_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4706_return_output := result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4706_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1440_c7_80fe] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1440_c7_80fe_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1440_c7_80fe_cond;
     tmp16_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output := tmp16_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output;

     -- n16_MUX[uxn_opcodes_h_l1431_c7_f941] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1431_c7_f941_cond <= VAR_n16_MUX_uxn_opcodes_h_l1431_c7_f941_cond;
     n16_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue;
     n16_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1431_c7_f941_return_output := n16_MUX_uxn_opcodes_h_l1431_c7_f941_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1431_c7_f941] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_f941_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_f941_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_f941_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_f941_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1435_c7_5951] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_5951_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_5951_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_5951_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_5951_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1435_c7_5951] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_5951_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_5951_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_5951_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_5951_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1440_c7_80fe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_80fe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_80fe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1423_c2_7a4d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1440_c7_80fe] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_80fe_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_80fe_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1431_c7_f941_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_f941_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_5951_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_5951_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_4706_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1431_c7_f941] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_f941_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_f941_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_f941_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_f941_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1435_c7_5951] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_5951_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_5951_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_5951_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_5951_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1431_c7_f941] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_f941_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_f941_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_f941_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_f941_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1423_c2_7a4d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1435_c7_5951] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1435_c7_5951_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1435_c7_5951_cond;
     tmp16_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1435_c7_5951_return_output := tmp16_MUX_uxn_opcodes_h_l1435_c7_5951_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1440_c7_80fe] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1440_c7_80fe_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_80fe_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_80fe_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_80fe_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output := result_stack_value_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output;

     -- n16_MUX[uxn_opcodes_h_l1423_c2_7a4d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond;
     n16_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue;
     n16_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output := n16_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1435_c7_5951] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_5951_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_5951_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_5951_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_5951_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1435_c7_5951] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_5951_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_5951_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_5951_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_5951_return_output;

     -- Submodule level 9
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_5951_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_5951_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_5951_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_f941_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_f941_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_80fe_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1435_c7_5951_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1431_c7_f941] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1431_c7_f941_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1431_c7_f941_cond;
     tmp16_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1431_c7_f941_return_output := tmp16_MUX_uxn_opcodes_h_l1431_c7_f941_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1431_c7_f941] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_f941_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_f941_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_f941_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_f941_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1431_c7_f941] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_f941_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_f941_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_f941_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_f941_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1423_c2_7a4d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1431_c7_f941] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_f941_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_f941_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_f941_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_f941_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1423_c2_7a4d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1435_c7_5951] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1435_c7_5951_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1435_c7_5951_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1435_c7_5951_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1435_c7_5951_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1435_c7_5951_return_output := result_stack_value_MUX_uxn_opcodes_h_l1435_c7_5951_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_f941_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_f941_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_f941_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1435_c7_5951_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1431_c7_f941_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1423_c2_7a4d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond;
     tmp16_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output := tmp16_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1423_c2_7a4d] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1423_c2_7a4d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1423_c2_7a4d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1431_c7_f941] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1431_c7_f941_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c7_f941_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c7_f941_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c7_f941_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c7_f941_return_output := result_stack_value_MUX_uxn_opcodes_h_l1431_c7_f941_return_output;

     -- Submodule level 11
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c7_f941_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1423_c2_7a4d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1423_c2_7a4d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1423_c2_7a4d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1423_c2_7a4d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1478_l1418_DUPLICATE_ac0d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1478_l1418_DUPLICATE_ac0d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_49dd(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_7a4d_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1478_l1418_DUPLICATE_ac0d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1478_l1418_DUPLICATE_ac0d_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
