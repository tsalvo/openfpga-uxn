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
-- Submodules: 65
entity gth_0CLK_7c2e709f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end gth_0CLK_7c2e709f;
architecture arch of gth_0CLK_7c2e709f is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2100_c6_0d7f]
signal BIN_OP_EQ_uxn_opcodes_h_l2100_c6_0d7f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2100_c6_0d7f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2100_c6_0d7f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2100_c1_1a59]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2100_c1_1a59_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2100_c1_1a59_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2100_c1_1a59_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2100_c1_1a59_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2100_c2_6473]
signal t8_MUX_uxn_opcodes_h_l2100_c2_6473_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2100_c2_6473_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2100_c2_6473]
signal n8_MUX_uxn_opcodes_h_l2100_c2_6473_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2100_c2_6473_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2100_c2_6473]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c2_6473_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c2_6473_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2100_c2_6473]
signal result_stack_value_MUX_uxn_opcodes_h_l2100_c2_6473_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2100_c2_6473_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2100_c2_6473]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2100_c2_6473_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2100_c2_6473_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2100_c2_6473]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c2_6473_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c2_6473_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2100_c2_6473]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c2_6473_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c2_6473_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2100_c2_6473]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2100_c2_6473_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2100_c2_6473_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2100_c2_6473]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2100_c2_6473_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2100_c2_6473_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l2101_c3_b204[uxn_opcodes_h_l2101_c3_b204]
signal printf_uxn_opcodes_h_l2101_c3_b204_uxn_opcodes_h_l2101_c3_b204_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2106_c11_34ca]
signal BIN_OP_EQ_uxn_opcodes_h_l2106_c11_34ca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2106_c11_34ca_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2106_c11_34ca_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2106_c7_b987]
signal t8_MUX_uxn_opcodes_h_l2106_c7_b987_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2106_c7_b987_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2106_c7_b987]
signal n8_MUX_uxn_opcodes_h_l2106_c7_b987_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2106_c7_b987_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2106_c7_b987]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2106_c7_b987_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2106_c7_b987_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2106_c7_b987]
signal result_stack_value_MUX_uxn_opcodes_h_l2106_c7_b987_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2106_c7_b987_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2106_c7_b987]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_b987_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_b987_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2106_c7_b987]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_b987_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_b987_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2106_c7_b987]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_b987_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_b987_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2106_c7_b987]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_b987_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_b987_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2106_c7_b987]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2106_c7_b987_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2106_c7_b987_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2109_c11_ae42]
signal BIN_OP_EQ_uxn_opcodes_h_l2109_c11_ae42_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2109_c11_ae42_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2109_c11_ae42_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2109_c7_1df2]
signal t8_MUX_uxn_opcodes_h_l2109_c7_1df2_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2109_c7_1df2]
signal n8_MUX_uxn_opcodes_h_l2109_c7_1df2_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2109_c7_1df2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_1df2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2109_c7_1df2]
signal result_stack_value_MUX_uxn_opcodes_h_l2109_c7_1df2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2109_c7_1df2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_1df2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2109_c7_1df2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_1df2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2109_c7_1df2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_1df2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2109_c7_1df2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_1df2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2109_c7_1df2]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_1df2_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2113_c11_37c2]
signal BIN_OP_EQ_uxn_opcodes_h_l2113_c11_37c2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2113_c11_37c2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2113_c11_37c2_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2113_c7_51aa]
signal n8_MUX_uxn_opcodes_h_l2113_c7_51aa_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2113_c7_51aa_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2113_c7_51aa_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2113_c7_51aa]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_51aa_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_51aa_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_51aa_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2113_c7_51aa]
signal result_stack_value_MUX_uxn_opcodes_h_l2113_c7_51aa_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2113_c7_51aa_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2113_c7_51aa_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2113_c7_51aa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_51aa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_51aa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_51aa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2113_c7_51aa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_51aa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_51aa_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_51aa_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2113_c7_51aa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_51aa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_51aa_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_51aa_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2113_c7_51aa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_51aa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_51aa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_51aa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2113_c7_51aa]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2113_c7_51aa_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2113_c7_51aa_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2113_c7_51aa_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2116_c11_f894]
signal BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f894_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f894_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f894_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2116_c7_6cdc]
signal n8_MUX_uxn_opcodes_h_l2116_c7_6cdc_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2116_c7_6cdc_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2116_c7_6cdc_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2116_c7_6cdc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2116_c7_6cdc]
signal result_stack_value_MUX_uxn_opcodes_h_l2116_c7_6cdc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2116_c7_6cdc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2116_c7_6cdc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2116_c7_6cdc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_6cdc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_6cdc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_6cdc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2116_c7_6cdc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2116_c7_6cdc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_6cdc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_6cdc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_6cdc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2116_c7_6cdc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_6cdc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_6cdc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_6cdc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2116_c7_6cdc]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_6cdc_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_6cdc_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_6cdc_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2120_c32_33e5]
signal BIN_OP_AND_uxn_opcodes_h_l2120_c32_33e5_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2120_c32_33e5_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2120_c32_33e5_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2120_c32_6d54]
signal BIN_OP_GT_uxn_opcodes_h_l2120_c32_6d54_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2120_c32_6d54_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2120_c32_6d54_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2120_c32_aecc]
signal MUX_uxn_opcodes_h_l2120_c32_aecc_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2120_c32_aecc_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2120_c32_aecc_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2120_c32_aecc_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2122_c11_1fd7]
signal BIN_OP_EQ_uxn_opcodes_h_l2122_c11_1fd7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2122_c11_1fd7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2122_c11_1fd7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2122_c7_d2ad]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_d2ad_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_d2ad_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_d2ad_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_d2ad_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2122_c7_d2ad]
signal result_stack_value_MUX_uxn_opcodes_h_l2122_c7_d2ad_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2122_c7_d2ad_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2122_c7_d2ad_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2122_c7_d2ad_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2122_c7_d2ad]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2122_c7_d2ad_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2122_c7_d2ad_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2122_c7_d2ad_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2122_c7_d2ad_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2122_c7_d2ad]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_d2ad_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_d2ad_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_d2ad_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_d2ad_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2122_c7_d2ad]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_d2ad_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_d2ad_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_d2ad_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_d2ad_return_output : unsigned(0 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2126_c24_1a55]
signal BIN_OP_GT_uxn_opcodes_h_l2126_c24_1a55_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2126_c24_1a55_right : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2126_c24_1a55_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2126_c24_2f74]
signal MUX_uxn_opcodes_h_l2126_c24_2f74_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2126_c24_2f74_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2126_c24_2f74_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2126_c24_2f74_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2128_c11_e151]
signal BIN_OP_EQ_uxn_opcodes_h_l2128_c11_e151_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2128_c11_e151_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2128_c11_e151_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2128_c7_eb4b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_eb4b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_eb4b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_eb4b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_eb4b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2128_c7_eb4b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_eb4b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_eb4b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_eb4b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_eb4b_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_287e( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.is_stack_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2100_c6_0d7f
BIN_OP_EQ_uxn_opcodes_h_l2100_c6_0d7f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2100_c6_0d7f_left,
BIN_OP_EQ_uxn_opcodes_h_l2100_c6_0d7f_right,
BIN_OP_EQ_uxn_opcodes_h_l2100_c6_0d7f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2100_c1_1a59
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2100_c1_1a59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2100_c1_1a59_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2100_c1_1a59_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2100_c1_1a59_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2100_c1_1a59_return_output);

-- t8_MUX_uxn_opcodes_h_l2100_c2_6473
t8_MUX_uxn_opcodes_h_l2100_c2_6473 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2100_c2_6473_cond,
t8_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue,
t8_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse,
t8_MUX_uxn_opcodes_h_l2100_c2_6473_return_output);

-- n8_MUX_uxn_opcodes_h_l2100_c2_6473
n8_MUX_uxn_opcodes_h_l2100_c2_6473 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2100_c2_6473_cond,
n8_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue,
n8_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse,
n8_MUX_uxn_opcodes_h_l2100_c2_6473_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c2_6473
result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c2_6473 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c2_6473_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c2_6473_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2100_c2_6473
result_stack_value_MUX_uxn_opcodes_h_l2100_c2_6473 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2100_c2_6473_cond,
result_stack_value_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2100_c2_6473_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2100_c2_6473
result_is_stack_write_MUX_uxn_opcodes_h_l2100_c2_6473 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2100_c2_6473_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2100_c2_6473_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c2_6473
result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c2_6473 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c2_6473_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c2_6473_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c2_6473
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c2_6473 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c2_6473_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c2_6473_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2100_c2_6473
result_is_opc_done_MUX_uxn_opcodes_h_l2100_c2_6473 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2100_c2_6473_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2100_c2_6473_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2100_c2_6473
result_is_stack_read_MUX_uxn_opcodes_h_l2100_c2_6473 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2100_c2_6473_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2100_c2_6473_return_output);

-- printf_uxn_opcodes_h_l2101_c3_b204_uxn_opcodes_h_l2101_c3_b204
printf_uxn_opcodes_h_l2101_c3_b204_uxn_opcodes_h_l2101_c3_b204 : entity work.printf_uxn_opcodes_h_l2101_c3_b204_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2101_c3_b204_uxn_opcodes_h_l2101_c3_b204_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2106_c11_34ca
BIN_OP_EQ_uxn_opcodes_h_l2106_c11_34ca : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2106_c11_34ca_left,
BIN_OP_EQ_uxn_opcodes_h_l2106_c11_34ca_right,
BIN_OP_EQ_uxn_opcodes_h_l2106_c11_34ca_return_output);

-- t8_MUX_uxn_opcodes_h_l2106_c7_b987
t8_MUX_uxn_opcodes_h_l2106_c7_b987 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2106_c7_b987_cond,
t8_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue,
t8_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse,
t8_MUX_uxn_opcodes_h_l2106_c7_b987_return_output);

-- n8_MUX_uxn_opcodes_h_l2106_c7_b987
n8_MUX_uxn_opcodes_h_l2106_c7_b987 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2106_c7_b987_cond,
n8_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue,
n8_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse,
n8_MUX_uxn_opcodes_h_l2106_c7_b987_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2106_c7_b987
result_is_sp_shift_MUX_uxn_opcodes_h_l2106_c7_b987 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2106_c7_b987_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2106_c7_b987_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2106_c7_b987
result_stack_value_MUX_uxn_opcodes_h_l2106_c7_b987 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2106_c7_b987_cond,
result_stack_value_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2106_c7_b987_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_b987
result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_b987 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_b987_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_b987_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_b987
result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_b987 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_b987_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_b987_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_b987
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_b987 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_b987_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_b987_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_b987
result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_b987 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_b987_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_b987_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2106_c7_b987
result_is_stack_read_MUX_uxn_opcodes_h_l2106_c7_b987 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2106_c7_b987_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2106_c7_b987_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2109_c11_ae42
BIN_OP_EQ_uxn_opcodes_h_l2109_c11_ae42 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2109_c11_ae42_left,
BIN_OP_EQ_uxn_opcodes_h_l2109_c11_ae42_right,
BIN_OP_EQ_uxn_opcodes_h_l2109_c11_ae42_return_output);

-- t8_MUX_uxn_opcodes_h_l2109_c7_1df2
t8_MUX_uxn_opcodes_h_l2109_c7_1df2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2109_c7_1df2_cond,
t8_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue,
t8_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse,
t8_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output);

-- n8_MUX_uxn_opcodes_h_l2109_c7_1df2
n8_MUX_uxn_opcodes_h_l2109_c7_1df2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2109_c7_1df2_cond,
n8_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue,
n8_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse,
n8_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_1df2
result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_1df2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_1df2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2109_c7_1df2
result_stack_value_MUX_uxn_opcodes_h_l2109_c7_1df2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2109_c7_1df2_cond,
result_stack_value_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_1df2
result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_1df2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_1df2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_1df2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_1df2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_1df2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_1df2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_1df2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_1df2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_1df2
result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_1df2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_1df2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_1df2
result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_1df2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_1df2_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2113_c11_37c2
BIN_OP_EQ_uxn_opcodes_h_l2113_c11_37c2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2113_c11_37c2_left,
BIN_OP_EQ_uxn_opcodes_h_l2113_c11_37c2_right,
BIN_OP_EQ_uxn_opcodes_h_l2113_c11_37c2_return_output);

-- n8_MUX_uxn_opcodes_h_l2113_c7_51aa
n8_MUX_uxn_opcodes_h_l2113_c7_51aa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2113_c7_51aa_cond,
n8_MUX_uxn_opcodes_h_l2113_c7_51aa_iftrue,
n8_MUX_uxn_opcodes_h_l2113_c7_51aa_iffalse,
n8_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_51aa
result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_51aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_51aa_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_51aa_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_51aa_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2113_c7_51aa
result_stack_value_MUX_uxn_opcodes_h_l2113_c7_51aa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2113_c7_51aa_cond,
result_stack_value_MUX_uxn_opcodes_h_l2113_c7_51aa_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2113_c7_51aa_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_51aa
result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_51aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_51aa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_51aa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_51aa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_51aa
result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_51aa : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_51aa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_51aa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_51aa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_51aa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_51aa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_51aa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_51aa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_51aa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_51aa
result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_51aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_51aa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_51aa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_51aa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2113_c7_51aa
result_is_stack_read_MUX_uxn_opcodes_h_l2113_c7_51aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2113_c7_51aa_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2113_c7_51aa_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2113_c7_51aa_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f894
BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f894 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f894_left,
BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f894_right,
BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f894_return_output);

-- n8_MUX_uxn_opcodes_h_l2116_c7_6cdc
n8_MUX_uxn_opcodes_h_l2116_c7_6cdc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2116_c7_6cdc_cond,
n8_MUX_uxn_opcodes_h_l2116_c7_6cdc_iftrue,
n8_MUX_uxn_opcodes_h_l2116_c7_6cdc_iffalse,
n8_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc
result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2116_c7_6cdc
result_stack_value_MUX_uxn_opcodes_h_l2116_c7_6cdc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2116_c7_6cdc_cond,
result_stack_value_MUX_uxn_opcodes_h_l2116_c7_6cdc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2116_c7_6cdc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_6cdc
result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_6cdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_6cdc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_6cdc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_6cdc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc
result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_6cdc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_6cdc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_6cdc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_6cdc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_6cdc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_6cdc
result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_6cdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_6cdc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_6cdc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_6cdc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_6cdc
result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_6cdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_6cdc_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_6cdc_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_6cdc_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2120_c32_33e5
BIN_OP_AND_uxn_opcodes_h_l2120_c32_33e5 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2120_c32_33e5_left,
BIN_OP_AND_uxn_opcodes_h_l2120_c32_33e5_right,
BIN_OP_AND_uxn_opcodes_h_l2120_c32_33e5_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2120_c32_6d54
BIN_OP_GT_uxn_opcodes_h_l2120_c32_6d54 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2120_c32_6d54_left,
BIN_OP_GT_uxn_opcodes_h_l2120_c32_6d54_right,
BIN_OP_GT_uxn_opcodes_h_l2120_c32_6d54_return_output);

-- MUX_uxn_opcodes_h_l2120_c32_aecc
MUX_uxn_opcodes_h_l2120_c32_aecc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2120_c32_aecc_cond,
MUX_uxn_opcodes_h_l2120_c32_aecc_iftrue,
MUX_uxn_opcodes_h_l2120_c32_aecc_iffalse,
MUX_uxn_opcodes_h_l2120_c32_aecc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2122_c11_1fd7
BIN_OP_EQ_uxn_opcodes_h_l2122_c11_1fd7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2122_c11_1fd7_left,
BIN_OP_EQ_uxn_opcodes_h_l2122_c11_1fd7_right,
BIN_OP_EQ_uxn_opcodes_h_l2122_c11_1fd7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_d2ad
result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_d2ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_d2ad_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_d2ad_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_d2ad_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_d2ad_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2122_c7_d2ad
result_stack_value_MUX_uxn_opcodes_h_l2122_c7_d2ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2122_c7_d2ad_cond,
result_stack_value_MUX_uxn_opcodes_h_l2122_c7_d2ad_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2122_c7_d2ad_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2122_c7_d2ad_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2122_c7_d2ad
result_is_stack_write_MUX_uxn_opcodes_h_l2122_c7_d2ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2122_c7_d2ad_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2122_c7_d2ad_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2122_c7_d2ad_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2122_c7_d2ad_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_d2ad
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_d2ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_d2ad_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_d2ad_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_d2ad_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_d2ad_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_d2ad
result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_d2ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_d2ad_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_d2ad_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_d2ad_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_d2ad_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2126_c24_1a55
BIN_OP_GT_uxn_opcodes_h_l2126_c24_1a55 : entity work.BIN_OP_GT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2126_c24_1a55_left,
BIN_OP_GT_uxn_opcodes_h_l2126_c24_1a55_right,
BIN_OP_GT_uxn_opcodes_h_l2126_c24_1a55_return_output);

-- MUX_uxn_opcodes_h_l2126_c24_2f74
MUX_uxn_opcodes_h_l2126_c24_2f74 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2126_c24_2f74_cond,
MUX_uxn_opcodes_h_l2126_c24_2f74_iftrue,
MUX_uxn_opcodes_h_l2126_c24_2f74_iffalse,
MUX_uxn_opcodes_h_l2126_c24_2f74_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2128_c11_e151
BIN_OP_EQ_uxn_opcodes_h_l2128_c11_e151 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2128_c11_e151_left,
BIN_OP_EQ_uxn_opcodes_h_l2128_c11_e151_right,
BIN_OP_EQ_uxn_opcodes_h_l2128_c11_e151_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_eb4b
result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_eb4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_eb4b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_eb4b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_eb4b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_eb4b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_eb4b
result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_eb4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_eb4b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_eb4b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_eb4b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_eb4b_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2100_c6_0d7f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2100_c1_1a59_return_output,
 t8_MUX_uxn_opcodes_h_l2100_c2_6473_return_output,
 n8_MUX_uxn_opcodes_h_l2100_c2_6473_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c2_6473_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2100_c2_6473_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2100_c2_6473_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c2_6473_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c2_6473_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2100_c2_6473_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2100_c2_6473_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2106_c11_34ca_return_output,
 t8_MUX_uxn_opcodes_h_l2106_c7_b987_return_output,
 n8_MUX_uxn_opcodes_h_l2106_c7_b987_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2106_c7_b987_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2106_c7_b987_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_b987_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_b987_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_b987_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_b987_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2106_c7_b987_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2109_c11_ae42_return_output,
 t8_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output,
 n8_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2113_c11_37c2_return_output,
 n8_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f894_return_output,
 n8_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2120_c32_33e5_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2120_c32_6d54_return_output,
 MUX_uxn_opcodes_h_l2120_c32_aecc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2122_c11_1fd7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_d2ad_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2122_c7_d2ad_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2122_c7_d2ad_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_d2ad_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_d2ad_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2126_c24_1a55_return_output,
 MUX_uxn_opcodes_h_l2126_c24_2f74_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2128_c11_e151_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_eb4b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_eb4b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2100_c6_0d7f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2100_c6_0d7f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2100_c6_0d7f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2100_c1_1a59_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2100_c1_1a59_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2100_c1_1a59_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2100_c1_1a59_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2106_c7_b987_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2100_c2_6473_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2100_c2_6473_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2106_c7_b987_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2100_c2_6473_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2100_c2_6473_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2106_c7_b987_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c2_6473_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c2_6473_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2106_c7_b987_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2100_c2_6473_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2100_c2_6473_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_b987_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2100_c2_6473_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2100_c2_6473_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_b987_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c2_6473_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c2_6473_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2103_c3_f02f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_b987_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c2_6473_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c2_6473_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_b987_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2100_c2_6473_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2100_c2_6473_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2106_c7_b987_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2100_c2_6473_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2100_c2_6473_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2101_c3_b204_uxn_opcodes_h_l2101_c3_b204_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_34ca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_34ca_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_34ca_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2106_c7_b987_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2106_c7_b987_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2106_c7_b987_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2106_c7_b987_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_b987_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_b987_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2107_c3_b83c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_b987_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_b987_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2106_c7_b987_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_ae42_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_ae42_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_ae42_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2109_c7_1df2_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2109_c7_1df2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_1df2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2109_c7_1df2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_1df2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_1df2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2111_c3_9d00 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_1df2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_1df2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_1df2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_37c2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_37c2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_37c2_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2113_c7_51aa_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2113_c7_51aa_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2113_c7_51aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_51aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_51aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_51aa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2113_c7_51aa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2113_c7_51aa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2113_c7_51aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_51aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_51aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_51aa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_51aa_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_51aa_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_51aa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_51aa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2114_c3_a9dd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_51aa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_51aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_51aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_51aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_51aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2113_c7_51aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2113_c7_51aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2113_c7_51aa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f894_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f894_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f894_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2116_c7_6cdc_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2116_c7_6cdc_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2116_c7_6cdc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_d2ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_6cdc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_6cdc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2122_c7_d2ad_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_6cdc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_6cdc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_6cdc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2122_c7_d2ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_6cdc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_6cdc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_6cdc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_d2ad_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_6cdc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_6cdc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_6cdc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_d2ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_6cdc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_6cdc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_6cdc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_6cdc_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2120_c32_aecc_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2120_c32_aecc_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2120_c32_aecc_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2120_c32_33e5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2120_c32_33e5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2120_c32_33e5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2120_c32_6d54_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2120_c32_6d54_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2120_c32_6d54_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2120_c32_aecc_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_1fd7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_1fd7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_1fd7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_d2ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_d2ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_d2ad_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2122_c7_d2ad_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2122_c7_d2ad_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2122_c7_d2ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2122_c7_d2ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2122_c7_d2ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_eb4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2122_c7_d2ad_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_d2ad_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2125_c3_e478 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_d2ad_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_d2ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_d2ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_d2ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_eb4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_d2ad_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2126_c24_2f74_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2126_c24_2f74_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2126_c24_2f74_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2126_c24_1a55_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2126_c24_1a55_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2126_c24_1a55_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2126_c24_2f74_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_e151_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_e151_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_e151_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_eb4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_eb4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_eb4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_eb4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_eb4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_eb4b_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2122_l2113_l2109_l2106_l2100_DUPLICATE_355d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2122_l2116_l2113_l2109_l2106_l2100_DUPLICATE_f6d0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2116_l2113_l2109_l2106_l2100_l2128_DUPLICATE_6c19_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2116_l2113_l2109_l2106_l2100_DUPLICATE_f24c_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2122_l2116_l2113_l2109_l2106_l2128_DUPLICATE_f609_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2106_l2116_l2109_l2113_DUPLICATE_3b50_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2116_l2122_DUPLICATE_d643_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2133_l2096_DUPLICATE_efbd_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_1fd7_right := to_unsigned(5, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2100_c1_1a59_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_eb4b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_e151_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2111_c3_9d00 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2111_c3_9d00;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_d2ad_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2120_c32_33e5_right := to_unsigned(128, 8);
     VAR_MUX_uxn_opcodes_h_l2126_c24_2f74_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2107_c3_b83c := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2107_c3_b83c;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2100_c6_0d7f_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2120_c32_aecc_iffalse := resize(to_signed(-1, 2), 8);
     VAR_MUX_uxn_opcodes_h_l2126_c24_2f74_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2122_c7_d2ad_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_37c2_right := to_unsigned(3, 2);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2120_c32_6d54_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_34ca_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_ae42_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2125_c3_e478 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_d2ad_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2125_c3_e478;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f894_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_eb4b_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2114_c3_a9dd := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_51aa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2114_c3_a9dd;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_6cdc_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2120_c32_aecc_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2103_c3_f02f := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2103_c3_f02f;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2100_c1_1a59_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2120_c32_33e5_left := VAR_ins;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2126_c24_1a55_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2113_c7_51aa_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2116_c7_6cdc_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2100_c6_0d7f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_34ca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_ae42_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_37c2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f894_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_1fd7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_e151_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2116_c7_6cdc_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2126_c24_1a55_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l2113_c11_37c2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2113_c11_37c2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_37c2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2113_c11_37c2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_37c2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_37c2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2113_c11_37c2_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2122_l2116_l2113_l2109_l2106_l2100_DUPLICATE_f6d0 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2122_l2116_l2113_l2109_l2106_l2100_DUPLICATE_f6d0_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2122_c11_1fd7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2122_c11_1fd7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_1fd7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2122_c11_1fd7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_1fd7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_1fd7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2122_c11_1fd7_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2122_l2116_l2113_l2109_l2106_l2128_DUPLICATE_f609 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2122_l2116_l2113_l2109_l2106_l2128_DUPLICATE_f609_return_output := result.is_opc_done;

     -- BIN_OP_AND[uxn_opcodes_h_l2120_c32_33e5] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2120_c32_33e5_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2120_c32_33e5_left;
     BIN_OP_AND_uxn_opcodes_h_l2120_c32_33e5_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2120_c32_33e5_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2120_c32_33e5_return_output := BIN_OP_AND_uxn_opcodes_h_l2120_c32_33e5_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2116_l2113_l2109_l2106_l2100_DUPLICATE_f24c LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2116_l2113_l2109_l2106_l2100_DUPLICATE_f24c_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2100_c6_0d7f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2100_c6_0d7f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2100_c6_0d7f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2100_c6_0d7f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2100_c6_0d7f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2100_c6_0d7f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2100_c6_0d7f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2128_c11_e151] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2128_c11_e151_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_e151_left;
     BIN_OP_EQ_uxn_opcodes_h_l2128_c11_e151_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_e151_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_e151_return_output := BIN_OP_EQ_uxn_opcodes_h_l2128_c11_e151_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2116_l2122_DUPLICATE_d643 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2116_l2122_DUPLICATE_d643_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2109_c11_ae42] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2109_c11_ae42_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_ae42_left;
     BIN_OP_EQ_uxn_opcodes_h_l2109_c11_ae42_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_ae42_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_ae42_return_output := BIN_OP_EQ_uxn_opcodes_h_l2109_c11_ae42_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2106_l2116_l2109_l2113_DUPLICATE_3b50 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2106_l2116_l2109_l2113_DUPLICATE_3b50_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2116_l2113_l2109_l2106_l2100_l2128_DUPLICATE_6c19 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2116_l2113_l2109_l2106_l2100_l2128_DUPLICATE_6c19_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2122_l2113_l2109_l2106_l2100_DUPLICATE_355d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2122_l2113_l2109_l2106_l2100_DUPLICATE_355d_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2116_c11_f894] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f894_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f894_left;
     BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f894_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f894_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f894_return_output := BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f894_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2106_c11_34ca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2106_c11_34ca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_34ca_left;
     BIN_OP_EQ_uxn_opcodes_h_l2106_c11_34ca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_34ca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_34ca_return_output := BIN_OP_EQ_uxn_opcodes_h_l2106_c11_34ca_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2126_c24_1a55] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2126_c24_1a55_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2126_c24_1a55_left;
     BIN_OP_GT_uxn_opcodes_h_l2126_c24_1a55_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2126_c24_1a55_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2126_c24_1a55_return_output := BIN_OP_GT_uxn_opcodes_h_l2126_c24_1a55_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2120_c32_6d54_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2120_c32_33e5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2100_c1_1a59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2100_c6_0d7f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2100_c2_6473_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2100_c6_0d7f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2100_c2_6473_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2100_c6_0d7f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c2_6473_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2100_c6_0d7f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2100_c2_6473_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2100_c6_0d7f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2100_c2_6473_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2100_c6_0d7f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c2_6473_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2100_c6_0d7f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c2_6473_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2100_c6_0d7f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2100_c2_6473_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2100_c6_0d7f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2100_c2_6473_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2100_c6_0d7f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2106_c7_b987_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_34ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_b987_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_34ca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2106_c7_b987_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_34ca_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2106_c7_b987_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_34ca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_b987_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_34ca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_b987_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_34ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_b987_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_34ca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2106_c7_b987_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_34ca_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2106_c7_b987_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_34ca_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2109_c7_1df2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_ae42_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_1df2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_ae42_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_1df2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_ae42_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_1df2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_ae42_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_1df2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_ae42_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_1df2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_ae42_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_1df2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_ae42_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2109_c7_1df2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_ae42_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2109_c7_1df2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_ae42_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2113_c7_51aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_37c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_51aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_37c2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_51aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_37c2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2113_c7_51aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_37c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_51aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_37c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_51aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_37c2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_51aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_37c2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2113_c7_51aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_37c2_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2116_c7_6cdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f894_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_6cdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f894_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f894_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_6cdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f894_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_6cdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f894_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f894_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_6cdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f894_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_6cdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f894_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_d2ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_1fd7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_d2ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_1fd7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2122_c7_d2ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_1fd7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_d2ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_1fd7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2122_c7_d2ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_1fd7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_eb4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_e151_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_eb4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_e151_return_output;
     VAR_MUX_uxn_opcodes_h_l2126_c24_2f74_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2126_c24_1a55_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2116_l2113_l2109_l2106_l2100_DUPLICATE_f24c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2116_l2113_l2109_l2106_l2100_DUPLICATE_f24c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2116_l2113_l2109_l2106_l2100_DUPLICATE_f24c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_51aa_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2116_l2113_l2109_l2106_l2100_DUPLICATE_f24c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2116_l2113_l2109_l2106_l2100_DUPLICATE_f24c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2122_l2116_l2113_l2109_l2106_l2128_DUPLICATE_f609_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2122_l2116_l2113_l2109_l2106_l2128_DUPLICATE_f609_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_51aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2122_l2116_l2113_l2109_l2106_l2128_DUPLICATE_f609_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_6cdc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2122_l2116_l2113_l2109_l2106_l2128_DUPLICATE_f609_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_d2ad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2122_l2116_l2113_l2109_l2106_l2128_DUPLICATE_f609_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_eb4b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2122_l2116_l2113_l2109_l2106_l2128_DUPLICATE_f609_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2122_l2113_l2109_l2106_l2100_DUPLICATE_355d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2122_l2113_l2109_l2106_l2100_DUPLICATE_355d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2122_l2113_l2109_l2106_l2100_DUPLICATE_355d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_51aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2122_l2113_l2109_l2106_l2100_DUPLICATE_355d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_d2ad_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2122_l2113_l2109_l2106_l2100_DUPLICATE_355d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2106_l2116_l2109_l2113_DUPLICATE_3b50_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2106_l2116_l2109_l2113_DUPLICATE_3b50_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2113_c7_51aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2106_l2116_l2109_l2113_DUPLICATE_3b50_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_6cdc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2106_l2116_l2109_l2113_DUPLICATE_3b50_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2116_l2113_l2109_l2106_l2100_l2128_DUPLICATE_6c19_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2116_l2113_l2109_l2106_l2100_l2128_DUPLICATE_6c19_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2116_l2113_l2109_l2106_l2100_l2128_DUPLICATE_6c19_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_51aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2116_l2113_l2109_l2106_l2100_l2128_DUPLICATE_6c19_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_6cdc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2116_l2113_l2109_l2106_l2100_l2128_DUPLICATE_6c19_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_eb4b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2116_l2113_l2109_l2106_l2100_l2128_DUPLICATE_6c19_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_6cdc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2116_l2122_DUPLICATE_d643_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_d2ad_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2116_l2122_DUPLICATE_d643_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2122_l2116_l2113_l2109_l2106_l2100_DUPLICATE_f6d0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2122_l2116_l2113_l2109_l2106_l2100_DUPLICATE_f6d0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2122_l2116_l2113_l2109_l2106_l2100_DUPLICATE_f6d0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2113_c7_51aa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2122_l2116_l2113_l2109_l2106_l2100_DUPLICATE_f6d0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_6cdc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2122_l2116_l2113_l2109_l2106_l2100_DUPLICATE_f6d0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2122_c7_d2ad_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2122_l2116_l2113_l2109_l2106_l2100_DUPLICATE_f6d0_return_output;
     -- t8_MUX[uxn_opcodes_h_l2109_c7_1df2] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2109_c7_1df2_cond <= VAR_t8_MUX_uxn_opcodes_h_l2109_c7_1df2_cond;
     t8_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue;
     t8_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output := t8_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2122_c7_d2ad] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_d2ad_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_d2ad_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_d2ad_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_d2ad_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_d2ad_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_d2ad_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_d2ad_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_d2ad_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2116_c7_6cdc] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_6cdc_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_6cdc_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_6cdc_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_6cdc_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_6cdc_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_6cdc_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2100_c1_1a59] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2100_c1_1a59_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2100_c1_1a59_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2100_c1_1a59_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2100_c1_1a59_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2100_c1_1a59_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2100_c1_1a59_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2100_c1_1a59_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2100_c1_1a59_return_output;

     -- MUX[uxn_opcodes_h_l2126_c24_2f74] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2126_c24_2f74_cond <= VAR_MUX_uxn_opcodes_h_l2126_c24_2f74_cond;
     MUX_uxn_opcodes_h_l2126_c24_2f74_iftrue <= VAR_MUX_uxn_opcodes_h_l2126_c24_2f74_iftrue;
     MUX_uxn_opcodes_h_l2126_c24_2f74_iffalse <= VAR_MUX_uxn_opcodes_h_l2126_c24_2f74_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2126_c24_2f74_return_output := MUX_uxn_opcodes_h_l2126_c24_2f74_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2128_c7_eb4b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_eb4b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_eb4b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_eb4b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_eb4b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_eb4b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_eb4b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_eb4b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_eb4b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2122_c7_d2ad] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_d2ad_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_d2ad_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_d2ad_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_d2ad_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_d2ad_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_d2ad_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_d2ad_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_d2ad_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2120_c32_6d54] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2120_c32_6d54_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2120_c32_6d54_left;
     BIN_OP_GT_uxn_opcodes_h_l2120_c32_6d54_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2120_c32_6d54_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2120_c32_6d54_return_output := BIN_OP_GT_uxn_opcodes_h_l2120_c32_6d54_return_output;

     -- n8_MUX[uxn_opcodes_h_l2116_c7_6cdc] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2116_c7_6cdc_cond <= VAR_n8_MUX_uxn_opcodes_h_l2116_c7_6cdc_cond;
     n8_MUX_uxn_opcodes_h_l2116_c7_6cdc_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2116_c7_6cdc_iftrue;
     n8_MUX_uxn_opcodes_h_l2116_c7_6cdc_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2116_c7_6cdc_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output := n8_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2128_c7_eb4b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_eb4b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_eb4b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_eb4b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_eb4b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_eb4b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_eb4b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_eb4b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_eb4b_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2120_c32_aecc_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2120_c32_6d54_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2122_c7_d2ad_iftrue := VAR_MUX_uxn_opcodes_h_l2126_c24_2f74_return_output;
     VAR_printf_uxn_opcodes_h_l2101_c3_b204_uxn_opcodes_h_l2101_c3_b204_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2100_c1_1a59_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2113_c7_51aa_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_d2ad_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_eb4b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_d2ad_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2113_c7_51aa_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2122_c7_d2ad_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_eb4b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_6cdc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_d2ad_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l2113_c7_51aa] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2113_c7_51aa_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2113_c7_51aa_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2113_c7_51aa_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2113_c7_51aa_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2113_c7_51aa_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2113_c7_51aa_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output;

     -- t8_MUX[uxn_opcodes_h_l2106_c7_b987] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2106_c7_b987_cond <= VAR_t8_MUX_uxn_opcodes_h_l2106_c7_b987_cond;
     t8_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue;
     t8_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2106_c7_b987_return_output := t8_MUX_uxn_opcodes_h_l2106_c7_b987_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2122_c7_d2ad] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2122_c7_d2ad_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2122_c7_d2ad_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2122_c7_d2ad_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2122_c7_d2ad_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2122_c7_d2ad_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2122_c7_d2ad_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2122_c7_d2ad_return_output := result_stack_value_MUX_uxn_opcodes_h_l2122_c7_d2ad_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2116_c7_6cdc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2116_c7_6cdc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_6cdc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_6cdc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_6cdc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_6cdc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_6cdc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_6cdc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2122_c7_d2ad] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2122_c7_d2ad_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2122_c7_d2ad_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2122_c7_d2ad_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2122_c7_d2ad_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2122_c7_d2ad_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2122_c7_d2ad_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2122_c7_d2ad_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2122_c7_d2ad_return_output;

     -- MUX[uxn_opcodes_h_l2120_c32_aecc] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2120_c32_aecc_cond <= VAR_MUX_uxn_opcodes_h_l2120_c32_aecc_cond;
     MUX_uxn_opcodes_h_l2120_c32_aecc_iftrue <= VAR_MUX_uxn_opcodes_h_l2120_c32_aecc_iftrue;
     MUX_uxn_opcodes_h_l2120_c32_aecc_iffalse <= VAR_MUX_uxn_opcodes_h_l2120_c32_aecc_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2120_c32_aecc_return_output := MUX_uxn_opcodes_h_l2120_c32_aecc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2122_c7_d2ad] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_d2ad_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_d2ad_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_d2ad_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_d2ad_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_d2ad_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_d2ad_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_d2ad_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_d2ad_return_output;

     -- n8_MUX[uxn_opcodes_h_l2113_c7_51aa] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2113_c7_51aa_cond <= VAR_n8_MUX_uxn_opcodes_h_l2113_c7_51aa_cond;
     n8_MUX_uxn_opcodes_h_l2113_c7_51aa_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2113_c7_51aa_iftrue;
     n8_MUX_uxn_opcodes_h_l2113_c7_51aa_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2113_c7_51aa_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output := n8_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output;

     -- printf_uxn_opcodes_h_l2101_c3_b204[uxn_opcodes_h_l2101_c3_b204] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2101_c3_b204_uxn_opcodes_h_l2101_c3_b204_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2101_c3_b204_uxn_opcodes_h_l2101_c3_b204_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc_iftrue := VAR_MUX_uxn_opcodes_h_l2120_c32_aecc_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_6cdc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_d2ad_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_51aa_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_6cdc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2122_c7_d2ad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_51aa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_6cdc_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2122_c7_d2ad_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2106_c7_b987_return_output;
     -- t8_MUX[uxn_opcodes_h_l2100_c2_6473] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2100_c2_6473_cond <= VAR_t8_MUX_uxn_opcodes_h_l2100_c2_6473_cond;
     t8_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue;
     t8_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2100_c2_6473_return_output := t8_MUX_uxn_opcodes_h_l2100_c2_6473_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2116_c7_6cdc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_6cdc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_6cdc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_6cdc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_6cdc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_6cdc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_6cdc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2116_c7_6cdc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_6cdc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_6cdc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_6cdc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_6cdc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_6cdc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_6cdc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2113_c7_51aa] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_51aa_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_51aa_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_51aa_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_51aa_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_51aa_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_51aa_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2116_c7_6cdc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2116_c7_6cdc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_6cdc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2116_c7_6cdc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_6cdc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2116_c7_6cdc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_6cdc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output := result_stack_value_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2109_c7_1df2] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_1df2_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_1df2_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output;

     -- n8_MUX[uxn_opcodes_h_l2109_c7_1df2] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2109_c7_1df2_cond <= VAR_n8_MUX_uxn_opcodes_h_l2109_c7_1df2_cond;
     n8_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue;
     n8_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output := n8_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2113_c7_51aa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_51aa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_51aa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_51aa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_51aa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_51aa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_51aa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2116_c7_6cdc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_51aa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_51aa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_51aa_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2113_c7_51aa_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_6cdc_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2100_c2_6473_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2113_c7_51aa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_51aa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_51aa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_51aa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_51aa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_51aa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_51aa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output;

     -- n8_MUX[uxn_opcodes_h_l2106_c7_b987] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2106_c7_b987_cond <= VAR_n8_MUX_uxn_opcodes_h_l2106_c7_b987_cond;
     n8_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue;
     n8_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2106_c7_b987_return_output := n8_MUX_uxn_opcodes_h_l2106_c7_b987_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2113_c7_51aa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_51aa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_51aa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_51aa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_51aa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_51aa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_51aa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2109_c7_1df2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_1df2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_1df2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2113_c7_51aa] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2113_c7_51aa_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2113_c7_51aa_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2113_c7_51aa_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2113_c7_51aa_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2113_c7_51aa_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2113_c7_51aa_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output := result_stack_value_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2109_c7_1df2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_1df2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_1df2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2113_c7_51aa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_51aa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_51aa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_51aa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_51aa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_51aa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_51aa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2106_c7_b987] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2106_c7_b987_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2106_c7_b987_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2106_c7_b987_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2106_c7_b987_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2106_c7_b987_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2106_c7_b987_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2113_c7_51aa_return_output;
     -- n8_MUX[uxn_opcodes_h_l2100_c2_6473] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2100_c2_6473_cond <= VAR_n8_MUX_uxn_opcodes_h_l2100_c2_6473_cond;
     n8_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue;
     n8_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2100_c2_6473_return_output := n8_MUX_uxn_opcodes_h_l2100_c2_6473_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2109_c7_1df2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2109_c7_1df2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2109_c7_1df2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output := result_stack_value_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2109_c7_1df2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_1df2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_1df2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2109_c7_1df2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_1df2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_1df2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2100_c2_6473] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2100_c2_6473_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2100_c2_6473_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2100_c2_6473_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2100_c2_6473_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2106_c7_b987] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2106_c7_b987_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2106_c7_b987_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2106_c7_b987_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2106_c7_b987_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2106_c7_b987] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_b987_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_b987_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_b987_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_b987_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2109_c7_1df2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_1df2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_1df2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_1df2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_1df2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2100_c2_6473_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2106_c7_b987_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_b987_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2109_c7_1df2_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2106_c7_b987] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_b987_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_b987_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_b987_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_b987_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2100_c2_6473] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c2_6473_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c2_6473_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c2_6473_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c2_6473_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2100_c2_6473] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c2_6473_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c2_6473_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c2_6473_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c2_6473_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2106_c7_b987] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_b987_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_b987_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_b987_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_b987_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2106_c7_b987] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2106_c7_b987_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2106_c7_b987_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2106_c7_b987_return_output := result_stack_value_MUX_uxn_opcodes_h_l2106_c7_b987_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2106_c7_b987] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_b987_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_b987_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_b987_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_b987_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_b987_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_b987_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_b987_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_b987_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_b987_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2106_c7_b987_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2100_c2_6473] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c2_6473_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c2_6473_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c2_6473_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c2_6473_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2100_c2_6473] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2100_c2_6473_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2100_c2_6473_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2100_c2_6473_return_output := result_stack_value_MUX_uxn_opcodes_h_l2100_c2_6473_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2100_c2_6473] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2100_c2_6473_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2100_c2_6473_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2100_c2_6473_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2100_c2_6473_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2100_c2_6473] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2100_c2_6473_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2100_c2_6473_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2100_c2_6473_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2100_c2_6473_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2100_c2_6473_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2100_c2_6473_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2133_l2096_DUPLICATE_efbd LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2133_l2096_DUPLICATE_efbd_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_287e(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c2_6473_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2100_c2_6473_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2100_c2_6473_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c2_6473_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c2_6473_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2100_c2_6473_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2100_c2_6473_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2133_l2096_DUPLICATE_efbd_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2133_l2096_DUPLICATE_efbd_return_output;
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
