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
-- Submodules: 73
entity sft_0CLK_f7a3ea45 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sft_0CLK_f7a3ea45;
architecture arch of sft_0CLK_f7a3ea45 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2528_c6_e181]
signal BIN_OP_EQ_uxn_opcodes_h_l2528_c6_e181_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2528_c6_e181_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2528_c6_e181_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2528_c1_b3a2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2528_c1_b3a2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2528_c1_b3a2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2528_c1_b3a2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2528_c1_b3a2_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2528_c2_5ee7]
signal t8_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2528_c2_5ee7]
signal n8_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2528_c2_5ee7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2528_c2_5ee7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2528_c2_5ee7]
signal result_stack_value_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2528_c2_5ee7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2528_c2_5ee7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2528_c2_5ee7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2528_c2_5ee7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2528_c2_5ee7]
signal tmp8_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l2529_c3_26de[uxn_opcodes_h_l2529_c3_26de]
signal printf_uxn_opcodes_h_l2529_c3_26de_uxn_opcodes_h_l2529_c3_26de_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2534_c11_64b4]
signal BIN_OP_EQ_uxn_opcodes_h_l2534_c11_64b4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2534_c11_64b4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2534_c11_64b4_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2534_c7_8431]
signal t8_MUX_uxn_opcodes_h_l2534_c7_8431_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2534_c7_8431_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2534_c7_8431]
signal n8_MUX_uxn_opcodes_h_l2534_c7_8431_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2534_c7_8431_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2534_c7_8431]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2534_c7_8431_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2534_c7_8431_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2534_c7_8431]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_8431_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_8431_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2534_c7_8431]
signal result_stack_value_MUX_uxn_opcodes_h_l2534_c7_8431_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2534_c7_8431_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2534_c7_8431]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_8431_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_8431_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2534_c7_8431]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_8431_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_8431_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2534_c7_8431]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_8431_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_8431_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2534_c7_8431]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_8431_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_8431_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2534_c7_8431]
signal tmp8_MUX_uxn_opcodes_h_l2534_c7_8431_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2534_c7_8431_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2537_c11_dbd0]
signal BIN_OP_EQ_uxn_opcodes_h_l2537_c11_dbd0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2537_c11_dbd0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2537_c11_dbd0_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2537_c7_a496]
signal t8_MUX_uxn_opcodes_h_l2537_c7_a496_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2537_c7_a496_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2537_c7_a496]
signal n8_MUX_uxn_opcodes_h_l2537_c7_a496_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2537_c7_a496_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2537_c7_a496]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2537_c7_a496_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2537_c7_a496_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2537_c7_a496]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2537_c7_a496_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2537_c7_a496_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2537_c7_a496]
signal result_stack_value_MUX_uxn_opcodes_h_l2537_c7_a496_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2537_c7_a496_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2537_c7_a496]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2537_c7_a496_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2537_c7_a496_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2537_c7_a496]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_a496_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_a496_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2537_c7_a496]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_a496_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_a496_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2537_c7_a496]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2537_c7_a496_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2537_c7_a496_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2537_c7_a496]
signal tmp8_MUX_uxn_opcodes_h_l2537_c7_a496_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2537_c7_a496_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2541_c11_4f53]
signal BIN_OP_EQ_uxn_opcodes_h_l2541_c11_4f53_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2541_c11_4f53_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2541_c11_4f53_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2541_c7_7d2b]
signal n8_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2541_c7_7d2b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2541_c7_7d2b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2541_c7_7d2b]
signal result_stack_value_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2541_c7_7d2b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2541_c7_7d2b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2541_c7_7d2b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2541_c7_7d2b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2541_c7_7d2b]
signal tmp8_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2544_c11_4512]
signal BIN_OP_EQ_uxn_opcodes_h_l2544_c11_4512_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2544_c11_4512_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2544_c11_4512_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2544_c7_185f]
signal n8_MUX_uxn_opcodes_h_l2544_c7_185f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2544_c7_185f_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2544_c7_185f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_185f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_185f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2544_c7_185f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_185f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_185f_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2544_c7_185f]
signal result_stack_value_MUX_uxn_opcodes_h_l2544_c7_185f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2544_c7_185f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2544_c7_185f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_185f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_185f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2544_c7_185f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_185f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_185f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2544_c7_185f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_185f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_185f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2544_c7_185f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_185f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_185f_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2544_c7_185f]
signal tmp8_MUX_uxn_opcodes_h_l2544_c7_185f_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2544_c7_185f_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2548_c32_da10]
signal BIN_OP_AND_uxn_opcodes_h_l2548_c32_da10_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2548_c32_da10_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2548_c32_da10_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2548_c32_23e3]
signal BIN_OP_GT_uxn_opcodes_h_l2548_c32_23e3_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2548_c32_23e3_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2548_c32_23e3_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2548_c32_79c0]
signal MUX_uxn_opcodes_h_l2548_c32_79c0_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2548_c32_79c0_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2548_c32_79c0_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2548_c32_79c0_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2550_c11_4f76]
signal BIN_OP_EQ_uxn_opcodes_h_l2550_c11_4f76_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2550_c11_4f76_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2550_c11_4f76_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2550_c7_2456]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2456_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2456_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2456_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2456_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2550_c7_2456]
signal result_stack_value_MUX_uxn_opcodes_h_l2550_c7_2456_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2550_c7_2456_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2550_c7_2456_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2550_c7_2456_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2550_c7_2456]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_2456_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_2456_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_2456_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_2456_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2550_c7_2456]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2456_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2456_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2456_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2456_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2550_c7_2456]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2456_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2456_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2456_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2456_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2550_c7_2456]
signal tmp8_MUX_uxn_opcodes_h_l2550_c7_2456_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2550_c7_2456_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2550_c7_2456_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2550_c7_2456_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2551_c18_7971]
signal BIN_OP_AND_uxn_opcodes_h_l2551_c18_7971_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2551_c18_7971_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2551_c18_7971_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l2551_c11_c2e5]
signal BIN_OP_SR_uxn_opcodes_h_l2551_c11_c2e5_left : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2551_c11_c2e5_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2551_c11_c2e5_return_output : unsigned(7 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l2551_c34_ecb5]
signal CONST_SR_4_uxn_opcodes_h_l2551_c34_ecb5_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l2551_c34_ecb5_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l2551_c11_a219]
signal BIN_OP_SL_uxn_opcodes_h_l2551_c11_a219_left : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2551_c11_a219_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2551_c11_a219_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2557_c11_afbb]
signal BIN_OP_EQ_uxn_opcodes_h_l2557_c11_afbb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2557_c11_afbb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2557_c11_afbb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2557_c7_6ab0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_6ab0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_6ab0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_6ab0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_6ab0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2557_c7_6ab0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_6ab0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_6ab0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_6ab0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_6ab0_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_read := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.stack_value := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2528_c6_e181
BIN_OP_EQ_uxn_opcodes_h_l2528_c6_e181 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2528_c6_e181_left,
BIN_OP_EQ_uxn_opcodes_h_l2528_c6_e181_right,
BIN_OP_EQ_uxn_opcodes_h_l2528_c6_e181_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2528_c1_b3a2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2528_c1_b3a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2528_c1_b3a2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2528_c1_b3a2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2528_c1_b3a2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2528_c1_b3a2_return_output);

-- t8_MUX_uxn_opcodes_h_l2528_c2_5ee7
t8_MUX_uxn_opcodes_h_l2528_c2_5ee7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond,
t8_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue,
t8_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse,
t8_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output);

-- n8_MUX_uxn_opcodes_h_l2528_c2_5ee7
n8_MUX_uxn_opcodes_h_l2528_c2_5ee7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond,
n8_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue,
n8_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse,
n8_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2528_c2_5ee7
result_is_stack_read_MUX_uxn_opcodes_h_l2528_c2_5ee7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7
result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2528_c2_5ee7
result_stack_value_MUX_uxn_opcodes_h_l2528_c2_5ee7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond,
result_stack_value_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7
result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2528_c2_5ee7
result_is_stack_write_MUX_uxn_opcodes_h_l2528_c2_5ee7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2528_c2_5ee7
result_is_opc_done_MUX_uxn_opcodes_h_l2528_c2_5ee7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c2_5ee7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c2_5ee7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2528_c2_5ee7
tmp8_MUX_uxn_opcodes_h_l2528_c2_5ee7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond,
tmp8_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue,
tmp8_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse,
tmp8_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output);

-- printf_uxn_opcodes_h_l2529_c3_26de_uxn_opcodes_h_l2529_c3_26de
printf_uxn_opcodes_h_l2529_c3_26de_uxn_opcodes_h_l2529_c3_26de : entity work.printf_uxn_opcodes_h_l2529_c3_26de_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2529_c3_26de_uxn_opcodes_h_l2529_c3_26de_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2534_c11_64b4
BIN_OP_EQ_uxn_opcodes_h_l2534_c11_64b4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2534_c11_64b4_left,
BIN_OP_EQ_uxn_opcodes_h_l2534_c11_64b4_right,
BIN_OP_EQ_uxn_opcodes_h_l2534_c11_64b4_return_output);

-- t8_MUX_uxn_opcodes_h_l2534_c7_8431
t8_MUX_uxn_opcodes_h_l2534_c7_8431 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2534_c7_8431_cond,
t8_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue,
t8_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse,
t8_MUX_uxn_opcodes_h_l2534_c7_8431_return_output);

-- n8_MUX_uxn_opcodes_h_l2534_c7_8431
n8_MUX_uxn_opcodes_h_l2534_c7_8431 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2534_c7_8431_cond,
n8_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue,
n8_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse,
n8_MUX_uxn_opcodes_h_l2534_c7_8431_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2534_c7_8431
result_is_stack_read_MUX_uxn_opcodes_h_l2534_c7_8431 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2534_c7_8431_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2534_c7_8431_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_8431
result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_8431 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_8431_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_8431_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2534_c7_8431
result_stack_value_MUX_uxn_opcodes_h_l2534_c7_8431 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2534_c7_8431_cond,
result_stack_value_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2534_c7_8431_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_8431
result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_8431 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_8431_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_8431_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_8431
result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_8431 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_8431_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_8431_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_8431
result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_8431 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_8431_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_8431_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_8431
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_8431 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_8431_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_8431_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2534_c7_8431
tmp8_MUX_uxn_opcodes_h_l2534_c7_8431 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2534_c7_8431_cond,
tmp8_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue,
tmp8_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse,
tmp8_MUX_uxn_opcodes_h_l2534_c7_8431_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2537_c11_dbd0
BIN_OP_EQ_uxn_opcodes_h_l2537_c11_dbd0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2537_c11_dbd0_left,
BIN_OP_EQ_uxn_opcodes_h_l2537_c11_dbd0_right,
BIN_OP_EQ_uxn_opcodes_h_l2537_c11_dbd0_return_output);

-- t8_MUX_uxn_opcodes_h_l2537_c7_a496
t8_MUX_uxn_opcodes_h_l2537_c7_a496 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2537_c7_a496_cond,
t8_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue,
t8_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse,
t8_MUX_uxn_opcodes_h_l2537_c7_a496_return_output);

-- n8_MUX_uxn_opcodes_h_l2537_c7_a496
n8_MUX_uxn_opcodes_h_l2537_c7_a496 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2537_c7_a496_cond,
n8_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue,
n8_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse,
n8_MUX_uxn_opcodes_h_l2537_c7_a496_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2537_c7_a496
result_is_stack_read_MUX_uxn_opcodes_h_l2537_c7_a496 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2537_c7_a496_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2537_c7_a496_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2537_c7_a496
result_sp_relative_shift_MUX_uxn_opcodes_h_l2537_c7_a496 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2537_c7_a496_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2537_c7_a496_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2537_c7_a496
result_stack_value_MUX_uxn_opcodes_h_l2537_c7_a496 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2537_c7_a496_cond,
result_stack_value_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2537_c7_a496_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2537_c7_a496
result_is_sp_shift_MUX_uxn_opcodes_h_l2537_c7_a496 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2537_c7_a496_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2537_c7_a496_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_a496
result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_a496 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_a496_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_a496_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_a496
result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_a496 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_a496_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_a496_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2537_c7_a496
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2537_c7_a496 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2537_c7_a496_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2537_c7_a496_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2537_c7_a496
tmp8_MUX_uxn_opcodes_h_l2537_c7_a496 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2537_c7_a496_cond,
tmp8_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue,
tmp8_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse,
tmp8_MUX_uxn_opcodes_h_l2537_c7_a496_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2541_c11_4f53
BIN_OP_EQ_uxn_opcodes_h_l2541_c11_4f53 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2541_c11_4f53_left,
BIN_OP_EQ_uxn_opcodes_h_l2541_c11_4f53_right,
BIN_OP_EQ_uxn_opcodes_h_l2541_c11_4f53_return_output);

-- n8_MUX_uxn_opcodes_h_l2541_c7_7d2b
n8_MUX_uxn_opcodes_h_l2541_c7_7d2b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond,
n8_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue,
n8_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse,
n8_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_7d2b
result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_7d2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2541_c7_7d2b
result_stack_value_MUX_uxn_opcodes_h_l2541_c7_7d2b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond,
result_stack_value_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b
result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_7d2b
result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_7d2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_7d2b
result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_7d2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_7d2b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_7d2b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2541_c7_7d2b
tmp8_MUX_uxn_opcodes_h_l2541_c7_7d2b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond,
tmp8_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue,
tmp8_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse,
tmp8_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2544_c11_4512
BIN_OP_EQ_uxn_opcodes_h_l2544_c11_4512 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2544_c11_4512_left,
BIN_OP_EQ_uxn_opcodes_h_l2544_c11_4512_right,
BIN_OP_EQ_uxn_opcodes_h_l2544_c11_4512_return_output);

-- n8_MUX_uxn_opcodes_h_l2544_c7_185f
n8_MUX_uxn_opcodes_h_l2544_c7_185f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2544_c7_185f_cond,
n8_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue,
n8_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse,
n8_MUX_uxn_opcodes_h_l2544_c7_185f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_185f
result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_185f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_185f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_185f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_185f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_185f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_185f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_185f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2544_c7_185f
result_stack_value_MUX_uxn_opcodes_h_l2544_c7_185f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2544_c7_185f_cond,
result_stack_value_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2544_c7_185f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_185f
result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_185f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_185f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_185f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_185f
result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_185f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_185f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_185f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_185f
result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_185f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_185f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_185f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_185f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_185f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_185f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_185f_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2544_c7_185f
tmp8_MUX_uxn_opcodes_h_l2544_c7_185f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2544_c7_185f_cond,
tmp8_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue,
tmp8_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse,
tmp8_MUX_uxn_opcodes_h_l2544_c7_185f_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2548_c32_da10
BIN_OP_AND_uxn_opcodes_h_l2548_c32_da10 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2548_c32_da10_left,
BIN_OP_AND_uxn_opcodes_h_l2548_c32_da10_right,
BIN_OP_AND_uxn_opcodes_h_l2548_c32_da10_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2548_c32_23e3
BIN_OP_GT_uxn_opcodes_h_l2548_c32_23e3 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2548_c32_23e3_left,
BIN_OP_GT_uxn_opcodes_h_l2548_c32_23e3_right,
BIN_OP_GT_uxn_opcodes_h_l2548_c32_23e3_return_output);

-- MUX_uxn_opcodes_h_l2548_c32_79c0
MUX_uxn_opcodes_h_l2548_c32_79c0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2548_c32_79c0_cond,
MUX_uxn_opcodes_h_l2548_c32_79c0_iftrue,
MUX_uxn_opcodes_h_l2548_c32_79c0_iffalse,
MUX_uxn_opcodes_h_l2548_c32_79c0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2550_c11_4f76
BIN_OP_EQ_uxn_opcodes_h_l2550_c11_4f76 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2550_c11_4f76_left,
BIN_OP_EQ_uxn_opcodes_h_l2550_c11_4f76_right,
BIN_OP_EQ_uxn_opcodes_h_l2550_c11_4f76_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2456
result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2456 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2456_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2456_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2456_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2456_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2550_c7_2456
result_stack_value_MUX_uxn_opcodes_h_l2550_c7_2456 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2550_c7_2456_cond,
result_stack_value_MUX_uxn_opcodes_h_l2550_c7_2456_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2550_c7_2456_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2550_c7_2456_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_2456
result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_2456 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_2456_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_2456_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_2456_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_2456_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2456
result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2456 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2456_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2456_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2456_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2456_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2456
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2456 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2456_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2456_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2456_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2456_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2550_c7_2456
tmp8_MUX_uxn_opcodes_h_l2550_c7_2456 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2550_c7_2456_cond,
tmp8_MUX_uxn_opcodes_h_l2550_c7_2456_iftrue,
tmp8_MUX_uxn_opcodes_h_l2550_c7_2456_iffalse,
tmp8_MUX_uxn_opcodes_h_l2550_c7_2456_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2551_c18_7971
BIN_OP_AND_uxn_opcodes_h_l2551_c18_7971 : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2551_c18_7971_left,
BIN_OP_AND_uxn_opcodes_h_l2551_c18_7971_right,
BIN_OP_AND_uxn_opcodes_h_l2551_c18_7971_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l2551_c11_c2e5
BIN_OP_SR_uxn_opcodes_h_l2551_c11_c2e5 : entity work.BIN_OP_SR_uint8_t_uint8_t_0CLK_25d197a7 port map (
BIN_OP_SR_uxn_opcodes_h_l2551_c11_c2e5_left,
BIN_OP_SR_uxn_opcodes_h_l2551_c11_c2e5_right,
BIN_OP_SR_uxn_opcodes_h_l2551_c11_c2e5_return_output);

-- CONST_SR_4_uxn_opcodes_h_l2551_c34_ecb5
CONST_SR_4_uxn_opcodes_h_l2551_c34_ecb5 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l2551_c34_ecb5_x,
CONST_SR_4_uxn_opcodes_h_l2551_c34_ecb5_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l2551_c11_a219
BIN_OP_SL_uxn_opcodes_h_l2551_c11_a219 : entity work.BIN_OP_SL_uint8_t_uint8_t_0CLK_10d8c973 port map (
BIN_OP_SL_uxn_opcodes_h_l2551_c11_a219_left,
BIN_OP_SL_uxn_opcodes_h_l2551_c11_a219_right,
BIN_OP_SL_uxn_opcodes_h_l2551_c11_a219_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2557_c11_afbb
BIN_OP_EQ_uxn_opcodes_h_l2557_c11_afbb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2557_c11_afbb_left,
BIN_OP_EQ_uxn_opcodes_h_l2557_c11_afbb_right,
BIN_OP_EQ_uxn_opcodes_h_l2557_c11_afbb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_6ab0
result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_6ab0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_6ab0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_6ab0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_6ab0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_6ab0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_6ab0
result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_6ab0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_6ab0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_6ab0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_6ab0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_6ab0_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2528_c6_e181_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2528_c1_b3a2_return_output,
 t8_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output,
 n8_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output,
 tmp8_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2534_c11_64b4_return_output,
 t8_MUX_uxn_opcodes_h_l2534_c7_8431_return_output,
 n8_MUX_uxn_opcodes_h_l2534_c7_8431_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2534_c7_8431_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_8431_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2534_c7_8431_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_8431_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_8431_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_8431_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_8431_return_output,
 tmp8_MUX_uxn_opcodes_h_l2534_c7_8431_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2537_c11_dbd0_return_output,
 t8_MUX_uxn_opcodes_h_l2537_c7_a496_return_output,
 n8_MUX_uxn_opcodes_h_l2537_c7_a496_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2537_c7_a496_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2537_c7_a496_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2537_c7_a496_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2537_c7_a496_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_a496_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_a496_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2537_c7_a496_return_output,
 tmp8_MUX_uxn_opcodes_h_l2537_c7_a496_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2541_c11_4f53_return_output,
 n8_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output,
 tmp8_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2544_c11_4512_return_output,
 n8_MUX_uxn_opcodes_h_l2544_c7_185f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_185f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_185f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2544_c7_185f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_185f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_185f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_185f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_185f_return_output,
 tmp8_MUX_uxn_opcodes_h_l2544_c7_185f_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2548_c32_da10_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2548_c32_23e3_return_output,
 MUX_uxn_opcodes_h_l2548_c32_79c0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2550_c11_4f76_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2456_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2550_c7_2456_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_2456_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2456_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2456_return_output,
 tmp8_MUX_uxn_opcodes_h_l2550_c7_2456_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2551_c18_7971_return_output,
 BIN_OP_SR_uxn_opcodes_h_l2551_c11_c2e5_return_output,
 CONST_SR_4_uxn_opcodes_h_l2551_c34_ecb5_return_output,
 BIN_OP_SL_uxn_opcodes_h_l2551_c11_a219_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2557_c11_afbb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_6ab0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_6ab0_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c6_e181_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c6_e181_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c6_e181_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2528_c1_b3a2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2528_c1_b3a2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2528_c1_b3a2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2528_c1_b3a2_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2534_c7_8431_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2534_c7_8431_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2534_c7_8431_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_8431_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2534_c7_8431_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_8431_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_8431_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_8431_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2531_c3_ac9d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_8431_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2534_c7_8431_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2529_c3_26de_uxn_opcodes_h_l2529_c3_26de_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_64b4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_64b4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_64b4_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2537_c7_a496_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2534_c7_8431_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2537_c7_a496_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2534_c7_8431_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2537_c7_a496_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2534_c7_8431_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2537_c7_a496_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_8431_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2537_c7_a496_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2534_c7_8431_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2537_c7_a496_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_8431_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_a496_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_8431_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_a496_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_8431_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2535_c3_0f8e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2537_c7_a496_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_8431_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2537_c7_a496_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2534_c7_8431_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2537_c11_dbd0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2537_c11_dbd0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2537_c11_dbd0_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2537_c7_a496_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2537_c7_a496_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2537_c7_a496_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2537_c7_a496_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2537_c7_a496_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2537_c7_a496_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_a496_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_a496_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2539_c3_c335 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2537_c7_a496_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2537_c7_a496_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c11_4f53_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c11_4f53_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c11_4f53_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2544_c7_185f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_185f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_185f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2544_c7_185f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_185f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_185f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_185f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2542_c3_2546 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_185f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2544_c7_185f_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_4512_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_4512_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_4512_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2544_c7_185f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_185f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_185f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2550_c7_2456_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2544_c7_185f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2456_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_185f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_2456_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_185f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2456_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_185f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2456_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_185f_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2550_c7_2456_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2544_c7_185f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2548_c32_79c0_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2548_c32_79c0_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2548_c32_79c0_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2548_c32_da10_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2548_c32_da10_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2548_c32_da10_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2548_c32_23e3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2548_c32_23e3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2548_c32_23e3_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2548_c32_79c0_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_4f76_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_4f76_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_4f76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2456_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2456_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2456_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2550_c7_2456_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2550_c7_2456_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2550_c7_2456_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_2456_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_2456_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_6ab0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_2456_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2456_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2456_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_6ab0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2456_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2456_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2554_c3_a9b3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2456_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2456_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2550_c7_2456_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2550_c7_2456_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2550_c7_2456_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2551_c11_c2e5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2551_c18_7971_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2551_c18_7971_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2551_c18_7971_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2551_c11_c2e5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2551_c11_c2e5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2551_c11_a219_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2551_c11_a219_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2551_c34_ecb5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2551_c34_ecb5_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2551_c11_a219_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_afbb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_afbb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_afbb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_6ab0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_6ab0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_6ab0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_6ab0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_6ab0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_6ab0_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2528_l2544_l2541_l2537_l2534_DUPLICATE_d596_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2528_l2550_l2544_l2541_l2537_l2534_DUPLICATE_f54c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2528_l2550_l2541_l2537_l2534_DUPLICATE_0dcf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2528_l2557_l2544_l2541_l2537_l2534_DUPLICATE_4c13_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2544_l2537_l2541_l2534_DUPLICATE_2c76_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2557_l2550_l2544_l2541_l2537_l2534_DUPLICATE_861c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2544_l2550_DUPLICATE_6c4f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2562_l2524_DUPLICATE_545a_return_output : opcode_result_t;
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
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2528_c1_b3a2_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2456_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2539_c3_c335 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2539_c3_c335;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_6ab0_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2548_c32_79c0_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2554_c3_a9b3 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2456_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2554_c3_a9b3;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2548_c32_da10_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c11_4f53_right := to_unsigned(3, 2);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2548_c32_23e3_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2531_c3_ac9d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2531_c3_ac9d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_64b4_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_afbb_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2542_c3_2546 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2542_c3_2546;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_2456_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2535_c3_0f8e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2535_c3_0f8e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2537_c11_dbd0_right := to_unsigned(2, 2);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2551_c18_7971_right := to_unsigned(15, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_4f76_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c6_e181_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2548_c32_79c0_iffalse := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_4512_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_6ab0_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2528_c1_b3a2_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2548_c32_da10_left := VAR_ins;
     VAR_BIN_OP_SR_uxn_opcodes_h_l2551_c11_c2e5_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c6_e181_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_64b4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2537_c11_dbd0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c11_4f53_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_4512_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_4f76_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_afbb_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2551_c18_7971_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l2551_c34_ecb5_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse := t8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2550_c7_2456_iffalse := tmp8;
     -- BIN_OP_EQ[uxn_opcodes_h_l2528_c6_e181] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2528_c6_e181_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c6_e181_left;
     BIN_OP_EQ_uxn_opcodes_h_l2528_c6_e181_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c6_e181_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c6_e181_return_output := BIN_OP_EQ_uxn_opcodes_h_l2528_c6_e181_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2548_c32_da10] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2548_c32_da10_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2548_c32_da10_left;
     BIN_OP_AND_uxn_opcodes_h_l2548_c32_da10_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2548_c32_da10_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2548_c32_da10_return_output := BIN_OP_AND_uxn_opcodes_h_l2548_c32_da10_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2550_c11_4f76] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2550_c11_4f76_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_4f76_left;
     BIN_OP_EQ_uxn_opcodes_h_l2550_c11_4f76_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_4f76_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_4f76_return_output := BIN_OP_EQ_uxn_opcodes_h_l2550_c11_4f76_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2528_l2557_l2544_l2541_l2537_l2534_DUPLICATE_4c13 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2528_l2557_l2544_l2541_l2537_l2534_DUPLICATE_4c13_return_output := result.is_stack_write;

     -- CONST_SR_4[uxn_opcodes_h_l2551_c34_ecb5] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l2551_c34_ecb5_x <= VAR_CONST_SR_4_uxn_opcodes_h_l2551_c34_ecb5_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l2551_c34_ecb5_return_output := CONST_SR_4_uxn_opcodes_h_l2551_c34_ecb5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2541_c11_4f53] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2541_c11_4f53_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c11_4f53_left;
     BIN_OP_EQ_uxn_opcodes_h_l2541_c11_4f53_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c11_4f53_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c11_4f53_return_output := BIN_OP_EQ_uxn_opcodes_h_l2541_c11_4f53_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2544_l2550_DUPLICATE_6c4f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2544_l2550_DUPLICATE_6c4f_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2534_c11_64b4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2534_c11_64b4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_64b4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2534_c11_64b4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_64b4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_64b4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2534_c11_64b4_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2528_l2550_l2544_l2541_l2537_l2534_DUPLICATE_f54c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2528_l2550_l2544_l2541_l2537_l2534_DUPLICATE_f54c_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2557_l2550_l2544_l2541_l2537_l2534_DUPLICATE_861c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2557_l2550_l2544_l2541_l2537_l2534_DUPLICATE_861c_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2528_l2550_l2541_l2537_l2534_DUPLICATE_0dcf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2528_l2550_l2541_l2537_l2534_DUPLICATE_0dcf_return_output := result.is_sp_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l2551_c18_7971] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2551_c18_7971_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2551_c18_7971_left;
     BIN_OP_AND_uxn_opcodes_h_l2551_c18_7971_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2551_c18_7971_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2551_c18_7971_return_output := BIN_OP_AND_uxn_opcodes_h_l2551_c18_7971_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2544_c11_4512] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2544_c11_4512_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_4512_left;
     BIN_OP_EQ_uxn_opcodes_h_l2544_c11_4512_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_4512_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_4512_return_output := BIN_OP_EQ_uxn_opcodes_h_l2544_c11_4512_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2537_c11_dbd0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2537_c11_dbd0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2537_c11_dbd0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2537_c11_dbd0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2537_c11_dbd0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2537_c11_dbd0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2537_c11_dbd0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2557_c11_afbb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2557_c11_afbb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_afbb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2557_c11_afbb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_afbb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_afbb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2557_c11_afbb_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2544_l2537_l2541_l2534_DUPLICATE_2c76 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2544_l2537_l2541_l2534_DUPLICATE_2c76_return_output := result.is_stack_read;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2528_l2544_l2541_l2537_l2534_DUPLICATE_d596 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2528_l2544_l2541_l2537_l2534_DUPLICATE_d596_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2548_c32_23e3_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2548_c32_da10_return_output;
     VAR_BIN_OP_SR_uxn_opcodes_h_l2551_c11_c2e5_right := VAR_BIN_OP_AND_uxn_opcodes_h_l2551_c18_7971_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2528_c1_b3a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c6_e181_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c6_e181_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c6_e181_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c6_e181_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c6_e181_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c6_e181_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c6_e181_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c6_e181_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c6_e181_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c6_e181_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c6_e181_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2534_c7_8431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_64b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_8431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_64b4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_8431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_64b4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2534_c7_8431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_64b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_8431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_64b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_8431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_64b4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_8431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_64b4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2534_c7_8431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_64b4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2534_c7_8431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_64b4_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2534_c7_8431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_64b4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2537_c7_a496_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2537_c11_dbd0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_a496_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2537_c11_dbd0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2537_c7_a496_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2537_c11_dbd0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2537_c7_a496_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2537_c11_dbd0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_a496_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2537_c11_dbd0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2537_c7_a496_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2537_c11_dbd0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2537_c7_a496_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2537_c11_dbd0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2537_c7_a496_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2537_c11_dbd0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2537_c7_a496_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2537_c11_dbd0_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2537_c7_a496_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2537_c11_dbd0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c11_4f53_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c11_4f53_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c11_4f53_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c11_4f53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c11_4f53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c11_4f53_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c11_4f53_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c11_4f53_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c11_4f53_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2544_c7_185f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_4512_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_185f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_4512_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_185f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_4512_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_185f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_4512_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_185f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_4512_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_185f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_4512_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_185f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_4512_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2544_c7_185f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_4512_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2544_c7_185f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_4512_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2456_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_4f76_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2456_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_4f76_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_2456_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_4f76_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2456_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_4f76_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2550_c7_2456_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_4f76_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2550_c7_2456_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_4f76_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_6ab0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_afbb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_6ab0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_afbb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2528_l2544_l2541_l2537_l2534_DUPLICATE_d596_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2528_l2544_l2541_l2537_l2534_DUPLICATE_d596_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2528_l2544_l2541_l2537_l2534_DUPLICATE_d596_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2528_l2544_l2541_l2537_l2534_DUPLICATE_d596_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2528_l2544_l2541_l2537_l2534_DUPLICATE_d596_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2557_l2550_l2544_l2541_l2537_l2534_DUPLICATE_861c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2557_l2550_l2544_l2541_l2537_l2534_DUPLICATE_861c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2557_l2550_l2544_l2541_l2537_l2534_DUPLICATE_861c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2557_l2550_l2544_l2541_l2537_l2534_DUPLICATE_861c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2456_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2557_l2550_l2544_l2541_l2537_l2534_DUPLICATE_861c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_6ab0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2557_l2550_l2544_l2541_l2537_l2534_DUPLICATE_861c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2528_l2550_l2541_l2537_l2534_DUPLICATE_0dcf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2528_l2550_l2541_l2537_l2534_DUPLICATE_0dcf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2528_l2550_l2541_l2537_l2534_DUPLICATE_0dcf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2528_l2550_l2541_l2537_l2534_DUPLICATE_0dcf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2456_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2528_l2550_l2541_l2537_l2534_DUPLICATE_0dcf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2544_l2537_l2541_l2534_DUPLICATE_2c76_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2544_l2537_l2541_l2534_DUPLICATE_2c76_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2544_l2537_l2541_l2534_DUPLICATE_2c76_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2544_l2537_l2541_l2534_DUPLICATE_2c76_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2528_l2557_l2544_l2541_l2537_l2534_DUPLICATE_4c13_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2528_l2557_l2544_l2541_l2537_l2534_DUPLICATE_4c13_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2528_l2557_l2544_l2541_l2537_l2534_DUPLICATE_4c13_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2528_l2557_l2544_l2541_l2537_l2534_DUPLICATE_4c13_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2528_l2557_l2544_l2541_l2537_l2534_DUPLICATE_4c13_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_6ab0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2528_l2557_l2544_l2541_l2537_l2534_DUPLICATE_4c13_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2544_l2550_DUPLICATE_6c4f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2456_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2544_l2550_DUPLICATE_6c4f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2528_l2550_l2544_l2541_l2537_l2534_DUPLICATE_f54c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2528_l2550_l2544_l2541_l2537_l2534_DUPLICATE_f54c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2528_l2550_l2544_l2541_l2537_l2534_DUPLICATE_f54c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2528_l2550_l2544_l2541_l2537_l2534_DUPLICATE_f54c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2528_l2550_l2544_l2541_l2537_l2534_DUPLICATE_f54c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2550_c7_2456_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2528_l2550_l2544_l2541_l2537_l2534_DUPLICATE_f54c_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2551_c11_a219_right := VAR_CONST_SR_4_uxn_opcodes_h_l2551_c34_ecb5_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l2548_c32_23e3] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2548_c32_23e3_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2548_c32_23e3_left;
     BIN_OP_GT_uxn_opcodes_h_l2548_c32_23e3_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2548_c32_23e3_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2548_c32_23e3_return_output := BIN_OP_GT_uxn_opcodes_h_l2548_c32_23e3_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2544_c7_185f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_185f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_185f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_185f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_185f_return_output;

     -- n8_MUX[uxn_opcodes_h_l2544_c7_185f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2544_c7_185f_cond <= VAR_n8_MUX_uxn_opcodes_h_l2544_c7_185f_cond;
     n8_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue;
     n8_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2544_c7_185f_return_output := n8_MUX_uxn_opcodes_h_l2544_c7_185f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2528_c1_b3a2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2528_c1_b3a2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2528_c1_b3a2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2528_c1_b3a2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2528_c1_b3a2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2528_c1_b3a2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2528_c1_b3a2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2528_c1_b3a2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2528_c1_b3a2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2550_c7_2456] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2456_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2456_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2456_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2456_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2456_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2456_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2456_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2456_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2557_c7_6ab0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_6ab0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_6ab0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_6ab0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_6ab0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_6ab0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_6ab0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_6ab0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_6ab0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2557_c7_6ab0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_6ab0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_6ab0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_6ab0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_6ab0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_6ab0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_6ab0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_6ab0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_6ab0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2550_c7_2456] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2456_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2456_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2456_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2456_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2456_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2456_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2456_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2456_return_output;

     -- BIN_OP_SR[uxn_opcodes_h_l2551_c11_c2e5] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l2551_c11_c2e5_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l2551_c11_c2e5_left;
     BIN_OP_SR_uxn_opcodes_h_l2551_c11_c2e5_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l2551_c11_c2e5_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l2551_c11_c2e5_return_output := BIN_OP_SR_uxn_opcodes_h_l2551_c11_c2e5_return_output;

     -- t8_MUX[uxn_opcodes_h_l2537_c7_a496] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2537_c7_a496_cond <= VAR_t8_MUX_uxn_opcodes_h_l2537_c7_a496_cond;
     t8_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue;
     t8_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2537_c7_a496_return_output := t8_MUX_uxn_opcodes_h_l2537_c7_a496_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2548_c32_79c0_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2548_c32_23e3_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2551_c11_a219_left := VAR_BIN_OP_SR_uxn_opcodes_h_l2551_c11_c2e5_return_output;
     VAR_printf_uxn_opcodes_h_l2529_c3_26de_uxn_opcodes_h_l2529_c3_26de_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2528_c1_b3a2_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2544_c7_185f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2456_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_6ab0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2456_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_185f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_2456_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2557_c7_6ab0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2456_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2537_c7_a496_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2550_c7_2456] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2456_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2456_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2456_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2456_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2456_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2456_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2456_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2456_return_output;

     -- MUX[uxn_opcodes_h_l2548_c32_79c0] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2548_c32_79c0_cond <= VAR_MUX_uxn_opcodes_h_l2548_c32_79c0_cond;
     MUX_uxn_opcodes_h_l2548_c32_79c0_iftrue <= VAR_MUX_uxn_opcodes_h_l2548_c32_79c0_iftrue;
     MUX_uxn_opcodes_h_l2548_c32_79c0_iffalse <= VAR_MUX_uxn_opcodes_h_l2548_c32_79c0_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2548_c32_79c0_return_output := MUX_uxn_opcodes_h_l2548_c32_79c0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2544_c7_185f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_185f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_185f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_185f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_185f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2541_c7_7d2b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output;

     -- n8_MUX[uxn_opcodes_h_l2541_c7_7d2b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond <= VAR_n8_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond;
     n8_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue;
     n8_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output := n8_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output;

     -- t8_MUX[uxn_opcodes_h_l2534_c7_8431] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2534_c7_8431_cond <= VAR_t8_MUX_uxn_opcodes_h_l2534_c7_8431_cond;
     t8_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue;
     t8_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2534_c7_8431_return_output := t8_MUX_uxn_opcodes_h_l2534_c7_8431_return_output;

     -- printf_uxn_opcodes_h_l2529_c3_26de[uxn_opcodes_h_l2529_c3_26de] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2529_c3_26de_uxn_opcodes_h_l2529_c3_26de_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2529_c3_26de_uxn_opcodes_h_l2529_c3_26de_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2544_c7_185f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_185f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_185f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_185f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_185f_return_output;

     -- BIN_OP_SL[uxn_opcodes_h_l2551_c11_a219] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l2551_c11_a219_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l2551_c11_a219_left;
     BIN_OP_SL_uxn_opcodes_h_l2551_c11_a219_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l2551_c11_a219_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l2551_c11_a219_return_output := BIN_OP_SL_uxn_opcodes_h_l2551_c11_a219_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2550_c7_2456] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_2456_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_2456_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_2456_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_2456_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_2456_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_2456_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_2456_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_2456_return_output;

     -- Submodule level 3
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2550_c7_2456_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2551_c11_a219_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2550_c7_2456_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2551_c11_a219_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue := VAR_MUX_uxn_opcodes_h_l2548_c32_79c0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2456_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_185f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_2456_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_185f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2534_c7_8431_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l2537_c7_a496] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2537_c7_a496_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2537_c7_a496_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2537_c7_a496_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2537_c7_a496_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2544_c7_185f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_185f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_185f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_185f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_185f_return_output;

     -- n8_MUX[uxn_opcodes_h_l2537_c7_a496] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2537_c7_a496_cond <= VAR_n8_MUX_uxn_opcodes_h_l2537_c7_a496_cond;
     n8_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue;
     n8_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2537_c7_a496_return_output := n8_MUX_uxn_opcodes_h_l2537_c7_a496_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2550_c7_2456] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2550_c7_2456_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2550_c7_2456_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2550_c7_2456_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2550_c7_2456_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2550_c7_2456_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2550_c7_2456_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2550_c7_2456_return_output := result_stack_value_MUX_uxn_opcodes_h_l2550_c7_2456_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2541_c7_7d2b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2544_c7_185f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_185f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_185f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_185f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_185f_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l2550_c7_2456] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2550_c7_2456_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2550_c7_2456_cond;
     tmp8_MUX_uxn_opcodes_h_l2550_c7_2456_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2550_c7_2456_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2550_c7_2456_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2550_c7_2456_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2550_c7_2456_return_output := tmp8_MUX_uxn_opcodes_h_l2550_c7_2456_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2544_c7_185f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_185f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_185f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_185f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_185f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2541_c7_7d2b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output;

     -- t8_MUX[uxn_opcodes_h_l2528_c2_5ee7] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond <= VAR_t8_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond;
     t8_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue;
     t8_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output := t8_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2537_c7_a496_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_185f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2537_c7_a496_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_185f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_185f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2550_c7_2456_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l2550_c7_2456_return_output;
     -- n8_MUX[uxn_opcodes_h_l2534_c7_8431] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2534_c7_8431_cond <= VAR_n8_MUX_uxn_opcodes_h_l2534_c7_8431_cond;
     n8_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue;
     n8_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2534_c7_8431_return_output := n8_MUX_uxn_opcodes_h_l2534_c7_8431_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2534_c7_8431] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2534_c7_8431_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2534_c7_8431_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2534_c7_8431_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2534_c7_8431_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2544_c7_185f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2544_c7_185f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2544_c7_185f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2544_c7_185f_return_output := result_stack_value_MUX_uxn_opcodes_h_l2544_c7_185f_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l2544_c7_185f] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2544_c7_185f_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2544_c7_185f_cond;
     tmp8_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2544_c7_185f_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2544_c7_185f_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2544_c7_185f_return_output := tmp8_MUX_uxn_opcodes_h_l2544_c7_185f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2541_c7_7d2b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2537_c7_a496] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2537_c7_a496_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2537_c7_a496_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2537_c7_a496_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2537_c7_a496_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2541_c7_7d2b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2537_c7_a496] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2537_c7_a496_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2537_c7_a496_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2537_c7_a496_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2537_c7_a496_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2541_c7_7d2b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2534_c7_8431_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2537_c7_a496_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2534_c7_8431_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2537_c7_a496_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2544_c7_185f_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l2544_c7_185f_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l2541_c7_7d2b] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond;
     tmp8_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output := tmp8_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output;

     -- n8_MUX[uxn_opcodes_h_l2528_c2_5ee7] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond <= VAR_n8_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond;
     n8_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue;
     n8_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output := n8_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2541_c7_7d2b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2541_c7_7d2b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2541_c7_7d2b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2541_c7_7d2b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output := result_stack_value_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2537_c7_a496] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_a496_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_a496_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_a496_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_a496_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2528_c2_5ee7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2537_c7_a496] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2537_c7_a496_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2537_c7_a496_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2537_c7_a496_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2537_c7_a496_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2534_c7_8431] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_8431_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_8431_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_8431_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_8431_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2534_c7_8431] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_8431_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_8431_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_8431_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_8431_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2537_c7_a496] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_a496_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_a496_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_a496_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_a496_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_a496_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_8431_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_a496_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2537_c7_a496_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_8431_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l2541_c7_7d2b_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2537_c7_a496] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2537_c7_a496_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2537_c7_a496_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2537_c7_a496_return_output := result_stack_value_MUX_uxn_opcodes_h_l2537_c7_a496_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2528_c2_5ee7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2534_c7_8431] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_8431_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_8431_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_8431_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_8431_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2528_c2_5ee7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2534_c7_8431] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_8431_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_8431_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_8431_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_8431_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2534_c7_8431] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_8431_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_8431_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_8431_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_8431_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l2537_c7_a496] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2537_c7_a496_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2537_c7_a496_cond;
     tmp8_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2537_c7_a496_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2537_c7_a496_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2537_c7_a496_return_output := tmp8_MUX_uxn_opcodes_h_l2537_c7_a496_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_8431_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_8431_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_8431_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2537_c7_a496_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l2537_c7_a496_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2528_c2_5ee7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2528_c2_5ee7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l2534_c7_8431] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2534_c7_8431_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2534_c7_8431_cond;
     tmp8_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2534_c7_8431_return_output := tmp8_MUX_uxn_opcodes_h_l2534_c7_8431_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2528_c2_5ee7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2534_c7_8431] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2534_c7_8431_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2534_c7_8431_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2534_c7_8431_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2534_c7_8431_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2534_c7_8431_return_output := result_stack_value_MUX_uxn_opcodes_h_l2534_c7_8431_return_output;

     -- Submodule level 8
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2534_c7_8431_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l2534_c7_8431_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l2528_c2_5ee7] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond;
     tmp8_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output := tmp8_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2528_c2_5ee7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2528_c2_5ee7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2528_c2_5ee7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2528_c2_5ee7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output := result_stack_value_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output;

     -- Submodule level 9
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2562_l2524_DUPLICATE_545a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2562_l2524_DUPLICATE_545a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c2_5ee7_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2562_l2524_DUPLICATE_545a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2562_l2524_DUPLICATE_545a_return_output;
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
