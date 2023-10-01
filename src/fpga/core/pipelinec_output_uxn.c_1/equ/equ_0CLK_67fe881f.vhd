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
-- BIN_OP_EQ[uxn_opcodes_h_l905_c6_5fe4]
signal BIN_OP_EQ_uxn_opcodes_h_l905_c6_5fe4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l905_c6_5fe4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l905_c6_5fe4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l905_c1_7eb3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_7eb3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_7eb3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_7eb3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_7eb3_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l905_c2_b38a]
signal t8_MUX_uxn_opcodes_h_l905_c2_b38a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue : unsigned(15 downto 0);
signal t8_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse : unsigned(15 downto 0);
signal t8_MUX_uxn_opcodes_h_l905_c2_b38a_return_output : unsigned(15 downto 0);

-- n8_MUX[uxn_opcodes_h_l905_c2_b38a]
signal n8_MUX_uxn_opcodes_h_l905_c2_b38a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue : unsigned(15 downto 0);
signal n8_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse : unsigned(15 downto 0);
signal n8_MUX_uxn_opcodes_h_l905_c2_b38a_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l905_c2_b38a]
signal result_stack_value_MUX_uxn_opcodes_h_l905_c2_b38a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l905_c2_b38a_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l905_c2_b38a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_b38a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_b38a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l905_c2_b38a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_b38a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_b38a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l905_c2_b38a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_b38a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_b38a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l905_c2_b38a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_b38a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_b38a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l905_c2_b38a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_b38a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_b38a_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l905_c2_b38a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_b38a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_b38a_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l905_c2_b38a]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_b38a_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_b38a_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l906_c3_847d[uxn_opcodes_h_l906_c3_847d]
signal printf_uxn_opcodes_h_l906_c3_847d_uxn_opcodes_h_l906_c3_847d_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l913_c11_ac7f]
signal BIN_OP_EQ_uxn_opcodes_h_l913_c11_ac7f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l913_c11_ac7f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l913_c11_ac7f_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l913_c7_9f9f]
signal t8_MUX_uxn_opcodes_h_l913_c7_9f9f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue : unsigned(15 downto 0);
signal t8_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse : unsigned(15 downto 0);
signal t8_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output : unsigned(15 downto 0);

-- n8_MUX[uxn_opcodes_h_l913_c7_9f9f]
signal n8_MUX_uxn_opcodes_h_l913_c7_9f9f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue : unsigned(15 downto 0);
signal n8_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse : unsigned(15 downto 0);
signal n8_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l913_c7_9f9f]
signal result_stack_value_MUX_uxn_opcodes_h_l913_c7_9f9f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l913_c7_9f9f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_9f9f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l913_c7_9f9f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_9f9f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l913_c7_9f9f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_9f9f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l913_c7_9f9f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_9f9f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l913_c7_9f9f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_9f9f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l913_c7_9f9f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_9f9f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l917_c11_df79]
signal BIN_OP_EQ_uxn_opcodes_h_l917_c11_df79_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l917_c11_df79_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l917_c11_df79_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l917_c7_c2f0]
signal t8_MUX_uxn_opcodes_h_l917_c7_c2f0_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue : unsigned(15 downto 0);
signal t8_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse : unsigned(15 downto 0);
signal t8_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output : unsigned(15 downto 0);

-- n8_MUX[uxn_opcodes_h_l917_c7_c2f0]
signal n8_MUX_uxn_opcodes_h_l917_c7_c2f0_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue : unsigned(15 downto 0);
signal n8_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse : unsigned(15 downto 0);
signal n8_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l917_c7_c2f0]
signal result_stack_value_MUX_uxn_opcodes_h_l917_c7_c2f0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l917_c7_c2f0]
signal result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_c2f0_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l917_c7_c2f0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_c2f0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l917_c7_c2f0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_c2f0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l917_c7_c2f0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_c2f0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l917_c7_c2f0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_c2f0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l917_c7_c2f0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_c2f0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l922_c11_9040]
signal BIN_OP_EQ_uxn_opcodes_h_l922_c11_9040_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l922_c11_9040_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l922_c11_9040_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l922_c7_7eae]
signal n8_MUX_uxn_opcodes_h_l922_c7_7eae_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l922_c7_7eae_iftrue : unsigned(15 downto 0);
signal n8_MUX_uxn_opcodes_h_l922_c7_7eae_iffalse : unsigned(15 downto 0);
signal n8_MUX_uxn_opcodes_h_l922_c7_7eae_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l922_c7_7eae]
signal result_stack_value_MUX_uxn_opcodes_h_l922_c7_7eae_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l922_c7_7eae_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l922_c7_7eae_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l922_c7_7eae_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l922_c7_7eae]
signal result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_7eae_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_7eae_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_7eae_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_7eae_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l922_c7_7eae]
signal result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_7eae_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_7eae_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_7eae_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_7eae_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l922_c7_7eae]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_7eae_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_7eae_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_7eae_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_7eae_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l922_c7_7eae]
signal result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_7eae_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_7eae_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_7eae_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_7eae_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l922_c7_7eae]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_7eae_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_7eae_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_7eae_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_7eae_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l922_c7_7eae]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_7eae_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_7eae_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_7eae_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_7eae_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l926_c11_cf11]
signal BIN_OP_EQ_uxn_opcodes_h_l926_c11_cf11_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l926_c11_cf11_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l926_c11_cf11_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l926_c7_fa38]
signal n8_MUX_uxn_opcodes_h_l926_c7_fa38_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l926_c7_fa38_iftrue : unsigned(15 downto 0);
signal n8_MUX_uxn_opcodes_h_l926_c7_fa38_iffalse : unsigned(15 downto 0);
signal n8_MUX_uxn_opcodes_h_l926_c7_fa38_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l926_c7_fa38]
signal result_stack_value_MUX_uxn_opcodes_h_l926_c7_fa38_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l926_c7_fa38_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l926_c7_fa38_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l926_c7_fa38_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l926_c7_fa38]
signal result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_fa38_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_fa38_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_fa38_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_fa38_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l926_c7_fa38]
signal result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_fa38_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_fa38_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_fa38_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_fa38_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l926_c7_fa38]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_fa38_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_fa38_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_fa38_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_fa38_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l926_c7_fa38]
signal result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_fa38_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_fa38_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_fa38_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_fa38_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l926_c7_fa38]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_fa38_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_fa38_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_fa38_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_fa38_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l926_c7_fa38]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_fa38_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_fa38_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_fa38_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_fa38_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l930_c32_063d]
signal BIN_OP_AND_uxn_opcodes_h_l930_c32_063d_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l930_c32_063d_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l930_c32_063d_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l930_c32_31c8]
signal BIN_OP_GT_uxn_opcodes_h_l930_c32_31c8_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l930_c32_31c8_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l930_c32_31c8_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l930_c32_f80c]
signal MUX_uxn_opcodes_h_l930_c32_f80c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l930_c32_f80c_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l930_c32_f80c_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l930_c32_f80c_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l932_c11_900f]
signal BIN_OP_EQ_uxn_opcodes_h_l932_c11_900f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l932_c11_900f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l932_c11_900f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l932_c7_5198]
signal result_stack_value_MUX_uxn_opcodes_h_l932_c7_5198_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l932_c7_5198_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l932_c7_5198_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l932_c7_5198_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l932_c7_5198]
signal result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_5198_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_5198_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_5198_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_5198_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l932_c7_5198]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_5198_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_5198_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_5198_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_5198_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l932_c7_5198]
signal result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_5198_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_5198_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_5198_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_5198_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l932_c7_5198]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_5198_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_5198_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_5198_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_5198_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l936_c24_a0c2]
signal BIN_OP_EQ_uxn_opcodes_h_l936_c24_a0c2_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l936_c24_a0c2_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l936_c24_a0c2_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l936_c24_2f39]
signal MUX_uxn_opcodes_h_l936_c24_2f39_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l936_c24_2f39_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l936_c24_2f39_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l936_c24_2f39_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l938_c11_9e58]
signal BIN_OP_EQ_uxn_opcodes_h_l938_c11_9e58_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l938_c11_9e58_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l938_c11_9e58_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l938_c7_500d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_500d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_500d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_500d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_500d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l938_c7_500d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_500d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_500d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_500d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_500d_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l905_c6_5fe4
BIN_OP_EQ_uxn_opcodes_h_l905_c6_5fe4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l905_c6_5fe4_left,
BIN_OP_EQ_uxn_opcodes_h_l905_c6_5fe4_right,
BIN_OP_EQ_uxn_opcodes_h_l905_c6_5fe4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_7eb3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_7eb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_7eb3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_7eb3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_7eb3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_7eb3_return_output);

-- t8_MUX_uxn_opcodes_h_l905_c2_b38a
t8_MUX_uxn_opcodes_h_l905_c2_b38a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l905_c2_b38a_cond,
t8_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue,
t8_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse,
t8_MUX_uxn_opcodes_h_l905_c2_b38a_return_output);

-- n8_MUX_uxn_opcodes_h_l905_c2_b38a
n8_MUX_uxn_opcodes_h_l905_c2_b38a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l905_c2_b38a_cond,
n8_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue,
n8_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse,
n8_MUX_uxn_opcodes_h_l905_c2_b38a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l905_c2_b38a
result_stack_value_MUX_uxn_opcodes_h_l905_c2_b38a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l905_c2_b38a_cond,
result_stack_value_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l905_c2_b38a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_b38a
result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_b38a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_b38a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_b38a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_b38a
result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_b38a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_b38a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_b38a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_b38a
result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_b38a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_b38a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_b38a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_b38a
result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_b38a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_b38a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_b38a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_b38a
result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_b38a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_b38a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_b38a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_b38a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_b38a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_b38a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_b38a_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_b38a
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_b38a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_b38a_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_b38a_return_output);

-- printf_uxn_opcodes_h_l906_c3_847d_uxn_opcodes_h_l906_c3_847d
printf_uxn_opcodes_h_l906_c3_847d_uxn_opcodes_h_l906_c3_847d : entity work.printf_uxn_opcodes_h_l906_c3_847d_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l906_c3_847d_uxn_opcodes_h_l906_c3_847d_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l913_c11_ac7f
BIN_OP_EQ_uxn_opcodes_h_l913_c11_ac7f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l913_c11_ac7f_left,
BIN_OP_EQ_uxn_opcodes_h_l913_c11_ac7f_right,
BIN_OP_EQ_uxn_opcodes_h_l913_c11_ac7f_return_output);

-- t8_MUX_uxn_opcodes_h_l913_c7_9f9f
t8_MUX_uxn_opcodes_h_l913_c7_9f9f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l913_c7_9f9f_cond,
t8_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue,
t8_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse,
t8_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output);

-- n8_MUX_uxn_opcodes_h_l913_c7_9f9f
n8_MUX_uxn_opcodes_h_l913_c7_9f9f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l913_c7_9f9f_cond,
n8_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue,
n8_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse,
n8_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l913_c7_9f9f
result_stack_value_MUX_uxn_opcodes_h_l913_c7_9f9f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l913_c7_9f9f_cond,
result_stack_value_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_9f9f
result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_9f9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_9f9f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_9f9f
result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_9f9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_9f9f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_9f9f
result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_9f9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_9f9f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_9f9f
result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_9f9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_9f9f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_9f9f
result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_9f9f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_9f9f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_9f9f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_9f9f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_9f9f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l917_c11_df79
BIN_OP_EQ_uxn_opcodes_h_l917_c11_df79 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l917_c11_df79_left,
BIN_OP_EQ_uxn_opcodes_h_l917_c11_df79_right,
BIN_OP_EQ_uxn_opcodes_h_l917_c11_df79_return_output);

-- t8_MUX_uxn_opcodes_h_l917_c7_c2f0
t8_MUX_uxn_opcodes_h_l917_c7_c2f0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l917_c7_c2f0_cond,
t8_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue,
t8_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse,
t8_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output);

-- n8_MUX_uxn_opcodes_h_l917_c7_c2f0
n8_MUX_uxn_opcodes_h_l917_c7_c2f0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l917_c7_c2f0_cond,
n8_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue,
n8_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse,
n8_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l917_c7_c2f0
result_stack_value_MUX_uxn_opcodes_h_l917_c7_c2f0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l917_c7_c2f0_cond,
result_stack_value_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_c2f0
result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_c2f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_c2f0_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_c2f0
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_c2f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_c2f0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_c2f0
result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_c2f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_c2f0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_c2f0
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_c2f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_c2f0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_c2f0
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_c2f0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_c2f0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_c2f0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_c2f0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_c2f0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l922_c11_9040
BIN_OP_EQ_uxn_opcodes_h_l922_c11_9040 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l922_c11_9040_left,
BIN_OP_EQ_uxn_opcodes_h_l922_c11_9040_right,
BIN_OP_EQ_uxn_opcodes_h_l922_c11_9040_return_output);

-- n8_MUX_uxn_opcodes_h_l922_c7_7eae
n8_MUX_uxn_opcodes_h_l922_c7_7eae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l922_c7_7eae_cond,
n8_MUX_uxn_opcodes_h_l922_c7_7eae_iftrue,
n8_MUX_uxn_opcodes_h_l922_c7_7eae_iffalse,
n8_MUX_uxn_opcodes_h_l922_c7_7eae_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l922_c7_7eae
result_stack_value_MUX_uxn_opcodes_h_l922_c7_7eae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l922_c7_7eae_cond,
result_stack_value_MUX_uxn_opcodes_h_l922_c7_7eae_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l922_c7_7eae_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l922_c7_7eae_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_7eae
result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_7eae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_7eae_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_7eae_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_7eae_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_7eae_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_7eae
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_7eae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_7eae_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_7eae_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_7eae_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_7eae_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_7eae
result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_7eae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_7eae_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_7eae_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_7eae_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_7eae_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_7eae
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_7eae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_7eae_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_7eae_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_7eae_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_7eae_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_7eae
result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_7eae : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_7eae_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_7eae_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_7eae_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_7eae_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_7eae
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_7eae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_7eae_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_7eae_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_7eae_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_7eae_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l926_c11_cf11
BIN_OP_EQ_uxn_opcodes_h_l926_c11_cf11 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l926_c11_cf11_left,
BIN_OP_EQ_uxn_opcodes_h_l926_c11_cf11_right,
BIN_OP_EQ_uxn_opcodes_h_l926_c11_cf11_return_output);

-- n8_MUX_uxn_opcodes_h_l926_c7_fa38
n8_MUX_uxn_opcodes_h_l926_c7_fa38 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l926_c7_fa38_cond,
n8_MUX_uxn_opcodes_h_l926_c7_fa38_iftrue,
n8_MUX_uxn_opcodes_h_l926_c7_fa38_iffalse,
n8_MUX_uxn_opcodes_h_l926_c7_fa38_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l926_c7_fa38
result_stack_value_MUX_uxn_opcodes_h_l926_c7_fa38 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l926_c7_fa38_cond,
result_stack_value_MUX_uxn_opcodes_h_l926_c7_fa38_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l926_c7_fa38_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l926_c7_fa38_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_fa38
result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_fa38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_fa38_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_fa38_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_fa38_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_fa38_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_fa38
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_fa38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_fa38_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_fa38_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_fa38_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_fa38_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_fa38
result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_fa38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_fa38_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_fa38_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_fa38_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_fa38_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_fa38
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_fa38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_fa38_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_fa38_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_fa38_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_fa38_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_fa38
result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_fa38 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_fa38_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_fa38_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_fa38_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_fa38_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_fa38
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_fa38 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_fa38_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_fa38_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_fa38_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_fa38_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l930_c32_063d
BIN_OP_AND_uxn_opcodes_h_l930_c32_063d : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l930_c32_063d_left,
BIN_OP_AND_uxn_opcodes_h_l930_c32_063d_right,
BIN_OP_AND_uxn_opcodes_h_l930_c32_063d_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l930_c32_31c8
BIN_OP_GT_uxn_opcodes_h_l930_c32_31c8 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l930_c32_31c8_left,
BIN_OP_GT_uxn_opcodes_h_l930_c32_31c8_right,
BIN_OP_GT_uxn_opcodes_h_l930_c32_31c8_return_output);

-- MUX_uxn_opcodes_h_l930_c32_f80c
MUX_uxn_opcodes_h_l930_c32_f80c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l930_c32_f80c_cond,
MUX_uxn_opcodes_h_l930_c32_f80c_iftrue,
MUX_uxn_opcodes_h_l930_c32_f80c_iffalse,
MUX_uxn_opcodes_h_l930_c32_f80c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l932_c11_900f
BIN_OP_EQ_uxn_opcodes_h_l932_c11_900f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l932_c11_900f_left,
BIN_OP_EQ_uxn_opcodes_h_l932_c11_900f_right,
BIN_OP_EQ_uxn_opcodes_h_l932_c11_900f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l932_c7_5198
result_stack_value_MUX_uxn_opcodes_h_l932_c7_5198 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l932_c7_5198_cond,
result_stack_value_MUX_uxn_opcodes_h_l932_c7_5198_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l932_c7_5198_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l932_c7_5198_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_5198
result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_5198 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_5198_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_5198_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_5198_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_5198_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_5198
result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_5198 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_5198_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_5198_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_5198_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_5198_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_5198
result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_5198 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_5198_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_5198_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_5198_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_5198_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_5198
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_5198 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_5198_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_5198_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_5198_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_5198_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l936_c24_a0c2
BIN_OP_EQ_uxn_opcodes_h_l936_c24_a0c2 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l936_c24_a0c2_left,
BIN_OP_EQ_uxn_opcodes_h_l936_c24_a0c2_right,
BIN_OP_EQ_uxn_opcodes_h_l936_c24_a0c2_return_output);

-- MUX_uxn_opcodes_h_l936_c24_2f39
MUX_uxn_opcodes_h_l936_c24_2f39 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l936_c24_2f39_cond,
MUX_uxn_opcodes_h_l936_c24_2f39_iftrue,
MUX_uxn_opcodes_h_l936_c24_2f39_iffalse,
MUX_uxn_opcodes_h_l936_c24_2f39_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l938_c11_9e58
BIN_OP_EQ_uxn_opcodes_h_l938_c11_9e58 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l938_c11_9e58_left,
BIN_OP_EQ_uxn_opcodes_h_l938_c11_9e58_right,
BIN_OP_EQ_uxn_opcodes_h_l938_c11_9e58_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_500d
result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_500d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_500d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_500d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_500d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_500d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_500d
result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_500d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_500d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_500d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_500d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_500d_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l905_c6_5fe4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_7eb3_return_output,
 t8_MUX_uxn_opcodes_h_l905_c2_b38a_return_output,
 n8_MUX_uxn_opcodes_h_l905_c2_b38a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l905_c2_b38a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_b38a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_b38a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_b38a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_b38a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_b38a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_b38a_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_b38a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l913_c11_ac7f_return_output,
 t8_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output,
 n8_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l917_c11_df79_return_output,
 t8_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output,
 n8_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l922_c11_9040_return_output,
 n8_MUX_uxn_opcodes_h_l922_c7_7eae_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l922_c7_7eae_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_7eae_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_7eae_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_7eae_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_7eae_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_7eae_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_7eae_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l926_c11_cf11_return_output,
 n8_MUX_uxn_opcodes_h_l926_c7_fa38_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l926_c7_fa38_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_fa38_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_fa38_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_fa38_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_fa38_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_fa38_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_fa38_return_output,
 BIN_OP_AND_uxn_opcodes_h_l930_c32_063d_return_output,
 BIN_OP_GT_uxn_opcodes_h_l930_c32_31c8_return_output,
 MUX_uxn_opcodes_h_l930_c32_f80c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l932_c11_900f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l932_c7_5198_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_5198_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_5198_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_5198_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_5198_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l936_c24_a0c2_return_output,
 MUX_uxn_opcodes_h_l936_c24_2f39_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l938_c11_9e58_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_500d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_500d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_5fe4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_5fe4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_5fe4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_7eb3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_7eb3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_7eb3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_7eb3_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l905_c2_b38a_return_output : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l905_c2_b38a_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l905_c2_b38a_return_output : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l905_c2_b38a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l905_c2_b38a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l905_c2_b38a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_b38a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_b38a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_b38a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_b38a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_b38a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_b38a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_b38a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_b38a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_b38a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_b38a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l909_c3_453f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_b38a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_b38a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l905_c2_b38a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_b38a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_b38a_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l906_c3_847d_uxn_opcodes_h_l906_c3_847d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_ac7f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_ac7f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_ac7f_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l913_c7_9f9f_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l913_c7_9f9f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l913_c7_9f9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_9f9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_9f9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_9f9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_9f9f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_9f9f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l915_c3_3a10 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_9f9f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_df79_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_df79_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_df79_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue : unsigned(15 downto 0);
 variable VAR_t8_uxn_opcodes_h_l918_c3_54d5 : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l917_c7_c2f0_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l922_c7_7eae_return_output : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l917_c7_c2f0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_7eae_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l917_c7_c2f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_7eae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_c2f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_7eae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_c2f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_7eae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_c2f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_7eae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_c2f0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_7eae_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_c2f0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l920_c3_d31b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_7eae_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_c2f0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_9040_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_9040_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_9040_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l922_c7_7eae_iftrue : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l922_c7_7eae_iffalse : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l926_c7_fa38_return_output : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l922_c7_7eae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_7eae_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_7eae_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_fa38_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_7eae_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_7eae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_7eae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_fa38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_7eae_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_7eae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_7eae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_fa38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_7eae_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_7eae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_7eae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_fa38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_7eae_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_7eae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_7eae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_fa38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_7eae_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_7eae_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_7eae_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_fa38_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_7eae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_7eae_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l924_c3_6a89 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_7eae_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_fa38_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_7eae_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_cf11_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_cf11_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_cf11_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l926_c7_fa38_iftrue : unsigned(15 downto 0);
 variable VAR_n8_uxn_opcodes_h_l927_c3_2c84 : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l926_c7_fa38_iffalse : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l926_c7_fa38_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_fa38_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_fa38_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l932_c7_5198_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_fa38_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_fa38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_fa38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l926_c7_fa38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_fa38_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_fa38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_fa38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_5198_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_fa38_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_fa38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_fa38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_5198_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_fa38_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_fa38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_fa38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_5198_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_fa38_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_fa38_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_fa38_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_fa38_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_fa38_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_fa38_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_5198_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_fa38_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l930_c32_f80c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l930_c32_f80c_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l930_c32_f80c_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l930_c32_063d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l930_c32_063d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l930_c32_063d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l930_c32_31c8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l930_c32_31c8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l930_c32_31c8_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l930_c32_f80c_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_900f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_900f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_900f_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l932_c7_5198_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l932_c7_5198_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l932_c7_5198_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_5198_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_5198_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_500d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_5198_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_5198_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_5198_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_5198_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_5198_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_5198_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_500d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_5198_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_5198_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l935_c3_4a32 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_5198_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_5198_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l936_c24_2f39_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l936_c24_2f39_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l936_c24_2f39_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c24_a0c2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c24_a0c2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c24_a0c2_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l936_c24_2f39_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c11_9e58_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c11_9e58_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c11_9e58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_500d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_500d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_500d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_500d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_500d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_500d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l905_l922_l917_l926_l913_l932_DUPLICATE_5a91_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l905_l922_l917_l913_l932_DUPLICATE_c96f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l905_l922_l917_l926_l913_DUPLICATE_c266_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l922_l917_l926_l913_l938_DUPLICATE_9c60_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l922_l917_l926_l913_l938_l932_DUPLICATE_6f57_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l926_l932_DUPLICATE_9d15_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l901_l943_DUPLICATE_4052_return_output : opcode_result_t;
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
     VAR_MUX_uxn_opcodes_h_l930_c32_f80c_iffalse := resize(to_signed(-1, 2), 8);
     VAR_MUX_uxn_opcodes_h_l936_c24_2f39_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_ac7f_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_7eb3_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_5198_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l924_c3_6a89 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_7eae_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l924_c3_6a89;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l909_c3_453f := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l909_c3_453f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_5fe4_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_df79_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_500d_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_fa38_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l930_c32_31c8_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l936_c24_2f39_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_500d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_900f_right := to_unsigned(5, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l930_c32_063d_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l920_c3_d31b := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l920_c3_d31b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l915_c3_3a10 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l915_c3_3a10;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c11_9e58_right := to_unsigned(6, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_fa38_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l935_c3_4a32 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_5198_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l935_c3_4a32;
     VAR_MUX_uxn_opcodes_h_l930_c32_f80c_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_5198_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_cf11_right := to_unsigned(4, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_7eae_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_9040_right := to_unsigned(3, 2);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_7eb3_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l930_c32_063d_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c24_a0c2_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l922_c7_7eae_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l926_c7_fa38_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_5fe4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_ac7f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_df79_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_9040_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_cf11_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_900f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c11_9e58_left := VAR_phase;
     VAR_n8_uxn_opcodes_h_l927_c3_2c84 := resize(VAR_previous_stack_read, 16);
     VAR_t8_uxn_opcodes_h_l918_c3_54d5 := resize(VAR_previous_stack_read, 16);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c24_a0c2_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse := t8;
     VAR_n8_MUX_uxn_opcodes_h_l926_c7_fa38_iftrue := VAR_n8_uxn_opcodes_h_l927_c3_2c84;
     VAR_t8_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue := VAR_t8_uxn_opcodes_h_l918_c3_54d5;
     -- BIN_OP_EQ[uxn_opcodes_h_l905_c6_5fe4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l905_c6_5fe4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_5fe4_left;
     BIN_OP_EQ_uxn_opcodes_h_l905_c6_5fe4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_5fe4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_5fe4_return_output := BIN_OP_EQ_uxn_opcodes_h_l905_c6_5fe4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l922_c11_9040] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l922_c11_9040_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_9040_left;
     BIN_OP_EQ_uxn_opcodes_h_l922_c11_9040_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_9040_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_9040_return_output := BIN_OP_EQ_uxn_opcodes_h_l922_c11_9040_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l926_c11_cf11] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l926_c11_cf11_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_cf11_left;
     BIN_OP_EQ_uxn_opcodes_h_l926_c11_cf11_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_cf11_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_cf11_return_output := BIN_OP_EQ_uxn_opcodes_h_l926_c11_cf11_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l922_l917_l926_l913_l938_DUPLICATE_9c60 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l922_l917_l926_l913_l938_DUPLICATE_9c60_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l905_l922_l917_l913_l932_DUPLICATE_c96f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l905_l922_l917_l913_l932_DUPLICATE_c96f_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l932_c11_900f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l932_c11_900f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_900f_left;
     BIN_OP_EQ_uxn_opcodes_h_l932_c11_900f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_900f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_900f_return_output := BIN_OP_EQ_uxn_opcodes_h_l932_c11_900f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l922_l917_l926_l913_l938_l932_DUPLICATE_6f57 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l922_l917_l926_l913_l938_l932_DUPLICATE_6f57_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l936_c24_a0c2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l936_c24_a0c2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c24_a0c2_left;
     BIN_OP_EQ_uxn_opcodes_h_l936_c24_a0c2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c24_a0c2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c24_a0c2_return_output := BIN_OP_EQ_uxn_opcodes_h_l936_c24_a0c2_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l905_c2_b38a] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l905_c2_b38a_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l913_c11_ac7f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l913_c11_ac7f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_ac7f_left;
     BIN_OP_EQ_uxn_opcodes_h_l913_c11_ac7f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_ac7f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_ac7f_return_output := BIN_OP_EQ_uxn_opcodes_h_l913_c11_ac7f_return_output;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l926_c7_fa38] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l926_c7_fa38_return_output := result.is_stack_read;

     -- BIN_OP_AND[uxn_opcodes_h_l930_c32_063d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l930_c32_063d_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l930_c32_063d_left;
     BIN_OP_AND_uxn_opcodes_h_l930_c32_063d_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l930_c32_063d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l930_c32_063d_return_output := BIN_OP_AND_uxn_opcodes_h_l930_c32_063d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l938_c11_9e58] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l938_c11_9e58_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c11_9e58_left;
     BIN_OP_EQ_uxn_opcodes_h_l938_c11_9e58_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c11_9e58_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c11_9e58_return_output := BIN_OP_EQ_uxn_opcodes_h_l938_c11_9e58_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l926_l932_DUPLICATE_9d15 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l926_l932_DUPLICATE_9d15_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l905_l922_l917_l926_l913_l932_DUPLICATE_5a91 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l905_l922_l917_l926_l913_l932_DUPLICATE_5a91_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l917_c11_df79] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l917_c11_df79_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_df79_left;
     BIN_OP_EQ_uxn_opcodes_h_l917_c11_df79_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_df79_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_df79_return_output := BIN_OP_EQ_uxn_opcodes_h_l917_c11_df79_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l905_l922_l917_l926_l913_DUPLICATE_c266 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l905_l922_l917_l926_l913_DUPLICATE_c266_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l930_c32_31c8_left := VAR_BIN_OP_AND_uxn_opcodes_h_l930_c32_063d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_7eb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_5fe4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l905_c2_b38a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_5fe4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_b38a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_5fe4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_b38a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_5fe4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_b38a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_5fe4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_b38a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_5fe4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_b38a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_5fe4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_b38a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_5fe4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_b38a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_5fe4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l905_c2_b38a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_5fe4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l905_c2_b38a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_5fe4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l913_c7_9f9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_ac7f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_9f9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_ac7f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_9f9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_ac7f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_9f9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_ac7f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_9f9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_ac7f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_9f9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_ac7f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_9f9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_ac7f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l913_c7_9f9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_ac7f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l913_c7_9f9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l913_c11_ac7f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l917_c7_c2f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_df79_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_c2f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_df79_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_c2f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_df79_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_c2f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_df79_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_c2f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_df79_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_c2f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_df79_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_c2f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_df79_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l917_c7_c2f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_df79_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l917_c7_c2f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_df79_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l922_c7_7eae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_9040_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_7eae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_9040_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_7eae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_9040_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_7eae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_9040_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_7eae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_9040_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_7eae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_9040_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_7eae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_9040_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_7eae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_9040_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l926_c7_fa38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_cf11_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_fa38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_cf11_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_fa38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_cf11_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_fa38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_cf11_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_fa38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_cf11_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_fa38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_cf11_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_fa38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_cf11_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_fa38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_cf11_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_5198_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_900f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_5198_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_900f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_5198_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_900f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_5198_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_900f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l932_c7_5198_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_900f_return_output;
     VAR_MUX_uxn_opcodes_h_l936_c24_2f39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c24_a0c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_500d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c11_9e58_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_500d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l938_c11_9e58_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l905_l922_l917_l926_l913_DUPLICATE_c266_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l905_l922_l917_l926_l913_DUPLICATE_c266_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l905_l922_l917_l926_l913_DUPLICATE_c266_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_7eae_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l905_l922_l917_l926_l913_DUPLICATE_c266_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_fa38_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l905_l922_l917_l926_l913_DUPLICATE_c266_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l922_l917_l926_l913_l938_l932_DUPLICATE_6f57_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l922_l917_l926_l913_l938_l932_DUPLICATE_6f57_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_7eae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l922_l917_l926_l913_l938_l932_DUPLICATE_6f57_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_fa38_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l922_l917_l926_l913_l938_l932_DUPLICATE_6f57_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_5198_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l922_l917_l926_l913_l938_l932_DUPLICATE_6f57_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_500d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l922_l917_l926_l913_l938_l932_DUPLICATE_6f57_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l905_l922_l917_l913_l932_DUPLICATE_c96f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l905_l922_l917_l913_l932_DUPLICATE_c96f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l905_l922_l917_l913_l932_DUPLICATE_c96f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_7eae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l905_l922_l917_l913_l932_DUPLICATE_c96f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_5198_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l905_l922_l917_l913_l932_DUPLICATE_c96f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l922_l917_l926_l913_l938_DUPLICATE_9c60_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l922_l917_l926_l913_l938_DUPLICATE_9c60_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_7eae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l922_l917_l926_l913_l938_DUPLICATE_9c60_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_fa38_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l922_l917_l926_l913_l938_DUPLICATE_9c60_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_500d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l922_l917_l926_l913_l938_DUPLICATE_9c60_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_fa38_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l926_l932_DUPLICATE_9d15_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_5198_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l926_l932_DUPLICATE_9d15_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l905_l922_l917_l926_l913_l932_DUPLICATE_5a91_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l905_l922_l917_l926_l913_l932_DUPLICATE_5a91_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l905_l922_l917_l926_l913_l932_DUPLICATE_5a91_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_7eae_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l905_l922_l917_l926_l913_l932_DUPLICATE_5a91_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_fa38_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l905_l922_l917_l926_l913_l932_DUPLICATE_5a91_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l932_c7_5198_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l905_l922_l917_l926_l913_l932_DUPLICATE_5a91_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l905_c2_b38a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_fa38_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l926_c7_fa38_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l905_c2_b38a] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_b38a_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_b38a_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_b38a_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_b38a_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l930_c32_31c8] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l930_c32_31c8_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l930_c32_31c8_left;
     BIN_OP_GT_uxn_opcodes_h_l930_c32_31c8_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l930_c32_31c8_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l930_c32_31c8_return_output := BIN_OP_GT_uxn_opcodes_h_l930_c32_31c8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l932_c7_5198] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_5198_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_5198_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_5198_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_5198_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_5198_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_5198_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_5198_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_5198_return_output;

     -- n8_MUX[uxn_opcodes_h_l926_c7_fa38] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l926_c7_fa38_cond <= VAR_n8_MUX_uxn_opcodes_h_l926_c7_fa38_cond;
     n8_MUX_uxn_opcodes_h_l926_c7_fa38_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l926_c7_fa38_iftrue;
     n8_MUX_uxn_opcodes_h_l926_c7_fa38_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l926_c7_fa38_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l926_c7_fa38_return_output := n8_MUX_uxn_opcodes_h_l926_c7_fa38_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l938_c7_500d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_500d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_500d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_500d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_500d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_500d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_500d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_500d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_500d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l905_c1_7eb3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_7eb3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_7eb3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_7eb3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_7eb3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_7eb3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_7eb3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_7eb3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_7eb3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l938_c7_500d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_500d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_500d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_500d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_500d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_500d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_500d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_500d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_500d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l926_c7_fa38] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_fa38_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_fa38_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_fa38_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_fa38_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_fa38_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_fa38_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_fa38_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_fa38_return_output;

     -- t8_MUX[uxn_opcodes_h_l917_c7_c2f0] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l917_c7_c2f0_cond <= VAR_t8_MUX_uxn_opcodes_h_l917_c7_c2f0_cond;
     t8_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue;
     t8_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output := t8_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output;

     -- MUX[uxn_opcodes_h_l936_c24_2f39] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l936_c24_2f39_cond <= VAR_MUX_uxn_opcodes_h_l936_c24_2f39_cond;
     MUX_uxn_opcodes_h_l936_c24_2f39_iftrue <= VAR_MUX_uxn_opcodes_h_l936_c24_2f39_iftrue;
     MUX_uxn_opcodes_h_l936_c24_2f39_iffalse <= VAR_MUX_uxn_opcodes_h_l936_c24_2f39_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l936_c24_2f39_return_output := MUX_uxn_opcodes_h_l936_c24_2f39_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l932_c7_5198] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_5198_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_5198_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_5198_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_5198_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_5198_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_5198_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_5198_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_5198_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l930_c32_f80c_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l930_c32_31c8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l932_c7_5198_iftrue := VAR_MUX_uxn_opcodes_h_l936_c24_2f39_return_output;
     VAR_printf_uxn_opcodes_h_l906_c3_847d_uxn_opcodes_h_l906_c3_847d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_7eb3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l922_c7_7eae_iffalse := VAR_n8_MUX_uxn_opcodes_h_l926_c7_fa38_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_5198_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l938_c7_500d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_fa38_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l932_c7_5198_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_7eae_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l926_c7_fa38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_5198_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l938_c7_500d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_fa38_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_5198_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse := VAR_t8_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l922_c7_7eae] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_7eae_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_7eae_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_7eae_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_7eae_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_7eae_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_7eae_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_7eae_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_7eae_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l932_c7_5198] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l932_c7_5198_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l932_c7_5198_cond;
     result_stack_value_MUX_uxn_opcodes_h_l932_c7_5198_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l932_c7_5198_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l932_c7_5198_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l932_c7_5198_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l932_c7_5198_return_output := result_stack_value_MUX_uxn_opcodes_h_l932_c7_5198_return_output;

     -- t8_MUX[uxn_opcodes_h_l913_c7_9f9f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l913_c7_9f9f_cond <= VAR_t8_MUX_uxn_opcodes_h_l913_c7_9f9f_cond;
     t8_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue;
     t8_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output := t8_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l932_c7_5198] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_5198_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_5198_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_5198_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_5198_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_5198_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_5198_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_5198_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_5198_return_output;

     -- printf_uxn_opcodes_h_l906_c3_847d[uxn_opcodes_h_l906_c3_847d] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l906_c3_847d_uxn_opcodes_h_l906_c3_847d_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l906_c3_847d_uxn_opcodes_h_l906_c3_847d_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l926_c7_fa38] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_fa38_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_fa38_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_fa38_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_fa38_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_fa38_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_fa38_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_fa38_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_fa38_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l932_c7_5198] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_5198_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_5198_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_5198_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_5198_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_5198_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_5198_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_5198_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_5198_return_output;

     -- n8_MUX[uxn_opcodes_h_l922_c7_7eae] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l922_c7_7eae_cond <= VAR_n8_MUX_uxn_opcodes_h_l922_c7_7eae_cond;
     n8_MUX_uxn_opcodes_h_l922_c7_7eae_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l922_c7_7eae_iftrue;
     n8_MUX_uxn_opcodes_h_l922_c7_7eae_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l922_c7_7eae_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l922_c7_7eae_return_output := n8_MUX_uxn_opcodes_h_l922_c7_7eae_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l926_c7_fa38] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_fa38_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_fa38_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_fa38_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_fa38_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_fa38_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_fa38_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_fa38_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_fa38_return_output;

     -- MUX[uxn_opcodes_h_l930_c32_f80c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l930_c32_f80c_cond <= VAR_MUX_uxn_opcodes_h_l930_c32_f80c_cond;
     MUX_uxn_opcodes_h_l930_c32_f80c_iftrue <= VAR_MUX_uxn_opcodes_h_l930_c32_f80c_iftrue;
     MUX_uxn_opcodes_h_l930_c32_f80c_iffalse <= VAR_MUX_uxn_opcodes_h_l930_c32_f80c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l930_c32_f80c_return_output := MUX_uxn_opcodes_h_l930_c32_f80c_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_fa38_iftrue := VAR_MUX_uxn_opcodes_h_l930_c32_f80c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse := VAR_n8_MUX_uxn_opcodes_h_l922_c7_7eae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_fa38_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_5198_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_7eae_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_fa38_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l922_c7_7eae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_fa38_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_5198_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_7eae_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_fa38_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_fa38_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l932_c7_5198_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse := VAR_t8_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l922_c7_7eae] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_7eae_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_7eae_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_7eae_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_7eae_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_7eae_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_7eae_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_7eae_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_7eae_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l926_c7_fa38] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_fa38_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_fa38_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_fa38_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_fa38_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_fa38_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_fa38_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_fa38_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_fa38_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l917_c7_c2f0] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_c2f0_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_c2f0_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output;

     -- t8_MUX[uxn_opcodes_h_l905_c2_b38a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l905_c2_b38a_cond <= VAR_t8_MUX_uxn_opcodes_h_l905_c2_b38a_cond;
     t8_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue;
     t8_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l905_c2_b38a_return_output := t8_MUX_uxn_opcodes_h_l905_c2_b38a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l922_c7_7eae] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_7eae_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_7eae_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_7eae_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_7eae_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_7eae_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_7eae_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_7eae_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_7eae_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l926_c7_fa38] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l926_c7_fa38_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_fa38_cond;
     result_stack_value_MUX_uxn_opcodes_h_l926_c7_fa38_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_fa38_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l926_c7_fa38_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_fa38_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_fa38_return_output := result_stack_value_MUX_uxn_opcodes_h_l926_c7_fa38_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l926_c7_fa38] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_fa38_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_fa38_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_fa38_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_fa38_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_fa38_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_fa38_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_fa38_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_fa38_return_output;

     -- n8_MUX[uxn_opcodes_h_l917_c7_c2f0] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l917_c7_c2f0_cond <= VAR_n8_MUX_uxn_opcodes_h_l917_c7_c2f0_cond;
     n8_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue;
     n8_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output := n8_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l926_c7_fa38] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_fa38_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_fa38_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_fa38_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_fa38_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_fa38_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_fa38_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_fa38_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_fa38_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse := VAR_n8_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_7eae_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_fa38_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_7eae_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_7eae_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_fa38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_7eae_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_fa38_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_7eae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_7eae_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l926_c7_fa38_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l905_c2_b38a_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l917_c7_c2f0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_c2f0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_c2f0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l922_c7_7eae] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_7eae_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_7eae_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_7eae_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_7eae_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_7eae_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_7eae_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_7eae_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_7eae_return_output;

     -- n8_MUX[uxn_opcodes_h_l913_c7_9f9f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l913_c7_9f9f_cond <= VAR_n8_MUX_uxn_opcodes_h_l913_c7_9f9f_cond;
     n8_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue;
     n8_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output := n8_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l922_c7_7eae] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l922_c7_7eae_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_7eae_cond;
     result_stack_value_MUX_uxn_opcodes_h_l922_c7_7eae_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_7eae_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l922_c7_7eae_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_7eae_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_7eae_return_output := result_stack_value_MUX_uxn_opcodes_h_l922_c7_7eae_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l917_c7_c2f0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_c2f0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_c2f0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l913_c7_9f9f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_9f9f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_9f9f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l922_c7_7eae] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_7eae_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_7eae_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_7eae_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_7eae_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_7eae_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_7eae_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_7eae_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_7eae_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l922_c7_7eae] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_7eae_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_7eae_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_7eae_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_7eae_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_7eae_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_7eae_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_7eae_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_7eae_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse := VAR_n8_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_7eae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_7eae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_7eae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l922_c7_7eae_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l905_c2_b38a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_b38a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_b38a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_b38a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_b38a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l917_c7_c2f0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_c2f0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_c2f0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output;

     -- n8_MUX[uxn_opcodes_h_l905_c2_b38a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l905_c2_b38a_cond <= VAR_n8_MUX_uxn_opcodes_h_l905_c2_b38a_cond;
     n8_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue;
     n8_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l905_c2_b38a_return_output := n8_MUX_uxn_opcodes_h_l905_c2_b38a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l917_c7_c2f0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_c2f0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_c2f0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l913_c7_9f9f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_9f9f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_9f9f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l917_c7_c2f0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_c2f0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_c2f0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l913_c7_9f9f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_9f9f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_9f9f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l917_c7_c2f0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l917_c7_c2f0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l917_c7_c2f0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l917_c7_c2f0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l917_c7_c2f0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output := result_stack_value_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l905_c2_b38a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l917_c7_c2f0_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l913_c7_9f9f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_9f9f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_9f9f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l905_c2_b38a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_b38a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_b38a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_b38a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_b38a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l913_c7_9f9f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l913_c7_9f9f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l913_c7_9f9f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output := result_stack_value_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l905_c2_b38a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_b38a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_b38a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_b38a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_b38a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l913_c7_9f9f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_9f9f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_9f9f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l913_c7_9f9f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_9f9f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_9f9f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_9f9f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_9f9f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l913_c7_9f9f_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l905_c2_b38a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l905_c2_b38a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l905_c2_b38a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l905_c2_b38a_return_output := result_stack_value_MUX_uxn_opcodes_h_l905_c2_b38a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l905_c2_b38a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_b38a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_b38a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_b38a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_b38a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l905_c2_b38a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_b38a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_b38a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_b38a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_b38a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l905_c2_b38a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_b38a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_b38a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_b38a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_b38a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_b38a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_b38a_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l901_l943_DUPLICATE_4052 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l901_l943_DUPLICATE_4052_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_81ab(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l905_c2_b38a_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_b38a_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_b38a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_b38a_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_b38a_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_b38a_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_b38a_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l905_c2_b38a_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l901_l943_DUPLICATE_4052_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l901_l943_DUPLICATE_4052_return_output;
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
