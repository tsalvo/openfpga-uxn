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
-- BIN_OP_EQ[uxn_opcodes_h_l1376_c6_1a2f]
signal BIN_OP_EQ_uxn_opcodes_h_l1376_c6_1a2f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1376_c6_1a2f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1376_c6_1a2f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1376_c1_b8a2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_b8a2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_b8a2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_b8a2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_b8a2_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1376_c2_1a50]
signal t8_MUX_uxn_opcodes_h_l1376_c2_1a50_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1376_c2_1a50]
signal n8_MUX_uxn_opcodes_h_l1376_c2_1a50_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1376_c2_1a50]
signal result_stack_value_MUX_uxn_opcodes_h_l1376_c2_1a50_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1376_c2_1a50]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_1a50_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1376_c2_1a50]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_1a50_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1376_c2_1a50]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_1a50_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1376_c2_1a50]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_1a50_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1376_c2_1a50]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_1a50_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1376_c2_1a50]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_1a50_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1376_c2_1a50]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_1a50_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1376_c2_1a50]
signal tmp8_MUX_uxn_opcodes_h_l1376_c2_1a50_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1377_c3_2cb1[uxn_opcodes_h_l1377_c3_2cb1]
signal printf_uxn_opcodes_h_l1377_c3_2cb1_uxn_opcodes_h_l1377_c3_2cb1_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1384_c11_90cc]
signal BIN_OP_EQ_uxn_opcodes_h_l1384_c11_90cc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1384_c11_90cc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1384_c11_90cc_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1384_c7_7112]
signal t8_MUX_uxn_opcodes_h_l1384_c7_7112_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1384_c7_7112_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1384_c7_7112]
signal n8_MUX_uxn_opcodes_h_l1384_c7_7112_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1384_c7_7112_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1384_c7_7112]
signal result_stack_value_MUX_uxn_opcodes_h_l1384_c7_7112_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1384_c7_7112_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1384_c7_7112]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_7112_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_7112_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1384_c7_7112]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_7112_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_7112_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1384_c7_7112]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_7112_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_7112_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1384_c7_7112]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_7112_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_7112_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1384_c7_7112]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_7112_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_7112_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1384_c7_7112]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_7112_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_7112_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1384_c7_7112]
signal tmp8_MUX_uxn_opcodes_h_l1384_c7_7112_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1384_c7_7112_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1388_c11_8129]
signal BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8129_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8129_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8129_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1388_c7_2c31]
signal t8_MUX_uxn_opcodes_h_l1388_c7_2c31_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1388_c7_2c31]
signal n8_MUX_uxn_opcodes_h_l1388_c7_2c31_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1388_c7_2c31]
signal result_stack_value_MUX_uxn_opcodes_h_l1388_c7_2c31_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1388_c7_2c31]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_2c31_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1388_c7_2c31]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_2c31_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1388_c7_2c31]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_2c31_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1388_c7_2c31]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_2c31_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1388_c7_2c31]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_2c31_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1388_c7_2c31]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_2c31_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1388_c7_2c31]
signal tmp8_MUX_uxn_opcodes_h_l1388_c7_2c31_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1393_c11_3956]
signal BIN_OP_EQ_uxn_opcodes_h_l1393_c11_3956_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1393_c11_3956_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1393_c11_3956_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1393_c7_a0d5]
signal n8_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1393_c7_a0d5]
signal result_stack_value_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1393_c7_a0d5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1393_c7_a0d5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1393_c7_a0d5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1393_c7_a0d5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1393_c7_a0d5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1393_c7_a0d5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1393_c7_a0d5]
signal tmp8_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1397_c11_abb0]
signal BIN_OP_EQ_uxn_opcodes_h_l1397_c11_abb0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1397_c11_abb0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1397_c11_abb0_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1397_c7_4d23]
signal n8_MUX_uxn_opcodes_h_l1397_c7_4d23_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1397_c7_4d23]
signal result_stack_value_MUX_uxn_opcodes_h_l1397_c7_4d23_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1397_c7_4d23]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_4d23_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1397_c7_4d23]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_4d23_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1397_c7_4d23]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_4d23_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1397_c7_4d23]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_4d23_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1397_c7_4d23]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_4d23_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1397_c7_4d23]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_4d23_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1397_c7_4d23]
signal tmp8_MUX_uxn_opcodes_h_l1397_c7_4d23_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1401_c32_be4c]
signal BIN_OP_AND_uxn_opcodes_h_l1401_c32_be4c_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1401_c32_be4c_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1401_c32_be4c_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1401_c32_9ac5]
signal BIN_OP_GT_uxn_opcodes_h_l1401_c32_9ac5_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1401_c32_9ac5_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1401_c32_9ac5_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1401_c32_ade4]
signal MUX_uxn_opcodes_h_l1401_c32_ade4_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1401_c32_ade4_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1401_c32_ade4_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1401_c32_ade4_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1403_c11_d380]
signal BIN_OP_EQ_uxn_opcodes_h_l1403_c11_d380_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1403_c11_d380_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1403_c11_d380_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1403_c7_c1a3]
signal result_stack_value_MUX_uxn_opcodes_h_l1403_c7_c1a3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1403_c7_c1a3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1403_c7_c1a3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1403_c7_c1a3_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1403_c7_c1a3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_c1a3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_c1a3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_c1a3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_c1a3_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1403_c7_c1a3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_c1a3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_c1a3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_c1a3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_c1a3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1403_c7_c1a3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_c1a3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_c1a3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_c1a3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_c1a3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1403_c7_c1a3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_c1a3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_c1a3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_c1a3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_c1a3_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1403_c7_c1a3]
signal tmp8_MUX_uxn_opcodes_h_l1403_c7_c1a3_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1403_c7_c1a3_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1403_c7_c1a3_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1403_c7_c1a3_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1404_c18_5136]
signal BIN_OP_AND_uxn_opcodes_h_l1404_c18_5136_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1404_c18_5136_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1404_c18_5136_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l1404_c11_eaa9]
signal BIN_OP_SR_uxn_opcodes_h_l1404_c11_eaa9_left : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l1404_c11_eaa9_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l1404_c11_eaa9_return_output : unsigned(7 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l1404_c34_ae0c]
signal CONST_SR_4_uxn_opcodes_h_l1404_c34_ae0c_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l1404_c34_ae0c_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l1404_c11_2211]
signal BIN_OP_SL_uxn_opcodes_h_l1404_c11_2211_left : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l1404_c11_2211_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l1404_c11_2211_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1410_c11_f60e]
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_f60e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_f60e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_f60e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1410_c7_3520]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_3520_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_3520_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_3520_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_3520_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1410_c7_3520]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_3520_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_3520_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_3520_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_3520_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_81ab( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_value := ref_toks_1;
      base.is_stack_read := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1376_c6_1a2f
BIN_OP_EQ_uxn_opcodes_h_l1376_c6_1a2f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1376_c6_1a2f_left,
BIN_OP_EQ_uxn_opcodes_h_l1376_c6_1a2f_right,
BIN_OP_EQ_uxn_opcodes_h_l1376_c6_1a2f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_b8a2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_b8a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_b8a2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_b8a2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_b8a2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_b8a2_return_output);

-- t8_MUX_uxn_opcodes_h_l1376_c2_1a50
t8_MUX_uxn_opcodes_h_l1376_c2_1a50 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1376_c2_1a50_cond,
t8_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue,
t8_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse,
t8_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output);

-- n8_MUX_uxn_opcodes_h_l1376_c2_1a50
n8_MUX_uxn_opcodes_h_l1376_c2_1a50 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1376_c2_1a50_cond,
n8_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue,
n8_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse,
n8_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1376_c2_1a50
result_stack_value_MUX_uxn_opcodes_h_l1376_c2_1a50 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1376_c2_1a50_cond,
result_stack_value_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_1a50
result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_1a50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_1a50_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_1a50
result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_1a50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_1a50_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_1a50
result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_1a50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_1a50_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_1a50
result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_1a50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_1a50_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_1a50
result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_1a50 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_1a50_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_1a50
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_1a50 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_1a50_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_1a50
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_1a50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_1a50_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1376_c2_1a50
tmp8_MUX_uxn_opcodes_h_l1376_c2_1a50 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1376_c2_1a50_cond,
tmp8_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue,
tmp8_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse,
tmp8_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output);

-- printf_uxn_opcodes_h_l1377_c3_2cb1_uxn_opcodes_h_l1377_c3_2cb1
printf_uxn_opcodes_h_l1377_c3_2cb1_uxn_opcodes_h_l1377_c3_2cb1 : entity work.printf_uxn_opcodes_h_l1377_c3_2cb1_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1377_c3_2cb1_uxn_opcodes_h_l1377_c3_2cb1_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1384_c11_90cc
BIN_OP_EQ_uxn_opcodes_h_l1384_c11_90cc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1384_c11_90cc_left,
BIN_OP_EQ_uxn_opcodes_h_l1384_c11_90cc_right,
BIN_OP_EQ_uxn_opcodes_h_l1384_c11_90cc_return_output);

-- t8_MUX_uxn_opcodes_h_l1384_c7_7112
t8_MUX_uxn_opcodes_h_l1384_c7_7112 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1384_c7_7112_cond,
t8_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue,
t8_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse,
t8_MUX_uxn_opcodes_h_l1384_c7_7112_return_output);

-- n8_MUX_uxn_opcodes_h_l1384_c7_7112
n8_MUX_uxn_opcodes_h_l1384_c7_7112 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1384_c7_7112_cond,
n8_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue,
n8_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse,
n8_MUX_uxn_opcodes_h_l1384_c7_7112_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1384_c7_7112
result_stack_value_MUX_uxn_opcodes_h_l1384_c7_7112 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1384_c7_7112_cond,
result_stack_value_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1384_c7_7112_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_7112
result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_7112 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_7112_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_7112_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_7112
result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_7112 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_7112_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_7112_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_7112
result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_7112 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_7112_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_7112_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_7112
result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_7112 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_7112_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_7112_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_7112
result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_7112 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_7112_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_7112_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_7112
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_7112 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_7112_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_7112_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1384_c7_7112
tmp8_MUX_uxn_opcodes_h_l1384_c7_7112 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1384_c7_7112_cond,
tmp8_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue,
tmp8_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse,
tmp8_MUX_uxn_opcodes_h_l1384_c7_7112_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8129
BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8129 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8129_left,
BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8129_right,
BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8129_return_output);

-- t8_MUX_uxn_opcodes_h_l1388_c7_2c31
t8_MUX_uxn_opcodes_h_l1388_c7_2c31 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1388_c7_2c31_cond,
t8_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue,
t8_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse,
t8_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output);

-- n8_MUX_uxn_opcodes_h_l1388_c7_2c31
n8_MUX_uxn_opcodes_h_l1388_c7_2c31 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1388_c7_2c31_cond,
n8_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue,
n8_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse,
n8_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1388_c7_2c31
result_stack_value_MUX_uxn_opcodes_h_l1388_c7_2c31 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1388_c7_2c31_cond,
result_stack_value_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_2c31
result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_2c31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_2c31_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_2c31
result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_2c31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_2c31_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_2c31
result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_2c31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_2c31_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_2c31
result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_2c31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_2c31_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_2c31
result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_2c31 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_2c31_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_2c31
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_2c31 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_2c31_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1388_c7_2c31
tmp8_MUX_uxn_opcodes_h_l1388_c7_2c31 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1388_c7_2c31_cond,
tmp8_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue,
tmp8_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse,
tmp8_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1393_c11_3956
BIN_OP_EQ_uxn_opcodes_h_l1393_c11_3956 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1393_c11_3956_left,
BIN_OP_EQ_uxn_opcodes_h_l1393_c11_3956_right,
BIN_OP_EQ_uxn_opcodes_h_l1393_c11_3956_return_output);

-- n8_MUX_uxn_opcodes_h_l1393_c7_a0d5
n8_MUX_uxn_opcodes_h_l1393_c7_a0d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond,
n8_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue,
n8_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse,
n8_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1393_c7_a0d5
result_stack_value_MUX_uxn_opcodes_h_l1393_c7_a0d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond,
result_stack_value_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_a0d5
result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_a0d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_a0d5
result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_a0d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5
result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_a0d5
result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_a0d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_a0d5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_a0d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1393_c7_a0d5
tmp8_MUX_uxn_opcodes_h_l1393_c7_a0d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond,
tmp8_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue,
tmp8_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse,
tmp8_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1397_c11_abb0
BIN_OP_EQ_uxn_opcodes_h_l1397_c11_abb0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1397_c11_abb0_left,
BIN_OP_EQ_uxn_opcodes_h_l1397_c11_abb0_right,
BIN_OP_EQ_uxn_opcodes_h_l1397_c11_abb0_return_output);

-- n8_MUX_uxn_opcodes_h_l1397_c7_4d23
n8_MUX_uxn_opcodes_h_l1397_c7_4d23 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1397_c7_4d23_cond,
n8_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue,
n8_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse,
n8_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1397_c7_4d23
result_stack_value_MUX_uxn_opcodes_h_l1397_c7_4d23 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1397_c7_4d23_cond,
result_stack_value_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_4d23
result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_4d23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_4d23_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_4d23
result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_4d23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_4d23_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_4d23
result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_4d23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_4d23_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_4d23
result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_4d23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_4d23_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_4d23
result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_4d23 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_4d23_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_4d23
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_4d23 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_4d23_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1397_c7_4d23
tmp8_MUX_uxn_opcodes_h_l1397_c7_4d23 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1397_c7_4d23_cond,
tmp8_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue,
tmp8_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse,
tmp8_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1401_c32_be4c
BIN_OP_AND_uxn_opcodes_h_l1401_c32_be4c : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1401_c32_be4c_left,
BIN_OP_AND_uxn_opcodes_h_l1401_c32_be4c_right,
BIN_OP_AND_uxn_opcodes_h_l1401_c32_be4c_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1401_c32_9ac5
BIN_OP_GT_uxn_opcodes_h_l1401_c32_9ac5 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1401_c32_9ac5_left,
BIN_OP_GT_uxn_opcodes_h_l1401_c32_9ac5_right,
BIN_OP_GT_uxn_opcodes_h_l1401_c32_9ac5_return_output);

-- MUX_uxn_opcodes_h_l1401_c32_ade4
MUX_uxn_opcodes_h_l1401_c32_ade4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1401_c32_ade4_cond,
MUX_uxn_opcodes_h_l1401_c32_ade4_iftrue,
MUX_uxn_opcodes_h_l1401_c32_ade4_iffalse,
MUX_uxn_opcodes_h_l1401_c32_ade4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1403_c11_d380
BIN_OP_EQ_uxn_opcodes_h_l1403_c11_d380 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1403_c11_d380_left,
BIN_OP_EQ_uxn_opcodes_h_l1403_c11_d380_right,
BIN_OP_EQ_uxn_opcodes_h_l1403_c11_d380_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1403_c7_c1a3
result_stack_value_MUX_uxn_opcodes_h_l1403_c7_c1a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1403_c7_c1a3_cond,
result_stack_value_MUX_uxn_opcodes_h_l1403_c7_c1a3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1403_c7_c1a3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1403_c7_c1a3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_c1a3
result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_c1a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_c1a3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_c1a3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_c1a3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_c1a3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_c1a3
result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_c1a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_c1a3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_c1a3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_c1a3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_c1a3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_c1a3
result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_c1a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_c1a3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_c1a3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_c1a3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_c1a3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_c1a3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_c1a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_c1a3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_c1a3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_c1a3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_c1a3_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1403_c7_c1a3
tmp8_MUX_uxn_opcodes_h_l1403_c7_c1a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1403_c7_c1a3_cond,
tmp8_MUX_uxn_opcodes_h_l1403_c7_c1a3_iftrue,
tmp8_MUX_uxn_opcodes_h_l1403_c7_c1a3_iffalse,
tmp8_MUX_uxn_opcodes_h_l1403_c7_c1a3_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1404_c18_5136
BIN_OP_AND_uxn_opcodes_h_l1404_c18_5136 : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1404_c18_5136_left,
BIN_OP_AND_uxn_opcodes_h_l1404_c18_5136_right,
BIN_OP_AND_uxn_opcodes_h_l1404_c18_5136_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l1404_c11_eaa9
BIN_OP_SR_uxn_opcodes_h_l1404_c11_eaa9 : entity work.BIN_OP_SR_uint8_t_uint8_t_0CLK_25d197a7 port map (
BIN_OP_SR_uxn_opcodes_h_l1404_c11_eaa9_left,
BIN_OP_SR_uxn_opcodes_h_l1404_c11_eaa9_right,
BIN_OP_SR_uxn_opcodes_h_l1404_c11_eaa9_return_output);

-- CONST_SR_4_uxn_opcodes_h_l1404_c34_ae0c
CONST_SR_4_uxn_opcodes_h_l1404_c34_ae0c : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l1404_c34_ae0c_x,
CONST_SR_4_uxn_opcodes_h_l1404_c34_ae0c_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l1404_c11_2211
BIN_OP_SL_uxn_opcodes_h_l1404_c11_2211 : entity work.BIN_OP_SL_uint8_t_uint8_t_0CLK_10d8c973 port map (
BIN_OP_SL_uxn_opcodes_h_l1404_c11_2211_left,
BIN_OP_SL_uxn_opcodes_h_l1404_c11_2211_right,
BIN_OP_SL_uxn_opcodes_h_l1404_c11_2211_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1410_c11_f60e
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_f60e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_f60e_left,
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_f60e_right,
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_f60e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_3520
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_3520 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_3520_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_3520_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_3520_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_3520_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_3520
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_3520 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_3520_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_3520_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_3520_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_3520_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1376_c6_1a2f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_b8a2_return_output,
 t8_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output,
 n8_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output,
 tmp8_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1384_c11_90cc_return_output,
 t8_MUX_uxn_opcodes_h_l1384_c7_7112_return_output,
 n8_MUX_uxn_opcodes_h_l1384_c7_7112_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1384_c7_7112_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_7112_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_7112_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_7112_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_7112_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_7112_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_7112_return_output,
 tmp8_MUX_uxn_opcodes_h_l1384_c7_7112_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8129_return_output,
 t8_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output,
 n8_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output,
 tmp8_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1393_c11_3956_return_output,
 n8_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output,
 tmp8_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1397_c11_abb0_return_output,
 n8_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output,
 tmp8_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1401_c32_be4c_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1401_c32_9ac5_return_output,
 MUX_uxn_opcodes_h_l1401_c32_ade4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1403_c11_d380_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1403_c7_c1a3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_c1a3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_c1a3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_c1a3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_c1a3_return_output,
 tmp8_MUX_uxn_opcodes_h_l1403_c7_c1a3_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1404_c18_5136_return_output,
 BIN_OP_SR_uxn_opcodes_h_l1404_c11_eaa9_return_output,
 CONST_SR_4_uxn_opcodes_h_l1404_c34_ae0c_return_output,
 BIN_OP_SL_uxn_opcodes_h_l1404_c11_2211_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1410_c11_f60e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_3520_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_3520_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_1a2f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_1a2f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_1a2f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_b8a2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_b8a2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_b8a2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_b8a2_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1384_c7_7112_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1376_c2_1a50_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1384_c7_7112_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1376_c2_1a50_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_7112_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1376_c2_1a50_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_7112_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_1a50_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_7112_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_1a50_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_7112_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_1a50_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_7112_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_1a50_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_7112_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_1a50_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1380_c3_3b20 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_7112_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_1a50_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1376_c2_1a50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_1a50_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1384_c7_7112_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1376_c2_1a50_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1377_c3_2cb1_uxn_opcodes_h_l1377_c3_2cb1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_90cc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_90cc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_90cc_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1384_c7_7112_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1384_c7_7112_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_7112_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_7112_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_7112_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_7112_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_7112_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_7112_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1386_c3_d0ef : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_7112_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1384_c7_7112_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8129_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8129_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8129_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1388_c7_2c31_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1388_c7_2c31_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_2c31_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_2c31_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_2c31_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_2c31_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_2c31_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_2c31_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1391_c3_bc0e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_2c31_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1388_c7_2c31_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_3956_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_3956_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_3956_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1395_c3_0588 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_abb0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_abb0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_abb0_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1397_c7_4d23_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_c1a3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1397_c7_4d23_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1397_c7_4d23_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_4d23_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_c1a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_4d23_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_c1a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_4d23_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_c1a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_4d23_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_4d23_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_c1a3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_4d23_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1403_c7_c1a3_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1397_c7_4d23_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1401_c32_ade4_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1401_c32_ade4_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1401_c32_ade4_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1401_c32_be4c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1401_c32_be4c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1401_c32_be4c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1401_c32_9ac5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1401_c32_9ac5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1401_c32_9ac5_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1401_c32_ade4_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_d380_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_d380_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_d380_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_c1a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_c1a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_c1a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_c1a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_c1a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_3520_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_c1a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_c1a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_c1a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_c1a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_c1a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_c1a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_3520_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_c1a3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_c1a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1407_c3_15cf : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_c1a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_c1a3_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1403_c7_c1a3_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1403_c7_c1a3_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1403_c7_c1a3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l1404_c11_eaa9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1404_c18_5136_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1404_c18_5136_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1404_c18_5136_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l1404_c11_eaa9_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l1404_c11_eaa9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l1404_c11_2211_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l1404_c11_2211_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l1404_c34_ae0c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l1404_c34_ae0c_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l1404_c11_2211_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_f60e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_f60e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_f60e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_3520_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_3520_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_3520_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_3520_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_3520_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_3520_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1403_l1397_l1393_l1388_l1384_l1376_DUPLICATE_f941_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1403_l1393_l1388_l1384_l1376_DUPLICATE_6538_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1397_l1393_l1388_l1384_l1376_DUPLICATE_7468_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1397_l1393_l1410_l1388_l1384_DUPLICATE_d55e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1403_l1397_l1393_l1410_l1388_l1384_DUPLICATE_8f55_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1397_l1403_DUPLICATE_3e5c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l1372_l1415_DUPLICATE_3779_return_output : opcode_result_t;
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
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1401_c32_ade4_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1391_c3_bc0e := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1391_c3_bc0e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1395_c3_0588 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1395_c3_0588;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8129_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_3520_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_b8a2_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1407_c3_15cf := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_c1a3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1407_c3_15cf;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1404_c18_5136_right := to_unsigned(15, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_90cc_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1380_c3_3b20 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1380_c3_3b20;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_3956_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_c1a3_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_f60e_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1386_c3_d0ef := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1386_c3_d0ef;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1401_c32_be4c_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_d380_right := to_unsigned(5, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_1a2f_right := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1401_c32_9ac5_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_3520_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_abb0_right := to_unsigned(4, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1401_c32_ade4_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_c1a3_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_b8a2_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1401_c32_be4c_left := VAR_ins;
     VAR_BIN_OP_SR_uxn_opcodes_h_l1404_c11_eaa9_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_1a2f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_90cc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8129_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_3956_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_abb0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_d380_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_f60e_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1404_c18_5136_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l1404_c34_ae0c_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse := t8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1403_c7_c1a3_iffalse := tmp8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1403_l1393_l1388_l1384_l1376_DUPLICATE_6538 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1403_l1393_l1388_l1384_l1376_DUPLICATE_6538_return_output := result.is_sp_shift;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1376_c2_1a50] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1376_c2_1a50_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1397_l1393_l1410_l1388_l1384_DUPLICATE_d55e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1397_l1393_l1410_l1388_l1384_DUPLICATE_d55e_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1410_c11_f60e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1410_c11_f60e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_f60e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1410_c11_f60e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_f60e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_f60e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1410_c11_f60e_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1404_c18_5136] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1404_c18_5136_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1404_c18_5136_left;
     BIN_OP_AND_uxn_opcodes_h_l1404_c18_5136_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1404_c18_5136_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1404_c18_5136_return_output := BIN_OP_AND_uxn_opcodes_h_l1404_c18_5136_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1397_l1403_DUPLICATE_3e5c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1397_l1403_DUPLICATE_3e5c_return_output := result.stack_address_sp_offset;

     -- CONST_SR_4[uxn_opcodes_h_l1404_c34_ae0c] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l1404_c34_ae0c_x <= VAR_CONST_SR_4_uxn_opcodes_h_l1404_c34_ae0c_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l1404_c34_ae0c_return_output := CONST_SR_4_uxn_opcodes_h_l1404_c34_ae0c_return_output;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l1397_c7_4d23] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1397_c7_4d23_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1388_c11_8129] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8129_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8129_left;
     BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8129_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8129_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8129_return_output := BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8129_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1384_c11_90cc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1384_c11_90cc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_90cc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1384_c11_90cc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_90cc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_90cc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1384_c11_90cc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1397_c11_abb0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1397_c11_abb0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_abb0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1397_c11_abb0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_abb0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_abb0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1397_c11_abb0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1403_c11_d380] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1403_c11_d380_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_d380_left;
     BIN_OP_EQ_uxn_opcodes_h_l1403_c11_d380_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_d380_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_d380_return_output := BIN_OP_EQ_uxn_opcodes_h_l1403_c11_d380_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1401_c32_be4c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1401_c32_be4c_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1401_c32_be4c_left;
     BIN_OP_AND_uxn_opcodes_h_l1401_c32_be4c_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1401_c32_be4c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1401_c32_be4c_return_output := BIN_OP_AND_uxn_opcodes_h_l1401_c32_be4c_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1397_l1393_l1388_l1384_l1376_DUPLICATE_7468 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1397_l1393_l1388_l1384_l1376_DUPLICATE_7468_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1393_c11_3956] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1393_c11_3956_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_3956_left;
     BIN_OP_EQ_uxn_opcodes_h_l1393_c11_3956_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_3956_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_3956_return_output := BIN_OP_EQ_uxn_opcodes_h_l1393_c11_3956_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1403_l1397_l1393_l1410_l1388_l1384_DUPLICATE_8f55 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1403_l1397_l1393_l1410_l1388_l1384_DUPLICATE_8f55_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1403_l1397_l1393_l1388_l1384_l1376_DUPLICATE_f941 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1403_l1397_l1393_l1388_l1384_l1376_DUPLICATE_f941_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1376_c6_1a2f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1376_c6_1a2f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_1a2f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1376_c6_1a2f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_1a2f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_1a2f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1376_c6_1a2f_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1401_c32_9ac5_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1401_c32_be4c_return_output;
     VAR_BIN_OP_SR_uxn_opcodes_h_l1404_c11_eaa9_right := VAR_BIN_OP_AND_uxn_opcodes_h_l1404_c18_5136_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_b8a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_1a2f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1376_c2_1a50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_1a2f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_1a50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_1a2f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_1a50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_1a2f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_1a50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_1a2f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_1a50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_1a2f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_1a50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_1a2f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_1a50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_1a2f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_1a50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_1a2f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1376_c2_1a50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_1a2f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1376_c2_1a50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_1a2f_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1376_c2_1a50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_1a2f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1384_c7_7112_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_90cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_7112_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_90cc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_7112_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_90cc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_7112_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_90cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_7112_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_90cc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_7112_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_90cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_7112_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_90cc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_7112_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_90cc_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1384_c7_7112_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_90cc_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1384_c7_7112_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_90cc_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1388_c7_2c31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8129_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_2c31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8129_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_2c31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8129_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_2c31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8129_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_2c31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8129_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_2c31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8129_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_2c31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8129_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_2c31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8129_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1388_c7_2c31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8129_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1388_c7_2c31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_8129_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_3956_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_3956_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_3956_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_3956_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_3956_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_3956_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_3956_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_3956_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_3956_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1397_c7_4d23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_abb0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_4d23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_abb0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_4d23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_abb0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_4d23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_abb0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_4d23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_abb0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_4d23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_abb0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_4d23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_abb0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1397_c7_4d23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_abb0_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1397_c7_4d23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_abb0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_c1a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_d380_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_c1a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_d380_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_c1a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_d380_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_c1a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_d380_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_c1a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_d380_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1403_c7_c1a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_d380_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_3520_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_f60e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_3520_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_f60e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1397_l1393_l1388_l1384_l1376_DUPLICATE_7468_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1397_l1393_l1388_l1384_l1376_DUPLICATE_7468_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1397_l1393_l1388_l1384_l1376_DUPLICATE_7468_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1397_l1393_l1388_l1384_l1376_DUPLICATE_7468_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1397_l1393_l1388_l1384_l1376_DUPLICATE_7468_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1403_l1397_l1393_l1410_l1388_l1384_DUPLICATE_8f55_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1403_l1397_l1393_l1410_l1388_l1384_DUPLICATE_8f55_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1403_l1397_l1393_l1410_l1388_l1384_DUPLICATE_8f55_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1403_l1397_l1393_l1410_l1388_l1384_DUPLICATE_8f55_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_c1a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1403_l1397_l1393_l1410_l1388_l1384_DUPLICATE_8f55_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_3520_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1403_l1397_l1393_l1410_l1388_l1384_DUPLICATE_8f55_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1403_l1393_l1388_l1384_l1376_DUPLICATE_6538_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1403_l1393_l1388_l1384_l1376_DUPLICATE_6538_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1403_l1393_l1388_l1384_l1376_DUPLICATE_6538_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1403_l1393_l1388_l1384_l1376_DUPLICATE_6538_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_c1a3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1403_l1393_l1388_l1384_l1376_DUPLICATE_6538_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1397_l1393_l1410_l1388_l1384_DUPLICATE_d55e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1397_l1393_l1410_l1388_l1384_DUPLICATE_d55e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1397_l1393_l1410_l1388_l1384_DUPLICATE_d55e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1397_l1393_l1410_l1388_l1384_DUPLICATE_d55e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_3520_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1397_l1393_l1410_l1388_l1384_DUPLICATE_d55e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1397_l1403_DUPLICATE_3e5c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_c1a3_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1397_l1403_DUPLICATE_3e5c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1403_l1397_l1393_l1388_l1384_l1376_DUPLICATE_f941_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1403_l1397_l1393_l1388_l1384_l1376_DUPLICATE_f941_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1403_l1397_l1393_l1388_l1384_l1376_DUPLICATE_f941_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1403_l1397_l1393_l1388_l1384_l1376_DUPLICATE_f941_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1403_l1397_l1393_l1388_l1384_l1376_DUPLICATE_f941_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_c1a3_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1403_l1397_l1393_l1388_l1384_l1376_DUPLICATE_f941_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l1404_c11_2211_right := VAR_CONST_SR_4_uxn_opcodes_h_l1404_c34_ae0c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1376_c2_1a50_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1397_c7_4d23_return_output;
     -- t8_MUX[uxn_opcodes_h_l1388_c7_2c31] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1388_c7_2c31_cond <= VAR_t8_MUX_uxn_opcodes_h_l1388_c7_2c31_cond;
     t8_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue;
     t8_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output := t8_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1397_c7_4d23] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_4d23_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_4d23_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1403_c7_c1a3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_c1a3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_c1a3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_c1a3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_c1a3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_c1a3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_c1a3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_c1a3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_c1a3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1403_c7_c1a3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_c1a3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_c1a3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_c1a3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_c1a3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_c1a3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_c1a3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_c1a3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_c1a3_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1401_c32_9ac5] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1401_c32_9ac5_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1401_c32_9ac5_left;
     BIN_OP_GT_uxn_opcodes_h_l1401_c32_9ac5_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1401_c32_9ac5_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1401_c32_9ac5_return_output := BIN_OP_GT_uxn_opcodes_h_l1401_c32_9ac5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1410_c7_3520] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_3520_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_3520_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_3520_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_3520_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_3520_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_3520_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_3520_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_3520_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1376_c2_1a50] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_1a50_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_1a50_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output;

     -- BIN_OP_SR[uxn_opcodes_h_l1404_c11_eaa9] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l1404_c11_eaa9_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l1404_c11_eaa9_left;
     BIN_OP_SR_uxn_opcodes_h_l1404_c11_eaa9_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l1404_c11_eaa9_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l1404_c11_eaa9_return_output := BIN_OP_SR_uxn_opcodes_h_l1404_c11_eaa9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1376_c1_b8a2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_b8a2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_b8a2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_b8a2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_b8a2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_b8a2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_b8a2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_b8a2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_b8a2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1410_c7_3520] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_3520_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_3520_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_3520_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_3520_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_3520_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_3520_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_3520_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_3520_return_output;

     -- n8_MUX[uxn_opcodes_h_l1397_c7_4d23] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1397_c7_4d23_cond <= VAR_n8_MUX_uxn_opcodes_h_l1397_c7_4d23_cond;
     n8_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue;
     n8_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output := n8_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1401_c32_ade4_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1401_c32_9ac5_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l1404_c11_2211_left := VAR_BIN_OP_SR_uxn_opcodes_h_l1404_c11_eaa9_return_output;
     VAR_printf_uxn_opcodes_h_l1377_c3_2cb1_uxn_opcodes_h_l1377_c3_2cb1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_b8a2_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_c1a3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_3520_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_c1a3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_c1a3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_3520_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_c1a3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output;
     -- t8_MUX[uxn_opcodes_h_l1384_c7_7112] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1384_c7_7112_cond <= VAR_t8_MUX_uxn_opcodes_h_l1384_c7_7112_cond;
     t8_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue;
     t8_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1384_c7_7112_return_output := t8_MUX_uxn_opcodes_h_l1384_c7_7112_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1403_c7_c1a3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_c1a3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_c1a3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_c1a3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_c1a3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_c1a3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_c1a3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_c1a3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_c1a3_return_output;

     -- printf_uxn_opcodes_h_l1377_c3_2cb1[uxn_opcodes_h_l1377_c3_2cb1] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1377_c3_2cb1_uxn_opcodes_h_l1377_c3_2cb1_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1377_c3_2cb1_uxn_opcodes_h_l1377_c3_2cb1_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1403_c7_c1a3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_c1a3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_c1a3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_c1a3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_c1a3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_c1a3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_c1a3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_c1a3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_c1a3_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1393_c7_a0d5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1397_c7_4d23] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_4d23_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_4d23_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output;

     -- BIN_OP_SL[uxn_opcodes_h_l1404_c11_2211] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l1404_c11_2211_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l1404_c11_2211_left;
     BIN_OP_SL_uxn_opcodes_h_l1404_c11_2211_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l1404_c11_2211_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l1404_c11_2211_return_output := BIN_OP_SL_uxn_opcodes_h_l1404_c11_2211_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1397_c7_4d23] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_4d23_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_4d23_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output;

     -- MUX[uxn_opcodes_h_l1401_c32_ade4] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1401_c32_ade4_cond <= VAR_MUX_uxn_opcodes_h_l1401_c32_ade4_cond;
     MUX_uxn_opcodes_h_l1401_c32_ade4_iftrue <= VAR_MUX_uxn_opcodes_h_l1401_c32_ade4_iftrue;
     MUX_uxn_opcodes_h_l1401_c32_ade4_iffalse <= VAR_MUX_uxn_opcodes_h_l1401_c32_ade4_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1401_c32_ade4_return_output := MUX_uxn_opcodes_h_l1401_c32_ade4_return_output;

     -- n8_MUX[uxn_opcodes_h_l1393_c7_a0d5] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond <= VAR_n8_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond;
     n8_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue;
     n8_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output := n8_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output;

     -- Submodule level 3
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_c1a3_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l1404_c11_2211_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1403_c7_c1a3_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l1404_c11_2211_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue := VAR_MUX_uxn_opcodes_h_l1401_c32_ade4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_c1a3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_c1a3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1384_c7_7112_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1397_c7_4d23] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_4d23_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_4d23_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output;

     -- n8_MUX[uxn_opcodes_h_l1388_c7_2c31] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1388_c7_2c31_cond <= VAR_n8_MUX_uxn_opcodes_h_l1388_c7_2c31_cond;
     n8_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue;
     n8_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output := n8_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output;

     -- t8_MUX[uxn_opcodes_h_l1376_c2_1a50] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1376_c2_1a50_cond <= VAR_t8_MUX_uxn_opcodes_h_l1376_c2_1a50_cond;
     t8_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue;
     t8_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output := t8_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1393_c7_a0d5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1393_c7_a0d5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1388_c7_2c31] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_2c31_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_2c31_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1403_c7_c1a3] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1403_c7_c1a3_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1403_c7_c1a3_cond;
     tmp8_MUX_uxn_opcodes_h_l1403_c7_c1a3_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1403_c7_c1a3_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1403_c7_c1a3_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1403_c7_c1a3_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1403_c7_c1a3_return_output := tmp8_MUX_uxn_opcodes_h_l1403_c7_c1a3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1403_c7_c1a3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1403_c7_c1a3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_c1a3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1403_c7_c1a3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_c1a3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1403_c7_c1a3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_c1a3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_c1a3_return_output := result_stack_value_MUX_uxn_opcodes_h_l1403_c7_c1a3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1397_c7_4d23] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_4d23_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_4d23_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1397_c7_4d23] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_4d23_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_4d23_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_c1a3_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1403_c7_c1a3_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1393_c7_a0d5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1393_c7_a0d5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1388_c7_2c31] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_2c31_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_2c31_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1397_c7_4d23] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1397_c7_4d23_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1397_c7_4d23_cond;
     tmp8_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output := tmp8_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output;

     -- n8_MUX[uxn_opcodes_h_l1384_c7_7112] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1384_c7_7112_cond <= VAR_n8_MUX_uxn_opcodes_h_l1384_c7_7112_cond;
     n8_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue;
     n8_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1384_c7_7112_return_output := n8_MUX_uxn_opcodes_h_l1384_c7_7112_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1393_c7_a0d5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1384_c7_7112] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_7112_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_7112_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_7112_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_7112_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1397_c7_4d23] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1397_c7_4d23_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1397_c7_4d23_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1397_c7_4d23_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1397_c7_4d23_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output := result_stack_value_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1388_c7_2c31] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_2c31_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_2c31_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1384_c7_7112_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_7112_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1397_c7_4d23_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1388_c7_2c31] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_2c31_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_2c31_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1388_c7_2c31] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_2c31_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_2c31_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output;

     -- n8_MUX[uxn_opcodes_h_l1376_c2_1a50] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1376_c2_1a50_cond <= VAR_n8_MUX_uxn_opcodes_h_l1376_c2_1a50_cond;
     n8_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue;
     n8_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output := n8_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1376_c2_1a50] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_1a50_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_1a50_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1388_c7_2c31] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_2c31_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_2c31_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1384_c7_7112] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_7112_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_7112_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_7112_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_7112_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1393_c7_a0d5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output := result_stack_value_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1393_c7_a0d5] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1393_c7_a0d5_cond;
     tmp8_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1393_c7_a0d5_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1393_c7_a0d5_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output := tmp8_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1384_c7_7112] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_7112_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_7112_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_7112_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_7112_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_7112_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_7112_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1393_c7_a0d5_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l1388_c7_2c31] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1388_c7_2c31_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1388_c7_2c31_cond;
     tmp8_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output := tmp8_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1376_c2_1a50] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_1a50_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_1a50_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1384_c7_7112] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_7112_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_7112_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_7112_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_7112_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1376_c2_1a50] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_1a50_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_1a50_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1384_c7_7112] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_7112_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_7112_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_7112_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_7112_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1388_c7_2c31] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1388_c7_2c31_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_2c31_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_2c31_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_2c31_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output := result_stack_value_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1384_c7_7112] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_7112_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_7112_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_7112_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_7112_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_7112_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_7112_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_7112_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1388_c7_2c31_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1384_c7_7112] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1384_c7_7112_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_7112_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_7112_return_output := result_stack_value_MUX_uxn_opcodes_h_l1384_c7_7112_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1376_c2_1a50] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_1a50_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_1a50_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1376_c2_1a50] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_1a50_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_1a50_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1384_c7_7112] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1384_c7_7112_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1384_c7_7112_cond;
     tmp8_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1384_c7_7112_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1384_c7_7112_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1384_c7_7112_return_output := tmp8_MUX_uxn_opcodes_h_l1384_c7_7112_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1376_c2_1a50] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_1a50_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_1a50_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output;

     -- Submodule level 8
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_7112_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1384_c7_7112_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1376_c2_1a50] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1376_c2_1a50_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1376_c2_1a50_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output := result_stack_value_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1376_c2_1a50] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1376_c2_1a50_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1376_c2_1a50_cond;
     tmp8_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1376_c2_1a50_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1376_c2_1a50_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output := tmp8_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output;

     -- Submodule level 9
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l1372_l1415_DUPLICATE_3779 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l1372_l1415_DUPLICATE_3779_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_81ab(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_1a50_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l1372_l1415_DUPLICATE_3779_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l1372_l1415_DUPLICATE_3779_return_output;
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
