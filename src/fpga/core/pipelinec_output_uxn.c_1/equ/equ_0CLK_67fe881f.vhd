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
-- Submodules: 66
entity equ_0CLK_67fe881f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end equ_0CLK_67fe881f;
architecture arch of equ_0CLK_67fe881f is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n8 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(15 downto 0);
signal REG_COMB_n8 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l905_c6_a756]
signal BIN_OP_EQ_uxn_opcodes_h_l905_c6_a756_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l905_c6_a756_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l905_c6_a756_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l905_c1_62f0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_62f0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_62f0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_62f0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_62f0_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l905_c2_9a79]
signal n8_MUX_uxn_opcodes_h_l905_c2_9a79_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue : unsigned(15 downto 0);
signal n8_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse : unsigned(15 downto 0);
signal n8_MUX_uxn_opcodes_h_l905_c2_9a79_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l905_c2_9a79]
signal t8_MUX_uxn_opcodes_h_l905_c2_9a79_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue : unsigned(15 downto 0);
signal t8_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse : unsigned(15 downto 0);
signal t8_MUX_uxn_opcodes_h_l905_c2_9a79_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l905_c2_9a79]
signal result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_9a79_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_9a79_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l905_c2_9a79]
signal result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_9a79_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_9a79_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l905_c2_9a79]
signal result_stack_value_MUX_uxn_opcodes_h_l905_c2_9a79_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l905_c2_9a79_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l905_c2_9a79]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_9a79_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_9a79_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l905_c2_9a79]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_9a79_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_9a79_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l905_c2_9a79]
signal result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_9a79_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_9a79_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l905_c2_9a79]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_9a79_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_9a79_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l905_c2_9a79]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_9a79_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_9a79_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l906_c3_c567[uxn_opcodes_h_l906_c3_c567]
signal printf_uxn_opcodes_h_l906_c3_c567_uxn_opcodes_h_l906_c3_c567_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l913_c11_0fe3]
signal BIN_OP_EQ_uxn_opcodes_h_l913_c11_0fe3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l913_c11_0fe3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l913_c11_0fe3_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l913_c7_6eba]
signal n8_MUX_uxn_opcodes_h_l913_c7_6eba_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue : unsigned(15 downto 0);
signal n8_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse : unsigned(15 downto 0);
signal n8_MUX_uxn_opcodes_h_l913_c7_6eba_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l913_c7_6eba]
signal t8_MUX_uxn_opcodes_h_l913_c7_6eba_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue : unsigned(15 downto 0);
signal t8_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse : unsigned(15 downto 0);
signal t8_MUX_uxn_opcodes_h_l913_c7_6eba_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l913_c7_6eba]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_6eba_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_6eba_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l913_c7_6eba]
signal result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_6eba_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_6eba_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l913_c7_6eba]
signal result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_6eba_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_6eba_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l913_c7_6eba]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_6eba_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_6eba_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l913_c7_6eba]
signal result_stack_value_MUX_uxn_opcodes_h_l913_c7_6eba_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l913_c7_6eba_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l913_c7_6eba]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_6eba_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_6eba_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l913_c7_6eba]
signal result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_6eba_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_6eba_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l917_c11_9ae6]
signal BIN_OP_EQ_uxn_opcodes_h_l917_c11_9ae6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l917_c11_9ae6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l917_c11_9ae6_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l917_c7_a0cc]
signal n8_MUX_uxn_opcodes_h_l917_c7_a0cc_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue : unsigned(15 downto 0);
signal n8_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse : unsigned(15 downto 0);
signal n8_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l917_c7_a0cc]
signal t8_MUX_uxn_opcodes_h_l917_c7_a0cc_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue : unsigned(15 downto 0);
signal t8_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse : unsigned(15 downto 0);
signal t8_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l917_c7_a0cc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a0cc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l917_c7_a0cc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a0cc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l917_c7_a0cc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a0cc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l917_c7_a0cc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a0cc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l917_c7_a0cc]
signal result_stack_value_MUX_uxn_opcodes_h_l917_c7_a0cc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l917_c7_a0cc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a0cc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l917_c7_a0cc]
signal result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_a0cc_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l922_c11_2ec6]
signal BIN_OP_EQ_uxn_opcodes_h_l922_c11_2ec6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l922_c11_2ec6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l922_c11_2ec6_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l922_c7_905f]
signal n8_MUX_uxn_opcodes_h_l922_c7_905f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l922_c7_905f_iftrue : unsigned(15 downto 0);
signal n8_MUX_uxn_opcodes_h_l922_c7_905f_iffalse : unsigned(15 downto 0);
signal n8_MUX_uxn_opcodes_h_l922_c7_905f_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l922_c7_905f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_905f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_905f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_905f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_905f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l922_c7_905f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_905f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_905f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_905f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_905f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l922_c7_905f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_905f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_905f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_905f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_905f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l922_c7_905f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_905f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_905f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_905f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_905f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l922_c7_905f]
signal result_stack_value_MUX_uxn_opcodes_h_l922_c7_905f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l922_c7_905f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l922_c7_905f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l922_c7_905f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l922_c7_905f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_905f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_905f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_905f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_905f_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l922_c7_905f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_905f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_905f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_905f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_905f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l926_c11_117e]
signal BIN_OP_EQ_uxn_opcodes_h_l926_c11_117e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l926_c11_117e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l926_c11_117e_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l926_c7_0be3]
signal n8_MUX_uxn_opcodes_h_l926_c7_0be3_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l926_c7_0be3_iftrue : unsigned(15 downto 0);
signal n8_MUX_uxn_opcodes_h_l926_c7_0be3_iffalse : unsigned(15 downto 0);
signal n8_MUX_uxn_opcodes_h_l926_c7_0be3_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l926_c7_0be3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_0be3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_0be3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_0be3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_0be3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l926_c7_0be3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_0be3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_0be3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_0be3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_0be3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l926_c7_0be3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_0be3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_0be3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_0be3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_0be3_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l926_c7_0be3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_0be3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_0be3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_0be3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_0be3_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l926_c7_0be3]
signal result_stack_value_MUX_uxn_opcodes_h_l926_c7_0be3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l926_c7_0be3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l926_c7_0be3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l926_c7_0be3_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l926_c7_0be3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_0be3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_0be3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_0be3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_0be3_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l926_c7_0be3]
signal result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_0be3_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_0be3_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_0be3_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_0be3_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l930_c32_817b]
signal BIN_OP_AND_uxn_opcodes_h_l930_c32_817b_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l930_c32_817b_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l930_c32_817b_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l930_c32_7496]
signal BIN_OP_GT_uxn_opcodes_h_l930_c32_7496_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l930_c32_7496_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l930_c32_7496_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l930_c32_0546]
signal MUX_uxn_opcodes_h_l930_c32_0546_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l930_c32_0546_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l930_c32_0546_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l930_c32_0546_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l932_c11_d5b5]
signal BIN_OP_EQ_uxn_opcodes_h_l932_c11_d5b5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l932_c11_d5b5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l932_c11_d5b5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l932_c7_377f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_377f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_377f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_377f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_377f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l932_c7_377f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_377f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_377f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_377f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_377f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l932_c7_377f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_377f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_377f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_377f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_377f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l932_c7_377f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_377f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_377f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_377f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_377f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l932_c7_377f]
signal result_stack_value_MUX_uxn_opcodes_h_l932_c7_377f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l932_c7_377f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l932_c7_377f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l932_c7_377f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l936_c24_5051]
signal BIN_OP_EQ_uxn_opcodes_h_l936_c24_5051_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l936_c24_5051_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l936_c24_5051_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l936_c24_e625]
signal MUX_uxn_opcodes_h_l936_c24_e625_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l936_c24_e625_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l936_c24_e625_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l936_c24_e625_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l938_c11_b4d4]
signal BIN_OP_EQ_uxn_opcodes_h_l938_c11_b4d4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l938_c11_b4d4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l938_c11_b4d4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l938_c7_c8d4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_c8d4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_c8d4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_c8d4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_c8d4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l938_c7_c8d4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_c8d4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_c8d4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_c8d4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_c8d4_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l905_c6_a756
BIN_OP_EQ_uxn_opcodes_h_l905_c6_a756 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l905_c6_a756_left,
BIN_OP_EQ_uxn_opcodes_h_l905_c6_a756_right,
BIN_OP_EQ_uxn_opcodes_h_l905_c6_a756_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_62f0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_62f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_62f0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_62f0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_62f0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_62f0_return_output);

-- n8_MUX_uxn_opcodes_h_l905_c2_9a79
n8_MUX_uxn_opcodes_h_l905_c2_9a79 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l905_c2_9a79_cond,
n8_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue,
n8_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse,
n8_MUX_uxn_opcodes_h_l905_c2_9a79_return_output);

-- t8_MUX_uxn_opcodes_h_l905_c2_9a79
t8_MUX_uxn_opcodes_h_l905_c2_9a79 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l905_c2_9a79_cond,
t8_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue,
t8_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse,
t8_MUX_uxn_opcodes_h_l905_c2_9a79_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_9a79
result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_9a79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_9a79_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_9a79_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_9a79
result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_9a79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_9a79_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_9a79_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l905_c2_9a79
result_stack_value_MUX_uxn_opcodes_h_l905_c2_9a79 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l905_c2_9a79_cond,
result_stack_value_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l905_c2_9a79_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_9a79
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_9a79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_9a79_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_9a79_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_9a79
result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_9a79 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_9a79_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_9a79_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_9a79
result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_9a79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_9a79_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_9a79_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_9a79
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_9a79 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_9a79_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_9a79_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_9a79
result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_9a79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_9a79_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_9a79_return_output);

-- printf_uxn_opcodes_h_l906_c3_c567_uxn_opcodes_h_l906_c3_c567
printf_uxn_opcodes_h_l906_c3_c567_uxn_opcodes_h_l906_c3_c567 : entity work.printf_uxn_opcodes_h_l906_c3_c567_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l906_c3_c567_uxn_opcodes_h_l906_c3_c567_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l913_c11_0fe3
BIN_OP_EQ_uxn_opcodes_h_l913_c11_0fe3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l913_c11_0fe3_left,
BIN_OP_EQ_uxn_opcodes_h_l913_c11_0fe3_right,
BIN_OP_EQ_uxn_opcodes_h_l913_c11_0fe3_return_output);

-- n8_MUX_uxn_opcodes_h_l913_c7_6eba
n8_MUX_uxn_opcodes_h_l913_c7_6eba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l913_c7_6eba_cond,
n8_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue,
n8_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse,
n8_MUX_uxn_opcodes_h_l913_c7_6eba_return_output);

-- t8_MUX_uxn_opcodes_h_l913_c7_6eba
t8_MUX_uxn_opcodes_h_l913_c7_6eba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l913_c7_6eba_cond,
t8_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue,
t8_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse,
t8_MUX_uxn_opcodes_h_l913_c7_6eba_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_6eba
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_6eba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_6eba_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_6eba_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_6eba
result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_6eba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_6eba_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_6eba_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_6eba
result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_6eba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_6eba_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_6eba_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_6eba
result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_6eba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_6eba_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_6eba_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l913_c7_6eba
result_stack_value_MUX_uxn_opcodes_h_l913_c7_6eba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l913_c7_6eba_cond,
result_stack_value_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l913_c7_6eba_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_6eba
result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_6eba : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_6eba_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_6eba_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_6eba
result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_6eba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_6eba_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_6eba_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l917_c11_9ae6
BIN_OP_EQ_uxn_opcodes_h_l917_c11_9ae6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l917_c11_9ae6_left,
BIN_OP_EQ_uxn_opcodes_h_l917_c11_9ae6_right,
BIN_OP_EQ_uxn_opcodes_h_l917_c11_9ae6_return_output);

-- n8_MUX_uxn_opcodes_h_l917_c7_a0cc
n8_MUX_uxn_opcodes_h_l917_c7_a0cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l917_c7_a0cc_cond,
n8_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue,
n8_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse,
n8_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output);

-- t8_MUX_uxn_opcodes_h_l917_c7_a0cc
t8_MUX_uxn_opcodes_h_l917_c7_a0cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l917_c7_a0cc_cond,
t8_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue,
t8_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse,
t8_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a0cc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a0cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a0cc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a0cc
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a0cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a0cc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a0cc
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a0cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a0cc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a0cc
result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a0cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a0cc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l917_c7_a0cc
result_stack_value_MUX_uxn_opcodes_h_l917_c7_a0cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l917_c7_a0cc_cond,
result_stack_value_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a0cc
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a0cc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a0cc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_a0cc
result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_a0cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_a0cc_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l922_c11_2ec6
BIN_OP_EQ_uxn_opcodes_h_l922_c11_2ec6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l922_c11_2ec6_left,
BIN_OP_EQ_uxn_opcodes_h_l922_c11_2ec6_right,
BIN_OP_EQ_uxn_opcodes_h_l922_c11_2ec6_return_output);

-- n8_MUX_uxn_opcodes_h_l922_c7_905f
n8_MUX_uxn_opcodes_h_l922_c7_905f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l922_c7_905f_cond,
n8_MUX_uxn_opcodes_h_l922_c7_905f_iftrue,
n8_MUX_uxn_opcodes_h_l922_c7_905f_iffalse,
n8_MUX_uxn_opcodes_h_l922_c7_905f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_905f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_905f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_905f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_905f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_905f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_905f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_905f
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_905f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_905f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_905f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_905f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_905f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_905f
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_905f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_905f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_905f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_905f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_905f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_905f
result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_905f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_905f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_905f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_905f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_905f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l922_c7_905f
result_stack_value_MUX_uxn_opcodes_h_l922_c7_905f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l922_c7_905f_cond,
result_stack_value_MUX_uxn_opcodes_h_l922_c7_905f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l922_c7_905f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l922_c7_905f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_905f
result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_905f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_905f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_905f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_905f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_905f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_905f
result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_905f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_905f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_905f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_905f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_905f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l926_c11_117e
BIN_OP_EQ_uxn_opcodes_h_l926_c11_117e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l926_c11_117e_left,
BIN_OP_EQ_uxn_opcodes_h_l926_c11_117e_right,
BIN_OP_EQ_uxn_opcodes_h_l926_c11_117e_return_output);

-- n8_MUX_uxn_opcodes_h_l926_c7_0be3
n8_MUX_uxn_opcodes_h_l926_c7_0be3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l926_c7_0be3_cond,
n8_MUX_uxn_opcodes_h_l926_c7_0be3_iftrue,
n8_MUX_uxn_opcodes_h_l926_c7_0be3_iffalse,
n8_MUX_uxn_opcodes_h_l926_c7_0be3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_0be3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_0be3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_0be3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_0be3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_0be3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_0be3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_0be3
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_0be3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_0be3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_0be3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_0be3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_0be3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_0be3
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_0be3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_0be3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_0be3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_0be3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_0be3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_0be3
result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_0be3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_0be3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_0be3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_0be3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_0be3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l926_c7_0be3
result_stack_value_MUX_uxn_opcodes_h_l926_c7_0be3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l926_c7_0be3_cond,
result_stack_value_MUX_uxn_opcodes_h_l926_c7_0be3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l926_c7_0be3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l926_c7_0be3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_0be3
result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_0be3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_0be3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_0be3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_0be3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_0be3_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_0be3
result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_0be3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_0be3_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_0be3_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_0be3_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_0be3_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l930_c32_817b
BIN_OP_AND_uxn_opcodes_h_l930_c32_817b : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l930_c32_817b_left,
BIN_OP_AND_uxn_opcodes_h_l930_c32_817b_right,
BIN_OP_AND_uxn_opcodes_h_l930_c32_817b_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l930_c32_7496
BIN_OP_GT_uxn_opcodes_h_l930_c32_7496 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l930_c32_7496_left,
BIN_OP_GT_uxn_opcodes_h_l930_c32_7496_right,
BIN_OP_GT_uxn_opcodes_h_l930_c32_7496_return_output);

-- MUX_uxn_opcodes_h_l930_c32_0546
MUX_uxn_opcodes_h_l930_c32_0546 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l930_c32_0546_cond,
MUX_uxn_opcodes_h_l930_c32_0546_iftrue,
MUX_uxn_opcodes_h_l930_c32_0546_iffalse,
MUX_uxn_opcodes_h_l930_c32_0546_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l932_c11_d5b5
BIN_OP_EQ_uxn_opcodes_h_l932_c11_d5b5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l932_c11_d5b5_left,
BIN_OP_EQ_uxn_opcodes_h_l932_c11_d5b5_right,
BIN_OP_EQ_uxn_opcodes_h_l932_c11_d5b5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_377f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_377f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_377f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_377f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_377f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_377f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_377f
result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_377f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_377f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_377f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_377f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_377f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_377f
result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_377f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_377f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_377f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_377f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_377f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_377f
result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_377f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_377f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_377f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_377f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_377f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l932_c7_377f
result_stack_value_MUX_uxn_opcodes_h_l932_c7_377f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l932_c7_377f_cond,
result_stack_value_MUX_uxn_opcodes_h_l932_c7_377f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l932_c7_377f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l932_c7_377f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l936_c24_5051
BIN_OP_EQ_uxn_opcodes_h_l936_c24_5051 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l936_c24_5051_left,
BIN_OP_EQ_uxn_opcodes_h_l936_c24_5051_right,
BIN_OP_EQ_uxn_opcodes_h_l936_c24_5051_return_output);

-- MUX_uxn_opcodes_h_l936_c24_e625
MUX_uxn_opcodes_h_l936_c24_e625 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l936_c24_e625_cond,
MUX_uxn_opcodes_h_l936_c24_e625_iftrue,
MUX_uxn_opcodes_h_l936_c24_e625_iffalse,
MUX_uxn_opcodes_h_l936_c24_e625_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l938_c11_b4d4
BIN_OP_EQ_uxn_opcodes_h_l938_c11_b4d4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l938_c11_b4d4_left,
BIN_OP_EQ_uxn_opcodes_h_l938_c11_b4d4_right,
BIN_OP_EQ_uxn_opcodes_h_l938_c11_b4d4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_c8d4
result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_c8d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_c8d4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_c8d4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_c8d4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_c8d4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_c8d4
result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_c8d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_c8d4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_c8d4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_c8d4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_c8d4_return_output);



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
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l905_c6_a756_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_62f0_return_output,
 n8_MUX_uxn_opcodes_h_l905_c2_9a79_return_output,
 t8_MUX_uxn_opcodes_h_l905_c2_9a79_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_9a79_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_9a79_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l905_c2_9a79_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_9a79_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_9a79_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_9a79_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_9a79_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_9a79_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l913_c11_0fe3_return_output,
 n8_MUX_uxn_opcodes_h_l913_c7_6eba_return_output,
 t8_MUX_uxn_opcodes_h_l913_c7_6eba_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_6eba_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_6eba_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_6eba_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_6eba_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l913_c7_6eba_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_6eba_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_6eba_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l917_c11_9ae6_return_output,
 n8_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output,
 t8_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l922_c11_2ec6_return_output,
 n8_MUX_uxn_opcodes_h_l922_c7_905f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_905f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_905f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_905f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_905f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l922_c7_905f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_905f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_905f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l926_c11_117e_return_output,
 n8_MUX_uxn_opcodes_h_l926_c7_0be3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_0be3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_0be3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_0be3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_0be3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l926_c7_0be3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_0be3_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_0be3_return_output,
 BIN_OP_AND_uxn_opcodes_h_l930_c32_817b_return_output,
 BIN_OP_GT_uxn_opcodes_h_l930_c32_7496_return_output,
 MUX_uxn_opcodes_h_l930_c32_0546_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l932_c11_d5b5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_377f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_377f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_377f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_377f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l932_c7_377f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l936_c24_5051_return_output,
 MUX_uxn_opcodes_h_l936_c24_e625_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l938_c11_b4d4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_c8d4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_c8d4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a756_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a756_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a756_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_62f0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_62f0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_62f0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_62f0_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l913_c7_6eba_return_output : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l905_c2_9a79_return_output : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l905_c2_9a79_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l913_c7_6eba_return_output : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l905_c2_9a79_return_output : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l905_c2_9a79_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_6eba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_9a79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_9a79_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_6eba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_9a79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_9a79_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l913_c7_6eba_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l905_c2_9a79_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l905_c2_9a79_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l905_c2_9a79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_9a79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_9a79_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_6eba_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_9a79_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_9a79_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_6eba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_9a79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_9a79_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l909_c3_0943 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_6eba_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_9a79_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_9a79_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_6eba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_9a79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_9a79_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l906_c3_c567_uxn_opcodes_h_l906_c3_c567_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_0fe3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_0fe3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_0fe3_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l913_c7_6eba_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l913_c7_6eba_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l915_c3_85ce : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_6eba_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_6eba_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_6eba_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_6eba_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l913_c7_6eba_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_6eba_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_6eba_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_9ae6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_9ae6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_9ae6_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l922_c7_905f_return_output : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l917_c7_a0cc_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue : unsigned(15 downto 0);
 variable VAR_t8_uxn_opcodes_h_l918_c3_d8d2 : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l917_c7_a0cc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l920_c3_9da7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_905f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a0cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_905f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a0cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_905f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a0cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_905f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a0cc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_905f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l917_c7_a0cc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_905f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a0cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_905f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_a0cc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_2ec6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_2ec6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_2ec6_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l922_c7_905f_iftrue : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l922_c7_905f_iffalse : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l926_c7_0be3_return_output : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l922_c7_905f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_905f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l924_c3_7770 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_905f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_0be3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_905f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_905f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_905f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_0be3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_905f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_905f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_905f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_0be3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_905f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_905f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_905f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_0be3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_905f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_905f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_905f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_0be3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_905f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_905f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_905f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_0be3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_905f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_905f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_905f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_0be3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_905f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_117e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_117e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_117e_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l926_c7_0be3_iftrue : unsigned(15 downto 0);
 variable VAR_n8_uxn_opcodes_h_l927_c3_e2f4 : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l926_c7_0be3_iffalse : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l926_c7_0be3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_0be3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_0be3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_377f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_0be3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_0be3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_0be3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_377f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_0be3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_0be3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_0be3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_377f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_0be3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_0be3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_0be3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_377f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_0be3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_0be3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_0be3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l932_c7_377f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_0be3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_0be3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_0be3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_0be3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_0be3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_0be3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l926_c7_0be3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_0be3_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l930_c32_0546_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l930_c32_0546_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l930_c32_0546_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l930_c32_817b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l930_c32_817b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l930_c32_817b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l930_c32_7496_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l930_c32_7496_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l930_c32_7496_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l930_c32_0546_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_d5b5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_d5b5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_d5b5_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_377f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l935_c3_9284 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_377f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_377f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_377f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_377f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_c8d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_377f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_377f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_377f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_c8d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_377f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_377f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_377f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_377f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l932_c7_377f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l932_c7_377f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l932_c7_377f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l936_c24_e625_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l936_c24_e625_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l936_c24_e625_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c24_5051_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c24_5051_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c24_5051_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l936_c24_e625_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c11_b4d4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c11_b4d4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c11_b4d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_c8d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_c8d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_c8d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_c8d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_c8d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_c8d4_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l932_l926_l922_l917_l913_l905_DUPLICATE_2573_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l926_l922_l917_l913_l905_DUPLICATE_4a62_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l932_l922_l917_l913_l905_DUPLICATE_eab2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l932_l926_l922_l917_l913_l938_DUPLICATE_2785_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l926_l922_l917_l913_l938_DUPLICATE_b33a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l932_l926_DUPLICATE_218b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l943_l901_DUPLICATE_6878_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(15 downto 0);
variable REG_VAR_n8 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_377f_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_377f_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_c8d4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_9ae6_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c11_b4d4_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l935_c3_9284 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_377f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l935_c3_9284;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l915_c3_85ce := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l915_c3_85ce;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_d5b5_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l936_c24_e625_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_MUX_uxn_opcodes_h_l930_c32_0546_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l909_c3_0943 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l909_c3_0943;
     VAR_MUX_uxn_opcodes_h_l930_c32_0546_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_AND_uxn_opcodes_h_l930_c32_817b_right := to_unsigned(128, 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l920_c3_9da7 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l920_c3_9da7;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_905f_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_62f0_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_0fe3_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a756_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_c8d4_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_0be3_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_0be3_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l930_c32_7496_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_2ec6_right := to_unsigned(3, 2);
     VAR_MUX_uxn_opcodes_h_l936_c24_e625_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_117e_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l924_c3_7770 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_905f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l924_c3_7770;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_62f0_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l930_c32_817b_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c24_5051_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l922_c7_905f_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l926_c7_0be3_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a756_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_0fe3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_9ae6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_2ec6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_117e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_d5b5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c11_b4d4_left := VAR_phase;
     VAR_n8_uxn_opcodes_h_l927_c3_e2f4 := resize(VAR_previous_stack_read, 16);
     VAR_t8_uxn_opcodes_h_l918_c3_d8d2 := resize(VAR_previous_stack_read, 16);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c24_5051_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse := t8;
     VAR_n8_MUX_uxn_opcodes_h_l926_c7_0be3_iftrue := VAR_n8_uxn_opcodes_h_l927_c3_e2f4;
     VAR_t8_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue := VAR_t8_uxn_opcodes_h_l918_c3_d8d2;
     -- BIN_OP_EQ[uxn_opcodes_h_l932_c11_d5b5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l932_c11_d5b5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_d5b5_left;
     BIN_OP_EQ_uxn_opcodes_h_l932_c11_d5b5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_d5b5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_d5b5_return_output := BIN_OP_EQ_uxn_opcodes_h_l932_c11_d5b5_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l905_c2_9a79] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l905_c2_9a79_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l905_c6_a756] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l905_c6_a756_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a756_left;
     BIN_OP_EQ_uxn_opcodes_h_l905_c6_a756_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a756_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a756_return_output := BIN_OP_EQ_uxn_opcodes_h_l905_c6_a756_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l926_l922_l917_l913_l938_DUPLICATE_b33a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l926_l922_l917_l913_l938_DUPLICATE_b33a_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l938_c11_b4d4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l938_c11_b4d4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c11_b4d4_left;
     BIN_OP_EQ_uxn_opcodes_h_l938_c11_b4d4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c11_b4d4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c11_b4d4_return_output := BIN_OP_EQ_uxn_opcodes_h_l938_c11_b4d4_return_output;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l926_c7_0be3] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l926_c7_0be3_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l932_l922_l917_l913_l905_DUPLICATE_eab2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l932_l922_l917_l913_l905_DUPLICATE_eab2_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l913_c11_0fe3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l913_c11_0fe3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_0fe3_left;
     BIN_OP_EQ_uxn_opcodes_h_l913_c11_0fe3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_0fe3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_0fe3_return_output := BIN_OP_EQ_uxn_opcodes_h_l913_c11_0fe3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l922_c11_2ec6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l922_c11_2ec6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_2ec6_left;
     BIN_OP_EQ_uxn_opcodes_h_l922_c11_2ec6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_2ec6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_2ec6_return_output := BIN_OP_EQ_uxn_opcodes_h_l922_c11_2ec6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l932_l926_l922_l917_l913_l938_DUPLICATE_2785 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l932_l926_l922_l917_l913_l938_DUPLICATE_2785_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l917_c11_9ae6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l917_c11_9ae6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_9ae6_left;
     BIN_OP_EQ_uxn_opcodes_h_l917_c11_9ae6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_9ae6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_9ae6_return_output := BIN_OP_EQ_uxn_opcodes_h_l917_c11_9ae6_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l930_c32_817b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l930_c32_817b_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l930_c32_817b_left;
     BIN_OP_AND_uxn_opcodes_h_l930_c32_817b_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l930_c32_817b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l930_c32_817b_return_output := BIN_OP_AND_uxn_opcodes_h_l930_c32_817b_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l926_l922_l917_l913_l905_DUPLICATE_4a62 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l926_l922_l917_l913_l905_DUPLICATE_4a62_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l932_l926_DUPLICATE_218b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l932_l926_DUPLICATE_218b_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l926_c11_117e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l926_c11_117e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_117e_left;
     BIN_OP_EQ_uxn_opcodes_h_l926_c11_117e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_117e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_117e_return_output := BIN_OP_EQ_uxn_opcodes_h_l926_c11_117e_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l932_l926_l922_l917_l913_l905_DUPLICATE_2573 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l932_l926_l922_l917_l913_l905_DUPLICATE_2573_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l936_c24_5051] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l936_c24_5051_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c24_5051_left;
     BIN_OP_EQ_uxn_opcodes_h_l936_c24_5051_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c24_5051_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c24_5051_return_output := BIN_OP_EQ_uxn_opcodes_h_l936_c24_5051_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l930_c32_7496_left := VAR_BIN_OP_AND_uxn_opcodes_h_l930_c32_817b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_62f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a756_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l905_c2_9a79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a756_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_9a79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a756_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_9a79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a756_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_9a79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a756_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_9a79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a756_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_9a79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a756_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_9a79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a756_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_9a79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a756_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l905_c2_9a79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a756_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l905_c2_9a79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a756_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l913_c7_6eba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_0fe3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_6eba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_0fe3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_6eba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_0fe3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_6eba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_0fe3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_6eba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_0fe3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_6eba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_0fe3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_6eba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_0fe3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l913_c7_6eba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_0fe3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l913_c7_6eba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_0fe3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l917_c7_a0cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_9ae6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a0cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_9ae6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a0cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_9ae6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_a0cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_9ae6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a0cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_9ae6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a0cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_9ae6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a0cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_9ae6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l917_c7_a0cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_9ae6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l917_c7_a0cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_9ae6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l922_c7_905f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_2ec6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_905f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_2ec6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_905f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_2ec6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_905f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_2ec6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_905f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_2ec6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_905f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_2ec6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_905f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_2ec6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_905f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_2ec6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l926_c7_0be3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_117e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_0be3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_117e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_0be3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_117e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_0be3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_117e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_0be3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_117e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_0be3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_117e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_0be3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_117e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_0be3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_117e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_377f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_d5b5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_377f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_d5b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_377f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_d5b5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_377f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_d5b5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l932_c7_377f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_d5b5_return_output;
     VAR_MUX_uxn_opcodes_h_l936_c24_e625_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c24_5051_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_c8d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c11_b4d4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_c8d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c11_b4d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l926_l922_l917_l913_l905_DUPLICATE_4a62_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l926_l922_l917_l913_l905_DUPLICATE_4a62_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l926_l922_l917_l913_l905_DUPLICATE_4a62_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_905f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l926_l922_l917_l913_l905_DUPLICATE_4a62_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_0be3_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l926_l922_l917_l913_l905_DUPLICATE_4a62_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l932_l926_l922_l917_l913_l938_DUPLICATE_2785_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l932_l926_l922_l917_l913_l938_DUPLICATE_2785_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_905f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l932_l926_l922_l917_l913_l938_DUPLICATE_2785_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_0be3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l932_l926_l922_l917_l913_l938_DUPLICATE_2785_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_377f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l932_l926_l922_l917_l913_l938_DUPLICATE_2785_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_c8d4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l932_l926_l922_l917_l913_l938_DUPLICATE_2785_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l932_l922_l917_l913_l905_DUPLICATE_eab2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l932_l922_l917_l913_l905_DUPLICATE_eab2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l932_l922_l917_l913_l905_DUPLICATE_eab2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_905f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l932_l922_l917_l913_l905_DUPLICATE_eab2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_377f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l932_l922_l917_l913_l905_DUPLICATE_eab2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l926_l922_l917_l913_l938_DUPLICATE_b33a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l926_l922_l917_l913_l938_DUPLICATE_b33a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_905f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l926_l922_l917_l913_l938_DUPLICATE_b33a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_0be3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l926_l922_l917_l913_l938_DUPLICATE_b33a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_c8d4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l926_l922_l917_l913_l938_DUPLICATE_b33a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_0be3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l932_l926_DUPLICATE_218b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_377f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l932_l926_DUPLICATE_218b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l932_l926_l922_l917_l913_l905_DUPLICATE_2573_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l932_l926_l922_l917_l913_l905_DUPLICATE_2573_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l932_l926_l922_l917_l913_l905_DUPLICATE_2573_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_905f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l932_l926_l922_l917_l913_l905_DUPLICATE_2573_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_0be3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l932_l926_l922_l917_l913_l905_DUPLICATE_2573_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l932_c7_377f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l932_l926_l922_l917_l913_l905_DUPLICATE_2573_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l905_c2_9a79_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_0be3_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l926_c7_0be3_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l932_c7_377f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_377f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_377f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_377f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_377f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_377f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_377f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_377f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_377f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l905_c1_62f0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_62f0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_62f0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_62f0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_62f0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_62f0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_62f0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_62f0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_62f0_return_output;

     -- MUX[uxn_opcodes_h_l936_c24_e625] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l936_c24_e625_cond <= VAR_MUX_uxn_opcodes_h_l936_c24_e625_cond;
     MUX_uxn_opcodes_h_l936_c24_e625_iftrue <= VAR_MUX_uxn_opcodes_h_l936_c24_e625_iftrue;
     MUX_uxn_opcodes_h_l936_c24_e625_iffalse <= VAR_MUX_uxn_opcodes_h_l936_c24_e625_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l936_c24_e625_return_output := MUX_uxn_opcodes_h_l936_c24_e625_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l926_c7_0be3] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_0be3_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_0be3_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_0be3_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_0be3_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_0be3_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_0be3_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_0be3_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_0be3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l938_c7_c8d4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_c8d4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_c8d4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_c8d4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_c8d4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_c8d4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_c8d4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_c8d4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_c8d4_return_output;

     -- t8_MUX[uxn_opcodes_h_l917_c7_a0cc] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l917_c7_a0cc_cond <= VAR_t8_MUX_uxn_opcodes_h_l917_c7_a0cc_cond;
     t8_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue;
     t8_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output := t8_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l932_c7_377f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_377f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_377f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_377f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_377f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_377f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_377f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_377f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_377f_return_output;

     -- n8_MUX[uxn_opcodes_h_l926_c7_0be3] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l926_c7_0be3_cond <= VAR_n8_MUX_uxn_opcodes_h_l926_c7_0be3_cond;
     n8_MUX_uxn_opcodes_h_l926_c7_0be3_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l926_c7_0be3_iftrue;
     n8_MUX_uxn_opcodes_h_l926_c7_0be3_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l926_c7_0be3_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l926_c7_0be3_return_output := n8_MUX_uxn_opcodes_h_l926_c7_0be3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l938_c7_c8d4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_c8d4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_c8d4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_c8d4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_c8d4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_c8d4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_c8d4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_c8d4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_c8d4_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l930_c32_7496] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l930_c32_7496_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l930_c32_7496_left;
     BIN_OP_GT_uxn_opcodes_h_l930_c32_7496_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l930_c32_7496_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l930_c32_7496_return_output := BIN_OP_GT_uxn_opcodes_h_l930_c32_7496_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l905_c2_9a79] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_9a79_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_9a79_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_9a79_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_9a79_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l930_c32_0546_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l930_c32_7496_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l932_c7_377f_iftrue := VAR_MUX_uxn_opcodes_h_l936_c24_e625_return_output;
     VAR_printf_uxn_opcodes_h_l906_c3_c567_uxn_opcodes_h_l906_c3_c567_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_62f0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l922_c7_905f_iffalse := VAR_n8_MUX_uxn_opcodes_h_l926_c7_0be3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_377f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_c8d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_0be3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_377f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_905f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_0be3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_377f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_c8d4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_0be3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_377f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse := VAR_t8_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output;
     -- MUX[uxn_opcodes_h_l930_c32_0546] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l930_c32_0546_cond <= VAR_MUX_uxn_opcodes_h_l930_c32_0546_cond;
     MUX_uxn_opcodes_h_l930_c32_0546_iftrue <= VAR_MUX_uxn_opcodes_h_l930_c32_0546_iftrue;
     MUX_uxn_opcodes_h_l930_c32_0546_iffalse <= VAR_MUX_uxn_opcodes_h_l930_c32_0546_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l930_c32_0546_return_output := MUX_uxn_opcodes_h_l930_c32_0546_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l932_c7_377f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_377f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_377f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_377f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_377f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_377f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_377f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_377f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_377f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l926_c7_0be3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_0be3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_0be3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_0be3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_0be3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_0be3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_0be3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_0be3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_0be3_return_output;

     -- n8_MUX[uxn_opcodes_h_l922_c7_905f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l922_c7_905f_cond <= VAR_n8_MUX_uxn_opcodes_h_l922_c7_905f_cond;
     n8_MUX_uxn_opcodes_h_l922_c7_905f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l922_c7_905f_iftrue;
     n8_MUX_uxn_opcodes_h_l922_c7_905f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l922_c7_905f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l922_c7_905f_return_output := n8_MUX_uxn_opcodes_h_l922_c7_905f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l932_c7_377f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l932_c7_377f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l932_c7_377f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l932_c7_377f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l932_c7_377f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l932_c7_377f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l932_c7_377f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l932_c7_377f_return_output := result_stack_value_MUX_uxn_opcodes_h_l932_c7_377f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l922_c7_905f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_905f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_905f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_905f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_905f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_905f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_905f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_905f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_905f_return_output;

     -- printf_uxn_opcodes_h_l906_c3_c567[uxn_opcodes_h_l906_c3_c567] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l906_c3_c567_uxn_opcodes_h_l906_c3_c567_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l906_c3_c567_uxn_opcodes_h_l906_c3_c567_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t8_MUX[uxn_opcodes_h_l913_c7_6eba] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l913_c7_6eba_cond <= VAR_t8_MUX_uxn_opcodes_h_l913_c7_6eba_cond;
     t8_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue;
     t8_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l913_c7_6eba_return_output := t8_MUX_uxn_opcodes_h_l913_c7_6eba_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l932_c7_377f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_377f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_377f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_377f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_377f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_377f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_377f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_377f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_377f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l926_c7_0be3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_0be3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_0be3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_0be3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_0be3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_0be3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_0be3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_0be3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_0be3_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_0be3_iftrue := VAR_MUX_uxn_opcodes_h_l930_c32_0546_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse := VAR_n8_MUX_uxn_opcodes_h_l922_c7_905f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_0be3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_377f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_905f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_0be3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_905f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_0be3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_377f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_905f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_0be3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_0be3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l932_c7_377f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse := VAR_t8_MUX_uxn_opcodes_h_l913_c7_6eba_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l926_c7_0be3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_0be3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_0be3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_0be3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_0be3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_0be3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_0be3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_0be3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_0be3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l922_c7_905f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_905f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_905f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_905f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_905f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_905f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_905f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_905f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_905f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l922_c7_905f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_905f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_905f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_905f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_905f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_905f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_905f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_905f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_905f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l926_c7_0be3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_0be3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_0be3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_0be3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_0be3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_0be3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_0be3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_0be3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_0be3_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l917_c7_a0cc] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_a0cc_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_a0cc_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output;

     -- n8_MUX[uxn_opcodes_h_l917_c7_a0cc] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l917_c7_a0cc_cond <= VAR_n8_MUX_uxn_opcodes_h_l917_c7_a0cc_cond;
     n8_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue;
     n8_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output := n8_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output;

     -- t8_MUX[uxn_opcodes_h_l905_c2_9a79] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l905_c2_9a79_cond <= VAR_t8_MUX_uxn_opcodes_h_l905_c2_9a79_cond;
     t8_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue;
     t8_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l905_c2_9a79_return_output := t8_MUX_uxn_opcodes_h_l905_c2_9a79_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l926_c7_0be3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_0be3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_0be3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_0be3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_0be3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_0be3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_0be3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_0be3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_0be3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l926_c7_0be3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l926_c7_0be3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_0be3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l926_c7_0be3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_0be3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l926_c7_0be3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_0be3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_0be3_return_output := result_stack_value_MUX_uxn_opcodes_h_l926_c7_0be3_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse := VAR_n8_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_905f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_0be3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_905f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_905f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_0be3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_905f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_0be3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_905f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_905f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_0be3_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l905_c2_9a79_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l922_c7_905f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_905f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_905f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_905f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_905f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_905f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_905f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_905f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_905f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l922_c7_905f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_905f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_905f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_905f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_905f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_905f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_905f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_905f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_905f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l917_c7_a0cc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a0cc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a0cc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output;

     -- n8_MUX[uxn_opcodes_h_l913_c7_6eba] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l913_c7_6eba_cond <= VAR_n8_MUX_uxn_opcodes_h_l913_c7_6eba_cond;
     n8_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue;
     n8_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l913_c7_6eba_return_output := n8_MUX_uxn_opcodes_h_l913_c7_6eba_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l913_c7_6eba] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_6eba_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_6eba_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_6eba_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_6eba_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l922_c7_905f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_905f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_905f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_905f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_905f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_905f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_905f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_905f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_905f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l922_c7_905f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l922_c7_905f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_905f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l922_c7_905f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_905f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l922_c7_905f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_905f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_905f_return_output := result_stack_value_MUX_uxn_opcodes_h_l922_c7_905f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l917_c7_a0cc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a0cc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a0cc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse := VAR_n8_MUX_uxn_opcodes_h_l913_c7_6eba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_905f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_6eba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_905f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_905f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_905f_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l913_c7_6eba] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_6eba_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_6eba_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_6eba_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_6eba_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l917_c7_a0cc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a0cc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a0cc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l913_c7_6eba] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_6eba_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_6eba_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_6eba_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_6eba_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l905_c2_9a79] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_9a79_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_9a79_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_9a79_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_9a79_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l917_c7_a0cc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a0cc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a0cc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l917_c7_a0cc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a0cc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a0cc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l917_c7_a0cc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l917_c7_a0cc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l917_c7_a0cc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l917_c7_a0cc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l917_c7_a0cc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output := result_stack_value_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output;

     -- n8_MUX[uxn_opcodes_h_l905_c2_9a79] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l905_c2_9a79_cond <= VAR_n8_MUX_uxn_opcodes_h_l905_c2_9a79_cond;
     n8_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue;
     n8_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l905_c2_9a79_return_output := n8_MUX_uxn_opcodes_h_l905_c2_9a79_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l905_c2_9a79_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_6eba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_6eba_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l917_c7_a0cc_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l905_c2_9a79] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_9a79_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_9a79_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_9a79_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_9a79_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l913_c7_6eba] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_6eba_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_6eba_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_6eba_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_6eba_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l905_c2_9a79] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_9a79_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_9a79_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_9a79_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_9a79_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l913_c7_6eba] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_6eba_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_6eba_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_6eba_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_6eba_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l913_c7_6eba] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_6eba_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_6eba_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_6eba_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_6eba_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l913_c7_6eba] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l913_c7_6eba_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l913_c7_6eba_cond;
     result_stack_value_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l913_c7_6eba_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l913_c7_6eba_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l913_c7_6eba_return_output := result_stack_value_MUX_uxn_opcodes_h_l913_c7_6eba_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_6eba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_6eba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_6eba_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l913_c7_6eba_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l905_c2_9a79] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_9a79_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_9a79_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_9a79_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_9a79_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l905_c2_9a79] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l905_c2_9a79_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l905_c2_9a79_cond;
     result_stack_value_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l905_c2_9a79_return_output := result_stack_value_MUX_uxn_opcodes_h_l905_c2_9a79_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l905_c2_9a79] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_9a79_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_9a79_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_9a79_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_9a79_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l905_c2_9a79] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_9a79_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_9a79_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_9a79_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_9a79_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_9a79_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_9a79_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l943_l901_DUPLICATE_6878 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l943_l901_DUPLICATE_6878_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_49dd(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_9a79_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_9a79_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l905_c2_9a79_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_9a79_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_9a79_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_9a79_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_9a79_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_9a79_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l943_l901_DUPLICATE_6878_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l943_l901_DUPLICATE_6878_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
