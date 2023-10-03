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
-- BIN_OP_EQ[uxn_opcodes_h_l1376_c6_7219]
signal BIN_OP_EQ_uxn_opcodes_h_l1376_c6_7219_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1376_c6_7219_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1376_c6_7219_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1376_c1_4a5a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_4a5a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_4a5a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_4a5a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_4a5a_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1376_c2_4c6f]
signal n8_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1376_c2_4c6f]
signal t8_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1376_c2_4c6f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1376_c2_4c6f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1376_c2_4c6f]
signal result_stack_value_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1376_c2_4c6f]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1376_c2_4c6f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1376_c2_4c6f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1376_c2_4c6f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1376_c2_4c6f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1376_c2_4c6f]
signal tmp8_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1377_c3_13c2[uxn_opcodes_h_l1377_c3_13c2]
signal printf_uxn_opcodes_h_l1377_c3_13c2_uxn_opcodes_h_l1377_c3_13c2_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1384_c11_e702]
signal BIN_OP_EQ_uxn_opcodes_h_l1384_c11_e702_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1384_c11_e702_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1384_c11_e702_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1384_c7_309c]
signal n8_MUX_uxn_opcodes_h_l1384_c7_309c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1384_c7_309c_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1384_c7_309c]
signal t8_MUX_uxn_opcodes_h_l1384_c7_309c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1384_c7_309c_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1384_c7_309c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_309c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_309c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1384_c7_309c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_309c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_309c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1384_c7_309c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_309c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_309c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1384_c7_309c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_309c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_309c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1384_c7_309c]
signal result_stack_value_MUX_uxn_opcodes_h_l1384_c7_309c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1384_c7_309c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1384_c7_309c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_309c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_309c_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1384_c7_309c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_309c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_309c_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1384_c7_309c]
signal tmp8_MUX_uxn_opcodes_h_l1384_c7_309c_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1384_c7_309c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1388_c11_9958]
signal BIN_OP_EQ_uxn_opcodes_h_l1388_c11_9958_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1388_c11_9958_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1388_c11_9958_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1388_c7_66ed]
signal n8_MUX_uxn_opcodes_h_l1388_c7_66ed_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1388_c7_66ed]
signal t8_MUX_uxn_opcodes_h_l1388_c7_66ed_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1388_c7_66ed]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_66ed_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1388_c7_66ed]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_66ed_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1388_c7_66ed]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_66ed_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1388_c7_66ed]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_66ed_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1388_c7_66ed]
signal result_stack_value_MUX_uxn_opcodes_h_l1388_c7_66ed_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1388_c7_66ed]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_66ed_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1388_c7_66ed]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_66ed_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1388_c7_66ed]
signal tmp8_MUX_uxn_opcodes_h_l1388_c7_66ed_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1393_c11_c073]
signal BIN_OP_EQ_uxn_opcodes_h_l1393_c11_c073_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1393_c11_c073_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1393_c11_c073_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1393_c7_9c66]
signal n8_MUX_uxn_opcodes_h_l1393_c7_9c66_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1393_c7_9c66]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_9c66_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1393_c7_9c66]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_9c66_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1393_c7_9c66]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_9c66_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1393_c7_9c66]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_9c66_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1393_c7_9c66]
signal result_stack_value_MUX_uxn_opcodes_h_l1393_c7_9c66_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1393_c7_9c66]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_9c66_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1393_c7_9c66]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_9c66_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1393_c7_9c66]
signal tmp8_MUX_uxn_opcodes_h_l1393_c7_9c66_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1397_c11_d9b0]
signal BIN_OP_EQ_uxn_opcodes_h_l1397_c11_d9b0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1397_c11_d9b0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1397_c11_d9b0_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1397_c7_38ea]
signal n8_MUX_uxn_opcodes_h_l1397_c7_38ea_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1397_c7_38ea]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_38ea_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1397_c7_38ea]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_38ea_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1397_c7_38ea]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_38ea_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1397_c7_38ea]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_38ea_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1397_c7_38ea]
signal result_stack_value_MUX_uxn_opcodes_h_l1397_c7_38ea_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1397_c7_38ea]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_38ea_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1397_c7_38ea]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_38ea_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1397_c7_38ea]
signal tmp8_MUX_uxn_opcodes_h_l1397_c7_38ea_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1401_c32_3951]
signal BIN_OP_AND_uxn_opcodes_h_l1401_c32_3951_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1401_c32_3951_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1401_c32_3951_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1401_c32_fdec]
signal BIN_OP_GT_uxn_opcodes_h_l1401_c32_fdec_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1401_c32_fdec_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1401_c32_fdec_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1401_c32_16b2]
signal MUX_uxn_opcodes_h_l1401_c32_16b2_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1401_c32_16b2_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1401_c32_16b2_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1401_c32_16b2_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1403_c11_2a67]
signal BIN_OP_EQ_uxn_opcodes_h_l1403_c11_2a67_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1403_c11_2a67_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1403_c11_2a67_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1403_c7_bdae]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_bdae_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_bdae_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_bdae_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_bdae_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1403_c7_bdae]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_bdae_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_bdae_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_bdae_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_bdae_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1403_c7_bdae]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_bdae_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_bdae_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_bdae_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_bdae_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1403_c7_bdae]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_bdae_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_bdae_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_bdae_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_bdae_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1403_c7_bdae]
signal result_stack_value_MUX_uxn_opcodes_h_l1403_c7_bdae_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1403_c7_bdae_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1403_c7_bdae_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1403_c7_bdae_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1403_c7_bdae]
signal tmp8_MUX_uxn_opcodes_h_l1403_c7_bdae_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1403_c7_bdae_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1403_c7_bdae_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1403_c7_bdae_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1404_c18_07cb]
signal BIN_OP_AND_uxn_opcodes_h_l1404_c18_07cb_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1404_c18_07cb_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1404_c18_07cb_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l1404_c11_5f96]
signal BIN_OP_SR_uxn_opcodes_h_l1404_c11_5f96_left : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l1404_c11_5f96_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l1404_c11_5f96_return_output : unsigned(7 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l1404_c34_9bdb]
signal CONST_SR_4_uxn_opcodes_h_l1404_c34_9bdb_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l1404_c34_9bdb_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l1404_c11_26d2]
signal BIN_OP_SL_uxn_opcodes_h_l1404_c11_26d2_left : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l1404_c11_26d2_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l1404_c11_26d2_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1410_c11_7d9b]
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_7d9b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_7d9b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_7d9b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1410_c7_da9a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_da9a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_da9a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_da9a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_da9a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1410_c7_da9a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_da9a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_da9a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_da9a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_da9a_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1376_c6_7219
BIN_OP_EQ_uxn_opcodes_h_l1376_c6_7219 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1376_c6_7219_left,
BIN_OP_EQ_uxn_opcodes_h_l1376_c6_7219_right,
BIN_OP_EQ_uxn_opcodes_h_l1376_c6_7219_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_4a5a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_4a5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_4a5a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_4a5a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_4a5a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_4a5a_return_output);

-- n8_MUX_uxn_opcodes_h_l1376_c2_4c6f
n8_MUX_uxn_opcodes_h_l1376_c2_4c6f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond,
n8_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue,
n8_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse,
n8_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output);

-- t8_MUX_uxn_opcodes_h_l1376_c2_4c6f
t8_MUX_uxn_opcodes_h_l1376_c2_4c6f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond,
t8_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue,
t8_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse,
t8_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_4c6f
result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_4c6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_4c6f
result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_4c6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1376_c2_4c6f
result_stack_value_MUX_uxn_opcodes_h_l1376_c2_4c6f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_4c6f
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_4c6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_4c6f
result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_4c6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_4c6f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_4c6f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f
result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1376_c2_4c6f
tmp8_MUX_uxn_opcodes_h_l1376_c2_4c6f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond,
tmp8_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue,
tmp8_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse,
tmp8_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output);

-- printf_uxn_opcodes_h_l1377_c3_13c2_uxn_opcodes_h_l1377_c3_13c2
printf_uxn_opcodes_h_l1377_c3_13c2_uxn_opcodes_h_l1377_c3_13c2 : entity work.printf_uxn_opcodes_h_l1377_c3_13c2_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1377_c3_13c2_uxn_opcodes_h_l1377_c3_13c2_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1384_c11_e702
BIN_OP_EQ_uxn_opcodes_h_l1384_c11_e702 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1384_c11_e702_left,
BIN_OP_EQ_uxn_opcodes_h_l1384_c11_e702_right,
BIN_OP_EQ_uxn_opcodes_h_l1384_c11_e702_return_output);

-- n8_MUX_uxn_opcodes_h_l1384_c7_309c
n8_MUX_uxn_opcodes_h_l1384_c7_309c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1384_c7_309c_cond,
n8_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue,
n8_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse,
n8_MUX_uxn_opcodes_h_l1384_c7_309c_return_output);

-- t8_MUX_uxn_opcodes_h_l1384_c7_309c
t8_MUX_uxn_opcodes_h_l1384_c7_309c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1384_c7_309c_cond,
t8_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue,
t8_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse,
t8_MUX_uxn_opcodes_h_l1384_c7_309c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_309c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_309c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_309c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_309c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_309c
result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_309c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_309c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_309c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_309c
result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_309c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_309c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_309c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_309c
result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_309c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_309c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_309c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1384_c7_309c
result_stack_value_MUX_uxn_opcodes_h_l1384_c7_309c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1384_c7_309c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1384_c7_309c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_309c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_309c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_309c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_309c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_309c
result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_309c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_309c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_309c_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1384_c7_309c
tmp8_MUX_uxn_opcodes_h_l1384_c7_309c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1384_c7_309c_cond,
tmp8_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue,
tmp8_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse,
tmp8_MUX_uxn_opcodes_h_l1384_c7_309c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1388_c11_9958
BIN_OP_EQ_uxn_opcodes_h_l1388_c11_9958 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1388_c11_9958_left,
BIN_OP_EQ_uxn_opcodes_h_l1388_c11_9958_right,
BIN_OP_EQ_uxn_opcodes_h_l1388_c11_9958_return_output);

-- n8_MUX_uxn_opcodes_h_l1388_c7_66ed
n8_MUX_uxn_opcodes_h_l1388_c7_66ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1388_c7_66ed_cond,
n8_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue,
n8_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse,
n8_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output);

-- t8_MUX_uxn_opcodes_h_l1388_c7_66ed
t8_MUX_uxn_opcodes_h_l1388_c7_66ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1388_c7_66ed_cond,
t8_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue,
t8_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse,
t8_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_66ed
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_66ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_66ed_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_66ed
result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_66ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_66ed_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_66ed
result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_66ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_66ed_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_66ed
result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_66ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_66ed_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1388_c7_66ed
result_stack_value_MUX_uxn_opcodes_h_l1388_c7_66ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1388_c7_66ed_cond,
result_stack_value_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_66ed
result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_66ed : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_66ed_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_66ed
result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_66ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_66ed_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1388_c7_66ed
tmp8_MUX_uxn_opcodes_h_l1388_c7_66ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1388_c7_66ed_cond,
tmp8_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue,
tmp8_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse,
tmp8_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1393_c11_c073
BIN_OP_EQ_uxn_opcodes_h_l1393_c11_c073 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1393_c11_c073_left,
BIN_OP_EQ_uxn_opcodes_h_l1393_c11_c073_right,
BIN_OP_EQ_uxn_opcodes_h_l1393_c11_c073_return_output);

-- n8_MUX_uxn_opcodes_h_l1393_c7_9c66
n8_MUX_uxn_opcodes_h_l1393_c7_9c66 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1393_c7_9c66_cond,
n8_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue,
n8_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse,
n8_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_9c66
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_9c66 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_9c66_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_9c66
result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_9c66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_9c66_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_9c66
result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_9c66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_9c66_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_9c66
result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_9c66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_9c66_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1393_c7_9c66
result_stack_value_MUX_uxn_opcodes_h_l1393_c7_9c66 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1393_c7_9c66_cond,
result_stack_value_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_9c66
result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_9c66 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_9c66_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_9c66
result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_9c66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_9c66_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1393_c7_9c66
tmp8_MUX_uxn_opcodes_h_l1393_c7_9c66 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1393_c7_9c66_cond,
tmp8_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue,
tmp8_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse,
tmp8_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1397_c11_d9b0
BIN_OP_EQ_uxn_opcodes_h_l1397_c11_d9b0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1397_c11_d9b0_left,
BIN_OP_EQ_uxn_opcodes_h_l1397_c11_d9b0_right,
BIN_OP_EQ_uxn_opcodes_h_l1397_c11_d9b0_return_output);

-- n8_MUX_uxn_opcodes_h_l1397_c7_38ea
n8_MUX_uxn_opcodes_h_l1397_c7_38ea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1397_c7_38ea_cond,
n8_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue,
n8_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse,
n8_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_38ea
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_38ea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_38ea_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_38ea
result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_38ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_38ea_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_38ea
result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_38ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_38ea_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_38ea
result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_38ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_38ea_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1397_c7_38ea
result_stack_value_MUX_uxn_opcodes_h_l1397_c7_38ea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1397_c7_38ea_cond,
result_stack_value_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_38ea
result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_38ea : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_38ea_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_38ea
result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_38ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_38ea_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1397_c7_38ea
tmp8_MUX_uxn_opcodes_h_l1397_c7_38ea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1397_c7_38ea_cond,
tmp8_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue,
tmp8_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse,
tmp8_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1401_c32_3951
BIN_OP_AND_uxn_opcodes_h_l1401_c32_3951 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1401_c32_3951_left,
BIN_OP_AND_uxn_opcodes_h_l1401_c32_3951_right,
BIN_OP_AND_uxn_opcodes_h_l1401_c32_3951_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1401_c32_fdec
BIN_OP_GT_uxn_opcodes_h_l1401_c32_fdec : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1401_c32_fdec_left,
BIN_OP_GT_uxn_opcodes_h_l1401_c32_fdec_right,
BIN_OP_GT_uxn_opcodes_h_l1401_c32_fdec_return_output);

-- MUX_uxn_opcodes_h_l1401_c32_16b2
MUX_uxn_opcodes_h_l1401_c32_16b2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1401_c32_16b2_cond,
MUX_uxn_opcodes_h_l1401_c32_16b2_iftrue,
MUX_uxn_opcodes_h_l1401_c32_16b2_iffalse,
MUX_uxn_opcodes_h_l1401_c32_16b2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1403_c11_2a67
BIN_OP_EQ_uxn_opcodes_h_l1403_c11_2a67 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1403_c11_2a67_left,
BIN_OP_EQ_uxn_opcodes_h_l1403_c11_2a67_right,
BIN_OP_EQ_uxn_opcodes_h_l1403_c11_2a67_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_bdae
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_bdae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_bdae_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_bdae_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_bdae_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_bdae_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_bdae
result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_bdae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_bdae_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_bdae_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_bdae_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_bdae_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_bdae
result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_bdae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_bdae_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_bdae_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_bdae_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_bdae_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_bdae
result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_bdae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_bdae_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_bdae_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_bdae_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_bdae_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1403_c7_bdae
result_stack_value_MUX_uxn_opcodes_h_l1403_c7_bdae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1403_c7_bdae_cond,
result_stack_value_MUX_uxn_opcodes_h_l1403_c7_bdae_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1403_c7_bdae_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1403_c7_bdae_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1403_c7_bdae
tmp8_MUX_uxn_opcodes_h_l1403_c7_bdae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1403_c7_bdae_cond,
tmp8_MUX_uxn_opcodes_h_l1403_c7_bdae_iftrue,
tmp8_MUX_uxn_opcodes_h_l1403_c7_bdae_iffalse,
tmp8_MUX_uxn_opcodes_h_l1403_c7_bdae_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1404_c18_07cb
BIN_OP_AND_uxn_opcodes_h_l1404_c18_07cb : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1404_c18_07cb_left,
BIN_OP_AND_uxn_opcodes_h_l1404_c18_07cb_right,
BIN_OP_AND_uxn_opcodes_h_l1404_c18_07cb_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l1404_c11_5f96
BIN_OP_SR_uxn_opcodes_h_l1404_c11_5f96 : entity work.BIN_OP_SR_uint8_t_uint8_t_0CLK_25d197a7 port map (
BIN_OP_SR_uxn_opcodes_h_l1404_c11_5f96_left,
BIN_OP_SR_uxn_opcodes_h_l1404_c11_5f96_right,
BIN_OP_SR_uxn_opcodes_h_l1404_c11_5f96_return_output);

-- CONST_SR_4_uxn_opcodes_h_l1404_c34_9bdb
CONST_SR_4_uxn_opcodes_h_l1404_c34_9bdb : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l1404_c34_9bdb_x,
CONST_SR_4_uxn_opcodes_h_l1404_c34_9bdb_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l1404_c11_26d2
BIN_OP_SL_uxn_opcodes_h_l1404_c11_26d2 : entity work.BIN_OP_SL_uint8_t_uint8_t_0CLK_10d8c973 port map (
BIN_OP_SL_uxn_opcodes_h_l1404_c11_26d2_left,
BIN_OP_SL_uxn_opcodes_h_l1404_c11_26d2_right,
BIN_OP_SL_uxn_opcodes_h_l1404_c11_26d2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1410_c11_7d9b
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_7d9b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_7d9b_left,
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_7d9b_right,
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_7d9b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_da9a
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_da9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_da9a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_da9a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_da9a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_da9a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_da9a
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_da9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_da9a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_da9a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_da9a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_da9a_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1376_c6_7219_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_4a5a_return_output,
 n8_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output,
 t8_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output,
 tmp8_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1384_c11_e702_return_output,
 n8_MUX_uxn_opcodes_h_l1384_c7_309c_return_output,
 t8_MUX_uxn_opcodes_h_l1384_c7_309c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_309c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_309c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_309c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_309c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1384_c7_309c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_309c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_309c_return_output,
 tmp8_MUX_uxn_opcodes_h_l1384_c7_309c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1388_c11_9958_return_output,
 n8_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output,
 t8_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output,
 tmp8_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1393_c11_c073_return_output,
 n8_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output,
 tmp8_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1397_c11_d9b0_return_output,
 n8_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output,
 tmp8_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1401_c32_3951_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1401_c32_fdec_return_output,
 MUX_uxn_opcodes_h_l1401_c32_16b2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1403_c11_2a67_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_bdae_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_bdae_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_bdae_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_bdae_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1403_c7_bdae_return_output,
 tmp8_MUX_uxn_opcodes_h_l1403_c7_bdae_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1404_c18_07cb_return_output,
 BIN_OP_SR_uxn_opcodes_h_l1404_c11_5f96_return_output,
 CONST_SR_4_uxn_opcodes_h_l1404_c34_9bdb_return_output,
 BIN_OP_SL_uxn_opcodes_h_l1404_c11_26d2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1410_c11_7d9b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_da9a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_da9a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_7219_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_7219_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_7219_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_4a5a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_4a5a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_4a5a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_4a5a_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1384_c7_309c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1384_c7_309c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_309c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_309c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_309c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1376_c2_4c6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_309c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_309c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1380_c3_8e6d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_309c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_309c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1384_c7_309c_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1377_c3_13c2_uxn_opcodes_h_l1377_c3_13c2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_e702_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_e702_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_e702_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1384_c7_309c_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1384_c7_309c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1386_c3_5e5a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_309c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_309c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_309c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_309c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_309c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_309c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_309c_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1384_c7_309c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_9958_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_9958_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_9958_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1388_c7_66ed_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1388_c7_66ed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1391_c3_1d62 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_66ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_66ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_66ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_66ed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_66ed_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_66ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_66ed_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1388_c7_66ed_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_c073_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_c073_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_c073_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1393_c7_9c66_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1395_c3_3067 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_9c66_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_9c66_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_9c66_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_9c66_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1393_c7_9c66_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_9c66_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_9c66_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1393_c7_9c66_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_d9b0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_d9b0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_d9b0_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1397_c7_38ea_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_bdae_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_38ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_bdae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_38ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_bdae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_38ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_bdae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_38ea_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_bdae_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1397_c7_38ea_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_38ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1397_c7_38ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_38ea_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1403_c7_bdae_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1397_c7_38ea_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1401_c32_16b2_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1401_c32_16b2_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1401_c32_16b2_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1401_c32_3951_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1401_c32_3951_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1401_c32_3951_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1401_c32_fdec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1401_c32_fdec_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1401_c32_fdec_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1401_c32_16b2_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_2a67_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_2a67_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_2a67_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_bdae_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1407_c3_58e7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_bdae_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_bdae_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_bdae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_bdae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_da9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_bdae_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_bdae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_bdae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_da9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_bdae_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_bdae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_bdae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_bdae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_bdae_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_bdae_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_bdae_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1403_c7_bdae_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1403_c7_bdae_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1403_c7_bdae_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l1404_c11_5f96_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1404_c18_07cb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1404_c18_07cb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1404_c18_07cb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l1404_c11_5f96_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l1404_c11_5f96_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l1404_c11_26d2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l1404_c11_26d2_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l1404_c34_9bdb_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l1404_c34_9bdb_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l1404_c11_26d2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_7d9b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_7d9b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_7d9b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_da9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_da9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_da9a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_da9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_da9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_da9a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1376_l1403_l1384_DUPLICATE_63a1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1376_l1384_DUPLICATE_25b1_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1393_l1388_l1376_l1403_l1384_DUPLICATE_0e15_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1410_l1403_l1384_DUPLICATE_27b2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1410_l1384_DUPLICATE_884c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1403_l1397_DUPLICATE_9997_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1415_l1372_DUPLICATE_8c4c_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_9958_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_e702_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_da9a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_c073_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1386_c3_5e5a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1386_c3_5e5a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_7219_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_4a5a_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1401_c32_16b2_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_bdae_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1401_c32_fdec_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1380_c3_8e6d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1380_c3_8e6d;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1395_c3_3067 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1395_c3_3067;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_d9b0_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1391_c3_1d62 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1391_c3_1d62;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1407_c3_58e7 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_bdae_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1407_c3_58e7;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1401_c32_3951_right := to_unsigned(128, 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_bdae_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_7d9b_right := to_unsigned(6, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_2a67_right := to_unsigned(5, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1404_c18_07cb_right := to_unsigned(15, 4);
     VAR_MUX_uxn_opcodes_h_l1401_c32_16b2_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_da9a_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_4a5a_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1401_c32_3951_left := VAR_ins;
     VAR_BIN_OP_SR_uxn_opcodes_h_l1404_c11_5f96_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_7219_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_e702_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_9958_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_c073_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_d9b0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_2a67_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_7d9b_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1404_c18_07cb_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l1404_c34_9bdb_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse := t8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1403_c7_bdae_iffalse := tmp8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1393_l1388_l1376_l1403_l1384_DUPLICATE_0e15 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1393_l1388_l1376_l1403_l1384_DUPLICATE_0e15_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1410_l1384_DUPLICATE_884c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1410_l1384_DUPLICATE_884c_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1410_c11_7d9b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1410_c11_7d9b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_7d9b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1410_c11_7d9b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_7d9b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_7d9b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1410_c11_7d9b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1403_c11_2a67] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1403_c11_2a67_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_2a67_left;
     BIN_OP_EQ_uxn_opcodes_h_l1403_c11_2a67_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_2a67_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_2a67_return_output := BIN_OP_EQ_uxn_opcodes_h_l1403_c11_2a67_return_output;

     -- CONST_SR_4[uxn_opcodes_h_l1404_c34_9bdb] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l1404_c34_9bdb_x <= VAR_CONST_SR_4_uxn_opcodes_h_l1404_c34_9bdb_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l1404_c34_9bdb_return_output := CONST_SR_4_uxn_opcodes_h_l1404_c34_9bdb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1384_c11_e702] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1384_c11_e702_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_e702_left;
     BIN_OP_EQ_uxn_opcodes_h_l1384_c11_e702_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_e702_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_e702_return_output := BIN_OP_EQ_uxn_opcodes_h_l1384_c11_e702_return_output;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l1397_c7_38ea] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1397_c7_38ea_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1388_c11_9958] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1388_c11_9958_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_9958_left;
     BIN_OP_EQ_uxn_opcodes_h_l1388_c11_9958_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_9958_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_9958_return_output := BIN_OP_EQ_uxn_opcodes_h_l1388_c11_9958_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1376_c6_7219] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1376_c6_7219_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_7219_left;
     BIN_OP_EQ_uxn_opcodes_h_l1376_c6_7219_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_7219_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_7219_return_output := BIN_OP_EQ_uxn_opcodes_h_l1376_c6_7219_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1376_l1384_DUPLICATE_25b1 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1376_l1384_DUPLICATE_25b1_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1410_l1403_l1384_DUPLICATE_27b2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1410_l1403_l1384_DUPLICATE_27b2_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1393_c11_c073] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1393_c11_c073_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_c073_left;
     BIN_OP_EQ_uxn_opcodes_h_l1393_c11_c073_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_c073_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_c073_return_output := BIN_OP_EQ_uxn_opcodes_h_l1393_c11_c073_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1403_l1397_DUPLICATE_9997 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1403_l1397_DUPLICATE_9997_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1376_l1403_l1384_DUPLICATE_63a1 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1376_l1403_l1384_DUPLICATE_63a1_return_output := result.stack_value;

     -- BIN_OP_AND[uxn_opcodes_h_l1401_c32_3951] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1401_c32_3951_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1401_c32_3951_left;
     BIN_OP_AND_uxn_opcodes_h_l1401_c32_3951_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1401_c32_3951_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1401_c32_3951_return_output := BIN_OP_AND_uxn_opcodes_h_l1401_c32_3951_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1376_c2_4c6f] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1376_c2_4c6f_return_output := result.is_stack_index_flipped;

     -- BIN_OP_AND[uxn_opcodes_h_l1404_c18_07cb] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1404_c18_07cb_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1404_c18_07cb_left;
     BIN_OP_AND_uxn_opcodes_h_l1404_c18_07cb_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1404_c18_07cb_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1404_c18_07cb_return_output := BIN_OP_AND_uxn_opcodes_h_l1404_c18_07cb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1397_c11_d9b0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1397_c11_d9b0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_d9b0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1397_c11_d9b0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_d9b0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_d9b0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1397_c11_d9b0_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1401_c32_fdec_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1401_c32_3951_return_output;
     VAR_BIN_OP_SR_uxn_opcodes_h_l1404_c11_5f96_right := VAR_BIN_OP_AND_uxn_opcodes_h_l1404_c18_07cb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_4a5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_7219_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_7219_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_7219_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_7219_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_7219_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_7219_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_7219_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_7219_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_7219_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_7219_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_7219_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c6_7219_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1384_c7_309c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_e702_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_309c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_e702_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_309c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_e702_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_309c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_e702_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_309c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_e702_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_309c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_e702_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_309c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_e702_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_309c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_e702_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1384_c7_309c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_e702_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1384_c7_309c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_e702_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1388_c7_66ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_9958_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_66ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_9958_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_66ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_9958_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_66ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_9958_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_66ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_9958_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_66ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_9958_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_66ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_9958_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_66ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_9958_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1388_c7_66ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_9958_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1388_c7_66ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1388_c11_9958_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1393_c7_9c66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_c073_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_9c66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_c073_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_9c66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_c073_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_9c66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_c073_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_9c66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_c073_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_9c66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_c073_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_9c66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_c073_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1393_c7_9c66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_c073_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1393_c7_9c66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_c073_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1397_c7_38ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_d9b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_38ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_d9b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_38ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_d9b0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_38ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_d9b0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_38ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_d9b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_38ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_d9b0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_38ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_d9b0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1397_c7_38ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_d9b0_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1397_c7_38ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1397_c11_d9b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_bdae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_2a67_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_bdae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_2a67_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_bdae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_2a67_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_bdae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_2a67_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_bdae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_2a67_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1403_c7_bdae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1403_c11_2a67_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_da9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_7d9b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_da9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_7d9b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1376_l1384_DUPLICATE_25b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1376_l1384_DUPLICATE_25b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1376_l1384_DUPLICATE_25b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1376_l1384_DUPLICATE_25b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1376_l1384_DUPLICATE_25b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1410_l1403_l1384_DUPLICATE_27b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1410_l1403_l1384_DUPLICATE_27b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1410_l1403_l1384_DUPLICATE_27b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1410_l1403_l1384_DUPLICATE_27b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_bdae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1410_l1403_l1384_DUPLICATE_27b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_da9a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1410_l1403_l1384_DUPLICATE_27b2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1393_l1388_l1376_l1403_l1384_DUPLICATE_0e15_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1393_l1388_l1376_l1403_l1384_DUPLICATE_0e15_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1393_l1388_l1376_l1403_l1384_DUPLICATE_0e15_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1393_l1388_l1376_l1403_l1384_DUPLICATE_0e15_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_bdae_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1393_l1388_l1376_l1403_l1384_DUPLICATE_0e15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1410_l1384_DUPLICATE_884c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1410_l1384_DUPLICATE_884c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1410_l1384_DUPLICATE_884c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1410_l1384_DUPLICATE_884c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_da9a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1410_l1384_DUPLICATE_884c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1403_l1397_DUPLICATE_9997_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_bdae_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1403_l1397_DUPLICATE_9997_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1376_l1403_l1384_DUPLICATE_63a1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1376_l1403_l1384_DUPLICATE_63a1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1376_l1403_l1384_DUPLICATE_63a1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1376_l1403_l1384_DUPLICATE_63a1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1376_l1403_l1384_DUPLICATE_63a1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_bdae_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1393_l1388_l1397_l1376_l1403_l1384_DUPLICATE_63a1_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l1404_c11_26d2_right := VAR_CONST_SR_4_uxn_opcodes_h_l1404_c34_9bdb_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1376_c2_4c6f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1397_c7_38ea_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1376_c2_4c6f] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1376_c1_4a5a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_4a5a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_4a5a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_4a5a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_4a5a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_4a5a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_4a5a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_4a5a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_4a5a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1397_c7_38ea] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_38ea_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_38ea_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1403_c7_bdae] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_bdae_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_bdae_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_bdae_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_bdae_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_bdae_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_bdae_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_bdae_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_bdae_return_output;

     -- n8_MUX[uxn_opcodes_h_l1397_c7_38ea] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1397_c7_38ea_cond <= VAR_n8_MUX_uxn_opcodes_h_l1397_c7_38ea_cond;
     n8_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue;
     n8_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output := n8_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1410_c7_da9a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_da9a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_da9a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_da9a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_da9a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_da9a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_da9a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_da9a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_da9a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1403_c7_bdae] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_bdae_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_bdae_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_bdae_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_bdae_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_bdae_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_bdae_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_bdae_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_bdae_return_output;

     -- t8_MUX[uxn_opcodes_h_l1388_c7_66ed] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1388_c7_66ed_cond <= VAR_t8_MUX_uxn_opcodes_h_l1388_c7_66ed_cond;
     t8_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue;
     t8_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output := t8_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1401_c32_fdec] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1401_c32_fdec_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1401_c32_fdec_left;
     BIN_OP_GT_uxn_opcodes_h_l1401_c32_fdec_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1401_c32_fdec_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1401_c32_fdec_return_output := BIN_OP_GT_uxn_opcodes_h_l1401_c32_fdec_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1410_c7_da9a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_da9a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_da9a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_da9a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_da9a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_da9a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_da9a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_da9a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_da9a_return_output;

     -- BIN_OP_SR[uxn_opcodes_h_l1404_c11_5f96] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l1404_c11_5f96_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l1404_c11_5f96_left;
     BIN_OP_SR_uxn_opcodes_h_l1404_c11_5f96_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l1404_c11_5f96_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l1404_c11_5f96_return_output := BIN_OP_SR_uxn_opcodes_h_l1404_c11_5f96_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1401_c32_16b2_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1401_c32_fdec_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l1404_c11_26d2_left := VAR_BIN_OP_SR_uxn_opcodes_h_l1404_c11_5f96_return_output;
     VAR_printf_uxn_opcodes_h_l1377_c3_13c2_uxn_opcodes_h_l1377_c3_13c2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1376_c1_4a5a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_bdae_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_da9a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1403_c7_bdae_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_bdae_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_da9a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1403_c7_bdae_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1397_c7_38ea] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_38ea_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_38ea_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output;

     -- t8_MUX[uxn_opcodes_h_l1384_c7_309c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1384_c7_309c_cond <= VAR_t8_MUX_uxn_opcodes_h_l1384_c7_309c_cond;
     t8_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue;
     t8_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1384_c7_309c_return_output := t8_MUX_uxn_opcodes_h_l1384_c7_309c_return_output;

     -- BIN_OP_SL[uxn_opcodes_h_l1404_c11_26d2] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l1404_c11_26d2_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l1404_c11_26d2_left;
     BIN_OP_SL_uxn_opcodes_h_l1404_c11_26d2_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l1404_c11_26d2_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l1404_c11_26d2_return_output := BIN_OP_SL_uxn_opcodes_h_l1404_c11_26d2_return_output;

     -- printf_uxn_opcodes_h_l1377_c3_13c2[uxn_opcodes_h_l1377_c3_13c2] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1377_c3_13c2_uxn_opcodes_h_l1377_c3_13c2_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1377_c3_13c2_uxn_opcodes_h_l1377_c3_13c2_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1393_c7_9c66] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_9c66_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_9c66_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output;

     -- MUX[uxn_opcodes_h_l1401_c32_16b2] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1401_c32_16b2_cond <= VAR_MUX_uxn_opcodes_h_l1401_c32_16b2_cond;
     MUX_uxn_opcodes_h_l1401_c32_16b2_iftrue <= VAR_MUX_uxn_opcodes_h_l1401_c32_16b2_iftrue;
     MUX_uxn_opcodes_h_l1401_c32_16b2_iffalse <= VAR_MUX_uxn_opcodes_h_l1401_c32_16b2_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1401_c32_16b2_return_output := MUX_uxn_opcodes_h_l1401_c32_16b2_return_output;

     -- n8_MUX[uxn_opcodes_h_l1393_c7_9c66] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1393_c7_9c66_cond <= VAR_n8_MUX_uxn_opcodes_h_l1393_c7_9c66_cond;
     n8_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue;
     n8_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output := n8_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1397_c7_38ea] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_38ea_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_38ea_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1403_c7_bdae] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_bdae_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_bdae_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_bdae_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_bdae_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_bdae_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_bdae_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_bdae_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_bdae_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1403_c7_bdae] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_bdae_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_bdae_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_bdae_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_bdae_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_bdae_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_bdae_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_bdae_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_bdae_return_output;

     -- Submodule level 3
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_bdae_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l1404_c11_26d2_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1403_c7_bdae_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l1404_c11_26d2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue := VAR_MUX_uxn_opcodes_h_l1401_c32_16b2_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1403_c7_bdae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1403_c7_bdae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1384_c7_309c_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1397_c7_38ea] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_38ea_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_38ea_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1388_c7_66ed] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_66ed_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_66ed_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1393_c7_9c66] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_9c66_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_9c66_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1397_c7_38ea] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_38ea_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_38ea_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1403_c7_bdae] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1403_c7_bdae_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_bdae_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1403_c7_bdae_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_bdae_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1403_c7_bdae_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_bdae_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_bdae_return_output := result_stack_value_MUX_uxn_opcodes_h_l1403_c7_bdae_return_output;

     -- n8_MUX[uxn_opcodes_h_l1388_c7_66ed] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1388_c7_66ed_cond <= VAR_n8_MUX_uxn_opcodes_h_l1388_c7_66ed_cond;
     n8_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue;
     n8_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output := n8_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1403_c7_bdae] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1403_c7_bdae_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1403_c7_bdae_cond;
     tmp8_MUX_uxn_opcodes_h_l1403_c7_bdae_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1403_c7_bdae_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1403_c7_bdae_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1403_c7_bdae_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1403_c7_bdae_return_output := tmp8_MUX_uxn_opcodes_h_l1403_c7_bdae_return_output;

     -- t8_MUX[uxn_opcodes_h_l1376_c2_4c6f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond <= VAR_t8_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond;
     t8_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue;
     t8_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output := t8_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1397_c7_38ea] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_38ea_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_38ea_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1393_c7_9c66] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_9c66_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_9c66_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1403_c7_bdae_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1403_c7_bdae_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1393_c7_9c66] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_9c66_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_9c66_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1388_c7_66ed] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_66ed_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_66ed_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1384_c7_309c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_309c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_309c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_309c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_309c_return_output;

     -- n8_MUX[uxn_opcodes_h_l1384_c7_309c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1384_c7_309c_cond <= VAR_n8_MUX_uxn_opcodes_h_l1384_c7_309c_cond;
     n8_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue;
     n8_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1384_c7_309c_return_output := n8_MUX_uxn_opcodes_h_l1384_c7_309c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1393_c7_9c66] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_9c66_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_9c66_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1397_c7_38ea] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1397_c7_38ea_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1397_c7_38ea_cond;
     tmp8_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output := tmp8_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1397_c7_38ea] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1397_c7_38ea_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1397_c7_38ea_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1397_c7_38ea_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1397_c7_38ea_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output := result_stack_value_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1388_c7_66ed] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_66ed_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_66ed_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1393_c7_9c66] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_9c66_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_9c66_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1384_c7_309c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1384_c7_309c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1397_c7_38ea_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1388_c7_66ed] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_66ed_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_66ed_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1376_c2_4c6f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1388_c7_66ed] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_66ed_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_66ed_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1393_c7_9c66] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1393_c7_9c66_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1393_c7_9c66_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output := result_stack_value_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output;

     -- n8_MUX[uxn_opcodes_h_l1376_c2_4c6f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond <= VAR_n8_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond;
     n8_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue;
     n8_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output := n8_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1388_c7_66ed] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_66ed_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_66ed_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1384_c7_309c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_309c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_309c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_309c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_309c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1384_c7_309c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_309c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_309c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_309c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_309c_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1393_c7_9c66] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1393_c7_9c66_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1393_c7_9c66_cond;
     tmp8_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1393_c7_9c66_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1393_c7_9c66_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output := tmp8_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_309c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_309c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1393_c7_9c66_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l1388_c7_66ed] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1388_c7_66ed_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1388_c7_66ed_cond;
     tmp8_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output := tmp8_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1388_c7_66ed] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1388_c7_66ed_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_66ed_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_66ed_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_66ed_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output := result_stack_value_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1376_c2_4c6f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1376_c2_4c6f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1384_c7_309c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_309c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_309c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_309c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_309c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1384_c7_309c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_309c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_309c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_309c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_309c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1384_c7_309c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_309c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_309c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_309c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_309c_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_309c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_309c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_309c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1388_c7_66ed_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1384_c7_309c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1384_c7_309c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_309c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_309c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1384_c7_309c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1376_c2_4c6f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1376_c2_4c6f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1376_c2_4c6f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1384_c7_309c] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1384_c7_309c_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1384_c7_309c_cond;
     tmp8_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1384_c7_309c_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1384_c7_309c_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1384_c7_309c_return_output := tmp8_MUX_uxn_opcodes_h_l1384_c7_309c_return_output;

     -- Submodule level 8
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_309c_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1384_c7_309c_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1376_c2_4c6f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1376_c2_4c6f] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1376_c2_4c6f_cond;
     tmp8_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1376_c2_4c6f_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1376_c2_4c6f_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output := tmp8_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output;

     -- Submodule level 9
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1415_l1372_DUPLICATE_8c4c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1415_l1372_DUPLICATE_8c4c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_49dd(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c2_4c6f_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1415_l1372_DUPLICATE_8c4c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1415_l1372_DUPLICATE_8c4c_return_output;
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
