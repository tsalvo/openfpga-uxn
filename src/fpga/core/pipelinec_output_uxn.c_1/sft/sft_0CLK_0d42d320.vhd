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
-- Submodules: 74
entity sft_0CLK_0d42d320 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sft_0CLK_0d42d320;
architecture arch of sft_0CLK_0d42d320 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1376_c6_876e]
signal BIN_OP_EQ_uxn_opcodes_h_l1376_c6_876e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1376_c6_876e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1376_c6_876e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1376_c1_bcd3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_bcd3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_bcd3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_bcd3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_bcd3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1376_c2_78a2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_78a2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1376_c2_78a2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_78a2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1376_c2_78a2]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_78a2_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1376_c2_78a2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_78a2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1376_c2_78a2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_78a2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1376_c2_78a2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_78a2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1376_c2_78a2]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_78a2_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1376_c2_78a2]
signal result_stack_value_MUX_uxn_opcodes_h_l1376_c2_78a2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1376_c2_78a2]
signal tmp8_MUX_uxn_opcodes_h_l1376_c2_78a2_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1376_c2_78a2]
signal t8_MUX_uxn_opcodes_h_l1376_c2_78a2_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1376_c2_78a2]
signal n8_MUX_uxn_opcodes_h_l1376_c2_78a2_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1377_c3_d99e[uxn_opcodes_h_l1377_c3_d99e]
signal printf_uxn_opcodes_h_l1377_c3_d99e_uxn_opcodes_h_l1377_c3_d99e_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1384_c11_0e82]
signal BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0e82_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0e82_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0e82_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1384_c7_221e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_221e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_221e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1384_c7_221e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_221e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_221e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1384_c7_221e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_221e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_221e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1384_c7_221e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_221e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_221e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1384_c7_221e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_221e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_221e_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1384_c7_221e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_221e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_221e_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1384_c7_221e]
signal result_stack_value_MUX_uxn_opcodes_h_l1384_c7_221e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1384_c7_221e_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1384_c7_221e]
signal tmp8_MUX_uxn_opcodes_h_l1384_c7_221e_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1384_c7_221e_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1384_c7_221e]
signal t8_MUX_uxn_opcodes_h_l1384_c7_221e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1384_c7_221e_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1384_c7_221e]
signal n8_MUX_uxn_opcodes_h_l1384_c7_221e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1384_c7_221e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1388_c11_4c5a]
signal BIN_OP_EQ_uxn_opcodes_h_l1388_c11_4c5a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1388_c11_4c5a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1388_c11_4c5a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1388_c7_6243]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_6243_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_6243_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1388_c7_6243]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_6243_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_6243_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1388_c7_6243]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_6243_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_6243_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1388_c7_6243]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_6243_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_6243_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1388_c7_6243]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_6243_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_6243_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1388_c7_6243]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_6243_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_6243_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1388_c7_6243]
signal result_stack_value_MUX_uxn_opcodes_h_l1388_c7_6243_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1388_c7_6243_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1388_c7_6243]
signal tmp8_MUX_uxn_opcodes_h_l1388_c7_6243_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1388_c7_6243_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1388_c7_6243]
signal t8_MUX_uxn_opcodes_h_l1388_c7_6243_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1388_c7_6243_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1388_c7_6243]
signal n8_MUX_uxn_opcodes_h_l1388_c7_6243_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1388_c7_6243_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1393_c11_952d]
signal BIN_OP_EQ_uxn_opcodes_h_l1393_c11_952d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1393_c11_952d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1393_c11_952d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1393_c7_ce58]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_ce58_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1393_c7_ce58]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_ce58_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1393_c7_ce58]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_ce58_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1393_c7_ce58]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_ce58_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1393_c7_ce58]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_ce58_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1393_c7_ce58]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_ce58_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1393_c7_ce58]
signal result_stack_value_MUX_uxn_opcodes_h_l1393_c7_ce58_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1393_c7_ce58]
signal tmp8_MUX_uxn_opcodes_h_l1393_c7_ce58_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1393_c7_ce58]
signal n8_MUX_uxn_opcodes_h_l1393_c7_ce58_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1397_c11_6293]
signal BIN_OP_EQ_uxn_opcodes_h_l1397_c11_6293_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1397_c11_6293_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1397_c11_6293_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1397_c7_ea2f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1397_c7_ea2f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1397_c7_ea2f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1397_c7_ea2f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1397_c7_ea2f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1397_c7_ea2f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1397_c7_ea2f]
signal result_stack_value_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1397_c7_ea2f]
signal tmp8_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1397_c7_ea2f]
signal n8_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1401_c32_f895]
signal BIN_OP_AND_uxn_opcodes_h_l1401_c32_f895_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1401_c32_f895_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1401_c32_f895_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1401_c32_c894]
signal BIN_OP_GT_uxn_opcodes_h_l1401_c32_c894_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1401_c32_c894_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1401_c32_c894_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1401_c32_191f]
signal MUX_uxn_opcodes_h_l1401_c32_191f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1401_c32_191f_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1401_c32_191f_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1401_c32_191f_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1403_c11_c9ac]
signal BIN_OP_EQ_uxn_opcodes_h_l1403_c11_c9ac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1403_c11_c9ac_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1403_c11_c9ac_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1403_c7_56d6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_56d6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_56d6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_56d6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_56d6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1403_c7_56d6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_56d6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_56d6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_56d6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_56d6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1403_c7_56d6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_56d6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_56d6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_56d6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_56d6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1403_c7_56d6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_56d6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_56d6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_56d6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_56d6_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1403_c7_56d6]
signal result_stack_value_MUX_uxn_opcodes_h_l1403_c7_56d6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1403_c7_56d6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1403_c7_56d6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1403_c7_56d6_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1403_c7_56d6]
signal tmp8_MUX_uxn_opcodes_h_l1403_c7_56d6_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1403_c7_56d6_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1403_c7_56d6_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1403_c7_56d6_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1404_c18_ce08]
signal BIN_OP_AND_uxn_opcodes_h_l1404_c18_ce08_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1404_c18_ce08_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1404_c18_ce08_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l1404_c11_85b5]
signal BIN_OP_SR_uxn_opcodes_h_l1404_c11_85b5_left : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l1404_c11_85b5_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l1404_c11_85b5_return_output : unsigned(7 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l1404_c34_c659]
signal CONST_SR_4_uxn_opcodes_h_l1404_c34_c659_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l1404_c34_c659_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l1404_c11_41db]
signal BIN_OP_SL_uxn_opcodes_h_l1404_c11_41db_left : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l1404_c11_41db_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l1404_c11_41db_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1410_c11_fa4a]
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_fa4a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_fa4a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_fa4a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1410_c7_eab5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_eab5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_eab5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_eab5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_eab5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1410_c7_eab5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_eab5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_eab5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_eab5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_eab5_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.is_stack_read := ref_toks_7;
      base.stack_value := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1376_c6_876e
BIN_OP_EQ_uxn_opcodes_h_l1376_c6_876e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1376_c6_876e_left,
BIN_OP_EQ_uxn_opcodes_h_l1376_c6_876e_right,
BIN_OP_EQ_uxn_opcodes_h_l1376_c6_876e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_bcd3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_bcd3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_bcd3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_bcd3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_bcd3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_bcd3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_78a2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_78a2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_78a2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_78a2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_78a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_78a2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_78a2
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_78a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_78a2_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_78a2
result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_78a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_78a2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_78a2
result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_78a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_78a2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_78a2
result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_78a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_78a2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_78a2
result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_78a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_78a2_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1376_c2_78a2
result_stack_value_MUX_uxn_opcodes_h_l1376_c2_78a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1376_c2_78a2_cond,
result_stack_value_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1376_c2_78a2
tmp8_MUX_uxn_opcodes_h_l1376_c2_78a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1376_c2_78a2_cond,
tmp8_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue,
tmp8_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse,
tmp8_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output);

-- t8_MUX_uxn_opcodes_h_l1376_c2_78a2
t8_MUX_uxn_opcodes_h_l1376_c2_78a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1376_c2_78a2_cond,
t8_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue,
t8_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse,
t8_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output);

-- n8_MUX_uxn_opcodes_h_l1376_c2_78a2
n8_MUX_uxn_opcodes_h_l1376_c2_78a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1376_c2_78a2_cond,
n8_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue,
n8_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse,
n8_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output);

-- printf_uxn_opcodes_h_l1377_c3_d99e_uxn_opcodes_h_l1377_c3_d99e
printf_uxn_opcodes_h_l1377_c3_d99e_uxn_opcodes_h_l1377_c3_d99e : entity work.printf_uxn_opcodes_h_l1377_c3_d99e_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1377_c3_d99e_uxn_opcodes_h_l1377_c3_d99e_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0e82
BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0e82 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0e82_left,
BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0e82_right,
BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0e82_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_221e
result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_221e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_221e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_221e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_221e
result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_221e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_221e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_221e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_221e
result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_221e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_221e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_221e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_221e
result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_221e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_221e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_221e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_221e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_221e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_221e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_221e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_221e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_221e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_221e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_221e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1384_c7_221e
result_stack_value_MUX_uxn_opcodes_h_l1384_c7_221e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1384_c7_221e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1384_c7_221e_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1384_c7_221e
tmp8_MUX_uxn_opcodes_h_l1384_c7_221e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1384_c7_221e_cond,
tmp8_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue,
tmp8_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse,
tmp8_MUX_uxn_opcodes_h_l1384_c7_221e_return_output);

-- t8_MUX_uxn_opcodes_h_l1384_c7_221e
t8_MUX_uxn_opcodes_h_l1384_c7_221e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1384_c7_221e_cond,
t8_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue,
t8_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse,
t8_MUX_uxn_opcodes_h_l1384_c7_221e_return_output);

-- n8_MUX_uxn_opcodes_h_l1384_c7_221e
n8_MUX_uxn_opcodes_h_l1384_c7_221e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1384_c7_221e_cond,
n8_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue,
n8_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse,
n8_MUX_uxn_opcodes_h_l1384_c7_221e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1388_c11_4c5a
BIN_OP_EQ_uxn_opcodes_h_l1388_c11_4c5a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1388_c11_4c5a_left,
BIN_OP_EQ_uxn_opcodes_h_l1388_c11_4c5a_right,
BIN_OP_EQ_uxn_opcodes_h_l1388_c11_4c5a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_6243
result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_6243 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_6243_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_6243_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_6243
result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_6243 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_6243_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_6243_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_6243
result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_6243 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_6243_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_6243_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_6243
result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_6243 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_6243_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_6243_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_6243
result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_6243 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_6243_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_6243_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_6243
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_6243 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_6243_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_6243_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1388_c7_6243
result_stack_value_MUX_uxn_opcodes_h_l1388_c7_6243 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1388_c7_6243_cond,
result_stack_value_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1388_c7_6243_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1388_c7_6243
tmp8_MUX_uxn_opcodes_h_l1388_c7_6243 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1388_c7_6243_cond,
tmp8_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue,
tmp8_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse,
tmp8_MUX_uxn_opcodes_h_l1388_c7_6243_return_output);

-- t8_MUX_uxn_opcodes_h_l1388_c7_6243
t8_MUX_uxn_opcodes_h_l1388_c7_6243 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1388_c7_6243_cond,
t8_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue,
t8_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse,
t8_MUX_uxn_opcodes_h_l1388_c7_6243_return_output);

-- n8_MUX_uxn_opcodes_h_l1388_c7_6243
n8_MUX_uxn_opcodes_h_l1388_c7_6243 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1388_c7_6243_cond,
n8_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue,
n8_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse,
n8_MUX_uxn_opcodes_h_l1388_c7_6243_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1393_c11_952d
BIN_OP_EQ_uxn_opcodes_h_l1393_c11_952d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1393_c11_952d_left,
BIN_OP_EQ_uxn_opcodes_h_l1393_c11_952d_right,
BIN_OP_EQ_uxn_opcodes_h_l1393_c11_952d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_ce58
result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_ce58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_ce58_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_ce58
result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_ce58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_ce58_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_ce58
result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_ce58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_ce58_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_ce58
result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_ce58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_ce58_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_ce58
result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_ce58 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_ce58_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_ce58
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_ce58 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_ce58_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1393_c7_ce58
result_stack_value_MUX_uxn_opcodes_h_l1393_c7_ce58 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1393_c7_ce58_cond,
result_stack_value_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1393_c7_ce58
tmp8_MUX_uxn_opcodes_h_l1393_c7_ce58 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1393_c7_ce58_cond,
tmp8_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue,
tmp8_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse,
tmp8_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output);

-- n8_MUX_uxn_opcodes_h_l1393_c7_ce58
n8_MUX_uxn_opcodes_h_l1393_c7_ce58 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1393_c7_ce58_cond,
n8_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue,
n8_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse,
n8_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1397_c11_6293
BIN_OP_EQ_uxn_opcodes_h_l1397_c11_6293 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1397_c11_6293_left,
BIN_OP_EQ_uxn_opcodes_h_l1397_c11_6293_right,
BIN_OP_EQ_uxn_opcodes_h_l1397_c11_6293_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f
result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_ea2f
result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_ea2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_ea2f
result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_ea2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_ea2f
result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_ea2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_ea2f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_ea2f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1397_c7_ea2f
result_stack_value_MUX_uxn_opcodes_h_l1397_c7_ea2f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1397_c7_ea2f
tmp8_MUX_uxn_opcodes_h_l1397_c7_ea2f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond,
tmp8_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue,
tmp8_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse,
tmp8_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output);

-- n8_MUX_uxn_opcodes_h_l1397_c7_ea2f
n8_MUX_uxn_opcodes_h_l1397_c7_ea2f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond,
n8_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue,
n8_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse,
n8_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1401_c32_f895
BIN_OP_AND_uxn_opcodes_h_l1401_c32_f895 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1401_c32_f895_left,
BIN_OP_AND_uxn_opcodes_h_l1401_c32_f895_right,
BIN_OP_AND_uxn_opcodes_h_l1401_c32_f895_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1401_c32_c894
BIN_OP_GT_uxn_opcodes_h_l1401_c32_c894 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1401_c32_c894_left,
BIN_OP_GT_uxn_opcodes_h_l1401_c32_c894_right,
BIN_OP_GT_uxn_opcodes_h_l1401_c32_c894_return_output);

-- MUX_uxn_opcodes_h_l1401_c32_191f
MUX_uxn_opcodes_h_l1401_c32_191f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1401_c32_191f_cond,
MUX_uxn_opcodes_h_l1401_c32_191f_iftrue,
MUX_uxn_opcodes_h_l1401_c32_191f_iffalse,
MUX_uxn_opcodes_h_l1401_c32_191f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1403_c11_c9ac
BIN_OP_EQ_uxn_opcodes_h_l1403_c11_c9ac : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1403_c11_c9ac_left,
BIN_OP_EQ_uxn_opcodes_h_l1403_c11_c9ac_right,
BIN_OP_EQ_uxn_opcodes_h_l1403_c11_c9ac_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_56d6
result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_56d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_56d6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_56d6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_56d6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_56d6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_56d6
result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_56d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_56d6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_56d6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_56d6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_56d6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_56d6
result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_56d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_56d6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_56d6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_56d6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_56d6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_56d6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_56d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_56d6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_56d6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_56d6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_56d6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1403_c7_56d6
result_stack_value_MUX_uxn_opcodes_h_l1403_c7_56d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1403_c7_56d6_cond,
result_stack_value_MUX_uxn_opcodes_h_l1403_c7_56d6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1403_c7_56d6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1403_c7_56d6_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1403_c7_56d6
tmp8_MUX_uxn_opcodes_h_l1403_c7_56d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1403_c7_56d6_cond,
tmp8_MUX_uxn_opcodes_h_l1403_c7_56d6_iftrue,
tmp8_MUX_uxn_opcodes_h_l1403_c7_56d6_iffalse,
tmp8_MUX_uxn_opcodes_h_l1403_c7_56d6_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1404_c18_ce08
BIN_OP_AND_uxn_opcodes_h_l1404_c18_ce08 : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1404_c18_ce08_left,
BIN_OP_AND_uxn_opcodes_h_l1404_c18_ce08_right,
BIN_OP_AND_uxn_opcodes_h_l1404_c18_ce08_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l1404_c11_85b5
BIN_OP_SR_uxn_opcodes_h_l1404_c11_85b5 : entity work.BIN_OP_SR_uint8_t_uint8_t_0CLK_25d197a7 port map (
BIN_OP_SR_uxn_opcodes_h_l1404_c11_85b5_left,
BIN_OP_SR_uxn_opcodes_h_l1404_c11_85b5_right,
BIN_OP_SR_uxn_opcodes_h_l1404_c11_85b5_return_output);

-- CONST_SR_4_uxn_opcodes_h_l1404_c34_c659
CONST_SR_4_uxn_opcodes_h_l1404_c34_c659 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l1404_c34_c659_x,
CONST_SR_4_uxn_opcodes_h_l1404_c34_c659_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l1404_c11_41db
BIN_OP_SL_uxn_opcodes_h_l1404_c11_41db : entity work.BIN_OP_SL_uint8_t_uint8_t_0CLK_10d8c973 port map (
BIN_OP_SL_uxn_opcodes_h_l1404_c11_41db_left,
BIN_OP_SL_uxn_opcodes_h_l1404_c11_41db_right,
BIN_OP_SL_uxn_opcodes_h_l1404_c11_41db_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1410_c11_fa4a
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_fa4a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_fa4a_left,
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_fa4a_right,
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_fa4a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_eab5
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_eab5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_eab5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_eab5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_eab5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_eab5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_eab5
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_eab5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_eab5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_eab5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_eab5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_eab5_return_output);



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
 n8,
 tmp8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1376_c6_876e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_bcd3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output,
 tmp8_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output,
 t8_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output,
 n8_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0e82_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_221e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_221e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_221e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_221e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_221e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_221e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1384_c7_221e_return_output,
 tmp8_MUX_uxn_opcodes_h_l1384_c7_221e_return_output,
 t8_MUX_uxn_opcodes_h_l1384_c7_221e_return_output,
 n8_MUX_uxn_opcodes_h_l1384_c7_221e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1388_c11_4c5a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_6243_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_6243_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_6243_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_6243_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_6243_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_6243_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1388_c7_6243_return_output,
 tmp8_MUX_uxn_opcodes_h_l1388_c7_6243_return_output,
 t8_MUX_uxn_opcodes_h_l1388_c7_6243_return_output,
 n8_MUX_uxn_opcodes_h_l1388_c7_6243_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1393_c11_952d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output,
 tmp8_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output,
 n8_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1397_c11_6293_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output,
 tmp8_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output,
 n8_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1401_c32_f895_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1401_c32_c894_return_output,
 MUX_uxn_opcodes_h_l1401_c32_191f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1403_c11_c9ac_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_56d6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_56d6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_56d6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_56d6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1403_c7_56d6_return_output,
 tmp8_MUX_uxn_opcodes_h_l1403_c7_56d6_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1404_c18_ce08_return_output,
 BIN_OP_SR_uxn_opcodes_h_l1404_c11_85b5_return_output,
 CONST_SR_4_uxn_opcodes_h_l1404_c34_c659_return_output,
 BIN_OP_SL_uxn_opcodes_h_l1404_c11_41db_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1410_c11_fa4a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_eab5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_eab5_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_876e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_876e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_876e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_bcd3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_bcd3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_bcd3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_bcd3_iffalse : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_221e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_78a2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1380_c3_b772 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_221e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_78a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1376_c2_78a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_78a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_221e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_78a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_221e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_78a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_221e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_78a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_221e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_78a2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_221e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1376_c2_78a2_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1384_c7_221e_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1376_c2_78a2_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1384_c7_221e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1376_c2_78a2_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1384_c7_221e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1376_c2_78a2_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1377_c3_d99e_uxn_opcodes_h_l1377_c3_d99e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0e82_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0e82_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0e82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_6243_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_221e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_6243_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_221e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_6243_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_221e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_6243_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_221e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_6243_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_221e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1386_c3_cbf6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_6243_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_221e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_6243_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_221e_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1388_c7_6243_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1384_c7_221e_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1388_c7_6243_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1384_c7_221e_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1388_c7_6243_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1384_c7_221e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_4c5a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_4c5a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_4c5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_6243_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_6243_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_6243_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_6243_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_6243_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1391_c3_6543 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_6243_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_6243_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1388_c7_6243_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1388_c7_6243_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1388_c7_6243_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_952d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_952d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_952d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_ce58_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_ce58_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_ce58_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_ce58_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_ce58_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1395_c3_bfef : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_ce58_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1393_c7_ce58_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1393_c7_ce58_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1393_c7_ce58_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_6293_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_6293_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_6293_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_56d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_56d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_56d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1397_c7_ea2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_56d6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_56d6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1403_c7_56d6_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1401_c32_191f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1401_c32_191f_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1401_c32_191f_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1401_c32_f895_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1401_c32_f895_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1401_c32_f895_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1401_c32_c894_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1401_c32_c894_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1401_c32_c894_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1401_c32_191f_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_c9ac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_c9ac_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_c9ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_56d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_56d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_56d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_56d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_56d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_eab5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_56d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_56d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_56d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_eab5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_56d6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_56d6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1407_c3_9a1b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_56d6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_56d6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_56d6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_56d6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_56d6_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1403_c7_56d6_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1403_c7_56d6_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1403_c7_56d6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l1404_c11_85b5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1404_c18_ce08_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1404_c18_ce08_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1404_c18_ce08_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l1404_c11_85b5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l1404_c11_85b5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l1404_c11_41db_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l1404_c11_41db_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l1404_c34_c659_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l1404_c34_c659_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l1404_c11_41db_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_fa4a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_fa4a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_fa4a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_eab5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_eab5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_eab5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_eab5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_eab5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_eab5_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1376_l1384_DUPLICATE_426c_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1393_l1388_l1376_l1403_l1384_DUPLICATE_02e9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1376_l1403_l1384_DUPLICATE_c11d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1410_l1384_DUPLICATE_a1b3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1410_l1403_l1384_DUPLICATE_b48e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1403_l1397_DUPLICATE_ccb0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1415_l1372_DUPLICATE_afac_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1386_c3_cbf6 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1386_c3_cbf6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_6293_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_eab5_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1404_c18_ce08_right := to_unsigned(15, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1395_c3_bfef := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1395_c3_bfef;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1380_c3_b772 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1380_c3_b772;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1391_c3_6543 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1391_c3_6543;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0e82_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_eab5_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1401_c32_191f_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1407_c3_9a1b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_56d6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1407_c3_9a1b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_c9ac_right := to_unsigned(5, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_4c5a_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_56d6_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_952d_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_876e_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1401_c32_191f_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_bcd3_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1401_c32_f895_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_fa4a_right := to_unsigned(6, 3);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1401_c32_c894_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_56d6_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_bcd3_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1401_c32_f895_left := VAR_ins;
     VAR_BIN_OP_SR_uxn_opcodes_h_l1404_c11_85b5_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_876e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0e82_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_4c5a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_952d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_6293_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_c9ac_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_fa4a_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1404_c18_ce08_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l1404_c34_c659_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse := t8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1403_c7_56d6_iffalse := tmp8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1410_l1384_DUPLICATE_a1b3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1410_l1384_DUPLICATE_a1b3_return_output := result.is_stack_write;

     -- CONST_SR_4[uxn_opcodes_h_l1404_c34_c659] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l1404_c34_c659_x <= VAR_CONST_SR_4_uxn_opcodes_h_l1404_c34_c659_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l1404_c34_c659_return_output := CONST_SR_4_uxn_opcodes_h_l1404_c34_c659_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1376_l1384_DUPLICATE_426c LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1376_l1384_DUPLICATE_426c_return_output := result.sp_relative_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l1404_c18_ce08] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1404_c18_ce08_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1404_c18_ce08_left;
     BIN_OP_AND_uxn_opcodes_h_l1404_c18_ce08_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1404_c18_ce08_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1404_c18_ce08_return_output := BIN_OP_AND_uxn_opcodes_h_l1404_c18_ce08_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1388_c11_4c5a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1388_c11_4c5a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_4c5a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1388_c11_4c5a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_4c5a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_4c5a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1388_c11_4c5a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1393_l1388_l1376_l1403_l1384_DUPLICATE_02e9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1393_l1388_l1376_l1403_l1384_DUPLICATE_02e9_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1393_c11_952d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1393_c11_952d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_952d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1393_c11_952d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_952d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_952d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1393_c11_952d_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1376_l1403_l1384_DUPLICATE_c11d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1376_l1403_l1384_DUPLICATE_c11d_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1384_c11_0e82] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0e82_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0e82_left;
     BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0e82_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0e82_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0e82_return_output := BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0e82_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1401_c32_f895] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1401_c32_f895_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1401_c32_f895_left;
     BIN_OP_AND_uxn_opcodes_h_l1401_c32_f895_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1401_c32_f895_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1401_c32_f895_return_output := BIN_OP_AND_uxn_opcodes_h_l1401_c32_f895_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1410_c11_fa4a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1410_c11_fa4a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_fa4a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1410_c11_fa4a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_fa4a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_fa4a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1410_c11_fa4a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1376_c6_876e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1376_c6_876e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_876e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1376_c6_876e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_876e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_876e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1376_c6_876e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1403_c11_c9ac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1403_c11_c9ac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_c9ac_left;
     BIN_OP_EQ_uxn_opcodes_h_l1403_c11_c9ac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_c9ac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_c9ac_return_output := BIN_OP_EQ_uxn_opcodes_h_l1403_c11_c9ac_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1397_c11_6293] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1397_c11_6293_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_6293_left;
     BIN_OP_EQ_uxn_opcodes_h_l1397_c11_6293_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_6293_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_6293_return_output := BIN_OP_EQ_uxn_opcodes_h_l1397_c11_6293_return_output;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l1397_c7_ea2f] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1397_c7_ea2f_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1410_l1403_l1384_DUPLICATE_b48e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1410_l1403_l1384_DUPLICATE_b48e_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1403_l1397_DUPLICATE_ccb0 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1403_l1397_DUPLICATE_ccb0_return_output := result.stack_address_sp_offset;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1376_c2_78a2] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1376_c2_78a2_return_output := result.is_stack_index_flipped;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1401_c32_c894_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1401_c32_f895_return_output;
     VAR_BIN_OP_SR_uxn_opcodes_h_l1404_c11_85b5_right := VAR_BIN_OP_AND_uxn_opcodes_h_l1404_c18_ce08_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_bcd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_876e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1376_c2_78a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_876e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_78a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_876e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_78a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_876e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_78a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_876e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_78a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_876e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_78a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_876e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_78a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_876e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_78a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_876e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1376_c2_78a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_876e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1376_c2_78a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_876e_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1376_c2_78a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_876e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1384_c7_221e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0e82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_221e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0e82_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_221e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0e82_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_221e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0e82_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_221e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0e82_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_221e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0e82_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_221e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0e82_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_221e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0e82_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1384_c7_221e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0e82_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1384_c7_221e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_0e82_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1388_c7_6243_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_4c5a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_6243_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_4c5a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_6243_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_4c5a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_6243_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_4c5a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_6243_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_4c5a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_6243_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_4c5a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_6243_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_4c5a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_6243_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_4c5a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1388_c7_6243_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_4c5a_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1388_c7_6243_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_4c5a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1393_c7_ce58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_952d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_ce58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_952d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_ce58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_952d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_ce58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_952d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_ce58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_952d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_ce58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_952d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_ce58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_952d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1393_c7_ce58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_952d_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1393_c7_ce58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_952d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_6293_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_6293_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_6293_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_6293_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_6293_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_6293_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_6293_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_6293_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_6293_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_56d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_c9ac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_56d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_c9ac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_56d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_c9ac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_56d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_c9ac_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_56d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_c9ac_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1403_c7_56d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_c9ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_eab5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_fa4a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_eab5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_fa4a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1376_l1384_DUPLICATE_426c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1376_l1384_DUPLICATE_426c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1376_l1384_DUPLICATE_426c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1376_l1384_DUPLICATE_426c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1376_l1384_DUPLICATE_426c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1410_l1403_l1384_DUPLICATE_b48e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1410_l1403_l1384_DUPLICATE_b48e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1410_l1403_l1384_DUPLICATE_b48e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1410_l1403_l1384_DUPLICATE_b48e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_56d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1410_l1403_l1384_DUPLICATE_b48e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_eab5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1410_l1403_l1384_DUPLICATE_b48e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1393_l1388_l1376_l1403_l1384_DUPLICATE_02e9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1393_l1388_l1376_l1403_l1384_DUPLICATE_02e9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1393_l1388_l1376_l1403_l1384_DUPLICATE_02e9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1393_l1388_l1376_l1403_l1384_DUPLICATE_02e9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_56d6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1393_l1388_l1376_l1403_l1384_DUPLICATE_02e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1410_l1384_DUPLICATE_a1b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1410_l1384_DUPLICATE_a1b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1410_l1384_DUPLICATE_a1b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1410_l1384_DUPLICATE_a1b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_eab5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1410_l1384_DUPLICATE_a1b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1403_l1397_DUPLICATE_ccb0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_56d6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1403_l1397_DUPLICATE_ccb0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1376_l1403_l1384_DUPLICATE_c11d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1376_l1403_l1384_DUPLICATE_c11d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1376_l1403_l1384_DUPLICATE_c11d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1376_l1403_l1384_DUPLICATE_c11d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1376_l1403_l1384_DUPLICATE_c11d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_56d6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1376_l1403_l1384_DUPLICATE_c11d_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l1404_c11_41db_right := VAR_CONST_SR_4_uxn_opcodes_h_l1404_c34_c659_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1376_c2_78a2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1397_c7_ea2f_return_output;
     -- BIN_OP_SR[uxn_opcodes_h_l1404_c11_85b5] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l1404_c11_85b5_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l1404_c11_85b5_left;
     BIN_OP_SR_uxn_opcodes_h_l1404_c11_85b5_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l1404_c11_85b5_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l1404_c11_85b5_return_output := BIN_OP_SR_uxn_opcodes_h_l1404_c11_85b5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1397_c7_ea2f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output;

     -- n8_MUX[uxn_opcodes_h_l1397_c7_ea2f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond <= VAR_n8_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond;
     n8_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue;
     n8_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output := n8_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1401_c32_c894] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1401_c32_c894_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1401_c32_c894_left;
     BIN_OP_GT_uxn_opcodes_h_l1401_c32_c894_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1401_c32_c894_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1401_c32_c894_return_output := BIN_OP_GT_uxn_opcodes_h_l1401_c32_c894_return_output;

     -- t8_MUX[uxn_opcodes_h_l1388_c7_6243] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1388_c7_6243_cond <= VAR_t8_MUX_uxn_opcodes_h_l1388_c7_6243_cond;
     t8_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue;
     t8_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1388_c7_6243_return_output := t8_MUX_uxn_opcodes_h_l1388_c7_6243_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1376_c2_78a2] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_78a2_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_78a2_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1410_c7_eab5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_eab5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_eab5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_eab5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_eab5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_eab5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_eab5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_eab5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_eab5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1376_c1_bcd3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_bcd3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_bcd3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_bcd3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_bcd3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_bcd3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_bcd3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_bcd3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_bcd3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1403_c7_56d6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_56d6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_56d6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_56d6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_56d6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_56d6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_56d6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_56d6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_56d6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1403_c7_56d6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_56d6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_56d6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_56d6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_56d6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_56d6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_56d6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_56d6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_56d6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1410_c7_eab5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_eab5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_eab5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_eab5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_eab5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_eab5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_eab5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_eab5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_eab5_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1401_c32_191f_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1401_c32_c894_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l1404_c11_41db_left := VAR_BIN_OP_SR_uxn_opcodes_h_l1404_c11_85b5_return_output;
     VAR_printf_uxn_opcodes_h_l1377_c3_d99e_uxn_opcodes_h_l1377_c3_d99e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_bcd3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_56d6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_eab5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_56d6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_56d6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_eab5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_56d6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1388_c7_6243_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1403_c7_56d6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_56d6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_56d6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_56d6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_56d6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_56d6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_56d6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_56d6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_56d6_return_output;

     -- printf_uxn_opcodes_h_l1377_c3_d99e[uxn_opcodes_h_l1377_c3_d99e] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1377_c3_d99e_uxn_opcodes_h_l1377_c3_d99e_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1377_c3_d99e_uxn_opcodes_h_l1377_c3_d99e_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1397_c7_ea2f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output;

     -- BIN_OP_SL[uxn_opcodes_h_l1404_c11_41db] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l1404_c11_41db_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l1404_c11_41db_left;
     BIN_OP_SL_uxn_opcodes_h_l1404_c11_41db_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l1404_c11_41db_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l1404_c11_41db_return_output := BIN_OP_SL_uxn_opcodes_h_l1404_c11_41db_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1393_c7_ce58] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_ce58_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_ce58_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output;

     -- n8_MUX[uxn_opcodes_h_l1393_c7_ce58] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1393_c7_ce58_cond <= VAR_n8_MUX_uxn_opcodes_h_l1393_c7_ce58_cond;
     n8_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue;
     n8_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output := n8_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1403_c7_56d6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_56d6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_56d6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_56d6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_56d6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_56d6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_56d6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_56d6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_56d6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1397_c7_ea2f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output;

     -- t8_MUX[uxn_opcodes_h_l1384_c7_221e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1384_c7_221e_cond <= VAR_t8_MUX_uxn_opcodes_h_l1384_c7_221e_cond;
     t8_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue;
     t8_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1384_c7_221e_return_output := t8_MUX_uxn_opcodes_h_l1384_c7_221e_return_output;

     -- MUX[uxn_opcodes_h_l1401_c32_191f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1401_c32_191f_cond <= VAR_MUX_uxn_opcodes_h_l1401_c32_191f_cond;
     MUX_uxn_opcodes_h_l1401_c32_191f_iftrue <= VAR_MUX_uxn_opcodes_h_l1401_c32_191f_iftrue;
     MUX_uxn_opcodes_h_l1401_c32_191f_iffalse <= VAR_MUX_uxn_opcodes_h_l1401_c32_191f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1401_c32_191f_return_output := MUX_uxn_opcodes_h_l1401_c32_191f_return_output;

     -- Submodule level 3
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_56d6_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l1404_c11_41db_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1403_c7_56d6_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l1404_c11_41db_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue := VAR_MUX_uxn_opcodes_h_l1401_c32_191f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_56d6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_56d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1384_c7_221e_return_output;
     -- n8_MUX[uxn_opcodes_h_l1388_c7_6243] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1388_c7_6243_cond <= VAR_n8_MUX_uxn_opcodes_h_l1388_c7_6243_cond;
     n8_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue;
     n8_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1388_c7_6243_return_output := n8_MUX_uxn_opcodes_h_l1388_c7_6243_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1403_c7_56d6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1403_c7_56d6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_56d6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1403_c7_56d6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_56d6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1403_c7_56d6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_56d6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_56d6_return_output := result_stack_value_MUX_uxn_opcodes_h_l1403_c7_56d6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1397_c7_ea2f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1388_c7_6243] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_6243_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_6243_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_6243_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_6243_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1397_c7_ea2f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1403_c7_56d6] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1403_c7_56d6_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1403_c7_56d6_cond;
     tmp8_MUX_uxn_opcodes_h_l1403_c7_56d6_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1403_c7_56d6_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1403_c7_56d6_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1403_c7_56d6_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1403_c7_56d6_return_output := tmp8_MUX_uxn_opcodes_h_l1403_c7_56d6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1393_c7_ce58] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_ce58_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_ce58_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output;

     -- t8_MUX[uxn_opcodes_h_l1376_c2_78a2] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1376_c2_78a2_cond <= VAR_t8_MUX_uxn_opcodes_h_l1376_c2_78a2_cond;
     t8_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue;
     t8_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output := t8_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1397_c7_ea2f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1393_c7_ce58] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_ce58_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_ce58_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1388_c7_6243_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_6243_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_56d6_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1403_c7_56d6_return_output;
     -- n8_MUX[uxn_opcodes_h_l1384_c7_221e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1384_c7_221e_cond <= VAR_n8_MUX_uxn_opcodes_h_l1384_c7_221e_cond;
     n8_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue;
     n8_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1384_c7_221e_return_output := n8_MUX_uxn_opcodes_h_l1384_c7_221e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1393_c7_ce58] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_ce58_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_ce58_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1397_c7_ea2f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1397_c7_ea2f] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1397_c7_ea2f_cond;
     tmp8_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1397_c7_ea2f_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1397_c7_ea2f_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output := tmp8_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1388_c7_6243] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_6243_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_6243_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_6243_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_6243_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1388_c7_6243] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_6243_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_6243_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_6243_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_6243_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1393_c7_ce58] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_ce58_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_ce58_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1384_c7_221e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_221e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_221e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_221e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_221e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1393_c7_ce58] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_ce58_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_ce58_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1384_c7_221e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_6243_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_221e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_6243_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1397_c7_ea2f_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1384_c7_221e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_221e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_221e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_221e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_221e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1376_c2_78a2] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_78a2_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_78a2_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1393_c7_ce58] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1393_c7_ce58_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1393_c7_ce58_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output := result_stack_value_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1388_c7_6243] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_6243_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_6243_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_6243_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_6243_return_output;

     -- n8_MUX[uxn_opcodes_h_l1376_c2_78a2] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1376_c2_78a2_cond <= VAR_n8_MUX_uxn_opcodes_h_l1376_c2_78a2_cond;
     n8_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue;
     n8_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output := n8_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1393_c7_ce58] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1393_c7_ce58_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1393_c7_ce58_cond;
     tmp8_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1393_c7_ce58_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1393_c7_ce58_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output := tmp8_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1388_c7_6243] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_6243_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_6243_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_6243_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_6243_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1384_c7_221e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_221e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_221e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_221e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_221e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1388_c7_6243] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_6243_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_6243_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_6243_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_6243_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_6243_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_221e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_6243_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_6243_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_221e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1393_c7_ce58_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1384_c7_221e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_221e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_221e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_221e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_221e_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1388_c7_6243] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1388_c7_6243_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1388_c7_6243_cond;
     tmp8_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1388_c7_6243_return_output := tmp8_MUX_uxn_opcodes_h_l1388_c7_6243_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1384_c7_221e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_221e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_221e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_221e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_221e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1388_c7_6243] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1388_c7_6243_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_6243_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_6243_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_6243_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_6243_return_output := result_stack_value_MUX_uxn_opcodes_h_l1388_c7_6243_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1376_c2_78a2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_78a2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_78a2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1384_c7_221e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_221e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_221e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_221e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_221e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1376_c2_78a2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_78a2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_78a2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_221e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_221e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_221e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_6243_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1388_c7_6243_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1384_c7_221e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1384_c7_221e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_221e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_221e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1384_c7_221e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1376_c2_78a2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_78a2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_78a2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1376_c2_78a2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_78a2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_78a2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1376_c2_78a2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_78a2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_78a2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1384_c7_221e] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1384_c7_221e_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1384_c7_221e_cond;
     tmp8_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1384_c7_221e_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1384_c7_221e_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1384_c7_221e_return_output := tmp8_MUX_uxn_opcodes_h_l1384_c7_221e_return_output;

     -- Submodule level 8
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_221e_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1384_c7_221e_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1376_c2_78a2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1376_c2_78a2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1376_c2_78a2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output := result_stack_value_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1376_c2_78a2] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1376_c2_78a2_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1376_c2_78a2_cond;
     tmp8_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1376_c2_78a2_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1376_c2_78a2_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output := tmp8_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output;

     -- Submodule level 9
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1415_l1372_DUPLICATE_afac LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1415_l1372_DUPLICATE_afac_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1376_c2_78a2_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1415_l1372_DUPLICATE_afac_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1415_l1372_DUPLICATE_afac_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
