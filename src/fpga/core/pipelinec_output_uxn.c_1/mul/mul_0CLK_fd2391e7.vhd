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
-- Submodules: 64
entity mul_0CLK_fd2391e7 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end mul_0CLK_fd2391e7;
architecture arch of mul_0CLK_fd2391e7 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1668_c6_5793]
signal BIN_OP_EQ_uxn_opcodes_h_l1668_c6_5793_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1668_c6_5793_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1668_c6_5793_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1668_c1_d41e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1668_c1_d41e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1668_c1_d41e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1668_c1_d41e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1668_c1_d41e_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1668_c2_4cc9]
signal t8_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1668_c2_4cc9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1668_c2_4cc9]
signal result_stack_value_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1668_c2_4cc9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1668_c2_4cc9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1668_c2_4cc9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1668_c2_4cc9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1668_c2_4cc9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1668_c2_4cc9]
signal n8_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1669_c3_c83c[uxn_opcodes_h_l1669_c3_c83c]
signal printf_uxn_opcodes_h_l1669_c3_c83c_uxn_opcodes_h_l1669_c3_c83c_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1674_c11_de24]
signal BIN_OP_EQ_uxn_opcodes_h_l1674_c11_de24_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1674_c11_de24_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1674_c11_de24_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1674_c7_50fb]
signal t8_MUX_uxn_opcodes_h_l1674_c7_50fb_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1674_c7_50fb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1674_c7_50fb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1674_c7_50fb]
signal result_stack_value_MUX_uxn_opcodes_h_l1674_c7_50fb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1674_c7_50fb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_50fb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1674_c7_50fb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_50fb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1674_c7_50fb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_50fb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1674_c7_50fb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_50fb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1674_c7_50fb]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1674_c7_50fb_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1674_c7_50fb]
signal n8_MUX_uxn_opcodes_h_l1674_c7_50fb_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1677_c11_df5d]
signal BIN_OP_EQ_uxn_opcodes_h_l1677_c11_df5d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1677_c11_df5d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1677_c11_df5d_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1677_c7_a4f4]
signal t8_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1677_c7_a4f4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1677_c7_a4f4]
signal result_stack_value_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1677_c7_a4f4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1677_c7_a4f4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1677_c7_a4f4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1677_c7_a4f4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1677_c7_a4f4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1677_c7_a4f4]
signal n8_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1681_c11_5f01]
signal BIN_OP_EQ_uxn_opcodes_h_l1681_c11_5f01_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1681_c11_5f01_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1681_c11_5f01_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1681_c7_bb2e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1681_c7_bb2e]
signal result_stack_value_MUX_uxn_opcodes_h_l1681_c7_bb2e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1681_c7_bb2e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1681_c7_bb2e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1681_c7_bb2e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1681_c7_bb2e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1681_c7_bb2e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1681_c7_bb2e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1681_c7_bb2e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1681_c7_bb2e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_bb2e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_bb2e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_bb2e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1681_c7_bb2e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_bb2e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_bb2e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_bb2e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1681_c7_bb2e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1681_c7_bb2e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1681_c7_bb2e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1681_c7_bb2e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1681_c7_bb2e]
signal n8_MUX_uxn_opcodes_h_l1681_c7_bb2e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1681_c7_bb2e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1681_c7_bb2e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1684_c11_e9c7]
signal BIN_OP_EQ_uxn_opcodes_h_l1684_c11_e9c7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1684_c11_e9c7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1684_c11_e9c7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1684_c7_62d6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_62d6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_62d6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_62d6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1684_c7_62d6]
signal result_stack_value_MUX_uxn_opcodes_h_l1684_c7_62d6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1684_c7_62d6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1684_c7_62d6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1684_c7_62d6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_62d6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_62d6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_62d6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1684_c7_62d6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1684_c7_62d6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1684_c7_62d6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1684_c7_62d6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1684_c7_62d6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_62d6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_62d6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_62d6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1684_c7_62d6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_62d6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_62d6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_62d6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1684_c7_62d6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1684_c7_62d6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1684_c7_62d6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1684_c7_62d6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1684_c7_62d6]
signal n8_MUX_uxn_opcodes_h_l1684_c7_62d6_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1684_c7_62d6_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1684_c7_62d6_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1688_c32_10de]
signal BIN_OP_AND_uxn_opcodes_h_l1688_c32_10de_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1688_c32_10de_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1688_c32_10de_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1688_c32_25e6]
signal BIN_OP_GT_uxn_opcodes_h_l1688_c32_25e6_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1688_c32_25e6_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1688_c32_25e6_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1688_c32_4cac]
signal MUX_uxn_opcodes_h_l1688_c32_4cac_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1688_c32_4cac_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1688_c32_4cac_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1688_c32_4cac_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1690_c11_10bc]
signal BIN_OP_EQ_uxn_opcodes_h_l1690_c11_10bc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1690_c11_10bc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1690_c11_10bc_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1690_c7_fe45]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_fe45_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_fe45_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_fe45_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_fe45_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1690_c7_fe45]
signal result_stack_value_MUX_uxn_opcodes_h_l1690_c7_fe45_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1690_c7_fe45_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1690_c7_fe45_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1690_c7_fe45_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1690_c7_fe45]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_fe45_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_fe45_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_fe45_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_fe45_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1690_c7_fe45]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_fe45_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_fe45_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_fe45_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_fe45_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1690_c7_fe45]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_fe45_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_fe45_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_fe45_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_fe45_return_output : unsigned(7 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l1694_c24_6a14]
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1694_c24_6a14_left : unsigned(7 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1694_c24_6a14_right : unsigned(7 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1694_c24_6a14_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1696_c11_9f01]
signal BIN_OP_EQ_uxn_opcodes_h_l1696_c11_9f01_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1696_c11_9f01_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1696_c11_9f01_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1696_c7_5e88]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_5e88_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_5e88_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_5e88_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_5e88_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1696_c7_5e88]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_5e88_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_5e88_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_5e88_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_5e88_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_e56b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_stack_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1668_c6_5793
BIN_OP_EQ_uxn_opcodes_h_l1668_c6_5793 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1668_c6_5793_left,
BIN_OP_EQ_uxn_opcodes_h_l1668_c6_5793_right,
BIN_OP_EQ_uxn_opcodes_h_l1668_c6_5793_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1668_c1_d41e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1668_c1_d41e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1668_c1_d41e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1668_c1_d41e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1668_c1_d41e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1668_c1_d41e_return_output);

-- t8_MUX_uxn_opcodes_h_l1668_c2_4cc9
t8_MUX_uxn_opcodes_h_l1668_c2_4cc9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond,
t8_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue,
t8_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse,
t8_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9
result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1668_c2_4cc9
result_stack_value_MUX_uxn_opcodes_h_l1668_c2_4cc9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond,
result_stack_value_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1668_c2_4cc9
result_is_stack_write_MUX_uxn_opcodes_h_l1668_c2_4cc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1668_c2_4cc9
result_is_opc_done_MUX_uxn_opcodes_h_l1668_c2_4cc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c2_4cc9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c2_4cc9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1668_c2_4cc9
result_is_stack_read_MUX_uxn_opcodes_h_l1668_c2_4cc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output);

-- n8_MUX_uxn_opcodes_h_l1668_c2_4cc9
n8_MUX_uxn_opcodes_h_l1668_c2_4cc9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond,
n8_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue,
n8_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse,
n8_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output);

-- printf_uxn_opcodes_h_l1669_c3_c83c_uxn_opcodes_h_l1669_c3_c83c
printf_uxn_opcodes_h_l1669_c3_c83c_uxn_opcodes_h_l1669_c3_c83c : entity work.printf_uxn_opcodes_h_l1669_c3_c83c_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1669_c3_c83c_uxn_opcodes_h_l1669_c3_c83c_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1674_c11_de24
BIN_OP_EQ_uxn_opcodes_h_l1674_c11_de24 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1674_c11_de24_left,
BIN_OP_EQ_uxn_opcodes_h_l1674_c11_de24_right,
BIN_OP_EQ_uxn_opcodes_h_l1674_c11_de24_return_output);

-- t8_MUX_uxn_opcodes_h_l1674_c7_50fb
t8_MUX_uxn_opcodes_h_l1674_c7_50fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1674_c7_50fb_cond,
t8_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue,
t8_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse,
t8_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1674_c7_50fb
result_is_sp_shift_MUX_uxn_opcodes_h_l1674_c7_50fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1674_c7_50fb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1674_c7_50fb
result_stack_value_MUX_uxn_opcodes_h_l1674_c7_50fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1674_c7_50fb_cond,
result_stack_value_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_50fb
result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_50fb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_50fb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_50fb
result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_50fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_50fb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_50fb
result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_50fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_50fb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_50fb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_50fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_50fb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1674_c7_50fb
result_is_stack_read_MUX_uxn_opcodes_h_l1674_c7_50fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1674_c7_50fb_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output);

-- n8_MUX_uxn_opcodes_h_l1674_c7_50fb
n8_MUX_uxn_opcodes_h_l1674_c7_50fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1674_c7_50fb_cond,
n8_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue,
n8_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse,
n8_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1677_c11_df5d
BIN_OP_EQ_uxn_opcodes_h_l1677_c11_df5d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1677_c11_df5d_left,
BIN_OP_EQ_uxn_opcodes_h_l1677_c11_df5d_right,
BIN_OP_EQ_uxn_opcodes_h_l1677_c11_df5d_return_output);

-- t8_MUX_uxn_opcodes_h_l1677_c7_a4f4
t8_MUX_uxn_opcodes_h_l1677_c7_a4f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond,
t8_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue,
t8_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse,
t8_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4
result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1677_c7_a4f4
result_stack_value_MUX_uxn_opcodes_h_l1677_c7_a4f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond,
result_stack_value_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_a4f4
result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_a4f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a4f4
result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a4f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_a4f4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_a4f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1677_c7_a4f4
result_is_stack_read_MUX_uxn_opcodes_h_l1677_c7_a4f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output);

-- n8_MUX_uxn_opcodes_h_l1677_c7_a4f4
n8_MUX_uxn_opcodes_h_l1677_c7_a4f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond,
n8_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue,
n8_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse,
n8_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1681_c11_5f01
BIN_OP_EQ_uxn_opcodes_h_l1681_c11_5f01 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1681_c11_5f01_left,
BIN_OP_EQ_uxn_opcodes_h_l1681_c11_5f01_right,
BIN_OP_EQ_uxn_opcodes_h_l1681_c11_5f01_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e
result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1681_c7_bb2e
result_stack_value_MUX_uxn_opcodes_h_l1681_c7_bb2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1681_c7_bb2e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1681_c7_bb2e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1681_c7_bb2e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1681_c7_bb2e
result_is_stack_write_MUX_uxn_opcodes_h_l1681_c7_bb2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1681_c7_bb2e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1681_c7_bb2e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1681_c7_bb2e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_bb2e
result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_bb2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_bb2e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_bb2e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_bb2e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_bb2e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_bb2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_bb2e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_bb2e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_bb2e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1681_c7_bb2e
result_is_stack_read_MUX_uxn_opcodes_h_l1681_c7_bb2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1681_c7_bb2e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1681_c7_bb2e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1681_c7_bb2e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output);

-- n8_MUX_uxn_opcodes_h_l1681_c7_bb2e
n8_MUX_uxn_opcodes_h_l1681_c7_bb2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1681_c7_bb2e_cond,
n8_MUX_uxn_opcodes_h_l1681_c7_bb2e_iftrue,
n8_MUX_uxn_opcodes_h_l1681_c7_bb2e_iffalse,
n8_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1684_c11_e9c7
BIN_OP_EQ_uxn_opcodes_h_l1684_c11_e9c7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1684_c11_e9c7_left,
BIN_OP_EQ_uxn_opcodes_h_l1684_c11_e9c7_right,
BIN_OP_EQ_uxn_opcodes_h_l1684_c11_e9c7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_62d6
result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_62d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_62d6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_62d6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_62d6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1684_c7_62d6
result_stack_value_MUX_uxn_opcodes_h_l1684_c7_62d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1684_c7_62d6_cond,
result_stack_value_MUX_uxn_opcodes_h_l1684_c7_62d6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1684_c7_62d6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_62d6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_62d6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_62d6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_62d6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_62d6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1684_c7_62d6
result_is_stack_write_MUX_uxn_opcodes_h_l1684_c7_62d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1684_c7_62d6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1684_c7_62d6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1684_c7_62d6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_62d6
result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_62d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_62d6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_62d6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_62d6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_62d6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_62d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_62d6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_62d6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_62d6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1684_c7_62d6
result_is_stack_read_MUX_uxn_opcodes_h_l1684_c7_62d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1684_c7_62d6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1684_c7_62d6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1684_c7_62d6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output);

-- n8_MUX_uxn_opcodes_h_l1684_c7_62d6
n8_MUX_uxn_opcodes_h_l1684_c7_62d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1684_c7_62d6_cond,
n8_MUX_uxn_opcodes_h_l1684_c7_62d6_iftrue,
n8_MUX_uxn_opcodes_h_l1684_c7_62d6_iffalse,
n8_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1688_c32_10de
BIN_OP_AND_uxn_opcodes_h_l1688_c32_10de : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1688_c32_10de_left,
BIN_OP_AND_uxn_opcodes_h_l1688_c32_10de_right,
BIN_OP_AND_uxn_opcodes_h_l1688_c32_10de_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1688_c32_25e6
BIN_OP_GT_uxn_opcodes_h_l1688_c32_25e6 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1688_c32_25e6_left,
BIN_OP_GT_uxn_opcodes_h_l1688_c32_25e6_right,
BIN_OP_GT_uxn_opcodes_h_l1688_c32_25e6_return_output);

-- MUX_uxn_opcodes_h_l1688_c32_4cac
MUX_uxn_opcodes_h_l1688_c32_4cac : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1688_c32_4cac_cond,
MUX_uxn_opcodes_h_l1688_c32_4cac_iftrue,
MUX_uxn_opcodes_h_l1688_c32_4cac_iffalse,
MUX_uxn_opcodes_h_l1688_c32_4cac_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1690_c11_10bc
BIN_OP_EQ_uxn_opcodes_h_l1690_c11_10bc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1690_c11_10bc_left,
BIN_OP_EQ_uxn_opcodes_h_l1690_c11_10bc_right,
BIN_OP_EQ_uxn_opcodes_h_l1690_c11_10bc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_fe45
result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_fe45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_fe45_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_fe45_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_fe45_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_fe45_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1690_c7_fe45
result_stack_value_MUX_uxn_opcodes_h_l1690_c7_fe45 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1690_c7_fe45_cond,
result_stack_value_MUX_uxn_opcodes_h_l1690_c7_fe45_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1690_c7_fe45_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1690_c7_fe45_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_fe45
result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_fe45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_fe45_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_fe45_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_fe45_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_fe45_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_fe45
result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_fe45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_fe45_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_fe45_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_fe45_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_fe45_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_fe45
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_fe45 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_fe45_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_fe45_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_fe45_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_fe45_return_output);

-- BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1694_c24_6a14
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1694_c24_6a14 : entity work.BIN_OP_INFERRED_MULT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1694_c24_6a14_left,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1694_c24_6a14_right,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1694_c24_6a14_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1696_c11_9f01
BIN_OP_EQ_uxn_opcodes_h_l1696_c11_9f01 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1696_c11_9f01_left,
BIN_OP_EQ_uxn_opcodes_h_l1696_c11_9f01_right,
BIN_OP_EQ_uxn_opcodes_h_l1696_c11_9f01_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_5e88
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_5e88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_5e88_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_5e88_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_5e88_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_5e88_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_5e88
result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_5e88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_5e88_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_5e88_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_5e88_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_5e88_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1668_c6_5793_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1668_c1_d41e_return_output,
 t8_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output,
 n8_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1674_c11_de24_return_output,
 t8_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output,
 n8_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1677_c11_df5d_return_output,
 t8_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output,
 n8_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1681_c11_5f01_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output,
 n8_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1684_c11_e9c7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output,
 n8_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1688_c32_10de_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1688_c32_25e6_return_output,
 MUX_uxn_opcodes_h_l1688_c32_4cac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1690_c11_10bc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_fe45_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1690_c7_fe45_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_fe45_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_fe45_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_fe45_return_output,
 BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1694_c24_6a14_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1696_c11_9f01_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_5e88_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_5e88_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c6_5793_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c6_5793_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c6_5793_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1668_c1_d41e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1668_c1_d41e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1668_c1_d41e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1668_c1_d41e_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1671_c3_0c8f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1669_c3_c83c_uxn_opcodes_h_l1669_c3_c83c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_de24_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_de24_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_de24_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1674_c7_50fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1674_c7_50fb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1674_c7_50fb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_50fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_50fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_50fb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1675_c3_38c0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_50fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1674_c7_50fb_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1674_c7_50fb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_df5d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_df5d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_df5d_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1679_c3_5da0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1681_c11_5f01_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1681_c11_5f01_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1681_c11_5f01_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1681_c7_bb2e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1681_c7_bb2e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1681_c7_bb2e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1681_c7_bb2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1681_c7_bb2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1681_c7_bb2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_bb2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_bb2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_bb2e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_bb2e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1682_c3_048f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_bb2e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_bb2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1681_c7_bb2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1681_c7_bb2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1681_c7_bb2e_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1681_c7_bb2e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1681_c7_bb2e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1681_c7_bb2e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1684_c11_e9c7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1684_c11_e9c7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1684_c11_e9c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_62d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_62d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_fe45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_62d6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1684_c7_62d6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1684_c7_62d6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1690_c7_fe45_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1684_c7_62d6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_62d6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_62d6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_62d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1684_c7_62d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1684_c7_62d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_fe45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1684_c7_62d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_62d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_62d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_fe45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_62d6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_62d6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_62d6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_fe45_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_62d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1684_c7_62d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1684_c7_62d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1684_c7_62d6_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1684_c7_62d6_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1684_c7_62d6_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1684_c7_62d6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1688_c32_4cac_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1688_c32_4cac_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1688_c32_4cac_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1688_c32_10de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1688_c32_10de_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1688_c32_10de_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1688_c32_25e6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1688_c32_25e6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1688_c32_25e6_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1688_c32_4cac_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_10bc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_10bc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_10bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_fe45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_fe45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_fe45_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1690_c7_fe45_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_uxn_opcodes_h_l1694_c3_46b5 : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1690_c7_fe45_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1690_c7_fe45_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_fe45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_fe45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_5e88_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_fe45_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_fe45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_fe45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_5e88_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_fe45_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_fe45_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1693_c3_e24c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_fe45_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_fe45_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1694_c24_6a14_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1694_c24_6a14_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1694_c24_6a14_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_9f01_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_9f01_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_9f01_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_5e88_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_5e88_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_5e88_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_5e88_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_5e88_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_5e88_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1668_l1690_l1681_l1677_l1674_DUPLICATE_0aa9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1668_l1690_l1684_l1681_l1677_l1674_DUPLICATE_9f60_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1668_l1684_l1681_l1677_l1674_DUPLICATE_1e1c_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1668_l1696_l1684_l1681_l1677_l1674_DUPLICATE_0cc1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1696_l1690_l1684_l1681_l1677_l1674_DUPLICATE_93ef_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1681_l1674_l1684_l1677_DUPLICATE_88fb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1684_l1690_DUPLICATE_a946_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1701_l1664_DUPLICATE_4e76_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_GT_uxn_opcodes_h_l1688_c32_25e6_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1668_c1_d41e_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_62d6_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_10bc_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1684_c11_e9c7_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c6_5793_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_5e88_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1681_c11_5f01_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1671_c3_0c8f := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1671_c3_0c8f;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1688_c32_10de_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1679_c3_5da0 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1679_c3_5da0;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1684_c7_62d6_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1693_c3_e24c := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_fe45_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1693_c3_e24c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1682_c3_048f := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_bb2e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1682_c3_048f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_df5d_right := to_unsigned(2, 2);
     VAR_MUX_uxn_opcodes_h_l1688_c32_4cac_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_fe45_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1688_c32_4cac_iffalse := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_de24_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1675_c3_38c0 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1675_c3_38c0;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_fe45_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_9f01_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_5e88_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1668_c1_d41e_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1688_c32_10de_left := VAR_ins;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1694_c24_6a14_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1681_c7_bb2e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1684_c7_62d6_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c6_5793_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_de24_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_df5d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1681_c11_5f01_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1684_c11_e9c7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_10bc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_9f01_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1684_c7_62d6_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1694_c24_6a14_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1668_c6_5793] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1668_c6_5793_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c6_5793_left;
     BIN_OP_EQ_uxn_opcodes_h_l1668_c6_5793_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c6_5793_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c6_5793_return_output := BIN_OP_EQ_uxn_opcodes_h_l1668_c6_5793_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1668_l1684_l1681_l1677_l1674_DUPLICATE_1e1c LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1668_l1684_l1681_l1677_l1674_DUPLICATE_1e1c_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1668_l1696_l1684_l1681_l1677_l1674_DUPLICATE_0cc1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1668_l1696_l1684_l1681_l1677_l1674_DUPLICATE_0cc1_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1684_l1690_DUPLICATE_a946 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1684_l1690_DUPLICATE_a946_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1684_c11_e9c7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1684_c11_e9c7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1684_c11_e9c7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1684_c11_e9c7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1684_c11_e9c7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1684_c11_e9c7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1684_c11_e9c7_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l1694_c24_6a14] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1694_c24_6a14_left <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1694_c24_6a14_left;
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1694_c24_6a14_right <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1694_c24_6a14_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1694_c24_6a14_return_output := BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1694_c24_6a14_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1668_l1690_l1681_l1677_l1674_DUPLICATE_0aa9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1668_l1690_l1681_l1677_l1674_DUPLICATE_0aa9_return_output := result.is_sp_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l1688_c32_10de] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1688_c32_10de_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1688_c32_10de_left;
     BIN_OP_AND_uxn_opcodes_h_l1688_c32_10de_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1688_c32_10de_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1688_c32_10de_return_output := BIN_OP_AND_uxn_opcodes_h_l1688_c32_10de_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1696_c11_9f01] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1696_c11_9f01_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_9f01_left;
     BIN_OP_EQ_uxn_opcodes_h_l1696_c11_9f01_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_9f01_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_9f01_return_output := BIN_OP_EQ_uxn_opcodes_h_l1696_c11_9f01_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1690_c11_10bc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1690_c11_10bc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_10bc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1690_c11_10bc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_10bc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_10bc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1690_c11_10bc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1674_c11_de24] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1674_c11_de24_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_de24_left;
     BIN_OP_EQ_uxn_opcodes_h_l1674_c11_de24_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_de24_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_de24_return_output := BIN_OP_EQ_uxn_opcodes_h_l1674_c11_de24_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1696_l1690_l1684_l1681_l1677_l1674_DUPLICATE_93ef LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1696_l1690_l1684_l1681_l1677_l1674_DUPLICATE_93ef_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1677_c11_df5d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1677_c11_df5d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_df5d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1677_c11_df5d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_df5d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_df5d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1677_c11_df5d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1681_c11_5f01] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1681_c11_5f01_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1681_c11_5f01_left;
     BIN_OP_EQ_uxn_opcodes_h_l1681_c11_5f01_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1681_c11_5f01_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1681_c11_5f01_return_output := BIN_OP_EQ_uxn_opcodes_h_l1681_c11_5f01_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1668_l1690_l1684_l1681_l1677_l1674_DUPLICATE_9f60 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1668_l1690_l1684_l1681_l1677_l1674_DUPLICATE_9f60_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1681_l1674_l1684_l1677_DUPLICATE_88fb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1681_l1674_l1684_l1677_DUPLICATE_88fb_return_output := result.is_stack_read;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1688_c32_25e6_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1688_c32_10de_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1668_c1_d41e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c6_5793_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c6_5793_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c6_5793_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c6_5793_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c6_5793_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c6_5793_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c6_5793_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c6_5793_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c6_5793_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c6_5793_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1674_c7_50fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_de24_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_50fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_de24_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1674_c7_50fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_de24_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1674_c7_50fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_de24_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_50fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_de24_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_50fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_de24_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_50fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_de24_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1674_c7_50fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_de24_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1674_c7_50fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_de24_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_df5d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_df5d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_df5d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_df5d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_df5d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_df5d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_df5d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_df5d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_df5d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1681_c7_bb2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1681_c11_5f01_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_bb2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1681_c11_5f01_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1681_c11_5f01_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1681_c7_bb2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1681_c11_5f01_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1681_c7_bb2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1681_c11_5f01_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1681_c11_5f01_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_bb2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1681_c11_5f01_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1681_c7_bb2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1681_c11_5f01_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1684_c7_62d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1684_c11_e9c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_62d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1684_c11_e9c7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_62d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1684_c11_e9c7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1684_c7_62d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1684_c11_e9c7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1684_c7_62d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1684_c11_e9c7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_62d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1684_c11_e9c7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_62d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1684_c11_e9c7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1684_c7_62d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1684_c11_e9c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_fe45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_10bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_fe45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_10bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_fe45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_10bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_fe45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_10bc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1690_c7_fe45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_10bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_5e88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_9f01_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_5e88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_9f01_return_output;
     VAR_result_stack_value_uxn_opcodes_h_l1694_c3_46b5 := resize(VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1694_c24_6a14_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1668_l1684_l1681_l1677_l1674_DUPLICATE_1e1c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1668_l1684_l1681_l1677_l1674_DUPLICATE_1e1c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1668_l1684_l1681_l1677_l1674_DUPLICATE_1e1c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1668_l1684_l1681_l1677_l1674_DUPLICATE_1e1c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_62d6_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1668_l1684_l1681_l1677_l1674_DUPLICATE_1e1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1696_l1690_l1684_l1681_l1677_l1674_DUPLICATE_93ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1696_l1690_l1684_l1681_l1677_l1674_DUPLICATE_93ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_bb2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1696_l1690_l1684_l1681_l1677_l1674_DUPLICATE_93ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_62d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1696_l1690_l1684_l1681_l1677_l1674_DUPLICATE_93ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_fe45_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1696_l1690_l1684_l1681_l1677_l1674_DUPLICATE_93ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_5e88_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1696_l1690_l1684_l1681_l1677_l1674_DUPLICATE_93ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1668_l1690_l1681_l1677_l1674_DUPLICATE_0aa9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1668_l1690_l1681_l1677_l1674_DUPLICATE_0aa9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1668_l1690_l1681_l1677_l1674_DUPLICATE_0aa9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1668_l1690_l1681_l1677_l1674_DUPLICATE_0aa9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_fe45_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1668_l1690_l1681_l1677_l1674_DUPLICATE_0aa9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1681_l1674_l1684_l1677_DUPLICATE_88fb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1681_l1674_l1684_l1677_DUPLICATE_88fb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1681_c7_bb2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1681_l1674_l1684_l1677_DUPLICATE_88fb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1684_c7_62d6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1681_l1674_l1684_l1677_DUPLICATE_88fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1668_l1696_l1684_l1681_l1677_l1674_DUPLICATE_0cc1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1668_l1696_l1684_l1681_l1677_l1674_DUPLICATE_0cc1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1668_l1696_l1684_l1681_l1677_l1674_DUPLICATE_0cc1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1681_c7_bb2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1668_l1696_l1684_l1681_l1677_l1674_DUPLICATE_0cc1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1684_c7_62d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1668_l1696_l1684_l1681_l1677_l1674_DUPLICATE_0cc1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_5e88_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1668_l1696_l1684_l1681_l1677_l1674_DUPLICATE_0cc1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_62d6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1684_l1690_DUPLICATE_a946_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_fe45_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1684_l1690_DUPLICATE_a946_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1668_l1690_l1684_l1681_l1677_l1674_DUPLICATE_9f60_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1668_l1690_l1684_l1681_l1677_l1674_DUPLICATE_9f60_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1668_l1690_l1684_l1681_l1677_l1674_DUPLICATE_9f60_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1681_c7_bb2e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1668_l1690_l1684_l1681_l1677_l1674_DUPLICATE_9f60_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1684_c7_62d6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1668_l1690_l1684_l1681_l1677_l1674_DUPLICATE_9f60_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1690_c7_fe45_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1668_l1690_l1684_l1681_l1677_l1674_DUPLICATE_9f60_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1690_c7_fe45_iftrue := VAR_result_stack_value_uxn_opcodes_h_l1694_c3_46b5;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1696_c7_5e88] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_5e88_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_5e88_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_5e88_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_5e88_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_5e88_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_5e88_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_5e88_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_5e88_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1690_c7_fe45] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_fe45_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_fe45_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_fe45_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_fe45_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_fe45_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_fe45_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_fe45_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_fe45_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1688_c32_25e6] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1688_c32_25e6_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1688_c32_25e6_left;
     BIN_OP_GT_uxn_opcodes_h_l1688_c32_25e6_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1688_c32_25e6_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1688_c32_25e6_return_output := BIN_OP_GT_uxn_opcodes_h_l1688_c32_25e6_return_output;

     -- t8_MUX[uxn_opcodes_h_l1677_c7_a4f4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond <= VAR_t8_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond;
     t8_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue;
     t8_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output := t8_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1684_c7_62d6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1684_c7_62d6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1684_c7_62d6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1684_c7_62d6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1684_c7_62d6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1684_c7_62d6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1684_c7_62d6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output;

     -- n8_MUX[uxn_opcodes_h_l1684_c7_62d6] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1684_c7_62d6_cond <= VAR_n8_MUX_uxn_opcodes_h_l1684_c7_62d6_cond;
     n8_MUX_uxn_opcodes_h_l1684_c7_62d6_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1684_c7_62d6_iftrue;
     n8_MUX_uxn_opcodes_h_l1684_c7_62d6_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1684_c7_62d6_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output := n8_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1668_c1_d41e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1668_c1_d41e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1668_c1_d41e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1668_c1_d41e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1668_c1_d41e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1668_c1_d41e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1668_c1_d41e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1668_c1_d41e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1668_c1_d41e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1690_c7_fe45] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1690_c7_fe45_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1690_c7_fe45_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1690_c7_fe45_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1690_c7_fe45_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1690_c7_fe45_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1690_c7_fe45_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1690_c7_fe45_return_output := result_stack_value_MUX_uxn_opcodes_h_l1690_c7_fe45_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1690_c7_fe45] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_fe45_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_fe45_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_fe45_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_fe45_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_fe45_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_fe45_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_fe45_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_fe45_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1696_c7_5e88] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_5e88_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_5e88_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_5e88_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_5e88_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_5e88_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_5e88_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_5e88_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_5e88_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1688_c32_4cac_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1688_c32_25e6_return_output;
     VAR_printf_uxn_opcodes_h_l1669_c3_c83c_uxn_opcodes_h_l1669_c3_c83c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1668_c1_d41e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1681_c7_bb2e_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_fe45_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_5e88_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_62d6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_fe45_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1681_c7_bb2e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_fe45_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_5e88_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_62d6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_fe45_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1684_c7_62d6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1690_c7_fe45_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1690_c7_fe45] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_fe45_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_fe45_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_fe45_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_fe45_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_fe45_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_fe45_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_fe45_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_fe45_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1684_c7_62d6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_62d6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_62d6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_62d6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_62d6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_62d6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_62d6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output;

     -- MUX[uxn_opcodes_h_l1688_c32_4cac] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1688_c32_4cac_cond <= VAR_MUX_uxn_opcodes_h_l1688_c32_4cac_cond;
     MUX_uxn_opcodes_h_l1688_c32_4cac_iftrue <= VAR_MUX_uxn_opcodes_h_l1688_c32_4cac_iftrue;
     MUX_uxn_opcodes_h_l1688_c32_4cac_iffalse <= VAR_MUX_uxn_opcodes_h_l1688_c32_4cac_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1688_c32_4cac_return_output := MUX_uxn_opcodes_h_l1688_c32_4cac_return_output;

     -- printf_uxn_opcodes_h_l1669_c3_c83c[uxn_opcodes_h_l1669_c3_c83c] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1669_c3_c83c_uxn_opcodes_h_l1669_c3_c83c_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1669_c3_c83c_uxn_opcodes_h_l1669_c3_c83c_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1690_c7_fe45] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_fe45_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_fe45_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_fe45_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_fe45_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_fe45_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_fe45_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_fe45_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_fe45_return_output;

     -- n8_MUX[uxn_opcodes_h_l1681_c7_bb2e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1681_c7_bb2e_cond <= VAR_n8_MUX_uxn_opcodes_h_l1681_c7_bb2e_cond;
     n8_MUX_uxn_opcodes_h_l1681_c7_bb2e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1681_c7_bb2e_iftrue;
     n8_MUX_uxn_opcodes_h_l1681_c7_bb2e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1681_c7_bb2e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output := n8_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output;

     -- t8_MUX[uxn_opcodes_h_l1674_c7_50fb] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1674_c7_50fb_cond <= VAR_t8_MUX_uxn_opcodes_h_l1674_c7_50fb_cond;
     t8_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue;
     t8_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output := t8_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1684_c7_62d6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1684_c7_62d6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1684_c7_62d6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1684_c7_62d6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1684_c7_62d6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1684_c7_62d6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1684_c7_62d6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output := result_stack_value_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1684_c7_62d6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_62d6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_62d6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_62d6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_62d6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_62d6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_62d6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1681_c7_bb2e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1681_c7_bb2e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1681_c7_bb2e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1681_c7_bb2e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1681_c7_bb2e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1681_c7_bb2e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1681_c7_bb2e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_62d6_iftrue := VAR_MUX_uxn_opcodes_h_l1688_c32_4cac_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_62d6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_fe45_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1684_c7_62d6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_fe45_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_bb2e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1681_c7_bb2e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1681_c7_bb2e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output;

     -- n8_MUX[uxn_opcodes_h_l1677_c7_a4f4] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond <= VAR_n8_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond;
     n8_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue;
     n8_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output := n8_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1681_c7_bb2e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1681_c7_bb2e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1681_c7_bb2e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1681_c7_bb2e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1681_c7_bb2e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1681_c7_bb2e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1681_c7_bb2e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1681_c7_bb2e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_bb2e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_bb2e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_bb2e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_bb2e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_bb2e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_bb2e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1677_c7_a4f4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1684_c7_62d6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_62d6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_62d6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_62d6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_62d6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_62d6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_62d6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output;

     -- t8_MUX[uxn_opcodes_h_l1668_c2_4cc9] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond <= VAR_t8_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond;
     t8_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue;
     t8_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output := t8_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1684_c7_62d6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_62d6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_62d6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_62d6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_62d6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_62d6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_62d6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1684_c7_62d6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1684_c7_62d6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1684_c7_62d6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1684_c7_62d6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1684_c7_62d6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1684_c7_62d6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1684_c7_62d6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_bb2e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1681_c7_bb2e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_62d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output;
     -- n8_MUX[uxn_opcodes_h_l1674_c7_50fb] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1674_c7_50fb_cond <= VAR_n8_MUX_uxn_opcodes_h_l1674_c7_50fb_cond;
     n8_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue;
     n8_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output := n8_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1677_c7_a4f4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output := result_stack_value_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1681_c7_bb2e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1674_c7_50fb] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1674_c7_50fb_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1674_c7_50fb_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1677_c7_a4f4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1681_c7_bb2e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1681_c7_bb2e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1681_c7_bb2e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1681_c7_bb2e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1681_c7_bb2e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1681_c7_bb2e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1681_c7_bb2e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1681_c7_bb2e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_bb2e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_bb2e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_bb2e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_bb2e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_bb2e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_bb2e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1677_c7_a4f4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_bb2e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1674_c7_50fb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1674_c7_50fb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1674_c7_50fb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1674_c7_50fb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_50fb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_50fb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1677_c7_a4f4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1677_c7_a4f4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output;

     -- n8_MUX[uxn_opcodes_h_l1668_c2_4cc9] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond <= VAR_n8_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond;
     n8_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue;
     n8_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output := n8_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1668_c2_4cc9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1677_c7_a4f4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1674_c7_50fb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1674_c7_50fb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1674_c7_50fb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output := result_stack_value_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_a4f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1668_c2_4cc9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output := result_stack_value_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1674_c7_50fb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_50fb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_50fb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1674_c7_50fb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_50fb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_50fb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1674_c7_50fb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_50fb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_50fb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_50fb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_50fb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1668_c2_4cc9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1668_c2_4cc9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_50fb_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1668_c2_4cc9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1668_c2_4cc9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1668_c2_4cc9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1668_c2_4cc9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1668_c2_4cc9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1668_c2_4cc9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1701_l1664_DUPLICATE_4e76 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1701_l1664_DUPLICATE_4e76_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e56b(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1668_c2_4cc9_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1701_l1664_DUPLICATE_4e76_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1701_l1664_DUPLICATE_4e76_return_output;
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
