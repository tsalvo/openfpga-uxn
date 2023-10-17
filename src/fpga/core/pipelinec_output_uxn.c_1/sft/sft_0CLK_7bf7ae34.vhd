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
-- Submodules: 60
entity sft_0CLK_7bf7ae34 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sft_0CLK_7bf7ae34;
architecture arch of sft_0CLK_7bf7ae34 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2349_c6_7193]
signal BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7193_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7193_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7193_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2349_c1_1f85]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_1f85_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_1f85_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_1f85_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_1f85_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2349_c2_2e88]
signal tmp8_MUX_uxn_opcodes_h_l2349_c2_2e88_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2349_c2_2e88]
signal n8_MUX_uxn_opcodes_h_l2349_c2_2e88_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2349_c2_2e88]
signal t8_MUX_uxn_opcodes_h_l2349_c2_2e88_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2349_c2_2e88]
signal result_u8_value_MUX_uxn_opcodes_h_l2349_c2_2e88_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2349_c2_2e88]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_2e88_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2349_c2_2e88]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_2e88_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2349_c2_2e88]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_2e88_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2349_c2_2e88]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_2e88_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2349_c2_2e88]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_2e88_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output : unsigned(3 downto 0);

-- printf_uxn_opcodes_h_l2350_c3_175e[uxn_opcodes_h_l2350_c3_175e]
signal printf_uxn_opcodes_h_l2350_c3_175e_uxn_opcodes_h_l2350_c3_175e_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2354_c11_a208]
signal BIN_OP_EQ_uxn_opcodes_h_l2354_c11_a208_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2354_c11_a208_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2354_c11_a208_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2354_c7_cc0c]
signal tmp8_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2354_c7_cc0c]
signal n8_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2354_c7_cc0c]
signal t8_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2354_c7_cc0c]
signal result_u8_value_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2354_c7_cc0c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2354_c7_cc0c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2354_c7_cc0c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2354_c7_cc0c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2354_c7_cc0c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2357_c11_e46d]
signal BIN_OP_EQ_uxn_opcodes_h_l2357_c11_e46d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2357_c11_e46d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2357_c11_e46d_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2357_c7_27d1]
signal tmp8_MUX_uxn_opcodes_h_l2357_c7_27d1_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2357_c7_27d1]
signal n8_MUX_uxn_opcodes_h_l2357_c7_27d1_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2357_c7_27d1]
signal t8_MUX_uxn_opcodes_h_l2357_c7_27d1_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2357_c7_27d1]
signal result_u8_value_MUX_uxn_opcodes_h_l2357_c7_27d1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2357_c7_27d1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_27d1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2357_c7_27d1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_27d1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2357_c7_27d1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_27d1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2357_c7_27d1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_27d1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2357_c7_27d1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_27d1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2361_c11_87ca]
signal BIN_OP_EQ_uxn_opcodes_h_l2361_c11_87ca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2361_c11_87ca_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2361_c11_87ca_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2361_c7_7617]
signal tmp8_MUX_uxn_opcodes_h_l2361_c7_7617_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2361_c7_7617_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2361_c7_7617_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2361_c7_7617_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2361_c7_7617]
signal n8_MUX_uxn_opcodes_h_l2361_c7_7617_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2361_c7_7617_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2361_c7_7617_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2361_c7_7617_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2361_c7_7617]
signal result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7617_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7617_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7617_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7617_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2361_c7_7617]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7617_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7617_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7617_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7617_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2361_c7_7617]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7617_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7617_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7617_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7617_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2361_c7_7617]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_7617_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_7617_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_7617_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_7617_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2361_c7_7617]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_7617_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_7617_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_7617_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_7617_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2361_c7_7617]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7617_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7617_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7617_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7617_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2364_c11_f2a5]
signal BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f2a5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f2a5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f2a5_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2364_c7_8794]
signal tmp8_MUX_uxn_opcodes_h_l2364_c7_8794_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2364_c7_8794_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2364_c7_8794_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2364_c7_8794_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2364_c7_8794]
signal n8_MUX_uxn_opcodes_h_l2364_c7_8794_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2364_c7_8794_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2364_c7_8794_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2364_c7_8794_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2364_c7_8794]
signal result_u8_value_MUX_uxn_opcodes_h_l2364_c7_8794_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2364_c7_8794_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2364_c7_8794_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2364_c7_8794_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2364_c7_8794]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_8794_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_8794_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_8794_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_8794_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2364_c7_8794]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_8794_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_8794_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_8794_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_8794_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2364_c7_8794]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_8794_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_8794_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_8794_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_8794_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2364_c7_8794]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_8794_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_8794_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_8794_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_8794_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2364_c7_8794]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_8794_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_8794_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_8794_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_8794_return_output : unsigned(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2367_c30_57dd]
signal sp_relative_shift_uxn_opcodes_h_l2367_c30_57dd_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2367_c30_57dd_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2367_c30_57dd_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2367_c30_57dd_return_output : signed(3 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2368_c18_4b5e]
signal BIN_OP_AND_uxn_opcodes_h_l2368_c18_4b5e_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2368_c18_4b5e_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2368_c18_4b5e_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l2368_c11_75ae]
signal BIN_OP_SR_uxn_opcodes_h_l2368_c11_75ae_left : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2368_c11_75ae_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2368_c11_75ae_return_output : unsigned(7 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l2368_c34_8d7e]
signal CONST_SR_4_uxn_opcodes_h_l2368_c34_8d7e_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l2368_c34_8d7e_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l2368_c11_62f7]
signal BIN_OP_SL_uxn_opcodes_h_l2368_c11_62f7_left : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2368_c11_62f7_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2368_c11_62f7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2373_c11_a210]
signal BIN_OP_EQ_uxn_opcodes_h_l2373_c11_a210_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2373_c11_a210_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2373_c11_a210_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2373_c7_7c19]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_7c19_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_7c19_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_7c19_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_7c19_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2373_c7_7c19]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_7c19_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_7c19_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_7c19_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_7c19_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2373_c7_7c19]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_7c19_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_7c19_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_7c19_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_7c19_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_25e8( ref_toks_0 : opcode_result_t;
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
      base.u8_value := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7193
BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7193 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7193_left,
BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7193_right,
BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7193_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_1f85
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_1f85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_1f85_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_1f85_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_1f85_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_1f85_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2349_c2_2e88
tmp8_MUX_uxn_opcodes_h_l2349_c2_2e88 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2349_c2_2e88_cond,
tmp8_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue,
tmp8_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse,
tmp8_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output);

-- n8_MUX_uxn_opcodes_h_l2349_c2_2e88
n8_MUX_uxn_opcodes_h_l2349_c2_2e88 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2349_c2_2e88_cond,
n8_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue,
n8_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse,
n8_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output);

-- t8_MUX_uxn_opcodes_h_l2349_c2_2e88
t8_MUX_uxn_opcodes_h_l2349_c2_2e88 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2349_c2_2e88_cond,
t8_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue,
t8_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse,
t8_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2349_c2_2e88
result_u8_value_MUX_uxn_opcodes_h_l2349_c2_2e88 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2349_c2_2e88_cond,
result_u8_value_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_2e88
result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_2e88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_2e88_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_2e88
result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_2e88 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_2e88_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_2e88
result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_2e88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_2e88_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_2e88
result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_2e88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_2e88_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_2e88
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_2e88 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_2e88_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output);

-- printf_uxn_opcodes_h_l2350_c3_175e_uxn_opcodes_h_l2350_c3_175e
printf_uxn_opcodes_h_l2350_c3_175e_uxn_opcodes_h_l2350_c3_175e : entity work.printf_uxn_opcodes_h_l2350_c3_175e_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2350_c3_175e_uxn_opcodes_h_l2350_c3_175e_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2354_c11_a208
BIN_OP_EQ_uxn_opcodes_h_l2354_c11_a208 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2354_c11_a208_left,
BIN_OP_EQ_uxn_opcodes_h_l2354_c11_a208_right,
BIN_OP_EQ_uxn_opcodes_h_l2354_c11_a208_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2354_c7_cc0c
tmp8_MUX_uxn_opcodes_h_l2354_c7_cc0c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond,
tmp8_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue,
tmp8_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse,
tmp8_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output);

-- n8_MUX_uxn_opcodes_h_l2354_c7_cc0c
n8_MUX_uxn_opcodes_h_l2354_c7_cc0c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond,
n8_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue,
n8_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse,
n8_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output);

-- t8_MUX_uxn_opcodes_h_l2354_c7_cc0c
t8_MUX_uxn_opcodes_h_l2354_c7_cc0c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond,
t8_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue,
t8_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse,
t8_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2354_c7_cc0c
result_u8_value_MUX_uxn_opcodes_h_l2354_c7_cc0c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_cc0c
result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_cc0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_cc0c
result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_cc0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c
result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_cc0c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_cc0c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2357_c11_e46d
BIN_OP_EQ_uxn_opcodes_h_l2357_c11_e46d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2357_c11_e46d_left,
BIN_OP_EQ_uxn_opcodes_h_l2357_c11_e46d_right,
BIN_OP_EQ_uxn_opcodes_h_l2357_c11_e46d_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2357_c7_27d1
tmp8_MUX_uxn_opcodes_h_l2357_c7_27d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2357_c7_27d1_cond,
tmp8_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue,
tmp8_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse,
tmp8_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output);

-- n8_MUX_uxn_opcodes_h_l2357_c7_27d1
n8_MUX_uxn_opcodes_h_l2357_c7_27d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2357_c7_27d1_cond,
n8_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue,
n8_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse,
n8_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output);

-- t8_MUX_uxn_opcodes_h_l2357_c7_27d1
t8_MUX_uxn_opcodes_h_l2357_c7_27d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2357_c7_27d1_cond,
t8_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue,
t8_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse,
t8_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2357_c7_27d1
result_u8_value_MUX_uxn_opcodes_h_l2357_c7_27d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2357_c7_27d1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_27d1
result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_27d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_27d1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_27d1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_27d1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_27d1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_27d1
result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_27d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_27d1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_27d1
result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_27d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_27d1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_27d1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_27d1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_27d1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2361_c11_87ca
BIN_OP_EQ_uxn_opcodes_h_l2361_c11_87ca : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2361_c11_87ca_left,
BIN_OP_EQ_uxn_opcodes_h_l2361_c11_87ca_right,
BIN_OP_EQ_uxn_opcodes_h_l2361_c11_87ca_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2361_c7_7617
tmp8_MUX_uxn_opcodes_h_l2361_c7_7617 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2361_c7_7617_cond,
tmp8_MUX_uxn_opcodes_h_l2361_c7_7617_iftrue,
tmp8_MUX_uxn_opcodes_h_l2361_c7_7617_iffalse,
tmp8_MUX_uxn_opcodes_h_l2361_c7_7617_return_output);

-- n8_MUX_uxn_opcodes_h_l2361_c7_7617
n8_MUX_uxn_opcodes_h_l2361_c7_7617 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2361_c7_7617_cond,
n8_MUX_uxn_opcodes_h_l2361_c7_7617_iftrue,
n8_MUX_uxn_opcodes_h_l2361_c7_7617_iffalse,
n8_MUX_uxn_opcodes_h_l2361_c7_7617_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7617
result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7617 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7617_cond,
result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7617_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7617_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7617_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7617
result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7617 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7617_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7617_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7617_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7617_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7617
result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7617 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7617_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7617_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7617_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7617_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_7617
result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_7617 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_7617_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_7617_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_7617_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_7617_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_7617
result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_7617 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_7617_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_7617_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_7617_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_7617_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7617
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7617 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7617_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7617_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7617_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7617_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f2a5
BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f2a5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f2a5_left,
BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f2a5_right,
BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f2a5_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2364_c7_8794
tmp8_MUX_uxn_opcodes_h_l2364_c7_8794 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2364_c7_8794_cond,
tmp8_MUX_uxn_opcodes_h_l2364_c7_8794_iftrue,
tmp8_MUX_uxn_opcodes_h_l2364_c7_8794_iffalse,
tmp8_MUX_uxn_opcodes_h_l2364_c7_8794_return_output);

-- n8_MUX_uxn_opcodes_h_l2364_c7_8794
n8_MUX_uxn_opcodes_h_l2364_c7_8794 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2364_c7_8794_cond,
n8_MUX_uxn_opcodes_h_l2364_c7_8794_iftrue,
n8_MUX_uxn_opcodes_h_l2364_c7_8794_iffalse,
n8_MUX_uxn_opcodes_h_l2364_c7_8794_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2364_c7_8794
result_u8_value_MUX_uxn_opcodes_h_l2364_c7_8794 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2364_c7_8794_cond,
result_u8_value_MUX_uxn_opcodes_h_l2364_c7_8794_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2364_c7_8794_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2364_c7_8794_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_8794
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_8794 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_8794_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_8794_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_8794_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_8794_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_8794
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_8794 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_8794_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_8794_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_8794_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_8794_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_8794
result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_8794 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_8794_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_8794_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_8794_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_8794_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_8794
result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_8794 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_8794_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_8794_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_8794_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_8794_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_8794
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_8794 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_8794_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_8794_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_8794_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_8794_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2367_c30_57dd
sp_relative_shift_uxn_opcodes_h_l2367_c30_57dd : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2367_c30_57dd_ins,
sp_relative_shift_uxn_opcodes_h_l2367_c30_57dd_x,
sp_relative_shift_uxn_opcodes_h_l2367_c30_57dd_y,
sp_relative_shift_uxn_opcodes_h_l2367_c30_57dd_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2368_c18_4b5e
BIN_OP_AND_uxn_opcodes_h_l2368_c18_4b5e : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2368_c18_4b5e_left,
BIN_OP_AND_uxn_opcodes_h_l2368_c18_4b5e_right,
BIN_OP_AND_uxn_opcodes_h_l2368_c18_4b5e_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l2368_c11_75ae
BIN_OP_SR_uxn_opcodes_h_l2368_c11_75ae : entity work.BIN_OP_SR_uint8_t_uint8_t_0CLK_25d197a7 port map (
BIN_OP_SR_uxn_opcodes_h_l2368_c11_75ae_left,
BIN_OP_SR_uxn_opcodes_h_l2368_c11_75ae_right,
BIN_OP_SR_uxn_opcodes_h_l2368_c11_75ae_return_output);

-- CONST_SR_4_uxn_opcodes_h_l2368_c34_8d7e
CONST_SR_4_uxn_opcodes_h_l2368_c34_8d7e : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l2368_c34_8d7e_x,
CONST_SR_4_uxn_opcodes_h_l2368_c34_8d7e_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l2368_c11_62f7
BIN_OP_SL_uxn_opcodes_h_l2368_c11_62f7 : entity work.BIN_OP_SL_uint8_t_uint8_t_0CLK_10d8c973 port map (
BIN_OP_SL_uxn_opcodes_h_l2368_c11_62f7_left,
BIN_OP_SL_uxn_opcodes_h_l2368_c11_62f7_right,
BIN_OP_SL_uxn_opcodes_h_l2368_c11_62f7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2373_c11_a210
BIN_OP_EQ_uxn_opcodes_h_l2373_c11_a210 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2373_c11_a210_left,
BIN_OP_EQ_uxn_opcodes_h_l2373_c11_a210_right,
BIN_OP_EQ_uxn_opcodes_h_l2373_c11_a210_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_7c19
result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_7c19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_7c19_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_7c19_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_7c19_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_7c19_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_7c19
result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_7c19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_7c19_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_7c19_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_7c19_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_7c19_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_7c19
result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_7c19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_7c19_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_7c19_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_7c19_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_7c19_return_output);



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
 tmp8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7193_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_1f85_return_output,
 tmp8_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output,
 n8_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output,
 t8_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2354_c11_a208_return_output,
 tmp8_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output,
 n8_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output,
 t8_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2357_c11_e46d_return_output,
 tmp8_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output,
 n8_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output,
 t8_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2361_c11_87ca_return_output,
 tmp8_MUX_uxn_opcodes_h_l2361_c7_7617_return_output,
 n8_MUX_uxn_opcodes_h_l2361_c7_7617_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7617_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7617_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7617_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_7617_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_7617_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7617_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f2a5_return_output,
 tmp8_MUX_uxn_opcodes_h_l2364_c7_8794_return_output,
 n8_MUX_uxn_opcodes_h_l2364_c7_8794_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2364_c7_8794_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_8794_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_8794_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_8794_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_8794_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_8794_return_output,
 sp_relative_shift_uxn_opcodes_h_l2367_c30_57dd_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2368_c18_4b5e_return_output,
 BIN_OP_SR_uxn_opcodes_h_l2368_c11_75ae_return_output,
 CONST_SR_4_uxn_opcodes_h_l2368_c34_8d7e_return_output,
 BIN_OP_SL_uxn_opcodes_h_l2368_c11_62f7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2373_c11_a210_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_7c19_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_7c19_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_7c19_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7193_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7193_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7193_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_1f85_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_1f85_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_1f85_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_1f85_iffalse : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2349_c2_2e88_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2349_c2_2e88_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2349_c2_2e88_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2349_c2_2e88_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_2e88_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_2e88_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_2e88_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_2e88_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2351_c3_aecc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_2e88_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2350_c3_175e_uxn_opcodes_h_l2350_c3_175e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c11_a208_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c11_a208_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c11_a208_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2355_c3_f141 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_e46d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_e46d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_e46d_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2361_c7_7617_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2357_c7_27d1_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2361_c7_7617_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2357_c7_27d1_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2357_c7_27d1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7617_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2357_c7_27d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7617_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_27d1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7617_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_27d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_7617_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_27d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_7617_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_27d1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2359_c3_7f57 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7617_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_27d1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_87ca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_87ca_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_87ca_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2361_c7_7617_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2361_c7_7617_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2364_c7_8794_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2361_c7_7617_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2361_c7_7617_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2361_c7_7617_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2364_c7_8794_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2361_c7_7617_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7617_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7617_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_8794_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7617_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7617_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7617_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_8794_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7617_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7617_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7617_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_8794_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7617_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_7617_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_7617_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_8794_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_7617_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_7617_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_7617_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_8794_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_7617_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7617_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2362_c3_3a8b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7617_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_8794_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7617_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f2a5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f2a5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f2a5_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2364_c7_8794_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2364_c7_8794_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2364_c7_8794_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2364_c7_8794_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2364_c7_8794_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2364_c7_8794_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_8794_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_8794_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_8794_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_8794_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_8794_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_7c19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_8794_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_8794_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_8794_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_8794_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_8794_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_8794_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_7c19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_8794_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_8794_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_8794_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_7c19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_8794_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_8794_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2370_c3_ad45 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_8794_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2364_c7_8794_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_8794_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_57dd_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_57dd_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_57dd_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_57dd_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2368_c11_75ae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2368_c18_4b5e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2368_c18_4b5e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2368_c18_4b5e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2368_c11_75ae_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2368_c11_75ae_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2368_c11_62f7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2368_c11_62f7_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2368_c34_8d7e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2368_c34_8d7e_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2368_c11_62f7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_a210_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_a210_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_a210_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_7c19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_7c19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_7c19_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_7c19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_7c19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_7c19_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_7c19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_7c19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_7c19_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2364_l2361_l2357_l2354_l2349_DUPLICATE_eb87_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2364_l2361_l2357_l2354_l2349_DUPLICATE_3c78_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2373_l2361_l2357_l2354_l2349_DUPLICATE_de9d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2373_l2361_l2357_l2354_l2349_DUPLICATE_f6ca_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2373_l2364_l2361_l2357_l2354_DUPLICATE_4867_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l2379_l2345_DUPLICATE_b4e6_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c11_a208_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2355_c3_f141 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2355_c3_f141;
     VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_57dd_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_7c19_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_1f85_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_a210_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2362_c3_3a8b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7617_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2362_c3_3a8b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f2a5_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_7c19_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_87ca_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2351_c3_aecc := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2351_c3_aecc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_e46d_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2370_c3_ad45 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_8794_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2370_c3_ad45;
     VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_57dd_y := resize(to_signed(-1, 2), 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_8794_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2368_c18_4b5e_right := to_unsigned(15, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_7c19_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_8794_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7193_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2359_c3_7f57 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2359_c3_7f57;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_1f85_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_57dd_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2361_c7_7617_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2364_c7_8794_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7193_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c11_a208_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_e46d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_87ca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f2a5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_a210_left := VAR_phase;
     VAR_BIN_OP_SR_uxn_opcodes_h_l2368_c11_75ae_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l2364_c7_8794_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2368_c18_4b5e_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l2368_c34_8d7e_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse := t8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2361_c7_7617_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2364_c7_8794_iffalse := tmp8;
     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2364_l2361_l2357_l2354_l2349_DUPLICATE_3c78 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2364_l2361_l2357_l2354_l2349_DUPLICATE_3c78_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2357_c11_e46d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2357_c11_e46d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_e46d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2357_c11_e46d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_e46d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_e46d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2357_c11_e46d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2373_l2364_l2361_l2357_l2354_DUPLICATE_4867 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2373_l2364_l2361_l2357_l2354_DUPLICATE_4867_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2354_c11_a208] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2354_c11_a208_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c11_a208_left;
     BIN_OP_EQ_uxn_opcodes_h_l2354_c11_a208_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c11_a208_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c11_a208_return_output := BIN_OP_EQ_uxn_opcodes_h_l2354_c11_a208_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2368_c18_4b5e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2368_c18_4b5e_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2368_c18_4b5e_left;
     BIN_OP_AND_uxn_opcodes_h_l2368_c18_4b5e_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2368_c18_4b5e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2368_c18_4b5e_return_output := BIN_OP_AND_uxn_opcodes_h_l2368_c18_4b5e_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2364_l2361_l2357_l2354_l2349_DUPLICATE_eb87 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2364_l2361_l2357_l2354_l2349_DUPLICATE_eb87_return_output := result.u8_value;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2364_c7_8794] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2364_c7_8794_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2373_l2361_l2357_l2354_l2349_DUPLICATE_f6ca LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2373_l2361_l2357_l2354_l2349_DUPLICATE_f6ca_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2349_c6_7193] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7193_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7193_left;
     BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7193_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7193_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7193_return_output := BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7193_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2364_c11_f2a5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f2a5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f2a5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f2a5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f2a5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f2a5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f2a5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2373_c11_a210] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2373_c11_a210_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_a210_left;
     BIN_OP_EQ_uxn_opcodes_h_l2373_c11_a210_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_a210_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_a210_return_output := BIN_OP_EQ_uxn_opcodes_h_l2373_c11_a210_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2373_l2361_l2357_l2354_l2349_DUPLICATE_de9d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2373_l2361_l2357_l2354_l2349_DUPLICATE_de9d_return_output := result.is_stack_write;

     -- CONST_SR_4[uxn_opcodes_h_l2368_c34_8d7e] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l2368_c34_8d7e_x <= VAR_CONST_SR_4_uxn_opcodes_h_l2368_c34_8d7e_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l2368_c34_8d7e_return_output := CONST_SR_4_uxn_opcodes_h_l2368_c34_8d7e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2361_c11_87ca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2361_c11_87ca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_87ca_left;
     BIN_OP_EQ_uxn_opcodes_h_l2361_c11_87ca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_87ca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_87ca_return_output := BIN_OP_EQ_uxn_opcodes_h_l2361_c11_87ca_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2367_c30_57dd] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2367_c30_57dd_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_57dd_ins;
     sp_relative_shift_uxn_opcodes_h_l2367_c30_57dd_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_57dd_x;
     sp_relative_shift_uxn_opcodes_h_l2367_c30_57dd_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_57dd_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_57dd_return_output := sp_relative_shift_uxn_opcodes_h_l2367_c30_57dd_return_output;

     -- Submodule level 1
     VAR_BIN_OP_SR_uxn_opcodes_h_l2368_c11_75ae_right := VAR_BIN_OP_AND_uxn_opcodes_h_l2368_c18_4b5e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_1f85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7193_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2349_c2_2e88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7193_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_2e88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7193_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_2e88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7193_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_2e88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7193_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_2e88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7193_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_2e88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7193_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2349_c2_2e88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7193_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2349_c2_2e88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7193_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2349_c2_2e88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7193_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c11_a208_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c11_a208_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c11_a208_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c11_a208_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c11_a208_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c11_a208_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c11_a208_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c11_a208_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c11_a208_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2357_c7_27d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_e46d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_27d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_e46d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_27d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_e46d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_27d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_e46d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_27d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_e46d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_27d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_e46d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2357_c7_27d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_e46d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2357_c7_27d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_e46d_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2357_c7_27d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_e46d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2361_c7_7617_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_87ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7617_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_87ca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_7617_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_87ca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_7617_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_87ca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7617_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_87ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7617_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_87ca_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7617_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_87ca_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2361_c7_7617_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_87ca_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2364_c7_8794_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f2a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_8794_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f2a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_8794_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f2a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_8794_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f2a5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_8794_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f2a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_8794_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f2a5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_8794_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f2a5_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2364_c7_8794_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_f2a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_7c19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_a210_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_7c19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_a210_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_7c19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_a210_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2364_l2361_l2357_l2354_l2349_DUPLICATE_3c78_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2364_l2361_l2357_l2354_l2349_DUPLICATE_3c78_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2364_l2361_l2357_l2354_l2349_DUPLICATE_3c78_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7617_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2364_l2361_l2357_l2354_l2349_DUPLICATE_3c78_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_8794_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2364_l2361_l2357_l2354_l2349_DUPLICATE_3c78_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2373_l2364_l2361_l2357_l2354_DUPLICATE_4867_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2373_l2364_l2361_l2357_l2354_DUPLICATE_4867_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7617_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2373_l2364_l2361_l2357_l2354_DUPLICATE_4867_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_8794_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2373_l2364_l2361_l2357_l2354_DUPLICATE_4867_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_7c19_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2373_l2364_l2361_l2357_l2354_DUPLICATE_4867_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2373_l2361_l2357_l2354_l2349_DUPLICATE_f6ca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2373_l2361_l2357_l2354_l2349_DUPLICATE_f6ca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2373_l2361_l2357_l2354_l2349_DUPLICATE_f6ca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_7617_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2373_l2361_l2357_l2354_l2349_DUPLICATE_f6ca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_7c19_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2373_l2361_l2357_l2354_l2349_DUPLICATE_f6ca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2373_l2361_l2357_l2354_l2349_DUPLICATE_de9d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2373_l2361_l2357_l2354_l2349_DUPLICATE_de9d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2373_l2361_l2357_l2354_l2349_DUPLICATE_de9d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_7617_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2373_l2361_l2357_l2354_l2349_DUPLICATE_de9d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_7c19_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2373_l2361_l2357_l2354_l2349_DUPLICATE_de9d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2364_l2361_l2357_l2354_l2349_DUPLICATE_eb87_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2364_l2361_l2357_l2354_l2349_DUPLICATE_eb87_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2364_l2361_l2357_l2354_l2349_DUPLICATE_eb87_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7617_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2364_l2361_l2357_l2354_l2349_DUPLICATE_eb87_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_8794_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2364_l2361_l2357_l2354_l2349_DUPLICATE_eb87_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2368_c11_62f7_right := VAR_CONST_SR_4_uxn_opcodes_h_l2368_c34_8d7e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_8794_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2364_c7_8794_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_8794_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_57dd_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2364_c7_8794] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_8794_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_8794_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_8794_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_8794_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_8794_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_8794_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_8794_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_8794_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2364_c7_8794] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_8794_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_8794_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_8794_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_8794_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_8794_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_8794_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_8794_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_8794_return_output;

     -- t8_MUX[uxn_opcodes_h_l2357_c7_27d1] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2357_c7_27d1_cond <= VAR_t8_MUX_uxn_opcodes_h_l2357_c7_27d1_cond;
     t8_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue;
     t8_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output := t8_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2373_c7_7c19] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_7c19_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_7c19_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_7c19_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_7c19_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_7c19_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_7c19_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_7c19_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_7c19_return_output;

     -- n8_MUX[uxn_opcodes_h_l2364_c7_8794] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2364_c7_8794_cond <= VAR_n8_MUX_uxn_opcodes_h_l2364_c7_8794_cond;
     n8_MUX_uxn_opcodes_h_l2364_c7_8794_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2364_c7_8794_iftrue;
     n8_MUX_uxn_opcodes_h_l2364_c7_8794_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2364_c7_8794_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2364_c7_8794_return_output := n8_MUX_uxn_opcodes_h_l2364_c7_8794_return_output;

     -- BIN_OP_SR[uxn_opcodes_h_l2368_c11_75ae] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l2368_c11_75ae_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l2368_c11_75ae_left;
     BIN_OP_SR_uxn_opcodes_h_l2368_c11_75ae_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l2368_c11_75ae_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l2368_c11_75ae_return_output := BIN_OP_SR_uxn_opcodes_h_l2368_c11_75ae_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2349_c1_1f85] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_1f85_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_1f85_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_1f85_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_1f85_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_1f85_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_1f85_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_1f85_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_1f85_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2373_c7_7c19] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_7c19_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_7c19_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_7c19_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_7c19_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_7c19_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_7c19_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_7c19_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_7c19_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2373_c7_7c19] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_7c19_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_7c19_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_7c19_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_7c19_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_7c19_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_7c19_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_7c19_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_7c19_return_output;

     -- Submodule level 2
     VAR_BIN_OP_SL_uxn_opcodes_h_l2368_c11_62f7_left := VAR_BIN_OP_SR_uxn_opcodes_h_l2368_c11_75ae_return_output;
     VAR_printf_uxn_opcodes_h_l2350_c3_175e_uxn_opcodes_h_l2350_c3_175e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_1f85_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2361_c7_7617_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2364_c7_8794_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_8794_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_7c19_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_8794_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_7c19_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_8794_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_7c19_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7617_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_8794_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7617_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_8794_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2361_c7_7617] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7617_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7617_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7617_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7617_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7617_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7617_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7617_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7617_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2364_c7_8794] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_8794_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_8794_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_8794_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_8794_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_8794_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_8794_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_8794_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_8794_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2364_c7_8794] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_8794_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_8794_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_8794_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_8794_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_8794_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_8794_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_8794_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_8794_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2364_c7_8794] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_8794_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_8794_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_8794_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_8794_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_8794_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_8794_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_8794_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_8794_return_output;

     -- printf_uxn_opcodes_h_l2350_c3_175e[uxn_opcodes_h_l2350_c3_175e] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2350_c3_175e_uxn_opcodes_h_l2350_c3_175e_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2350_c3_175e_uxn_opcodes_h_l2350_c3_175e_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2361_c7_7617] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7617_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7617_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7617_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7617_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7617_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7617_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7617_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7617_return_output;

     -- n8_MUX[uxn_opcodes_h_l2361_c7_7617] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2361_c7_7617_cond <= VAR_n8_MUX_uxn_opcodes_h_l2361_c7_7617_cond;
     n8_MUX_uxn_opcodes_h_l2361_c7_7617_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2361_c7_7617_iftrue;
     n8_MUX_uxn_opcodes_h_l2361_c7_7617_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2361_c7_7617_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2361_c7_7617_return_output := n8_MUX_uxn_opcodes_h_l2361_c7_7617_return_output;

     -- t8_MUX[uxn_opcodes_h_l2354_c7_cc0c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond <= VAR_t8_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond;
     t8_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue;
     t8_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output := t8_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output;

     -- BIN_OP_SL[uxn_opcodes_h_l2368_c11_62f7] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l2368_c11_62f7_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l2368_c11_62f7_left;
     BIN_OP_SL_uxn_opcodes_h_l2368_c11_62f7_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l2368_c11_62f7_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l2368_c11_62f7_return_output := BIN_OP_SL_uxn_opcodes_h_l2368_c11_62f7_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_8794_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2368_c11_62f7_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2364_c7_8794_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2368_c11_62f7_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2361_c7_7617_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7617_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_8794_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_7617_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_8794_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_7617_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_8794_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7617_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7617_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2357_c7_27d1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_27d1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_27d1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2357_c7_27d1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_27d1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_27d1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2361_c7_7617] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_7617_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_7617_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_7617_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_7617_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_7617_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_7617_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_7617_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_7617_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2361_c7_7617] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_7617_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_7617_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_7617_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_7617_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_7617_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_7617_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_7617_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_7617_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l2364_c7_8794] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2364_c7_8794_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2364_c7_8794_cond;
     tmp8_MUX_uxn_opcodes_h_l2364_c7_8794_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2364_c7_8794_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2364_c7_8794_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2364_c7_8794_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2364_c7_8794_return_output := tmp8_MUX_uxn_opcodes_h_l2364_c7_8794_return_output;

     -- t8_MUX[uxn_opcodes_h_l2349_c2_2e88] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2349_c2_2e88_cond <= VAR_t8_MUX_uxn_opcodes_h_l2349_c2_2e88_cond;
     t8_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue;
     t8_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output := t8_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2361_c7_7617] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7617_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7617_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7617_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7617_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7617_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7617_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7617_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7617_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2364_c7_8794] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2364_c7_8794_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_8794_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2364_c7_8794_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_8794_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2364_c7_8794_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_8794_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_8794_return_output := result_u8_value_MUX_uxn_opcodes_h_l2364_c7_8794_return_output;

     -- n8_MUX[uxn_opcodes_h_l2357_c7_27d1] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2357_c7_27d1_cond <= VAR_n8_MUX_uxn_opcodes_h_l2357_c7_27d1_cond;
     n8_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue;
     n8_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output := n8_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7617_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_7617_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_7617_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7617_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_8794_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2361_c7_7617_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l2364_c7_8794_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l2361_c7_7617] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2361_c7_7617_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2361_c7_7617_cond;
     tmp8_MUX_uxn_opcodes_h_l2361_c7_7617_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2361_c7_7617_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2361_c7_7617_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2361_c7_7617_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2361_c7_7617_return_output := tmp8_MUX_uxn_opcodes_h_l2361_c7_7617_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2357_c7_27d1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_27d1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_27d1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2361_c7_7617] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7617_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7617_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7617_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7617_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7617_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7617_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7617_return_output := result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7617_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2357_c7_27d1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_27d1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_27d1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output;

     -- n8_MUX[uxn_opcodes_h_l2354_c7_cc0c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond <= VAR_n8_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond;
     n8_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue;
     n8_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output := n8_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2357_c7_27d1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_27d1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_27d1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2354_c7_cc0c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2354_c7_cc0c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7617_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l2361_c7_7617_return_output;
     -- n8_MUX[uxn_opcodes_h_l2349_c2_2e88] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2349_c2_2e88_cond <= VAR_n8_MUX_uxn_opcodes_h_l2349_c2_2e88_cond;
     n8_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue;
     n8_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output := n8_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2349_c2_2e88] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_2e88_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_2e88_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2354_c7_cc0c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l2357_c7_27d1] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2357_c7_27d1_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2357_c7_27d1_cond;
     tmp8_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output := tmp8_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2349_c2_2e88] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_2e88_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_2e88_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2354_c7_cc0c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2354_c7_cc0c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2357_c7_27d1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2357_c7_27d1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2357_c7_27d1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2357_c7_27d1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2357_c7_27d1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l2357_c7_27d1_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2349_c2_2e88] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_2e88_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_2e88_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l2354_c7_cc0c] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond;
     tmp8_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output := tmp8_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2354_c7_cc0c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2354_c7_cc0c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2354_c7_cc0c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2354_c7_cc0c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2349_c2_2e88] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_2e88_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_2e88_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2349_c2_2e88] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_2e88_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_2e88_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output;

     -- Submodule level 7
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l2354_c7_cc0c_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2349_c2_2e88] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2349_c2_2e88_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2349_c2_2e88_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output := result_u8_value_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l2349_c2_2e88] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2349_c2_2e88_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2349_c2_2e88_cond;
     tmp8_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2349_c2_2e88_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2349_c2_2e88_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output := tmp8_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output;

     -- Submodule level 8
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l2379_l2345_DUPLICATE_b4e6 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l2379_l2345_DUPLICATE_b4e6_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_25e8(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_2e88_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l2379_l2345_DUPLICATE_b4e6_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l2379_l2345_DUPLICATE_b4e6_return_output;
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
