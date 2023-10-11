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
-- Submodules: 59
entity mul_0CLK_3220bbf1 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end mul_0CLK_3220bbf1;
architecture arch of mul_0CLK_3220bbf1 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2135_c6_93a6]
signal BIN_OP_EQ_uxn_opcodes_h_l2135_c6_93a6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2135_c6_93a6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2135_c6_93a6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2135_c1_bbc5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2135_c1_bbc5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2135_c1_bbc5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2135_c1_bbc5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2135_c1_bbc5_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2135_c2_1811]
signal t8_MUX_uxn_opcodes_h_l2135_c2_1811_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2135_c2_1811_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2135_c2_1811_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2135_c2_1811_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2135_c2_1811]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2135_c2_1811_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2135_c2_1811_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2135_c2_1811_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2135_c2_1811_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2135_c2_1811]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2135_c2_1811_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2135_c2_1811_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2135_c2_1811_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2135_c2_1811_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2135_c2_1811]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2135_c2_1811_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2135_c2_1811_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2135_c2_1811_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2135_c2_1811_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2135_c2_1811]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2135_c2_1811_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2135_c2_1811_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2135_c2_1811_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2135_c2_1811_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2135_c2_1811]
signal result_stack_value_MUX_uxn_opcodes_h_l2135_c2_1811_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2135_c2_1811_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2135_c2_1811_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2135_c2_1811_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2135_c2_1811]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2135_c2_1811_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2135_c2_1811_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2135_c2_1811_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2135_c2_1811_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2135_c2_1811]
signal n8_MUX_uxn_opcodes_h_l2135_c2_1811_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2135_c2_1811_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2135_c2_1811_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2135_c2_1811_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l2136_c3_8c77[uxn_opcodes_h_l2136_c3_8c77]
signal printf_uxn_opcodes_h_l2136_c3_8c77_uxn_opcodes_h_l2136_c3_8c77_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2140_c11_8e03]
signal BIN_OP_EQ_uxn_opcodes_h_l2140_c11_8e03_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2140_c11_8e03_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2140_c11_8e03_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2140_c7_cf35]
signal t8_MUX_uxn_opcodes_h_l2140_c7_cf35_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2140_c7_cf35_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2140_c7_cf35_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2140_c7_cf35]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_cf35_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_cf35_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_cf35_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2140_c7_cf35]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_cf35_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_cf35_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_cf35_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2140_c7_cf35]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_cf35_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_cf35_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_cf35_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2140_c7_cf35]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_cf35_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_cf35_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_cf35_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2140_c7_cf35]
signal result_stack_value_MUX_uxn_opcodes_h_l2140_c7_cf35_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2140_c7_cf35_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2140_c7_cf35_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2140_c7_cf35]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_cf35_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_cf35_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_cf35_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2140_c7_cf35]
signal n8_MUX_uxn_opcodes_h_l2140_c7_cf35_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2140_c7_cf35_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2140_c7_cf35_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2143_c11_8ced]
signal BIN_OP_EQ_uxn_opcodes_h_l2143_c11_8ced_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2143_c11_8ced_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2143_c11_8ced_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2143_c7_d85b]
signal t8_MUX_uxn_opcodes_h_l2143_c7_d85b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2143_c7_d85b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2143_c7_d85b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2143_c7_d85b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_d85b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_d85b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_d85b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2143_c7_d85b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_d85b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_d85b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_d85b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2143_c7_d85b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_d85b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_d85b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_d85b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2143_c7_d85b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_d85b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_d85b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_d85b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2143_c7_d85b]
signal result_stack_value_MUX_uxn_opcodes_h_l2143_c7_d85b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2143_c7_d85b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2143_c7_d85b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2143_c7_d85b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_d85b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_d85b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_d85b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2143_c7_d85b]
signal n8_MUX_uxn_opcodes_h_l2143_c7_d85b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2143_c7_d85b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2143_c7_d85b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2147_c11_be47]
signal BIN_OP_EQ_uxn_opcodes_h_l2147_c11_be47_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2147_c11_be47_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2147_c11_be47_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2147_c7_c6d9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_c6d9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_c6d9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_c6d9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_c6d9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2147_c7_c6d9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_c6d9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_c6d9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_c6d9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_c6d9_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2147_c7_c6d9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2147_c7_c6d9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_c6d9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_c6d9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_c6d9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_c6d9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2147_c7_c6d9]
signal result_stack_value_MUX_uxn_opcodes_h_l2147_c7_c6d9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2147_c7_c6d9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2147_c7_c6d9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2147_c7_c6d9_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2147_c7_c6d9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2147_c7_c6d9]
signal n8_MUX_uxn_opcodes_h_l2147_c7_c6d9_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2147_c7_c6d9_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2147_c7_c6d9_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2147_c7_c6d9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2150_c11_82b0]
signal BIN_OP_EQ_uxn_opcodes_h_l2150_c11_82b0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2150_c11_82b0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2150_c11_82b0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2150_c7_845e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_845e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_845e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_845e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_845e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2150_c7_845e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_845e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_845e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_845e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_845e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2150_c7_845e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_845e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_845e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_845e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_845e_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2150_c7_845e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_845e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_845e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_845e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_845e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2150_c7_845e]
signal result_stack_value_MUX_uxn_opcodes_h_l2150_c7_845e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2150_c7_845e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2150_c7_845e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2150_c7_845e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2150_c7_845e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_845e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_845e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_845e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_845e_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2150_c7_845e]
signal n8_MUX_uxn_opcodes_h_l2150_c7_845e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2150_c7_845e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2150_c7_845e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2150_c7_845e_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2153_c32_417e]
signal BIN_OP_AND_uxn_opcodes_h_l2153_c32_417e_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2153_c32_417e_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2153_c32_417e_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2153_c32_28ac]
signal BIN_OP_GT_uxn_opcodes_h_l2153_c32_28ac_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2153_c32_28ac_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2153_c32_28ac_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2153_c32_0171]
signal MUX_uxn_opcodes_h_l2153_c32_0171_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2153_c32_0171_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2153_c32_0171_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2153_c32_0171_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2155_c11_92ed]
signal BIN_OP_EQ_uxn_opcodes_h_l2155_c11_92ed_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2155_c11_92ed_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2155_c11_92ed_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2155_c7_c7fa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_c7fa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_c7fa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_c7fa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_c7fa_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2155_c7_c7fa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_c7fa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_c7fa_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_c7fa_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_c7fa_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2155_c7_c7fa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_c7fa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_c7fa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_c7fa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_c7fa_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2155_c7_c7fa]
signal result_stack_value_MUX_uxn_opcodes_h_l2155_c7_c7fa_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2155_c7_c7fa_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2155_c7_c7fa_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2155_c7_c7fa_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2155_c7_c7fa]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2155_c7_c7fa_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2155_c7_c7fa_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2155_c7_c7fa_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2155_c7_c7fa_return_output : unsigned(0 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2159_c24_e956]
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2159_c24_e956_left : unsigned(7 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2159_c24_e956_right : unsigned(7 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2159_c24_e956_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2161_c11_ed85]
signal BIN_OP_EQ_uxn_opcodes_h_l2161_c11_ed85_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2161_c11_ed85_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2161_c11_ed85_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2161_c7_d037]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_d037_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_d037_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_d037_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_d037_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2161_c7_d037]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_d037_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_d037_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_d037_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_d037_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_53ff( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.is_sp_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2135_c6_93a6
BIN_OP_EQ_uxn_opcodes_h_l2135_c6_93a6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2135_c6_93a6_left,
BIN_OP_EQ_uxn_opcodes_h_l2135_c6_93a6_right,
BIN_OP_EQ_uxn_opcodes_h_l2135_c6_93a6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2135_c1_bbc5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2135_c1_bbc5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2135_c1_bbc5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2135_c1_bbc5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2135_c1_bbc5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2135_c1_bbc5_return_output);

-- t8_MUX_uxn_opcodes_h_l2135_c2_1811
t8_MUX_uxn_opcodes_h_l2135_c2_1811 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2135_c2_1811_cond,
t8_MUX_uxn_opcodes_h_l2135_c2_1811_iftrue,
t8_MUX_uxn_opcodes_h_l2135_c2_1811_iffalse,
t8_MUX_uxn_opcodes_h_l2135_c2_1811_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2135_c2_1811
result_is_stack_write_MUX_uxn_opcodes_h_l2135_c2_1811 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2135_c2_1811_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2135_c2_1811_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2135_c2_1811_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2135_c2_1811_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2135_c2_1811
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2135_c2_1811 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2135_c2_1811_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2135_c2_1811_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2135_c2_1811_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2135_c2_1811_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2135_c2_1811
result_sp_relative_shift_MUX_uxn_opcodes_h_l2135_c2_1811 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2135_c2_1811_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2135_c2_1811_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2135_c2_1811_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2135_c2_1811_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2135_c2_1811
result_is_opc_done_MUX_uxn_opcodes_h_l2135_c2_1811 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2135_c2_1811_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2135_c2_1811_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2135_c2_1811_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2135_c2_1811_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2135_c2_1811
result_stack_value_MUX_uxn_opcodes_h_l2135_c2_1811 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2135_c2_1811_cond,
result_stack_value_MUX_uxn_opcodes_h_l2135_c2_1811_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2135_c2_1811_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2135_c2_1811_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2135_c2_1811
result_is_sp_shift_MUX_uxn_opcodes_h_l2135_c2_1811 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2135_c2_1811_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2135_c2_1811_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2135_c2_1811_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2135_c2_1811_return_output);

-- n8_MUX_uxn_opcodes_h_l2135_c2_1811
n8_MUX_uxn_opcodes_h_l2135_c2_1811 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2135_c2_1811_cond,
n8_MUX_uxn_opcodes_h_l2135_c2_1811_iftrue,
n8_MUX_uxn_opcodes_h_l2135_c2_1811_iffalse,
n8_MUX_uxn_opcodes_h_l2135_c2_1811_return_output);

-- printf_uxn_opcodes_h_l2136_c3_8c77_uxn_opcodes_h_l2136_c3_8c77
printf_uxn_opcodes_h_l2136_c3_8c77_uxn_opcodes_h_l2136_c3_8c77 : entity work.printf_uxn_opcodes_h_l2136_c3_8c77_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2136_c3_8c77_uxn_opcodes_h_l2136_c3_8c77_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2140_c11_8e03
BIN_OP_EQ_uxn_opcodes_h_l2140_c11_8e03 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2140_c11_8e03_left,
BIN_OP_EQ_uxn_opcodes_h_l2140_c11_8e03_right,
BIN_OP_EQ_uxn_opcodes_h_l2140_c11_8e03_return_output);

-- t8_MUX_uxn_opcodes_h_l2140_c7_cf35
t8_MUX_uxn_opcodes_h_l2140_c7_cf35 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2140_c7_cf35_cond,
t8_MUX_uxn_opcodes_h_l2140_c7_cf35_iftrue,
t8_MUX_uxn_opcodes_h_l2140_c7_cf35_iffalse,
t8_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_cf35
result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_cf35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_cf35_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_cf35_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_cf35_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_cf35
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_cf35 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_cf35_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_cf35_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_cf35_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_cf35
result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_cf35 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_cf35_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_cf35_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_cf35_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_cf35
result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_cf35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_cf35_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_cf35_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_cf35_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2140_c7_cf35
result_stack_value_MUX_uxn_opcodes_h_l2140_c7_cf35 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2140_c7_cf35_cond,
result_stack_value_MUX_uxn_opcodes_h_l2140_c7_cf35_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2140_c7_cf35_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_cf35
result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_cf35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_cf35_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_cf35_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_cf35_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output);

-- n8_MUX_uxn_opcodes_h_l2140_c7_cf35
n8_MUX_uxn_opcodes_h_l2140_c7_cf35 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2140_c7_cf35_cond,
n8_MUX_uxn_opcodes_h_l2140_c7_cf35_iftrue,
n8_MUX_uxn_opcodes_h_l2140_c7_cf35_iffalse,
n8_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2143_c11_8ced
BIN_OP_EQ_uxn_opcodes_h_l2143_c11_8ced : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2143_c11_8ced_left,
BIN_OP_EQ_uxn_opcodes_h_l2143_c11_8ced_right,
BIN_OP_EQ_uxn_opcodes_h_l2143_c11_8ced_return_output);

-- t8_MUX_uxn_opcodes_h_l2143_c7_d85b
t8_MUX_uxn_opcodes_h_l2143_c7_d85b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2143_c7_d85b_cond,
t8_MUX_uxn_opcodes_h_l2143_c7_d85b_iftrue,
t8_MUX_uxn_opcodes_h_l2143_c7_d85b_iffalse,
t8_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_d85b
result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_d85b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_d85b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_d85b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_d85b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_d85b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_d85b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_d85b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_d85b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_d85b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_d85b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_d85b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_d85b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_d85b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_d85b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_d85b
result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_d85b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_d85b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_d85b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_d85b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2143_c7_d85b
result_stack_value_MUX_uxn_opcodes_h_l2143_c7_d85b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2143_c7_d85b_cond,
result_stack_value_MUX_uxn_opcodes_h_l2143_c7_d85b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2143_c7_d85b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_d85b
result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_d85b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_d85b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_d85b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_d85b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output);

-- n8_MUX_uxn_opcodes_h_l2143_c7_d85b
n8_MUX_uxn_opcodes_h_l2143_c7_d85b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2143_c7_d85b_cond,
n8_MUX_uxn_opcodes_h_l2143_c7_d85b_iftrue,
n8_MUX_uxn_opcodes_h_l2143_c7_d85b_iffalse,
n8_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2147_c11_be47
BIN_OP_EQ_uxn_opcodes_h_l2147_c11_be47 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2147_c11_be47_left,
BIN_OP_EQ_uxn_opcodes_h_l2147_c11_be47_right,
BIN_OP_EQ_uxn_opcodes_h_l2147_c11_be47_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_c6d9
result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_c6d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_c6d9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_c6d9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_c6d9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_c6d9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_c6d9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_c6d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_c6d9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_c6d9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_c6d9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_c6d9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_c6d9
result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_c6d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_c6d9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_c6d9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_c6d9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_c6d9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2147_c7_c6d9
result_stack_value_MUX_uxn_opcodes_h_l2147_c7_c6d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2147_c7_c6d9_cond,
result_stack_value_MUX_uxn_opcodes_h_l2147_c7_c6d9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2147_c7_c6d9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2147_c7_c6d9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9
result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9_return_output);

-- n8_MUX_uxn_opcodes_h_l2147_c7_c6d9
n8_MUX_uxn_opcodes_h_l2147_c7_c6d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2147_c7_c6d9_cond,
n8_MUX_uxn_opcodes_h_l2147_c7_c6d9_iftrue,
n8_MUX_uxn_opcodes_h_l2147_c7_c6d9_iffalse,
n8_MUX_uxn_opcodes_h_l2147_c7_c6d9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2150_c11_82b0
BIN_OP_EQ_uxn_opcodes_h_l2150_c11_82b0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2150_c11_82b0_left,
BIN_OP_EQ_uxn_opcodes_h_l2150_c11_82b0_right,
BIN_OP_EQ_uxn_opcodes_h_l2150_c11_82b0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_845e
result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_845e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_845e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_845e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_845e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_845e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_845e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_845e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_845e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_845e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_845e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_845e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_845e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_845e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_845e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_845e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_845e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_845e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_845e
result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_845e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_845e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_845e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_845e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_845e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2150_c7_845e
result_stack_value_MUX_uxn_opcodes_h_l2150_c7_845e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2150_c7_845e_cond,
result_stack_value_MUX_uxn_opcodes_h_l2150_c7_845e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2150_c7_845e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2150_c7_845e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_845e
result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_845e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_845e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_845e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_845e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_845e_return_output);

-- n8_MUX_uxn_opcodes_h_l2150_c7_845e
n8_MUX_uxn_opcodes_h_l2150_c7_845e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2150_c7_845e_cond,
n8_MUX_uxn_opcodes_h_l2150_c7_845e_iftrue,
n8_MUX_uxn_opcodes_h_l2150_c7_845e_iffalse,
n8_MUX_uxn_opcodes_h_l2150_c7_845e_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2153_c32_417e
BIN_OP_AND_uxn_opcodes_h_l2153_c32_417e : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2153_c32_417e_left,
BIN_OP_AND_uxn_opcodes_h_l2153_c32_417e_right,
BIN_OP_AND_uxn_opcodes_h_l2153_c32_417e_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2153_c32_28ac
BIN_OP_GT_uxn_opcodes_h_l2153_c32_28ac : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2153_c32_28ac_left,
BIN_OP_GT_uxn_opcodes_h_l2153_c32_28ac_right,
BIN_OP_GT_uxn_opcodes_h_l2153_c32_28ac_return_output);

-- MUX_uxn_opcodes_h_l2153_c32_0171
MUX_uxn_opcodes_h_l2153_c32_0171 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2153_c32_0171_cond,
MUX_uxn_opcodes_h_l2153_c32_0171_iftrue,
MUX_uxn_opcodes_h_l2153_c32_0171_iffalse,
MUX_uxn_opcodes_h_l2153_c32_0171_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2155_c11_92ed
BIN_OP_EQ_uxn_opcodes_h_l2155_c11_92ed : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2155_c11_92ed_left,
BIN_OP_EQ_uxn_opcodes_h_l2155_c11_92ed_right,
BIN_OP_EQ_uxn_opcodes_h_l2155_c11_92ed_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_c7fa
result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_c7fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_c7fa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_c7fa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_c7fa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_c7fa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_c7fa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_c7fa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_c7fa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_c7fa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_c7fa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_c7fa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_c7fa
result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_c7fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_c7fa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_c7fa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_c7fa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_c7fa_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2155_c7_c7fa
result_stack_value_MUX_uxn_opcodes_h_l2155_c7_c7fa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2155_c7_c7fa_cond,
result_stack_value_MUX_uxn_opcodes_h_l2155_c7_c7fa_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2155_c7_c7fa_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2155_c7_c7fa_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2155_c7_c7fa
result_is_sp_shift_MUX_uxn_opcodes_h_l2155_c7_c7fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2155_c7_c7fa_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2155_c7_c7fa_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2155_c7_c7fa_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2155_c7_c7fa_return_output);

-- BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2159_c24_e956
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2159_c24_e956 : entity work.BIN_OP_INFERRED_MULT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2159_c24_e956_left,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2159_c24_e956_right,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2159_c24_e956_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2161_c11_ed85
BIN_OP_EQ_uxn_opcodes_h_l2161_c11_ed85 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2161_c11_ed85_left,
BIN_OP_EQ_uxn_opcodes_h_l2161_c11_ed85_right,
BIN_OP_EQ_uxn_opcodes_h_l2161_c11_ed85_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_d037
result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_d037 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_d037_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_d037_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_d037_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_d037_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_d037
result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_d037 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_d037_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_d037_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_d037_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_d037_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2135_c6_93a6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2135_c1_bbc5_return_output,
 t8_MUX_uxn_opcodes_h_l2135_c2_1811_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2135_c2_1811_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2135_c2_1811_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2135_c2_1811_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2135_c2_1811_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2135_c2_1811_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2135_c2_1811_return_output,
 n8_MUX_uxn_opcodes_h_l2135_c2_1811_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2140_c11_8e03_return_output,
 t8_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output,
 n8_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2143_c11_8ced_return_output,
 t8_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output,
 n8_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2147_c11_be47_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_c6d9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_c6d9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_c6d9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2147_c7_c6d9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9_return_output,
 n8_MUX_uxn_opcodes_h_l2147_c7_c6d9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2150_c11_82b0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_845e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_845e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_845e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_845e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2150_c7_845e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_845e_return_output,
 n8_MUX_uxn_opcodes_h_l2150_c7_845e_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2153_c32_417e_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2153_c32_28ac_return_output,
 MUX_uxn_opcodes_h_l2153_c32_0171_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2155_c11_92ed_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_c7fa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_c7fa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_c7fa_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2155_c7_c7fa_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2155_c7_c7fa_return_output,
 BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2159_c24_e956_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2161_c11_ed85_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_d037_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_d037_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2135_c6_93a6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2135_c6_93a6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2135_c6_93a6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2135_c1_bbc5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2135_c1_bbc5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2135_c1_bbc5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2135_c1_bbc5_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2135_c2_1811_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2135_c2_1811_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2135_c2_1811_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2135_c2_1811_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2135_c2_1811_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2135_c2_1811_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2135_c2_1811_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2135_c2_1811_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2135_c2_1811_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2137_c3_3363 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2135_c2_1811_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2135_c2_1811_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2135_c2_1811_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2135_c2_1811_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2135_c2_1811_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2135_c2_1811_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2135_c2_1811_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2135_c2_1811_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2135_c2_1811_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2135_c2_1811_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2135_c2_1811_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2135_c2_1811_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2135_c2_1811_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2135_c2_1811_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2135_c2_1811_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2135_c2_1811_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2135_c2_1811_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2135_c2_1811_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2135_c2_1811_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2135_c2_1811_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2135_c2_1811_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2135_c2_1811_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2135_c2_1811_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2136_c3_8c77_uxn_opcodes_h_l2136_c3_8c77_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2140_c11_8e03_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2140_c11_8e03_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2140_c11_8e03_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2140_c7_cf35_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2140_c7_cf35_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2140_c7_cf35_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_cf35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_cf35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_cf35_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_cf35_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2141_c3_35c6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_cf35_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_cf35_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_cf35_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_cf35_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_cf35_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_cf35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_cf35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_cf35_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2140_c7_cf35_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2140_c7_cf35_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2140_c7_cf35_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_cf35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_cf35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_cf35_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2140_c7_cf35_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2140_c7_cf35_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2140_c7_cf35_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2143_c11_8ced_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2143_c11_8ced_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2143_c11_8ced_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2143_c7_d85b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2143_c7_d85b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2143_c7_d85b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_d85b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_d85b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_c6d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_d85b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_d85b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2145_c3_5912 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_d85b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_c6d9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_d85b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_d85b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_d85b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_d85b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_d85b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_d85b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_c6d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_d85b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2143_c7_d85b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2143_c7_d85b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2147_c7_c6d9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2143_c7_d85b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_d85b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_d85b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_d85b_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2143_c7_d85b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2143_c7_d85b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2147_c7_c6d9_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2143_c7_d85b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2147_c11_be47_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2147_c11_be47_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2147_c11_be47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_c6d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_c6d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_845e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_c6d9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_c6d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2148_c3_806b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_c6d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_845e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_c6d9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_845e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_c6d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_c6d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_845e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_c6d9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2147_c7_c6d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2147_c7_c6d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2150_c7_845e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2147_c7_c6d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_845e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2147_c7_c6d9_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2147_c7_c6d9_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2150_c7_845e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2147_c7_c6d9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2150_c11_82b0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2150_c11_82b0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2150_c11_82b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_845e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_845e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_c7fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_845e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_845e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_845e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_c7fa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_845e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_845e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_845e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_845e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_845e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_845e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_c7fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_845e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2150_c7_845e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2150_c7_845e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2155_c7_c7fa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2150_c7_845e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_845e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_845e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2155_c7_c7fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_845e_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2150_c7_845e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2150_c7_845e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2150_c7_845e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2153_c32_0171_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2153_c32_0171_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2153_c32_0171_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2153_c32_417e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2153_c32_417e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2153_c32_417e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2153_c32_28ac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2153_c32_28ac_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2153_c32_28ac_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2153_c32_0171_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2155_c11_92ed_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2155_c11_92ed_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2155_c11_92ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_c7fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_c7fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_d037_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_c7fa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_c7fa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2158_c3_f9b2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_c7fa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_c7fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_c7fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_c7fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_d037_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_c7fa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2155_c7_c7fa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_uxn_opcodes_h_l2159_c3_679a : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2155_c7_c7fa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2155_c7_c7fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2155_c7_c7fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2155_c7_c7fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2155_c7_c7fa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2159_c24_e956_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2159_c24_e956_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2159_c24_e956_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2161_c11_ed85_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2161_c11_ed85_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2161_c11_ed85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_d037_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_d037_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_d037_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_d037_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_d037_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_d037_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2150_l2147_l2143_l2140_l2135_l2161_DUPLICATE_bcd2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2150_l2147_l2143_l2140_l2135_DUPLICATE_0c0b_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2150_l2147_l2143_l2140_l2135_l2155_DUPLICATE_a6bc_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2147_l2143_l2140_l2135_l2155_DUPLICATE_ebaa_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2150_l2147_l2143_l2140_l2161_l2155_DUPLICATE_dfbe_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2150_l2155_DUPLICATE_b569_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2131_l2166_DUPLICATE_56a2_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2143_c11_8ced_right := to_unsigned(2, 2);
     VAR_MUX_uxn_opcodes_h_l2153_c32_0171_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2137_c3_3363 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2135_c2_1811_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2137_c3_3363;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2147_c11_be47_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2140_c11_8e03_right := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2153_c32_0171_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2135_c2_1811_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_845e_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2141_c3_35c6 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_cf35_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2141_c3_35c6;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2153_c32_28ac_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_c7fa_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_d037_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2158_c3_f9b2 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_c7fa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2158_c3_f9b2;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2153_c32_417e_right := to_unsigned(128, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2135_c1_bbc5_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2145_c3_5912 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_d85b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2145_c3_5912;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2155_c11_92ed_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_d037_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2135_c6_93a6_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2161_c11_ed85_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2148_c3_806b := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_c6d9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2148_c3_806b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2150_c11_82b0_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2155_c7_c7fa_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2135_c1_bbc5_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2153_c32_417e_left := VAR_ins;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2159_c24_e956_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2135_c2_1811_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2140_c7_cf35_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2143_c7_d85b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2147_c7_c6d9_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2150_c7_845e_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2135_c6_93a6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2140_c11_8e03_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2143_c11_8ced_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2147_c11_be47_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2150_c11_82b0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2155_c11_92ed_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2161_c11_ed85_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2150_c7_845e_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2143_c7_d85b_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2159_c24_e956_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2135_c2_1811_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2140_c7_cf35_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2143_c7_d85b_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2147_l2143_l2140_l2135_l2155_DUPLICATE_ebaa LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2147_l2143_l2140_l2135_l2155_DUPLICATE_ebaa_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2150_l2155_DUPLICATE_b569 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2150_l2155_DUPLICATE_b569_return_output := result.stack_address_sp_offset;

     -- BIN_OP_AND[uxn_opcodes_h_l2153_c32_417e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2153_c32_417e_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2153_c32_417e_left;
     BIN_OP_AND_uxn_opcodes_h_l2153_c32_417e_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2153_c32_417e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2153_c32_417e_return_output := BIN_OP_AND_uxn_opcodes_h_l2153_c32_417e_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2150_l2147_l2143_l2140_l2135_DUPLICATE_0c0b LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2150_l2147_l2143_l2140_l2135_DUPLICATE_0c0b_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2135_c6_93a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2135_c6_93a6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2135_c6_93a6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2135_c6_93a6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2135_c6_93a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2135_c6_93a6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2135_c6_93a6_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2150_l2147_l2143_l2140_l2135_l2155_DUPLICATE_a6bc LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2150_l2147_l2143_l2140_l2135_l2155_DUPLICATE_a6bc_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2143_c11_8ced] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2143_c11_8ced_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2143_c11_8ced_left;
     BIN_OP_EQ_uxn_opcodes_h_l2143_c11_8ced_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2143_c11_8ced_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2143_c11_8ced_return_output := BIN_OP_EQ_uxn_opcodes_h_l2143_c11_8ced_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2161_c11_ed85] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2161_c11_ed85_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2161_c11_ed85_left;
     BIN_OP_EQ_uxn_opcodes_h_l2161_c11_ed85_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2161_c11_ed85_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2161_c11_ed85_return_output := BIN_OP_EQ_uxn_opcodes_h_l2161_c11_ed85_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2150_c11_82b0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2150_c11_82b0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2150_c11_82b0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2150_c11_82b0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2150_c11_82b0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2150_c11_82b0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2150_c11_82b0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2150_l2147_l2143_l2140_l2135_l2161_DUPLICATE_bcd2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2150_l2147_l2143_l2140_l2135_l2161_DUPLICATE_bcd2_return_output := result.is_stack_write;

     -- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2159_c24_e956] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2159_c24_e956_left <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2159_c24_e956_left;
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2159_c24_e956_right <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2159_c24_e956_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2159_c24_e956_return_output := BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2159_c24_e956_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2150_l2147_l2143_l2140_l2161_l2155_DUPLICATE_dfbe LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2150_l2147_l2143_l2140_l2161_l2155_DUPLICATE_dfbe_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2140_c11_8e03] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2140_c11_8e03_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2140_c11_8e03_left;
     BIN_OP_EQ_uxn_opcodes_h_l2140_c11_8e03_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2140_c11_8e03_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2140_c11_8e03_return_output := BIN_OP_EQ_uxn_opcodes_h_l2140_c11_8e03_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2147_c11_be47] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2147_c11_be47_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2147_c11_be47_left;
     BIN_OP_EQ_uxn_opcodes_h_l2147_c11_be47_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2147_c11_be47_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2147_c11_be47_return_output := BIN_OP_EQ_uxn_opcodes_h_l2147_c11_be47_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2155_c11_92ed] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2155_c11_92ed_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2155_c11_92ed_left;
     BIN_OP_EQ_uxn_opcodes_h_l2155_c11_92ed_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2155_c11_92ed_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2155_c11_92ed_return_output := BIN_OP_EQ_uxn_opcodes_h_l2155_c11_92ed_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2153_c32_28ac_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2153_c32_417e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2135_c1_bbc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2135_c6_93a6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2135_c2_1811_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2135_c6_93a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2135_c2_1811_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2135_c6_93a6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2135_c2_1811_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2135_c6_93a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2135_c2_1811_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2135_c6_93a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2135_c2_1811_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2135_c6_93a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2135_c2_1811_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2135_c6_93a6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2135_c2_1811_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2135_c6_93a6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2135_c2_1811_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2135_c6_93a6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2140_c7_cf35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2140_c11_8e03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_cf35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2140_c11_8e03_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_cf35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2140_c11_8e03_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_cf35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2140_c11_8e03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_cf35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2140_c11_8e03_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_cf35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2140_c11_8e03_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2140_c7_cf35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2140_c11_8e03_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2140_c7_cf35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2140_c11_8e03_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2143_c7_d85b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2143_c11_8ced_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_d85b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2143_c11_8ced_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_d85b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2143_c11_8ced_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_d85b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2143_c11_8ced_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_d85b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2143_c11_8ced_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_d85b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2143_c11_8ced_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2143_c7_d85b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2143_c11_8ced_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2143_c7_d85b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2143_c11_8ced_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2147_c7_c6d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2147_c11_be47_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_c6d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2147_c11_be47_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2147_c11_be47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_c6d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2147_c11_be47_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2147_c11_be47_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_c6d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2147_c11_be47_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2147_c7_c6d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2147_c11_be47_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2150_c7_845e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2150_c11_82b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_845e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2150_c11_82b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_845e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2150_c11_82b0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_845e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2150_c11_82b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_845e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2150_c11_82b0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_845e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2150_c11_82b0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2150_c7_845e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2150_c11_82b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_c7fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2155_c11_92ed_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2155_c7_c7fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2155_c11_92ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_c7fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2155_c11_92ed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_c7fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2155_c11_92ed_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2155_c7_c7fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2155_c11_92ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_d037_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2161_c11_ed85_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_d037_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2161_c11_ed85_return_output;
     VAR_result_stack_value_uxn_opcodes_h_l2159_c3_679a := resize(VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2159_c24_e956_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2135_c2_1811_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2150_l2147_l2143_l2140_l2135_DUPLICATE_0c0b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_cf35_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2150_l2147_l2143_l2140_l2135_DUPLICATE_0c0b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_d85b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2150_l2147_l2143_l2140_l2135_DUPLICATE_0c0b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2150_l2147_l2143_l2140_l2135_DUPLICATE_0c0b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_845e_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2150_l2147_l2143_l2140_l2135_DUPLICATE_0c0b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_cf35_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2150_l2147_l2143_l2140_l2161_l2155_DUPLICATE_dfbe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_d85b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2150_l2147_l2143_l2140_l2161_l2155_DUPLICATE_dfbe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_c6d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2150_l2147_l2143_l2140_l2161_l2155_DUPLICATE_dfbe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_845e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2150_l2147_l2143_l2140_l2161_l2155_DUPLICATE_dfbe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_c7fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2150_l2147_l2143_l2140_l2161_l2155_DUPLICATE_dfbe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_d037_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2150_l2147_l2143_l2140_l2161_l2155_DUPLICATE_dfbe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2135_c2_1811_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2147_l2143_l2140_l2135_l2155_DUPLICATE_ebaa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_cf35_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2147_l2143_l2140_l2135_l2155_DUPLICATE_ebaa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_d85b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2147_l2143_l2140_l2135_l2155_DUPLICATE_ebaa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2147_l2143_l2140_l2135_l2155_DUPLICATE_ebaa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2155_c7_c7fa_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2147_l2143_l2140_l2135_l2155_DUPLICATE_ebaa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2135_c2_1811_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2150_l2147_l2143_l2140_l2135_l2161_DUPLICATE_bcd2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_cf35_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2150_l2147_l2143_l2140_l2135_l2161_DUPLICATE_bcd2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_d85b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2150_l2147_l2143_l2140_l2135_l2161_DUPLICATE_bcd2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_c6d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2150_l2147_l2143_l2140_l2135_l2161_DUPLICATE_bcd2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_845e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2150_l2147_l2143_l2140_l2135_l2161_DUPLICATE_bcd2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_d037_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2150_l2147_l2143_l2140_l2135_l2161_DUPLICATE_bcd2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_845e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2150_l2155_DUPLICATE_b569_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_c7fa_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2150_l2155_DUPLICATE_b569_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2135_c2_1811_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2150_l2147_l2143_l2140_l2135_l2155_DUPLICATE_a6bc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2140_c7_cf35_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2150_l2147_l2143_l2140_l2135_l2155_DUPLICATE_a6bc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2143_c7_d85b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2150_l2147_l2143_l2140_l2135_l2155_DUPLICATE_a6bc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2147_c7_c6d9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2150_l2147_l2143_l2140_l2135_l2155_DUPLICATE_a6bc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2150_c7_845e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2150_l2147_l2143_l2140_l2135_l2155_DUPLICATE_a6bc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2155_c7_c7fa_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2150_l2147_l2143_l2140_l2135_l2155_DUPLICATE_a6bc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2155_c7_c7fa_iftrue := VAR_result_stack_value_uxn_opcodes_h_l2159_c3_679a;
     -- BIN_OP_GT[uxn_opcodes_h_l2153_c32_28ac] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2153_c32_28ac_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2153_c32_28ac_left;
     BIN_OP_GT_uxn_opcodes_h_l2153_c32_28ac_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2153_c32_28ac_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2153_c32_28ac_return_output := BIN_OP_GT_uxn_opcodes_h_l2153_c32_28ac_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2135_c1_bbc5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2135_c1_bbc5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2135_c1_bbc5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2135_c1_bbc5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2135_c1_bbc5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2135_c1_bbc5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2135_c1_bbc5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2135_c1_bbc5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2135_c1_bbc5_return_output;

     -- t8_MUX[uxn_opcodes_h_l2143_c7_d85b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2143_c7_d85b_cond <= VAR_t8_MUX_uxn_opcodes_h_l2143_c7_d85b_cond;
     t8_MUX_uxn_opcodes_h_l2143_c7_d85b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2143_c7_d85b_iftrue;
     t8_MUX_uxn_opcodes_h_l2143_c7_d85b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2143_c7_d85b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output := t8_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2155_c7_c7fa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_c7fa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_c7fa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_c7fa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_c7fa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_c7fa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_c7fa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_c7fa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_c7fa_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2155_c7_c7fa] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2155_c7_c7fa_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2155_c7_c7fa_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2155_c7_c7fa_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2155_c7_c7fa_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2155_c7_c7fa_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2155_c7_c7fa_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2155_c7_c7fa_return_output := result_stack_value_MUX_uxn_opcodes_h_l2155_c7_c7fa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2161_c7_d037] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_d037_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_d037_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_d037_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_d037_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_d037_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_d037_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_d037_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_d037_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2161_c7_d037] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_d037_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_d037_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_d037_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_d037_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_d037_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_d037_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_d037_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_d037_return_output;

     -- n8_MUX[uxn_opcodes_h_l2150_c7_845e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2150_c7_845e_cond <= VAR_n8_MUX_uxn_opcodes_h_l2150_c7_845e_cond;
     n8_MUX_uxn_opcodes_h_l2150_c7_845e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2150_c7_845e_iftrue;
     n8_MUX_uxn_opcodes_h_l2150_c7_845e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2150_c7_845e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2150_c7_845e_return_output := n8_MUX_uxn_opcodes_h_l2150_c7_845e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2155_c7_c7fa] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2155_c7_c7fa_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2155_c7_c7fa_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2155_c7_c7fa_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2155_c7_c7fa_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2155_c7_c7fa_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2155_c7_c7fa_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2155_c7_c7fa_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2155_c7_c7fa_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2153_c32_0171_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2153_c32_28ac_return_output;
     VAR_printf_uxn_opcodes_h_l2136_c3_8c77_uxn_opcodes_h_l2136_c3_8c77_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2135_c1_bbc5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2147_c7_c6d9_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2150_c7_845e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_c7fa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_d037_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_845e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2155_c7_c7fa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_c7fa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_d037_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_845e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2155_c7_c7fa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2150_c7_845e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2155_c7_c7fa_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2140_c7_cf35_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output;
     -- t8_MUX[uxn_opcodes_h_l2140_c7_cf35] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2140_c7_cf35_cond <= VAR_t8_MUX_uxn_opcodes_h_l2140_c7_cf35_cond;
     t8_MUX_uxn_opcodes_h_l2140_c7_cf35_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2140_c7_cf35_iftrue;
     t8_MUX_uxn_opcodes_h_l2140_c7_cf35_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2140_c7_cf35_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output := t8_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output;

     -- printf_uxn_opcodes_h_l2136_c3_8c77[uxn_opcodes_h_l2136_c3_8c77] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2136_c3_8c77_uxn_opcodes_h_l2136_c3_8c77_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2136_c3_8c77_uxn_opcodes_h_l2136_c3_8c77_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- MUX[uxn_opcodes_h_l2153_c32_0171] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2153_c32_0171_cond <= VAR_MUX_uxn_opcodes_h_l2153_c32_0171_cond;
     MUX_uxn_opcodes_h_l2153_c32_0171_iftrue <= VAR_MUX_uxn_opcodes_h_l2153_c32_0171_iftrue;
     MUX_uxn_opcodes_h_l2153_c32_0171_iffalse <= VAR_MUX_uxn_opcodes_h_l2153_c32_0171_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2153_c32_0171_return_output := MUX_uxn_opcodes_h_l2153_c32_0171_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2155_c7_c7fa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_c7fa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_c7fa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_c7fa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_c7fa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_c7fa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_c7fa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_c7fa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_c7fa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2155_c7_c7fa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_c7fa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_c7fa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_c7fa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_c7fa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_c7fa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_c7fa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_c7fa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_c7fa_return_output;

     -- n8_MUX[uxn_opcodes_h_l2147_c7_c6d9] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2147_c7_c6d9_cond <= VAR_n8_MUX_uxn_opcodes_h_l2147_c7_c6d9_cond;
     n8_MUX_uxn_opcodes_h_l2147_c7_c6d9_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2147_c7_c6d9_iftrue;
     n8_MUX_uxn_opcodes_h_l2147_c7_c6d9_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2147_c7_c6d9_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2147_c7_c6d9_return_output := n8_MUX_uxn_opcodes_h_l2147_c7_c6d9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2150_c7_845e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2150_c7_845e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2150_c7_845e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2150_c7_845e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2150_c7_845e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2150_c7_845e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2150_c7_845e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2150_c7_845e_return_output := result_stack_value_MUX_uxn_opcodes_h_l2150_c7_845e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2150_c7_845e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_845e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_845e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_845e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_845e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_845e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_845e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_845e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_845e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2150_c7_845e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_845e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_845e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_845e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_845e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_845e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_845e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_845e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_845e_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_845e_iftrue := VAR_MUX_uxn_opcodes_h_l2153_c32_0171_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2143_c7_d85b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2147_c7_c6d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_845e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_c7fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2150_c7_845e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_845e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_c7fa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_c6d9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_845e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2147_c7_c6d9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2150_c7_845e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2135_c2_1811_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2150_c7_845e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_845e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_845e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_845e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_845e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_845e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_845e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_845e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_845e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2150_c7_845e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_845e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_845e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_845e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_845e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_845e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_845e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_845e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_845e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2147_c7_c6d9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9_return_output;

     -- t8_MUX[uxn_opcodes_h_l2135_c2_1811] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2135_c2_1811_cond <= VAR_t8_MUX_uxn_opcodes_h_l2135_c2_1811_cond;
     t8_MUX_uxn_opcodes_h_l2135_c2_1811_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2135_c2_1811_iftrue;
     t8_MUX_uxn_opcodes_h_l2135_c2_1811_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2135_c2_1811_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2135_c2_1811_return_output := t8_MUX_uxn_opcodes_h_l2135_c2_1811_return_output;

     -- n8_MUX[uxn_opcodes_h_l2143_c7_d85b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2143_c7_d85b_cond <= VAR_n8_MUX_uxn_opcodes_h_l2143_c7_d85b_cond;
     n8_MUX_uxn_opcodes_h_l2143_c7_d85b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2143_c7_d85b_iftrue;
     n8_MUX_uxn_opcodes_h_l2143_c7_d85b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2143_c7_d85b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output := n8_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2147_c7_c6d9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2147_c7_c6d9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2147_c7_c6d9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2147_c7_c6d9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2147_c7_c6d9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2147_c7_c6d9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2147_c7_c6d9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2147_c7_c6d9_return_output := result_stack_value_MUX_uxn_opcodes_h_l2147_c7_c6d9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2147_c7_c6d9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_c6d9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_c6d9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_c6d9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_c6d9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_c6d9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_c6d9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_c6d9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_c6d9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2150_c7_845e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_845e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_845e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_845e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_845e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_845e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_845e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_845e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_845e_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2140_c7_cf35_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_c6d9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_845e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_d85b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_c6d9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2150_c7_845e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_845e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_d85b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_c6d9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2143_c7_d85b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2147_c7_c6d9_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2135_c2_1811_return_output;
     -- n8_MUX[uxn_opcodes_h_l2140_c7_cf35] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2140_c7_cf35_cond <= VAR_n8_MUX_uxn_opcodes_h_l2140_c7_cf35_cond;
     n8_MUX_uxn_opcodes_h_l2140_c7_cf35_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2140_c7_cf35_iftrue;
     n8_MUX_uxn_opcodes_h_l2140_c7_cf35_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2140_c7_cf35_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output := n8_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2147_c7_c6d9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_c6d9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_c6d9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_c6d9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_c6d9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_c6d9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_c6d9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_c6d9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_c6d9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2143_c7_d85b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_d85b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_d85b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_d85b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_d85b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_d85b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_d85b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2143_c7_d85b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_d85b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_d85b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_d85b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_d85b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_d85b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_d85b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2147_c7_c6d9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_c6d9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_c6d9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_c6d9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_c6d9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_c6d9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_c6d9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_c6d9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_c6d9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2147_c7_c6d9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2143_c7_d85b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2143_c7_d85b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2143_c7_d85b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2143_c7_d85b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2143_c7_d85b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2143_c7_d85b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2143_c7_d85b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output := result_stack_value_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2135_c2_1811_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_d85b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_c6d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_cf35_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_d85b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_c6d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_d85b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_c6d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_cf35_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2140_c7_cf35_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2143_c7_d85b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_d85b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_d85b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_d85b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_d85b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_d85b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_d85b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2143_c7_d85b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_d85b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_d85b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_d85b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_d85b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_d85b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_d85b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2143_c7_d85b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_d85b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_d85b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_d85b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_d85b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_d85b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_d85b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2140_c7_cf35] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_cf35_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_cf35_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_cf35_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_cf35_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_cf35_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_cf35_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2140_c7_cf35] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_cf35_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_cf35_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_cf35_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_cf35_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_cf35_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_cf35_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2140_c7_cf35] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2140_c7_cf35_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2140_c7_cf35_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2140_c7_cf35_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2140_c7_cf35_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2140_c7_cf35_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2140_c7_cf35_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output := result_stack_value_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output;

     -- n8_MUX[uxn_opcodes_h_l2135_c2_1811] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2135_c2_1811_cond <= VAR_n8_MUX_uxn_opcodes_h_l2135_c2_1811_cond;
     n8_MUX_uxn_opcodes_h_l2135_c2_1811_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2135_c2_1811_iftrue;
     n8_MUX_uxn_opcodes_h_l2135_c2_1811_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2135_c2_1811_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2135_c2_1811_return_output := n8_MUX_uxn_opcodes_h_l2135_c2_1811_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2135_c2_1811_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_cf35_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2135_c2_1811_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_cf35_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_cf35_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_d85b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2135_c2_1811_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2135_c2_1811_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2135_c2_1811] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2135_c2_1811_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2135_c2_1811_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2135_c2_1811_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2135_c2_1811_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2135_c2_1811_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2135_c2_1811_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2135_c2_1811_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2135_c2_1811_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2135_c2_1811] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2135_c2_1811_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2135_c2_1811_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2135_c2_1811_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2135_c2_1811_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2135_c2_1811_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2135_c2_1811_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2135_c2_1811_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2135_c2_1811_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2140_c7_cf35] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_cf35_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_cf35_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_cf35_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_cf35_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_cf35_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_cf35_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2140_c7_cf35] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_cf35_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_cf35_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_cf35_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_cf35_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_cf35_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_cf35_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2140_c7_cf35] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_cf35_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_cf35_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_cf35_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_cf35_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_cf35_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_cf35_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2135_c2_1811] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2135_c2_1811_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2135_c2_1811_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2135_c2_1811_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2135_c2_1811_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2135_c2_1811_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2135_c2_1811_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2135_c2_1811_return_output := result_stack_value_MUX_uxn_opcodes_h_l2135_c2_1811_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2135_c2_1811_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2135_c2_1811_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2135_c2_1811_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_cf35_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2135_c2_1811] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2135_c2_1811_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2135_c2_1811_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2135_c2_1811_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2135_c2_1811_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2135_c2_1811_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2135_c2_1811_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2135_c2_1811_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2135_c2_1811_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2135_c2_1811] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2135_c2_1811_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2135_c2_1811_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2135_c2_1811_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2135_c2_1811_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2135_c2_1811_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2135_c2_1811_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2135_c2_1811_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2135_c2_1811_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2135_c2_1811] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2135_c2_1811_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2135_c2_1811_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2135_c2_1811_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2135_c2_1811_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2135_c2_1811_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2135_c2_1811_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2135_c2_1811_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2135_c2_1811_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2131_l2166_DUPLICATE_56a2 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2131_l2166_DUPLICATE_56a2_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_53ff(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2135_c2_1811_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2135_c2_1811_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2135_c2_1811_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2135_c2_1811_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2135_c2_1811_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2135_c2_1811_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2131_l2166_DUPLICATE_56a2_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2131_l2166_DUPLICATE_56a2_return_output;
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
