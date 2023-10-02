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
-- BIN_OP_EQ[uxn_opcodes_h_l1423_c6_81f6]
signal BIN_OP_EQ_uxn_opcodes_h_l1423_c6_81f6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1423_c6_81f6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1423_c6_81f6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1423_c1_0e14]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_0e14_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_0e14_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_0e14_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_0e14_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1423_c2_9846]
signal n16_MUX_uxn_opcodes_h_l1423_c2_9846_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1423_c2_9846_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1423_c2_9846]
signal t8_MUX_uxn_opcodes_h_l1423_c2_9846_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1423_c2_9846_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1423_c2_9846]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_9846_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_9846_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1423_c2_9846]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_9846_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_9846_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1423_c2_9846]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_9846_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_9846_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1423_c2_9846]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_9846_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_9846_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1423_c2_9846]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_9846_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_9846_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1423_c2_9846]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_9846_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_9846_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1423_c2_9846]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_9846_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_9846_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1423_c2_9846]
signal result_stack_value_MUX_uxn_opcodes_h_l1423_c2_9846_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1423_c2_9846_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1423_c2_9846]
signal tmp16_MUX_uxn_opcodes_h_l1423_c2_9846_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1423_c2_9846_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1424_c3_7119[uxn_opcodes_h_l1424_c3_7119]
signal printf_uxn_opcodes_h_l1424_c3_7119_uxn_opcodes_h_l1424_c3_7119_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1431_c11_ca8b]
signal BIN_OP_EQ_uxn_opcodes_h_l1431_c11_ca8b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1431_c11_ca8b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1431_c11_ca8b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1431_c7_b4dc]
signal n16_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1431_c7_b4dc]
signal t8_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1431_c7_b4dc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1431_c7_b4dc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1431_c7_b4dc]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1431_c7_b4dc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1431_c7_b4dc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1431_c7_b4dc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1431_c7_b4dc]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1431_c7_b4dc]
signal result_stack_value_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1431_c7_b4dc]
signal tmp16_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1435_c11_06ed]
signal BIN_OP_EQ_uxn_opcodes_h_l1435_c11_06ed_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1435_c11_06ed_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1435_c11_06ed_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1435_c7_98fb]
signal n16_MUX_uxn_opcodes_h_l1435_c7_98fb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1435_c7_98fb]
signal t8_MUX_uxn_opcodes_h_l1435_c7_98fb_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1435_c7_98fb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_98fb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1435_c7_98fb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_98fb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1435_c7_98fb]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_98fb_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1435_c7_98fb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_98fb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1435_c7_98fb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_98fb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1435_c7_98fb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_98fb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1435_c7_98fb]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_98fb_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1435_c7_98fb]
signal result_stack_value_MUX_uxn_opcodes_h_l1435_c7_98fb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1435_c7_98fb]
signal tmp16_MUX_uxn_opcodes_h_l1435_c7_98fb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1440_c11_aced]
signal BIN_OP_EQ_uxn_opcodes_h_l1440_c11_aced_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1440_c11_aced_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1440_c11_aced_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1440_c7_5039]
signal n16_MUX_uxn_opcodes_h_l1440_c7_5039_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1440_c7_5039_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1440_c7_5039]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_5039_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_5039_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1440_c7_5039]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_5039_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_5039_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1440_c7_5039]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_5039_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_5039_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1440_c7_5039]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_5039_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_5039_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1440_c7_5039]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_5039_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_5039_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1440_c7_5039]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_5039_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_5039_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1440_c7_5039]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_5039_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_5039_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1440_c7_5039]
signal result_stack_value_MUX_uxn_opcodes_h_l1440_c7_5039_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1440_c7_5039_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1440_c7_5039]
signal tmp16_MUX_uxn_opcodes_h_l1440_c7_5039_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1440_c7_5039_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1444_c11_7c41]
signal BIN_OP_EQ_uxn_opcodes_h_l1444_c11_7c41_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1444_c11_7c41_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1444_c11_7c41_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1444_c7_820a]
signal n16_MUX_uxn_opcodes_h_l1444_c7_820a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1444_c7_820a_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1444_c7_820a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_820a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_820a_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1444_c7_820a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_820a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_820a_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1444_c7_820a]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_820a_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_820a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1444_c7_820a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_820a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_820a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1444_c7_820a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_820a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_820a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1444_c7_820a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_820a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_820a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1444_c7_820a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_820a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_820a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1444_c7_820a]
signal result_stack_value_MUX_uxn_opcodes_h_l1444_c7_820a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1444_c7_820a_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1444_c7_820a]
signal tmp16_MUX_uxn_opcodes_h_l1444_c7_820a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1444_c7_820a_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1446_c3_585d]
signal CONST_SL_8_uxn_opcodes_h_l1446_c3_585d_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1446_c3_585d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1450_c11_26fd]
signal BIN_OP_EQ_uxn_opcodes_h_l1450_c11_26fd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1450_c11_26fd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1450_c11_26fd_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1450_c7_214e]
signal n16_MUX_uxn_opcodes_h_l1450_c7_214e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1450_c7_214e_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1450_c7_214e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_214e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_214e_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1450_c7_214e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_214e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_214e_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1450_c7_214e]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_214e_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_214e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1450_c7_214e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_214e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_214e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1450_c7_214e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_214e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_214e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1450_c7_214e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_214e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_214e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1450_c7_214e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_214e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_214e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1450_c7_214e]
signal result_stack_value_MUX_uxn_opcodes_h_l1450_c7_214e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1450_c7_214e_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1450_c7_214e]
signal tmp16_MUX_uxn_opcodes_h_l1450_c7_214e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1450_c7_214e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1454_c11_23da]
signal BIN_OP_EQ_uxn_opcodes_h_l1454_c11_23da_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1454_c11_23da_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1454_c11_23da_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1454_c7_4732]
signal n16_MUX_uxn_opcodes_h_l1454_c7_4732_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1454_c7_4732_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1454_c7_4732]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_4732_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_4732_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1454_c7_4732]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_4732_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_4732_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1454_c7_4732]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_4732_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_4732_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1454_c7_4732]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_4732_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_4732_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1454_c7_4732]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_4732_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_4732_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1454_c7_4732]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_4732_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_4732_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1454_c7_4732]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_4732_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_4732_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1454_c7_4732]
signal result_stack_value_MUX_uxn_opcodes_h_l1454_c7_4732_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1454_c7_4732_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1454_c7_4732]
signal tmp16_MUX_uxn_opcodes_h_l1454_c7_4732_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1454_c7_4732_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1455_c3_d706]
signal BIN_OP_OR_uxn_opcodes_h_l1455_c3_d706_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1455_c3_d706_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1455_c3_d706_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1458_c32_8033]
signal BIN_OP_AND_uxn_opcodes_h_l1458_c32_8033_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1458_c32_8033_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1458_c32_8033_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1458_c32_9b5e]
signal BIN_OP_GT_uxn_opcodes_h_l1458_c32_9b5e_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1458_c32_9b5e_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1458_c32_9b5e_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1458_c32_0557]
signal MUX_uxn_opcodes_h_l1458_c32_0557_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1458_c32_0557_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1458_c32_0557_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1458_c32_0557_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1460_c11_6e28]
signal BIN_OP_EQ_uxn_opcodes_h_l1460_c11_6e28_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1460_c11_6e28_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1460_c11_6e28_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1460_c7_73fe]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_73fe_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_73fe_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_73fe_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_73fe_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1460_c7_73fe]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_73fe_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_73fe_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_73fe_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_73fe_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1460_c7_73fe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_73fe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_73fe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_73fe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_73fe_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1460_c7_73fe]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_73fe_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_73fe_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_73fe_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_73fe_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1460_c7_73fe]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_73fe_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_73fe_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_73fe_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_73fe_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1460_c7_73fe]
signal result_stack_value_MUX_uxn_opcodes_h_l1460_c7_73fe_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1460_c7_73fe_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1460_c7_73fe_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1460_c7_73fe_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1460_c7_73fe]
signal tmp16_MUX_uxn_opcodes_h_l1460_c7_73fe_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1460_c7_73fe_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1460_c7_73fe_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1460_c7_73fe_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1461_c20_bca8]
signal BIN_OP_AND_uxn_opcodes_h_l1461_c20_bca8_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1461_c20_bca8_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1461_c20_bca8_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l1461_c12_8bc2]
signal BIN_OP_SR_uxn_opcodes_h_l1461_c12_8bc2_left : unsigned(15 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l1461_c12_8bc2_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l1461_c12_8bc2_return_output : unsigned(15 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l1461_c36_2a4c]
signal CONST_SR_4_uxn_opcodes_h_l1461_c36_2a4c_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l1461_c36_2a4c_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l1461_c12_e63d]
signal BIN_OP_SL_uxn_opcodes_h_l1461_c12_e63d_left : unsigned(15 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l1461_c12_e63d_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l1461_c12_e63d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1467_c11_8d2a]
signal BIN_OP_EQ_uxn_opcodes_h_l1467_c11_8d2a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1467_c11_8d2a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1467_c11_8d2a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1467_c7_e92c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_e92c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_e92c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_e92c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_e92c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1467_c7_e92c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_e92c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_e92c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_e92c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_e92c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1467_c7_e92c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_e92c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_e92c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_e92c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_e92c_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1467_c7_e92c]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_e92c_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_e92c_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_e92c_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_e92c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1467_c7_e92c]
signal result_stack_value_MUX_uxn_opcodes_h_l1467_c7_e92c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1467_c7_e92c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1467_c7_e92c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1467_c7_e92c_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1470_c34_277d]
signal CONST_SR_8_uxn_opcodes_h_l1470_c34_277d_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1470_c34_277d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1472_c11_02d8]
signal BIN_OP_EQ_uxn_opcodes_h_l1472_c11_02d8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1472_c11_02d8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1472_c11_02d8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1472_c7_cad6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_cad6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_cad6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_cad6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_cad6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1472_c7_cad6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_cad6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_cad6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_cad6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_cad6_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1472_c7_cad6]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_cad6_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_cad6_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_cad6_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_cad6_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_9a35( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.is_stack_read := ref_toks_7;
      base.stack_value := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1423_c6_81f6
BIN_OP_EQ_uxn_opcodes_h_l1423_c6_81f6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1423_c6_81f6_left,
BIN_OP_EQ_uxn_opcodes_h_l1423_c6_81f6_right,
BIN_OP_EQ_uxn_opcodes_h_l1423_c6_81f6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_0e14
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_0e14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_0e14_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_0e14_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_0e14_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_0e14_return_output);

-- n16_MUX_uxn_opcodes_h_l1423_c2_9846
n16_MUX_uxn_opcodes_h_l1423_c2_9846 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1423_c2_9846_cond,
n16_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue,
n16_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse,
n16_MUX_uxn_opcodes_h_l1423_c2_9846_return_output);

-- t8_MUX_uxn_opcodes_h_l1423_c2_9846
t8_MUX_uxn_opcodes_h_l1423_c2_9846 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1423_c2_9846_cond,
t8_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue,
t8_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse,
t8_MUX_uxn_opcodes_h_l1423_c2_9846_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_9846
result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_9846 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_9846_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_9846_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_9846
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_9846 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_9846_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_9846_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_9846
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_9846 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_9846_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_9846_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_9846
result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_9846 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_9846_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_9846_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_9846
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_9846 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_9846_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_9846_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_9846
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_9846 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_9846_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_9846_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_9846
result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_9846 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_9846_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_9846_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1423_c2_9846
result_stack_value_MUX_uxn_opcodes_h_l1423_c2_9846 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1423_c2_9846_cond,
result_stack_value_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1423_c2_9846_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1423_c2_9846
tmp16_MUX_uxn_opcodes_h_l1423_c2_9846 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1423_c2_9846_cond,
tmp16_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue,
tmp16_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse,
tmp16_MUX_uxn_opcodes_h_l1423_c2_9846_return_output);

-- printf_uxn_opcodes_h_l1424_c3_7119_uxn_opcodes_h_l1424_c3_7119
printf_uxn_opcodes_h_l1424_c3_7119_uxn_opcodes_h_l1424_c3_7119 : entity work.printf_uxn_opcodes_h_l1424_c3_7119_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1424_c3_7119_uxn_opcodes_h_l1424_c3_7119_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1431_c11_ca8b
BIN_OP_EQ_uxn_opcodes_h_l1431_c11_ca8b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1431_c11_ca8b_left,
BIN_OP_EQ_uxn_opcodes_h_l1431_c11_ca8b_right,
BIN_OP_EQ_uxn_opcodes_h_l1431_c11_ca8b_return_output);

-- n16_MUX_uxn_opcodes_h_l1431_c7_b4dc
n16_MUX_uxn_opcodes_h_l1431_c7_b4dc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond,
n16_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue,
n16_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse,
n16_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output);

-- t8_MUX_uxn_opcodes_h_l1431_c7_b4dc
t8_MUX_uxn_opcodes_h_l1431_c7_b4dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond,
t8_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue,
t8_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse,
t8_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc
result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_b4dc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_b4dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_b4dc
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_b4dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc
result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_b4dc
result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_b4dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_b4dc
result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_b4dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_b4dc
result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_b4dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1431_c7_b4dc
result_stack_value_MUX_uxn_opcodes_h_l1431_c7_b4dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond,
result_stack_value_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1431_c7_b4dc
tmp16_MUX_uxn_opcodes_h_l1431_c7_b4dc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond,
tmp16_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue,
tmp16_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse,
tmp16_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1435_c11_06ed
BIN_OP_EQ_uxn_opcodes_h_l1435_c11_06ed : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1435_c11_06ed_left,
BIN_OP_EQ_uxn_opcodes_h_l1435_c11_06ed_right,
BIN_OP_EQ_uxn_opcodes_h_l1435_c11_06ed_return_output);

-- n16_MUX_uxn_opcodes_h_l1435_c7_98fb
n16_MUX_uxn_opcodes_h_l1435_c7_98fb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1435_c7_98fb_cond,
n16_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue,
n16_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse,
n16_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output);

-- t8_MUX_uxn_opcodes_h_l1435_c7_98fb
t8_MUX_uxn_opcodes_h_l1435_c7_98fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1435_c7_98fb_cond,
t8_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue,
t8_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse,
t8_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_98fb
result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_98fb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_98fb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_98fb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_98fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_98fb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_98fb
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_98fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_98fb_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_98fb
result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_98fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_98fb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_98fb
result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_98fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_98fb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_98fb
result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_98fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_98fb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_98fb
result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_98fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_98fb_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1435_c7_98fb
result_stack_value_MUX_uxn_opcodes_h_l1435_c7_98fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1435_c7_98fb_cond,
result_stack_value_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1435_c7_98fb
tmp16_MUX_uxn_opcodes_h_l1435_c7_98fb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1435_c7_98fb_cond,
tmp16_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue,
tmp16_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse,
tmp16_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1440_c11_aced
BIN_OP_EQ_uxn_opcodes_h_l1440_c11_aced : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1440_c11_aced_left,
BIN_OP_EQ_uxn_opcodes_h_l1440_c11_aced_right,
BIN_OP_EQ_uxn_opcodes_h_l1440_c11_aced_return_output);

-- n16_MUX_uxn_opcodes_h_l1440_c7_5039
n16_MUX_uxn_opcodes_h_l1440_c7_5039 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1440_c7_5039_cond,
n16_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue,
n16_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse,
n16_MUX_uxn_opcodes_h_l1440_c7_5039_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_5039
result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_5039 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_5039_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_5039_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_5039
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_5039 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_5039_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_5039_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_5039
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_5039 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_5039_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_5039_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_5039
result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_5039 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_5039_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_5039_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_5039
result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_5039 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_5039_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_5039_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_5039
result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_5039 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_5039_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_5039_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_5039
result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_5039 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_5039_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_5039_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1440_c7_5039
result_stack_value_MUX_uxn_opcodes_h_l1440_c7_5039 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1440_c7_5039_cond,
result_stack_value_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1440_c7_5039_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1440_c7_5039
tmp16_MUX_uxn_opcodes_h_l1440_c7_5039 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1440_c7_5039_cond,
tmp16_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue,
tmp16_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse,
tmp16_MUX_uxn_opcodes_h_l1440_c7_5039_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1444_c11_7c41
BIN_OP_EQ_uxn_opcodes_h_l1444_c11_7c41 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1444_c11_7c41_left,
BIN_OP_EQ_uxn_opcodes_h_l1444_c11_7c41_right,
BIN_OP_EQ_uxn_opcodes_h_l1444_c11_7c41_return_output);

-- n16_MUX_uxn_opcodes_h_l1444_c7_820a
n16_MUX_uxn_opcodes_h_l1444_c7_820a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1444_c7_820a_cond,
n16_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue,
n16_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse,
n16_MUX_uxn_opcodes_h_l1444_c7_820a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_820a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_820a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_820a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_820a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_820a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_820a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_820a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_820a_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_820a
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_820a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_820a_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_820a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_820a
result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_820a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_820a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_820a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_820a
result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_820a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_820a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_820a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_820a
result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_820a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_820a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_820a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_820a
result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_820a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_820a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_820a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1444_c7_820a
result_stack_value_MUX_uxn_opcodes_h_l1444_c7_820a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1444_c7_820a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1444_c7_820a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1444_c7_820a
tmp16_MUX_uxn_opcodes_h_l1444_c7_820a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1444_c7_820a_cond,
tmp16_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1444_c7_820a_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1446_c3_585d
CONST_SL_8_uxn_opcodes_h_l1446_c3_585d : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1446_c3_585d_x,
CONST_SL_8_uxn_opcodes_h_l1446_c3_585d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1450_c11_26fd
BIN_OP_EQ_uxn_opcodes_h_l1450_c11_26fd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1450_c11_26fd_left,
BIN_OP_EQ_uxn_opcodes_h_l1450_c11_26fd_right,
BIN_OP_EQ_uxn_opcodes_h_l1450_c11_26fd_return_output);

-- n16_MUX_uxn_opcodes_h_l1450_c7_214e
n16_MUX_uxn_opcodes_h_l1450_c7_214e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1450_c7_214e_cond,
n16_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue,
n16_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse,
n16_MUX_uxn_opcodes_h_l1450_c7_214e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_214e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_214e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_214e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_214e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_214e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_214e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_214e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_214e_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_214e
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_214e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_214e_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_214e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_214e
result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_214e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_214e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_214e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_214e
result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_214e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_214e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_214e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_214e
result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_214e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_214e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_214e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_214e
result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_214e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_214e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_214e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1450_c7_214e
result_stack_value_MUX_uxn_opcodes_h_l1450_c7_214e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1450_c7_214e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1450_c7_214e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1450_c7_214e
tmp16_MUX_uxn_opcodes_h_l1450_c7_214e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1450_c7_214e_cond,
tmp16_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1450_c7_214e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1454_c11_23da
BIN_OP_EQ_uxn_opcodes_h_l1454_c11_23da : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1454_c11_23da_left,
BIN_OP_EQ_uxn_opcodes_h_l1454_c11_23da_right,
BIN_OP_EQ_uxn_opcodes_h_l1454_c11_23da_return_output);

-- n16_MUX_uxn_opcodes_h_l1454_c7_4732
n16_MUX_uxn_opcodes_h_l1454_c7_4732 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1454_c7_4732_cond,
n16_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue,
n16_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse,
n16_MUX_uxn_opcodes_h_l1454_c7_4732_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_4732
result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_4732 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_4732_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_4732_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_4732
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_4732 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_4732_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_4732_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_4732
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_4732 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_4732_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_4732_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_4732
result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_4732 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_4732_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_4732_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_4732
result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_4732 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_4732_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_4732_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_4732
result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_4732 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_4732_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_4732_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_4732
result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_4732 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_4732_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_4732_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1454_c7_4732
result_stack_value_MUX_uxn_opcodes_h_l1454_c7_4732 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1454_c7_4732_cond,
result_stack_value_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1454_c7_4732_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1454_c7_4732
tmp16_MUX_uxn_opcodes_h_l1454_c7_4732 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1454_c7_4732_cond,
tmp16_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue,
tmp16_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse,
tmp16_MUX_uxn_opcodes_h_l1454_c7_4732_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1455_c3_d706
BIN_OP_OR_uxn_opcodes_h_l1455_c3_d706 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1455_c3_d706_left,
BIN_OP_OR_uxn_opcodes_h_l1455_c3_d706_right,
BIN_OP_OR_uxn_opcodes_h_l1455_c3_d706_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1458_c32_8033
BIN_OP_AND_uxn_opcodes_h_l1458_c32_8033 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1458_c32_8033_left,
BIN_OP_AND_uxn_opcodes_h_l1458_c32_8033_right,
BIN_OP_AND_uxn_opcodes_h_l1458_c32_8033_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1458_c32_9b5e
BIN_OP_GT_uxn_opcodes_h_l1458_c32_9b5e : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1458_c32_9b5e_left,
BIN_OP_GT_uxn_opcodes_h_l1458_c32_9b5e_right,
BIN_OP_GT_uxn_opcodes_h_l1458_c32_9b5e_return_output);

-- MUX_uxn_opcodes_h_l1458_c32_0557
MUX_uxn_opcodes_h_l1458_c32_0557 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1458_c32_0557_cond,
MUX_uxn_opcodes_h_l1458_c32_0557_iftrue,
MUX_uxn_opcodes_h_l1458_c32_0557_iffalse,
MUX_uxn_opcodes_h_l1458_c32_0557_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1460_c11_6e28
BIN_OP_EQ_uxn_opcodes_h_l1460_c11_6e28 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1460_c11_6e28_left,
BIN_OP_EQ_uxn_opcodes_h_l1460_c11_6e28_right,
BIN_OP_EQ_uxn_opcodes_h_l1460_c11_6e28_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_73fe
result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_73fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_73fe_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_73fe_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_73fe_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_73fe_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_73fe
result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_73fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_73fe_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_73fe_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_73fe_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_73fe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_73fe
result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_73fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_73fe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_73fe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_73fe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_73fe_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_73fe
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_73fe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_73fe_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_73fe_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_73fe_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_73fe_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_73fe
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_73fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_73fe_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_73fe_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_73fe_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_73fe_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1460_c7_73fe
result_stack_value_MUX_uxn_opcodes_h_l1460_c7_73fe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1460_c7_73fe_cond,
result_stack_value_MUX_uxn_opcodes_h_l1460_c7_73fe_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1460_c7_73fe_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1460_c7_73fe_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1460_c7_73fe
tmp16_MUX_uxn_opcodes_h_l1460_c7_73fe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1460_c7_73fe_cond,
tmp16_MUX_uxn_opcodes_h_l1460_c7_73fe_iftrue,
tmp16_MUX_uxn_opcodes_h_l1460_c7_73fe_iffalse,
tmp16_MUX_uxn_opcodes_h_l1460_c7_73fe_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1461_c20_bca8
BIN_OP_AND_uxn_opcodes_h_l1461_c20_bca8 : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1461_c20_bca8_left,
BIN_OP_AND_uxn_opcodes_h_l1461_c20_bca8_right,
BIN_OP_AND_uxn_opcodes_h_l1461_c20_bca8_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l1461_c12_8bc2
BIN_OP_SR_uxn_opcodes_h_l1461_c12_8bc2 : entity work.BIN_OP_SR_uint16_t_uint8_t_0CLK_295015b8 port map (
BIN_OP_SR_uxn_opcodes_h_l1461_c12_8bc2_left,
BIN_OP_SR_uxn_opcodes_h_l1461_c12_8bc2_right,
BIN_OP_SR_uxn_opcodes_h_l1461_c12_8bc2_return_output);

-- CONST_SR_4_uxn_opcodes_h_l1461_c36_2a4c
CONST_SR_4_uxn_opcodes_h_l1461_c36_2a4c : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l1461_c36_2a4c_x,
CONST_SR_4_uxn_opcodes_h_l1461_c36_2a4c_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l1461_c12_e63d
BIN_OP_SL_uxn_opcodes_h_l1461_c12_e63d : entity work.BIN_OP_SL_uint16_t_uint8_t_0CLK_b6546dec port map (
BIN_OP_SL_uxn_opcodes_h_l1461_c12_e63d_left,
BIN_OP_SL_uxn_opcodes_h_l1461_c12_e63d_right,
BIN_OP_SL_uxn_opcodes_h_l1461_c12_e63d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1467_c11_8d2a
BIN_OP_EQ_uxn_opcodes_h_l1467_c11_8d2a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1467_c11_8d2a_left,
BIN_OP_EQ_uxn_opcodes_h_l1467_c11_8d2a_right,
BIN_OP_EQ_uxn_opcodes_h_l1467_c11_8d2a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_e92c
result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_e92c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_e92c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_e92c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_e92c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_e92c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_e92c
result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_e92c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_e92c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_e92c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_e92c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_e92c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_e92c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_e92c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_e92c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_e92c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_e92c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_e92c_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_e92c
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_e92c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_e92c_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_e92c_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_e92c_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_e92c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1467_c7_e92c
result_stack_value_MUX_uxn_opcodes_h_l1467_c7_e92c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1467_c7_e92c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1467_c7_e92c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1467_c7_e92c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1467_c7_e92c_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1470_c34_277d
CONST_SR_8_uxn_opcodes_h_l1470_c34_277d : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1470_c34_277d_x,
CONST_SR_8_uxn_opcodes_h_l1470_c34_277d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1472_c11_02d8
BIN_OP_EQ_uxn_opcodes_h_l1472_c11_02d8 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1472_c11_02d8_left,
BIN_OP_EQ_uxn_opcodes_h_l1472_c11_02d8_right,
BIN_OP_EQ_uxn_opcodes_h_l1472_c11_02d8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_cad6
result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_cad6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_cad6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_cad6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_cad6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_cad6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_cad6
result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_cad6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_cad6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_cad6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_cad6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_cad6_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_cad6
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_cad6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_cad6_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_cad6_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_cad6_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_cad6_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1423_c6_81f6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_0e14_return_output,
 n16_MUX_uxn_opcodes_h_l1423_c2_9846_return_output,
 t8_MUX_uxn_opcodes_h_l1423_c2_9846_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_9846_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_9846_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_9846_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_9846_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_9846_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_9846_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_9846_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1423_c2_9846_return_output,
 tmp16_MUX_uxn_opcodes_h_l1423_c2_9846_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1431_c11_ca8b_return_output,
 n16_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output,
 t8_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output,
 tmp16_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1435_c11_06ed_return_output,
 n16_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output,
 t8_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output,
 tmp16_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1440_c11_aced_return_output,
 n16_MUX_uxn_opcodes_h_l1440_c7_5039_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_5039_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_5039_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_5039_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_5039_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_5039_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_5039_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_5039_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1440_c7_5039_return_output,
 tmp16_MUX_uxn_opcodes_h_l1440_c7_5039_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1444_c11_7c41_return_output,
 n16_MUX_uxn_opcodes_h_l1444_c7_820a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_820a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_820a_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_820a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_820a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_820a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_820a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_820a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1444_c7_820a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1444_c7_820a_return_output,
 CONST_SL_8_uxn_opcodes_h_l1446_c3_585d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1450_c11_26fd_return_output,
 n16_MUX_uxn_opcodes_h_l1450_c7_214e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_214e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_214e_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_214e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_214e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_214e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_214e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_214e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1450_c7_214e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1450_c7_214e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1454_c11_23da_return_output,
 n16_MUX_uxn_opcodes_h_l1454_c7_4732_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_4732_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_4732_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_4732_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_4732_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_4732_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_4732_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_4732_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1454_c7_4732_return_output,
 tmp16_MUX_uxn_opcodes_h_l1454_c7_4732_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1455_c3_d706_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1458_c32_8033_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1458_c32_9b5e_return_output,
 MUX_uxn_opcodes_h_l1458_c32_0557_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1460_c11_6e28_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_73fe_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_73fe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_73fe_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_73fe_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_73fe_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1460_c7_73fe_return_output,
 tmp16_MUX_uxn_opcodes_h_l1460_c7_73fe_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1461_c20_bca8_return_output,
 BIN_OP_SR_uxn_opcodes_h_l1461_c12_8bc2_return_output,
 CONST_SR_4_uxn_opcodes_h_l1461_c36_2a4c_return_output,
 BIN_OP_SL_uxn_opcodes_h_l1461_c12_e63d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1467_c11_8d2a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_e92c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_e92c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_e92c_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_e92c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1467_c7_e92c_return_output,
 CONST_SR_8_uxn_opcodes_h_l1470_c34_277d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1472_c11_02d8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_cad6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_cad6_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_cad6_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_81f6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_81f6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_81f6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_0e14_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_0e14_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_0e14_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_0e14_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1423_c2_9846_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1423_c2_9846_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1423_c2_9846_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1423_c2_9846_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_9846_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_9846_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1427_c3_e6da : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_9846_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_9846_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_9846_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_9846_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_9846_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_9846_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_9846_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_9846_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_9846_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_9846_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_9846_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_9846_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1423_c2_9846_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1423_c2_9846_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1423_c2_9846_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1423_c2_9846_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1424_c3_7119_uxn_opcodes_h_l1424_c3_7119_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_ca8b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_ca8b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_ca8b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1433_c3_78ad : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_06ed_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_06ed_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_06ed_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1440_c7_5039_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1435_c7_98fb_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1435_c7_98fb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_5039_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_98fb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1438_c3_9f4a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_5039_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_98fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_5039_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_98fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_5039_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_98fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_5039_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_98fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_5039_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_98fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_5039_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_98fb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_5039_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1435_c7_98fb_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1440_c7_5039_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1435_c7_98fb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_aced_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_aced_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_aced_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1444_c7_820a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1440_c7_5039_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_820a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_5039_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1442_c3_9255 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_820a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_5039_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_820a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_5039_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_820a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_5039_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_820a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_5039_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_820a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_5039_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_820a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_5039_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_820a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_5039_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_820a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1440_c7_5039_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_7c41_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_7c41_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_7c41_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1450_c7_214e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1444_c7_820a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_214e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_820a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1448_c3_35f6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_214e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_820a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_214e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_820a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_214e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_820a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_214e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_820a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_214e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_820a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_214e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_820a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_214e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_820a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_214e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_820a_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1446_c3_585d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1446_c3_585d_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_26fd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_26fd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_26fd_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1454_c7_4732_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1450_c7_214e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_4732_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_214e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1452_c3_df7b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_4732_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_214e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_4732_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_214e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_4732_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_214e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_4732_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_214e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_4732_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_214e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_4732_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_214e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_4732_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_214e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1454_c7_4732_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_214e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_23da_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_23da_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_23da_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1454_c7_4732_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_4732_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_73fe_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_4732_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_73fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_4732_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_73fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_4732_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_73fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_4732_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_73fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_4732_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1454_c7_4732_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_4732_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1460_c7_73fe_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_4732_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1460_c7_73fe_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1454_c7_4732_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1455_c3_d706_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1455_c3_d706_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1455_c3_d706_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1458_c32_0557_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1458_c32_0557_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1458_c32_0557_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1458_c32_8033_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1458_c32_8033_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1458_c32_8033_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1458_c32_9b5e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1458_c32_9b5e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1458_c32_9b5e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1458_c32_0557_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_6e28_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_6e28_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_6e28_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_73fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_73fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_73fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_73fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_73fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_e92c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_73fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_73fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_73fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_e92c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_73fe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_73fe_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1464_c3_52a0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_73fe_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_e92c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_73fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_73fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_73fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_e92c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_73fe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1460_c7_73fe_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1460_c7_73fe_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1467_c7_e92c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1460_c7_73fe_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1460_c7_73fe_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1460_c7_73fe_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1460_c7_73fe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l1461_c12_8bc2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1461_c20_bca8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1461_c20_bca8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1461_c20_bca8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l1461_c12_8bc2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l1461_c12_8bc2_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l1461_c12_e63d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l1461_c12_e63d_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l1461_c36_2a4c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l1461_c36_2a4c_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l1461_c12_e63d_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1465_c24_6201_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_8d2a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_8d2a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_8d2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_e92c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_e92c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_cad6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_e92c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_e92c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_e92c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_cad6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_e92c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_e92c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1469_c3_442e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_e92c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_e92c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_e92c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_e92c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_cad6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_e92c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1467_c7_e92c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1467_c7_e92c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1467_c7_e92c_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1470_c34_277d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1470_c34_277d_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1470_c24_8186_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1472_c11_02d8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1472_c11_02d8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1472_c11_02d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_cad6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_cad6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_cad6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_cad6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_cad6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_cad6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_cad6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_cad6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_cad6_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1423_DUPLICATE_6d90_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1440_l1444_l1423_DUPLICATE_b98b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1467_l1423_DUPLICATE_8477_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1454_l1440_l1444_l1467_l1472_DUPLICATE_d91d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1472_DUPLICATE_0327_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1454_l1440_l1444_l1467_l1472_DUPLICATE_7e56_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1445_l1455_DUPLICATE_63ef_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1467_l1454_DUPLICATE_ed51_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9a35_uxn_opcodes_h_l1478_l1418_DUPLICATE_dd89_return_output : opcode_result_t;
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
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_cad6_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1458_c32_9b5e_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1433_c3_78ad := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1433_c3_78ad;
     VAR_MUX_uxn_opcodes_h_l1458_c32_0557_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_26fd_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_e92c_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_73fe_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1452_c3_df7b := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1452_c3_df7b;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1458_c32_8033_right := to_unsigned(128, 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1461_c20_bca8_right := to_unsigned(15, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_7c41_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1469_c3_442e := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_e92c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1469_c3_442e;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_cad6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_81f6_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1472_c11_02d8_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_8d2a_right := to_unsigned(8, 4);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_cad6_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1458_c32_0557_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_06ed_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_73fe_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_6e28_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_23da_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1438_c3_9f4a := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1438_c3_9f4a;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_0e14_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_aced_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1442_c3_9255 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1442_c3_9255;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1448_c3_35f6 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1448_c3_35f6;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1464_c3_52a0 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_73fe_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1464_c3_52a0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_ca8b_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1427_c3_e6da := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1427_c3_e6da;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_0e14_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1458_c32_8033_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1455_c3_d706_left := n16;
     VAR_BIN_OP_SR_uxn_opcodes_h_l1461_c12_8bc2_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_81f6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_ca8b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_06ed_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_aced_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_7c41_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_26fd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_23da_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_6e28_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_8d2a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1472_c11_02d8_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1461_c20_bca8_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l1461_c36_2a4c_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse := t8;
     VAR_CONST_SR_8_uxn_opcodes_h_l1470_c34_277d_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1460_c7_73fe_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1460_c11_6e28] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1460_c11_6e28_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_6e28_left;
     BIN_OP_EQ_uxn_opcodes_h_l1460_c11_6e28_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_6e28_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_6e28_return_output := BIN_OP_EQ_uxn_opcodes_h_l1460_c11_6e28_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1444_c11_7c41] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1444_c11_7c41_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_7c41_left;
     BIN_OP_EQ_uxn_opcodes_h_l1444_c11_7c41_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_7c41_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_7c41_return_output := BIN_OP_EQ_uxn_opcodes_h_l1444_c11_7c41_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1431_c11_ca8b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1431_c11_ca8b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_ca8b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1431_c11_ca8b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_ca8b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_ca8b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1431_c11_ca8b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1454_l1440_l1444_l1467_l1472_DUPLICATE_d91d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1454_l1440_l1444_l1467_l1472_DUPLICATE_d91d_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1423_DUPLICATE_6d90 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1423_DUPLICATE_6d90_return_output := result.sp_relative_shift;

     -- CONST_SR_4[uxn_opcodes_h_l1461_c36_2a4c] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l1461_c36_2a4c_x <= VAR_CONST_SR_4_uxn_opcodes_h_l1461_c36_2a4c_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l1461_c36_2a4c_return_output := CONST_SR_4_uxn_opcodes_h_l1461_c36_2a4c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1440_c11_aced] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1440_c11_aced_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_aced_left;
     BIN_OP_EQ_uxn_opcodes_h_l1440_c11_aced_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_aced_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_aced_return_output := BIN_OP_EQ_uxn_opcodes_h_l1440_c11_aced_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1454_c11_23da] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1454_c11_23da_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_23da_left;
     BIN_OP_EQ_uxn_opcodes_h_l1454_c11_23da_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_23da_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_23da_return_output := BIN_OP_EQ_uxn_opcodes_h_l1454_c11_23da_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1435_c11_06ed] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1435_c11_06ed_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_06ed_left;
     BIN_OP_EQ_uxn_opcodes_h_l1435_c11_06ed_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_06ed_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_06ed_return_output := BIN_OP_EQ_uxn_opcodes_h_l1435_c11_06ed_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1461_c20_bca8] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1461_c20_bca8_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1461_c20_bca8_left;
     BIN_OP_AND_uxn_opcodes_h_l1461_c20_bca8_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1461_c20_bca8_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1461_c20_bca8_return_output := BIN_OP_AND_uxn_opcodes_h_l1461_c20_bca8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1423_c6_81f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1423_c6_81f6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_81f6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1423_c6_81f6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_81f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_81f6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1423_c6_81f6_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1458_c32_8033] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1458_c32_8033_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1458_c32_8033_left;
     BIN_OP_AND_uxn_opcodes_h_l1458_c32_8033_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1458_c32_8033_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1458_c32_8033_return_output := BIN_OP_AND_uxn_opcodes_h_l1458_c32_8033_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1440_l1444_l1423_DUPLICATE_b98b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1440_l1444_l1423_DUPLICATE_b98b_return_output := result.is_sp_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1445_l1455_DUPLICATE_63ef LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1445_l1455_DUPLICATE_63ef_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1467_l1454_DUPLICATE_ed51 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1467_l1454_DUPLICATE_ed51_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1454_l1440_l1444_l1467_l1472_DUPLICATE_7e56 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1454_l1440_l1444_l1467_l1472_DUPLICATE_7e56_return_output := result.is_opc_done;

     -- CONST_SR_8[uxn_opcodes_h_l1470_c34_277d] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1470_c34_277d_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1470_c34_277d_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1470_c34_277d_return_output := CONST_SR_8_uxn_opcodes_h_l1470_c34_277d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1467_c11_8d2a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1467_c11_8d2a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_8d2a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1467_c11_8d2a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_8d2a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_8d2a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1467_c11_8d2a_return_output;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l1454_c7_4732] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1454_c7_4732_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1472_c11_02d8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1472_c11_02d8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1472_c11_02d8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1472_c11_02d8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1472_c11_02d8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1472_c11_02d8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1472_c11_02d8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1450_c11_26fd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1450_c11_26fd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_26fd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1450_c11_26fd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_26fd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_26fd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1450_c11_26fd_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1472_DUPLICATE_0327 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1472_DUPLICATE_0327_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1467_l1423_DUPLICATE_8477 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1467_l1423_DUPLICATE_8477_return_output := result.stack_value;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1458_c32_9b5e_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1458_c32_8033_return_output;
     VAR_BIN_OP_SR_uxn_opcodes_h_l1461_c12_8bc2_right := VAR_BIN_OP_AND_uxn_opcodes_h_l1461_c20_bca8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_0e14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_81f6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1423_c2_9846_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_81f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_9846_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_81f6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_9846_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_81f6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_9846_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_81f6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_9846_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_81f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_9846_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_81f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_9846_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_81f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_9846_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_81f6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1423_c2_9846_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_81f6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1423_c2_9846_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_81f6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1423_c2_9846_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c6_81f6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_ca8b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_ca8b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_ca8b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_ca8b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_ca8b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_ca8b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_ca8b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_ca8b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_ca8b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_ca8b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_ca8b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1435_c7_98fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_06ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_98fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_06ed_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_98fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_06ed_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_98fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_06ed_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_98fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_06ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_98fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_06ed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_98fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_06ed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_98fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_06ed_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1435_c7_98fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_06ed_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1435_c7_98fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_06ed_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1435_c7_98fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1435_c11_06ed_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1440_c7_5039_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_aced_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_5039_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_aced_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_5039_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_aced_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_5039_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_aced_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_5039_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_aced_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_5039_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_aced_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_5039_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_aced_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_5039_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_aced_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_5039_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_aced_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1440_c7_5039_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_aced_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1444_c7_820a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_7c41_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_820a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_7c41_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_820a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_7c41_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_820a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_7c41_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_820a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_7c41_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_820a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_7c41_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_820a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_7c41_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_820a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_7c41_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_820a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_7c41_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_820a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_7c41_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1450_c7_214e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_26fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_214e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_26fd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_214e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_26fd_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_214e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_26fd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_214e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_26fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_214e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_26fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_214e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_26fd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_214e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_26fd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_214e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_26fd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_214e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_26fd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1454_c7_4732_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_23da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_4732_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_23da_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_4732_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_23da_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_4732_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_23da_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_4732_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_23da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_4732_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_23da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_4732_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_23da_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_4732_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_23da_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_4732_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_23da_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1454_c7_4732_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_23da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_73fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_6e28_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_73fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_6e28_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_73fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_6e28_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_73fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_6e28_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_73fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_6e28_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1460_c7_73fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_6e28_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1460_c7_73fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_6e28_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_e92c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_8d2a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_e92c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_8d2a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_e92c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_8d2a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_e92c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_8d2a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1467_c7_e92c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_8d2a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_cad6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1472_c11_02d8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_cad6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1472_c11_02d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_cad6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1472_c11_02d8_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1455_c3_d706_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1445_l1455_DUPLICATE_63ef_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1446_c3_585d_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1445_l1455_DUPLICATE_63ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1423_DUPLICATE_6d90_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1423_DUPLICATE_6d90_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1423_DUPLICATE_6d90_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1423_DUPLICATE_6d90_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1423_DUPLICATE_6d90_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1423_DUPLICATE_6d90_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1423_DUPLICATE_6d90_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1454_l1440_l1444_l1467_l1472_DUPLICATE_7e56_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1454_l1440_l1444_l1467_l1472_DUPLICATE_7e56_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1454_l1440_l1444_l1467_l1472_DUPLICATE_7e56_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1454_l1440_l1444_l1467_l1472_DUPLICATE_7e56_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1454_l1440_l1444_l1467_l1472_DUPLICATE_7e56_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1454_l1440_l1444_l1467_l1472_DUPLICATE_7e56_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_73fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1454_l1440_l1444_l1467_l1472_DUPLICATE_7e56_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_e92c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1454_l1440_l1444_l1467_l1472_DUPLICATE_7e56_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_cad6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1454_l1440_l1444_l1467_l1472_DUPLICATE_7e56_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1440_l1444_l1423_DUPLICATE_b98b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1440_l1444_l1423_DUPLICATE_b98b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1440_l1444_l1423_DUPLICATE_b98b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1440_l1444_l1423_DUPLICATE_b98b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1440_l1444_l1423_DUPLICATE_b98b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1440_l1444_l1423_DUPLICATE_b98b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_73fe_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1440_l1444_l1423_DUPLICATE_b98b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1454_l1440_l1444_l1467_l1472_DUPLICATE_d91d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1454_l1440_l1444_l1467_l1472_DUPLICATE_d91d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1454_l1440_l1444_l1467_l1472_DUPLICATE_d91d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1454_l1440_l1444_l1467_l1472_DUPLICATE_d91d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1454_l1440_l1444_l1467_l1472_DUPLICATE_d91d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1454_l1440_l1444_l1467_l1472_DUPLICATE_d91d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_73fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1454_l1440_l1444_l1467_l1472_DUPLICATE_d91d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_e92c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1454_l1440_l1444_l1467_l1472_DUPLICATE_d91d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_cad6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1435_l1460_l1431_l1450_l1454_l1440_l1444_l1467_l1472_DUPLICATE_d91d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1472_DUPLICATE_0327_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1472_DUPLICATE_0327_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1472_DUPLICATE_0327_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1472_DUPLICATE_0327_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1472_DUPLICATE_0327_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1472_DUPLICATE_0327_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_cad6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1472_DUPLICATE_0327_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1467_l1454_DUPLICATE_ed51_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_e92c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1467_l1454_DUPLICATE_ed51_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1467_l1423_DUPLICATE_8477_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1467_l1423_DUPLICATE_8477_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1467_l1423_DUPLICATE_8477_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1467_l1423_DUPLICATE_8477_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1467_l1423_DUPLICATE_8477_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1467_l1423_DUPLICATE_8477_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1467_l1423_DUPLICATE_8477_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1467_c7_e92c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1435_l1431_l1450_l1454_l1440_l1444_l1467_l1423_DUPLICATE_8477_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l1461_c12_e63d_right := VAR_CONST_SR_4_uxn_opcodes_h_l1461_c36_2a4c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1454_c7_4732_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1423_c1_0e14] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_0e14_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_0e14_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_0e14_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_0e14_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_0e14_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_0e14_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_0e14_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_0e14_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1472_c7_cad6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_cad6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_cad6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_cad6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_cad6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_cad6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_cad6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_cad6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_cad6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1460_c7_73fe] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_73fe_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_73fe_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_73fe_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_73fe_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_73fe_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_73fe_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_73fe_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_73fe_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1458_c32_9b5e] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1458_c32_9b5e_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1458_c32_9b5e_left;
     BIN_OP_GT_uxn_opcodes_h_l1458_c32_9b5e_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1458_c32_9b5e_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1458_c32_9b5e_return_output := BIN_OP_GT_uxn_opcodes_h_l1458_c32_9b5e_return_output;

     -- t8_MUX[uxn_opcodes_h_l1435_c7_98fb] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1435_c7_98fb_cond <= VAR_t8_MUX_uxn_opcodes_h_l1435_c7_98fb_cond;
     t8_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue;
     t8_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output := t8_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output;

     -- BIN_OP_SR[uxn_opcodes_h_l1461_c12_8bc2] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l1461_c12_8bc2_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l1461_c12_8bc2_left;
     BIN_OP_SR_uxn_opcodes_h_l1461_c12_8bc2_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l1461_c12_8bc2_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l1461_c12_8bc2_return_output := BIN_OP_SR_uxn_opcodes_h_l1461_c12_8bc2_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1470_c24_8186] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1470_c24_8186_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1470_c34_277d_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1472_c7_cad6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_cad6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_cad6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_cad6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_cad6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_cad6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_cad6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_cad6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_cad6_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1454_c7_4732] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_4732_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_4732_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_4732_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_4732_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1455_c3_d706] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1455_c3_d706_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1455_c3_d706_left;
     BIN_OP_OR_uxn_opcodes_h_l1455_c3_d706_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1455_c3_d706_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1455_c3_d706_return_output := BIN_OP_OR_uxn_opcodes_h_l1455_c3_d706_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1472_c7_cad6] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_cad6_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_cad6_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_cad6_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_cad6_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_cad6_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_cad6_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_cad6_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_cad6_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1446_c3_585d] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1446_c3_585d_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1446_c3_585d_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1446_c3_585d_return_output := CONST_SL_8_uxn_opcodes_h_l1446_c3_585d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1467_c7_e92c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_e92c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_e92c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_e92c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_e92c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_e92c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_e92c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_e92c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_e92c_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1458_c32_0557_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1458_c32_9b5e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1455_c3_d706_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l1461_c12_e63d_left := VAR_BIN_OP_SR_uxn_opcodes_h_l1461_c12_8bc2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1467_c7_e92c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1470_c24_8186_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1446_c3_585d_return_output;
     VAR_printf_uxn_opcodes_h_l1424_c3_7119_uxn_opcodes_h_l1424_c3_7119_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1423_c1_0e14_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_e92c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1472_c7_cad6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1460_c7_73fe_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_e92c_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1472_c7_cad6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_4732_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_e92c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1472_c7_cad6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_73fe_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_e92c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1460_c7_73fe] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_73fe_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_73fe_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_73fe_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_73fe_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_73fe_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_73fe_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_73fe_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_73fe_return_output;

     -- MUX[uxn_opcodes_h_l1458_c32_0557] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1458_c32_0557_cond <= VAR_MUX_uxn_opcodes_h_l1458_c32_0557_cond;
     MUX_uxn_opcodes_h_l1458_c32_0557_iftrue <= VAR_MUX_uxn_opcodes_h_l1458_c32_0557_iftrue;
     MUX_uxn_opcodes_h_l1458_c32_0557_iffalse <= VAR_MUX_uxn_opcodes_h_l1458_c32_0557_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1458_c32_0557_return_output := MUX_uxn_opcodes_h_l1458_c32_0557_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1467_c7_e92c] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_e92c_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_e92c_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_e92c_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_e92c_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_e92c_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_e92c_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_e92c_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_e92c_return_output;

     -- printf_uxn_opcodes_h_l1424_c3_7119[uxn_opcodes_h_l1424_c3_7119] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1424_c3_7119_uxn_opcodes_h_l1424_c3_7119_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1424_c3_7119_uxn_opcodes_h_l1424_c3_7119_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1450_c7_214e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_214e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_214e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_214e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_214e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1467_c7_e92c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_e92c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_e92c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_e92c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_e92c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_e92c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_e92c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_e92c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_e92c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1454_c7_4732] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1454_c7_4732_cond <= VAR_n16_MUX_uxn_opcodes_h_l1454_c7_4732_cond;
     n16_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue;
     n16_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1454_c7_4732_return_output := n16_MUX_uxn_opcodes_h_l1454_c7_4732_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1467_c7_e92c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1467_c7_e92c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1467_c7_e92c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1467_c7_e92c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1467_c7_e92c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1467_c7_e92c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1467_c7_e92c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1467_c7_e92c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1467_c7_e92c_return_output;

     -- t8_MUX[uxn_opcodes_h_l1431_c7_b4dc] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond <= VAR_t8_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond;
     t8_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue;
     t8_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output := t8_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1454_c7_4732] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_4732_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_4732_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_4732_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_4732_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1467_c7_e92c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_e92c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_e92c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_e92c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_e92c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_e92c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_e92c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_e92c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_e92c_return_output;

     -- BIN_OP_SL[uxn_opcodes_h_l1461_c12_e63d] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l1461_c12_e63d_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l1461_c12_e63d_left;
     BIN_OP_SL_uxn_opcodes_h_l1461_c12_e63d_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l1461_c12_e63d_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l1461_c12_e63d_return_output := BIN_OP_SL_uxn_opcodes_h_l1461_c12_e63d_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1460_c7_73fe_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l1461_c12_e63d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue := VAR_MUX_uxn_opcodes_h_l1458_c32_0557_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1454_c7_4732_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_73fe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_e92c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_4732_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_73fe_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1467_c7_e92c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_214e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_73fe_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_e92c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_73fe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1460_c7_73fe_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1467_c7_e92c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1450_c7_214e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_214e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_214e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_214e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_214e_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1465_c24_6201] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1465_c24_6201_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_SL_uxn_opcodes_h_l1461_c12_e63d_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1454_c7_4732] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_4732_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_4732_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_4732_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_4732_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1460_c7_73fe] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_73fe_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_73fe_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_73fe_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_73fe_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_73fe_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_73fe_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_73fe_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_73fe_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1454_c7_4732] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_4732_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_4732_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_4732_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_4732_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1460_c7_73fe] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1460_c7_73fe_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1460_c7_73fe_cond;
     tmp16_MUX_uxn_opcodes_h_l1460_c7_73fe_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1460_c7_73fe_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1460_c7_73fe_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1460_c7_73fe_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1460_c7_73fe_return_output := tmp16_MUX_uxn_opcodes_h_l1460_c7_73fe_return_output;

     -- t8_MUX[uxn_opcodes_h_l1423_c2_9846] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1423_c2_9846_cond <= VAR_t8_MUX_uxn_opcodes_h_l1423_c2_9846_cond;
     t8_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue;
     t8_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1423_c2_9846_return_output := t8_MUX_uxn_opcodes_h_l1423_c2_9846_return_output;

     -- n16_MUX[uxn_opcodes_h_l1450_c7_214e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1450_c7_214e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1450_c7_214e_cond;
     n16_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue;
     n16_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1450_c7_214e_return_output := n16_MUX_uxn_opcodes_h_l1450_c7_214e_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1460_c7_73fe] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_73fe_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_73fe_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_73fe_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_73fe_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_73fe_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_73fe_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_73fe_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_73fe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1460_c7_73fe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_73fe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_73fe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_73fe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_73fe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_73fe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_73fe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_73fe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_73fe_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1444_c7_820a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_820a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_820a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_820a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_820a_return_output;

     -- Submodule level 4
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1460_c7_73fe_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1465_c24_6201_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1450_c7_214e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_73fe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_214e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1460_c7_73fe_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_820a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_73fe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_4732_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_4732_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1423_c2_9846_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1460_c7_73fe_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1454_c7_4732] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_4732_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_4732_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_4732_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_4732_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1460_c7_73fe] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1460_c7_73fe_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1460_c7_73fe_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1460_c7_73fe_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1460_c7_73fe_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1460_c7_73fe_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1460_c7_73fe_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1460_c7_73fe_return_output := result_stack_value_MUX_uxn_opcodes_h_l1460_c7_73fe_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1454_c7_4732] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1454_c7_4732_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1454_c7_4732_cond;
     tmp16_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1454_c7_4732_return_output := tmp16_MUX_uxn_opcodes_h_l1454_c7_4732_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1444_c7_820a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_820a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_820a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_820a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_820a_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1454_c7_4732] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_4732_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_4732_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_4732_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_4732_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1450_c7_214e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_214e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_214e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_214e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_214e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1444_c7_820a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1444_c7_820a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1444_c7_820a_cond;
     n16_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue;
     n16_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1444_c7_820a_return_output := n16_MUX_uxn_opcodes_h_l1444_c7_820a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1440_c7_5039] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_5039_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_5039_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_5039_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_5039_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1454_c7_4732] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_4732_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_4732_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_4732_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_4732_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1450_c7_214e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_214e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_214e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_214e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_214e_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1444_c7_820a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_4732_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_820a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1454_c7_4732_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_5039_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_4732_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_214e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_214e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1460_c7_73fe_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1454_c7_4732_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1440_c7_5039] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_5039_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_5039_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_5039_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_5039_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1454_c7_4732] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1454_c7_4732_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_4732_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_4732_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_4732_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_4732_return_output := result_stack_value_MUX_uxn_opcodes_h_l1454_c7_4732_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1444_c7_820a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_820a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_820a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_820a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_820a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1450_c7_214e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_214e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_214e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_214e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_214e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1444_c7_820a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_820a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_820a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_820a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_820a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1450_c7_214e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1450_c7_214e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_214e_cond;
     tmp16_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_214e_return_output := tmp16_MUX_uxn_opcodes_h_l1450_c7_214e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1440_c7_5039] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1440_c7_5039_cond <= VAR_n16_MUX_uxn_opcodes_h_l1440_c7_5039_cond;
     n16_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue;
     n16_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1440_c7_5039_return_output := n16_MUX_uxn_opcodes_h_l1440_c7_5039_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1450_c7_214e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_214e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_214e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_214e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_214e_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1450_c7_214e] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_214e_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_214e_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_214e_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_214e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1435_c7_98fb] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_98fb_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_98fb_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1440_c7_5039_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_214e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_5039_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1450_c7_214e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_214e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_820a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_820a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_4732_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_214e_return_output;
     -- n16_MUX[uxn_opcodes_h_l1435_c7_98fb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1435_c7_98fb_cond <= VAR_n16_MUX_uxn_opcodes_h_l1435_c7_98fb_cond;
     n16_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue;
     n16_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output := n16_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1431_c7_b4dc] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1440_c7_5039] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_5039_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_5039_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_5039_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_5039_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1440_c7_5039] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_5039_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_5039_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_5039_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_5039_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1450_c7_214e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1450_c7_214e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_214e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_214e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_214e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_214e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1450_c7_214e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1435_c7_98fb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_98fb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_98fb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1444_c7_820a] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_820a_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_820a_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_820a_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_820a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1444_c7_820a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_820a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_820a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_820a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_820a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1444_c7_820a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1444_c7_820a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_820a_cond;
     tmp16_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_820a_return_output := tmp16_MUX_uxn_opcodes_h_l1444_c7_820a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1444_c7_820a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_820a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_820a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_820a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_820a_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_820a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1444_c7_820a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_820a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_5039_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_5039_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_214e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_820a_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1440_c7_5039] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1440_c7_5039_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1440_c7_5039_cond;
     tmp16_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1440_c7_5039_return_output := tmp16_MUX_uxn_opcodes_h_l1440_c7_5039_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1435_c7_98fb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_98fb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_98fb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output;

     -- n16_MUX[uxn_opcodes_h_l1431_c7_b4dc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond <= VAR_n16_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond;
     n16_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue;
     n16_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output := n16_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1423_c2_9846] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_9846_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_9846_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_9846_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_9846_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1444_c7_820a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1444_c7_820a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_820a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_820a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_820a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_820a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1444_c7_820a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1435_c7_98fb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_98fb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_98fb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1440_c7_5039] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_5039_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_5039_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_5039_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_5039_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1440_c7_5039] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_5039_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_5039_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_5039_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_5039_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1440_c7_5039] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_5039_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_5039_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_5039_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_5039_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1431_c7_b4dc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_5039_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1440_c7_5039_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_5039_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_820a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1440_c7_5039_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1423_c2_9846] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_9846_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_9846_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_9846_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_9846_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1431_c7_b4dc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1435_c7_98fb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_98fb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_98fb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1431_c7_b4dc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1435_c7_98fb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1435_c7_98fb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1435_c7_98fb_cond;
     tmp16_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output := tmp16_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1435_c7_98fb] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_98fb_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_98fb_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1440_c7_5039] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1440_c7_5039_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_5039_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_5039_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_5039_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_5039_return_output := result_stack_value_MUX_uxn_opcodes_h_l1440_c7_5039_return_output;

     -- n16_MUX[uxn_opcodes_h_l1423_c2_9846] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1423_c2_9846_cond <= VAR_n16_MUX_uxn_opcodes_h_l1423_c2_9846_cond;
     n16_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue;
     n16_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1423_c2_9846_return_output := n16_MUX_uxn_opcodes_h_l1423_c2_9846_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1435_c7_98fb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_98fb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_98fb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output;

     -- Submodule level 9
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1423_c2_9846_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_5039_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1431_c7_b4dc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1431_c7_b4dc] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1423_c2_9846] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_9846_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_9846_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_9846_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_9846_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1431_c7_b4dc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond;
     tmp16_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output := tmp16_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1431_c7_b4dc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1423_c2_9846] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_9846_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_9846_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_9846_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_9846_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1435_c7_98fb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1435_c7_98fb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1435_c7_98fb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1435_c7_98fb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1435_c7_98fb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output := result_stack_value_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1435_c7_98fb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1423_c2_9846] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_9846_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_9846_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_9846_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_9846_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1423_c2_9846] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_9846_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_9846_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_9846_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_9846_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1423_c2_9846] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_9846_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_9846_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_9846_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_9846_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1423_c2_9846] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1423_c2_9846_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1423_c2_9846_cond;
     tmp16_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1423_c2_9846_return_output := tmp16_MUX_uxn_opcodes_h_l1423_c2_9846_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1431_c7_b4dc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c7_b4dc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c7_b4dc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c7_b4dc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output := result_stack_value_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output;

     -- Submodule level 11
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c7_b4dc_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1423_c2_9846_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1423_c2_9846] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1423_c2_9846_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1423_c2_9846_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1423_c2_9846_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1423_c2_9846_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1423_c2_9846_return_output := result_stack_value_MUX_uxn_opcodes_h_l1423_c2_9846_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_9a35_uxn_opcodes_h_l1478_l1418_DUPLICATE_dd89 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9a35_uxn_opcodes_h_l1478_l1418_DUPLICATE_dd89_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_9a35(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c2_9846_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c2_9846_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1423_c2_9846_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c2_9846_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c2_9846_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c2_9846_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1423_c2_9846_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1423_c2_9846_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9a35_uxn_opcodes_h_l1478_l1418_DUPLICATE_dd89_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9a35_uxn_opcodes_h_l1478_l1418_DUPLICATE_dd89_return_output;
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
