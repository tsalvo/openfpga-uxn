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
entity add_0CLK_3220bbf1 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end add_0CLK_3220bbf1;
architecture arch of add_0CLK_3220bbf1 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l861_c6_9887]
signal BIN_OP_EQ_uxn_opcodes_h_l861_c6_9887_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l861_c6_9887_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l861_c6_9887_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l861_c1_1001]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_1001_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_1001_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_1001_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_1001_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l861_c2_a7a7]
signal t8_MUX_uxn_opcodes_h_l861_c2_a7a7_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l861_c2_a7a7_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l861_c2_a7a7_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l861_c2_a7a7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l861_c2_a7a7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l861_c2_a7a7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l861_c2_a7a7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l861_c2_a7a7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c2_a7a7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c2_a7a7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c2_a7a7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l861_c2_a7a7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c2_a7a7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c2_a7a7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c2_a7a7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l861_c2_a7a7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l861_c2_a7a7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l861_c2_a7a7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l861_c2_a7a7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l861_c2_a7a7]
signal result_stack_value_MUX_uxn_opcodes_h_l861_c2_a7a7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l861_c2_a7a7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l861_c2_a7a7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l861_c2_a7a7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l861_c2_a7a7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l861_c2_a7a7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l861_c2_a7a7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l861_c2_a7a7]
signal n8_MUX_uxn_opcodes_h_l861_c2_a7a7_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l861_c2_a7a7_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l861_c2_a7a7_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l862_c3_a64b[uxn_opcodes_h_l862_c3_a64b]
signal printf_uxn_opcodes_h_l862_c3_a64b_uxn_opcodes_h_l862_c3_a64b_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l866_c11_7e08]
signal BIN_OP_EQ_uxn_opcodes_h_l866_c11_7e08_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l866_c11_7e08_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l866_c11_7e08_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l866_c7_a5d8]
signal t8_MUX_uxn_opcodes_h_l866_c7_a5d8_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l866_c7_a5d8_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l866_c7_a5d8_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l866_c7_a5d8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_a5d8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_a5d8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_a5d8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l866_c7_a5d8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_a5d8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_a5d8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_a5d8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l866_c7_a5d8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_a5d8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_a5d8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_a5d8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l866_c7_a5d8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_a5d8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_a5d8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_a5d8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l866_c7_a5d8]
signal result_stack_value_MUX_uxn_opcodes_h_l866_c7_a5d8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l866_c7_a5d8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l866_c7_a5d8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l866_c7_a5d8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_a5d8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_a5d8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_a5d8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l866_c7_a5d8]
signal n8_MUX_uxn_opcodes_h_l866_c7_a5d8_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l866_c7_a5d8_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l866_c7_a5d8_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l869_c11_2898]
signal BIN_OP_EQ_uxn_opcodes_h_l869_c11_2898_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l869_c11_2898_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l869_c11_2898_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l869_c7_a5bb]
signal t8_MUX_uxn_opcodes_h_l869_c7_a5bb_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l869_c7_a5bb_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l869_c7_a5bb_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l869_c7_a5bb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a5bb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a5bb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a5bb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l869_c7_a5bb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a5bb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a5bb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a5bb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l869_c7_a5bb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a5bb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a5bb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a5bb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l869_c7_a5bb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a5bb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a5bb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a5bb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l869_c7_a5bb]
signal result_stack_value_MUX_uxn_opcodes_h_l869_c7_a5bb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l869_c7_a5bb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l869_c7_a5bb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l869_c7_a5bb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_a5bb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_a5bb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_a5bb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l869_c7_a5bb]
signal n8_MUX_uxn_opcodes_h_l869_c7_a5bb_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l869_c7_a5bb_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l869_c7_a5bb_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l873_c11_efe0]
signal BIN_OP_EQ_uxn_opcodes_h_l873_c11_efe0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l873_c11_efe0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l873_c11_efe0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l873_c7_6c0a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_6c0a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_6c0a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_6c0a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_6c0a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l873_c7_6c0a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_6c0a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_6c0a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_6c0a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_6c0a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l873_c7_6c0a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_6c0a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_6c0a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_6c0a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_6c0a_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l873_c7_6c0a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_6c0a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_6c0a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_6c0a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_6c0a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l873_c7_6c0a]
signal result_stack_value_MUX_uxn_opcodes_h_l873_c7_6c0a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l873_c7_6c0a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l873_c7_6c0a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l873_c7_6c0a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l873_c7_6c0a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_6c0a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_6c0a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_6c0a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_6c0a_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l873_c7_6c0a]
signal n8_MUX_uxn_opcodes_h_l873_c7_6c0a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l873_c7_6c0a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l873_c7_6c0a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l873_c7_6c0a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l876_c11_d34a]
signal BIN_OP_EQ_uxn_opcodes_h_l876_c11_d34a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l876_c11_d34a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l876_c11_d34a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l876_c7_8936]
signal result_is_stack_write_MUX_uxn_opcodes_h_l876_c7_8936_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l876_c7_8936_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l876_c7_8936_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l876_c7_8936_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l876_c7_8936]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c7_8936_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c7_8936_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c7_8936_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c7_8936_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l876_c7_8936]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c7_8936_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c7_8936_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c7_8936_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c7_8936_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l876_c7_8936]
signal result_is_opc_done_MUX_uxn_opcodes_h_l876_c7_8936_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l876_c7_8936_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l876_c7_8936_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l876_c7_8936_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l876_c7_8936]
signal result_stack_value_MUX_uxn_opcodes_h_l876_c7_8936_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l876_c7_8936_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l876_c7_8936_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l876_c7_8936_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l876_c7_8936]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l876_c7_8936_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l876_c7_8936_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l876_c7_8936_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l876_c7_8936_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l876_c7_8936]
signal n8_MUX_uxn_opcodes_h_l876_c7_8936_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l876_c7_8936_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l876_c7_8936_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l876_c7_8936_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l879_c32_5740]
signal BIN_OP_AND_uxn_opcodes_h_l879_c32_5740_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l879_c32_5740_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l879_c32_5740_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l879_c32_93ca]
signal BIN_OP_GT_uxn_opcodes_h_l879_c32_93ca_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l879_c32_93ca_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l879_c32_93ca_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l879_c32_2d20]
signal MUX_uxn_opcodes_h_l879_c32_2d20_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l879_c32_2d20_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l879_c32_2d20_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l879_c32_2d20_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l881_c11_ae83]
signal BIN_OP_EQ_uxn_opcodes_h_l881_c11_ae83_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l881_c11_ae83_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l881_c11_ae83_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l881_c7_299d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l881_c7_299d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l881_c7_299d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l881_c7_299d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l881_c7_299d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l881_c7_299d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l881_c7_299d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l881_c7_299d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l881_c7_299d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l881_c7_299d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l881_c7_299d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l881_c7_299d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l881_c7_299d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l881_c7_299d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l881_c7_299d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l881_c7_299d]
signal result_stack_value_MUX_uxn_opcodes_h_l881_c7_299d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l881_c7_299d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l881_c7_299d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l881_c7_299d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l881_c7_299d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l881_c7_299d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l881_c7_299d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l881_c7_299d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l881_c7_299d_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l885_c24_353d]
signal BIN_OP_PLUS_uxn_opcodes_h_l885_c24_353d_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l885_c24_353d_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l885_c24_353d_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l887_c11_0e9f]
signal BIN_OP_EQ_uxn_opcodes_h_l887_c11_0e9f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l887_c11_0e9f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l887_c11_0e9f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l887_c7_e6d6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_e6d6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_e6d6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_e6d6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_e6d6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l887_c7_e6d6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_e6d6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_e6d6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_e6d6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_e6d6_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l861_c6_9887
BIN_OP_EQ_uxn_opcodes_h_l861_c6_9887 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l861_c6_9887_left,
BIN_OP_EQ_uxn_opcodes_h_l861_c6_9887_right,
BIN_OP_EQ_uxn_opcodes_h_l861_c6_9887_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_1001
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_1001 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_1001_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_1001_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_1001_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_1001_return_output);

-- t8_MUX_uxn_opcodes_h_l861_c2_a7a7
t8_MUX_uxn_opcodes_h_l861_c2_a7a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l861_c2_a7a7_cond,
t8_MUX_uxn_opcodes_h_l861_c2_a7a7_iftrue,
t8_MUX_uxn_opcodes_h_l861_c2_a7a7_iffalse,
t8_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l861_c2_a7a7
result_is_stack_write_MUX_uxn_opcodes_h_l861_c2_a7a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l861_c2_a7a7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l861_c2_a7a7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l861_c2_a7a7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c2_a7a7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c2_a7a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c2_a7a7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c2_a7a7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c2_a7a7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c2_a7a7
result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c2_a7a7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c2_a7a7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c2_a7a7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c2_a7a7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l861_c2_a7a7
result_is_opc_done_MUX_uxn_opcodes_h_l861_c2_a7a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l861_c2_a7a7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l861_c2_a7a7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l861_c2_a7a7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l861_c2_a7a7
result_stack_value_MUX_uxn_opcodes_h_l861_c2_a7a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l861_c2_a7a7_cond,
result_stack_value_MUX_uxn_opcodes_h_l861_c2_a7a7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l861_c2_a7a7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l861_c2_a7a7
result_is_sp_shift_MUX_uxn_opcodes_h_l861_c2_a7a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l861_c2_a7a7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l861_c2_a7a7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l861_c2_a7a7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output);

-- n8_MUX_uxn_opcodes_h_l861_c2_a7a7
n8_MUX_uxn_opcodes_h_l861_c2_a7a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l861_c2_a7a7_cond,
n8_MUX_uxn_opcodes_h_l861_c2_a7a7_iftrue,
n8_MUX_uxn_opcodes_h_l861_c2_a7a7_iffalse,
n8_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output);

-- printf_uxn_opcodes_h_l862_c3_a64b_uxn_opcodes_h_l862_c3_a64b
printf_uxn_opcodes_h_l862_c3_a64b_uxn_opcodes_h_l862_c3_a64b : entity work.printf_uxn_opcodes_h_l862_c3_a64b_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l862_c3_a64b_uxn_opcodes_h_l862_c3_a64b_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l866_c11_7e08
BIN_OP_EQ_uxn_opcodes_h_l866_c11_7e08 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l866_c11_7e08_left,
BIN_OP_EQ_uxn_opcodes_h_l866_c11_7e08_right,
BIN_OP_EQ_uxn_opcodes_h_l866_c11_7e08_return_output);

-- t8_MUX_uxn_opcodes_h_l866_c7_a5d8
t8_MUX_uxn_opcodes_h_l866_c7_a5d8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l866_c7_a5d8_cond,
t8_MUX_uxn_opcodes_h_l866_c7_a5d8_iftrue,
t8_MUX_uxn_opcodes_h_l866_c7_a5d8_iffalse,
t8_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_a5d8
result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_a5d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_a5d8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_a5d8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_a5d8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_a5d8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_a5d8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_a5d8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_a5d8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_a5d8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_a5d8
result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_a5d8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_a5d8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_a5d8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_a5d8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_a5d8
result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_a5d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_a5d8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_a5d8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_a5d8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l866_c7_a5d8
result_stack_value_MUX_uxn_opcodes_h_l866_c7_a5d8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l866_c7_a5d8_cond,
result_stack_value_MUX_uxn_opcodes_h_l866_c7_a5d8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l866_c7_a5d8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_a5d8
result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_a5d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_a5d8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_a5d8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_a5d8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output);

-- n8_MUX_uxn_opcodes_h_l866_c7_a5d8
n8_MUX_uxn_opcodes_h_l866_c7_a5d8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l866_c7_a5d8_cond,
n8_MUX_uxn_opcodes_h_l866_c7_a5d8_iftrue,
n8_MUX_uxn_opcodes_h_l866_c7_a5d8_iffalse,
n8_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l869_c11_2898
BIN_OP_EQ_uxn_opcodes_h_l869_c11_2898 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l869_c11_2898_left,
BIN_OP_EQ_uxn_opcodes_h_l869_c11_2898_right,
BIN_OP_EQ_uxn_opcodes_h_l869_c11_2898_return_output);

-- t8_MUX_uxn_opcodes_h_l869_c7_a5bb
t8_MUX_uxn_opcodes_h_l869_c7_a5bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l869_c7_a5bb_cond,
t8_MUX_uxn_opcodes_h_l869_c7_a5bb_iftrue,
t8_MUX_uxn_opcodes_h_l869_c7_a5bb_iffalse,
t8_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a5bb
result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a5bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a5bb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a5bb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a5bb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a5bb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a5bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a5bb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a5bb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a5bb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a5bb
result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a5bb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a5bb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a5bb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a5bb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a5bb
result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a5bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a5bb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a5bb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a5bb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l869_c7_a5bb
result_stack_value_MUX_uxn_opcodes_h_l869_c7_a5bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l869_c7_a5bb_cond,
result_stack_value_MUX_uxn_opcodes_h_l869_c7_a5bb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l869_c7_a5bb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_a5bb
result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_a5bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_a5bb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_a5bb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_a5bb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output);

-- n8_MUX_uxn_opcodes_h_l869_c7_a5bb
n8_MUX_uxn_opcodes_h_l869_c7_a5bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l869_c7_a5bb_cond,
n8_MUX_uxn_opcodes_h_l869_c7_a5bb_iftrue,
n8_MUX_uxn_opcodes_h_l869_c7_a5bb_iffalse,
n8_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l873_c11_efe0
BIN_OP_EQ_uxn_opcodes_h_l873_c11_efe0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l873_c11_efe0_left,
BIN_OP_EQ_uxn_opcodes_h_l873_c11_efe0_right,
BIN_OP_EQ_uxn_opcodes_h_l873_c11_efe0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_6c0a
result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_6c0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_6c0a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_6c0a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_6c0a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_6c0a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_6c0a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_6c0a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_6c0a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_6c0a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_6c0a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_6c0a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_6c0a
result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_6c0a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_6c0a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_6c0a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_6c0a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_6c0a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_6c0a
result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_6c0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_6c0a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_6c0a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_6c0a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_6c0a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l873_c7_6c0a
result_stack_value_MUX_uxn_opcodes_h_l873_c7_6c0a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l873_c7_6c0a_cond,
result_stack_value_MUX_uxn_opcodes_h_l873_c7_6c0a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l873_c7_6c0a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l873_c7_6c0a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_6c0a
result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_6c0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_6c0a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_6c0a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_6c0a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_6c0a_return_output);

-- n8_MUX_uxn_opcodes_h_l873_c7_6c0a
n8_MUX_uxn_opcodes_h_l873_c7_6c0a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l873_c7_6c0a_cond,
n8_MUX_uxn_opcodes_h_l873_c7_6c0a_iftrue,
n8_MUX_uxn_opcodes_h_l873_c7_6c0a_iffalse,
n8_MUX_uxn_opcodes_h_l873_c7_6c0a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l876_c11_d34a
BIN_OP_EQ_uxn_opcodes_h_l876_c11_d34a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l876_c11_d34a_left,
BIN_OP_EQ_uxn_opcodes_h_l876_c11_d34a_right,
BIN_OP_EQ_uxn_opcodes_h_l876_c11_d34a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l876_c7_8936
result_is_stack_write_MUX_uxn_opcodes_h_l876_c7_8936 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l876_c7_8936_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l876_c7_8936_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l876_c7_8936_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l876_c7_8936_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c7_8936
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c7_8936 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c7_8936_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c7_8936_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c7_8936_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c7_8936_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c7_8936
result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c7_8936 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c7_8936_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c7_8936_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c7_8936_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c7_8936_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l876_c7_8936
result_is_opc_done_MUX_uxn_opcodes_h_l876_c7_8936 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l876_c7_8936_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l876_c7_8936_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l876_c7_8936_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l876_c7_8936_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l876_c7_8936
result_stack_value_MUX_uxn_opcodes_h_l876_c7_8936 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l876_c7_8936_cond,
result_stack_value_MUX_uxn_opcodes_h_l876_c7_8936_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l876_c7_8936_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l876_c7_8936_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l876_c7_8936
result_is_sp_shift_MUX_uxn_opcodes_h_l876_c7_8936 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l876_c7_8936_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l876_c7_8936_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l876_c7_8936_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l876_c7_8936_return_output);

-- n8_MUX_uxn_opcodes_h_l876_c7_8936
n8_MUX_uxn_opcodes_h_l876_c7_8936 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l876_c7_8936_cond,
n8_MUX_uxn_opcodes_h_l876_c7_8936_iftrue,
n8_MUX_uxn_opcodes_h_l876_c7_8936_iffalse,
n8_MUX_uxn_opcodes_h_l876_c7_8936_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l879_c32_5740
BIN_OP_AND_uxn_opcodes_h_l879_c32_5740 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l879_c32_5740_left,
BIN_OP_AND_uxn_opcodes_h_l879_c32_5740_right,
BIN_OP_AND_uxn_opcodes_h_l879_c32_5740_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l879_c32_93ca
BIN_OP_GT_uxn_opcodes_h_l879_c32_93ca : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l879_c32_93ca_left,
BIN_OP_GT_uxn_opcodes_h_l879_c32_93ca_right,
BIN_OP_GT_uxn_opcodes_h_l879_c32_93ca_return_output);

-- MUX_uxn_opcodes_h_l879_c32_2d20
MUX_uxn_opcodes_h_l879_c32_2d20 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l879_c32_2d20_cond,
MUX_uxn_opcodes_h_l879_c32_2d20_iftrue,
MUX_uxn_opcodes_h_l879_c32_2d20_iffalse,
MUX_uxn_opcodes_h_l879_c32_2d20_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l881_c11_ae83
BIN_OP_EQ_uxn_opcodes_h_l881_c11_ae83 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l881_c11_ae83_left,
BIN_OP_EQ_uxn_opcodes_h_l881_c11_ae83_right,
BIN_OP_EQ_uxn_opcodes_h_l881_c11_ae83_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l881_c7_299d
result_is_stack_write_MUX_uxn_opcodes_h_l881_c7_299d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l881_c7_299d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l881_c7_299d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l881_c7_299d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l881_c7_299d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l881_c7_299d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l881_c7_299d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l881_c7_299d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l881_c7_299d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l881_c7_299d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l881_c7_299d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l881_c7_299d
result_is_opc_done_MUX_uxn_opcodes_h_l881_c7_299d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l881_c7_299d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l881_c7_299d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l881_c7_299d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l881_c7_299d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l881_c7_299d
result_stack_value_MUX_uxn_opcodes_h_l881_c7_299d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l881_c7_299d_cond,
result_stack_value_MUX_uxn_opcodes_h_l881_c7_299d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l881_c7_299d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l881_c7_299d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l881_c7_299d
result_is_sp_shift_MUX_uxn_opcodes_h_l881_c7_299d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l881_c7_299d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l881_c7_299d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l881_c7_299d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l881_c7_299d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l885_c24_353d
BIN_OP_PLUS_uxn_opcodes_h_l885_c24_353d : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l885_c24_353d_left,
BIN_OP_PLUS_uxn_opcodes_h_l885_c24_353d_right,
BIN_OP_PLUS_uxn_opcodes_h_l885_c24_353d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l887_c11_0e9f
BIN_OP_EQ_uxn_opcodes_h_l887_c11_0e9f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l887_c11_0e9f_left,
BIN_OP_EQ_uxn_opcodes_h_l887_c11_0e9f_right,
BIN_OP_EQ_uxn_opcodes_h_l887_c11_0e9f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_e6d6
result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_e6d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_e6d6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_e6d6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_e6d6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_e6d6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_e6d6
result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_e6d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_e6d6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_e6d6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_e6d6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_e6d6_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l861_c6_9887_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_1001_return_output,
 t8_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output,
 n8_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l866_c11_7e08_return_output,
 t8_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output,
 n8_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l869_c11_2898_return_output,
 t8_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output,
 n8_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l873_c11_efe0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_6c0a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_6c0a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_6c0a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_6c0a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l873_c7_6c0a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_6c0a_return_output,
 n8_MUX_uxn_opcodes_h_l873_c7_6c0a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l876_c11_d34a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l876_c7_8936_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c7_8936_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c7_8936_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l876_c7_8936_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l876_c7_8936_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l876_c7_8936_return_output,
 n8_MUX_uxn_opcodes_h_l876_c7_8936_return_output,
 BIN_OP_AND_uxn_opcodes_h_l879_c32_5740_return_output,
 BIN_OP_GT_uxn_opcodes_h_l879_c32_93ca_return_output,
 MUX_uxn_opcodes_h_l879_c32_2d20_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l881_c11_ae83_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l881_c7_299d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l881_c7_299d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l881_c7_299d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l881_c7_299d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l881_c7_299d_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l885_c24_353d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l887_c11_0e9f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_e6d6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_e6d6_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c6_9887_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c6_9887_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c6_9887_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_1001_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_1001_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_1001_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_1001_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l861_c2_a7a7_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l861_c2_a7a7_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l861_c2_a7a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c2_a7a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c2_a7a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c2_a7a7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c2_a7a7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l863_c3_4960 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c2_a7a7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c2_a7a7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c2_a7a7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c2_a7a7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c2_a7a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c2_a7a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c2_a7a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c2_a7a7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c2_a7a7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c2_a7a7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c2_a7a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c2_a7a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c2_a7a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c2_a7a7_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l861_c2_a7a7_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l861_c2_a7a7_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l861_c2_a7a7_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l862_c3_a64b_uxn_opcodes_h_l862_c3_a64b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_7e08_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_7e08_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_7e08_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l866_c7_a5d8_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l866_c7_a5d8_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l866_c7_a5d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_a5d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_a5d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_a5d8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_a5d8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l867_c3_722f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_a5d8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_a5d8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_a5d8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_a5d8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_a5d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_a5d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_a5d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_a5d8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l866_c7_a5d8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l866_c7_a5d8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l866_c7_a5d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_a5d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_a5d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_a5d8_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l866_c7_a5d8_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l866_c7_a5d8_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l866_c7_a5d8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_2898_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_2898_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_2898_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l869_c7_a5bb_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l869_c7_a5bb_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l869_c7_a5bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a5bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a5bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_6c0a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a5bb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a5bb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l871_c3_ca8d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a5bb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_6c0a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a5bb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a5bb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a5bb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_6c0a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a5bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a5bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a5bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_6c0a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a5bb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l869_c7_a5bb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l869_c7_a5bb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l873_c7_6c0a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l869_c7_a5bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_a5bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_a5bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_6c0a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_a5bb_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l869_c7_a5bb_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l869_c7_a5bb_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l873_c7_6c0a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l869_c7_a5bb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_efe0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_efe0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_efe0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_6c0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_6c0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l876_c7_8936_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_6c0a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_6c0a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l874_c3_1d52 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_6c0a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c7_8936_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_6c0a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_6c0a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_6c0a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c7_8936_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_6c0a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_6c0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_6c0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l876_c7_8936_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_6c0a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l873_c7_6c0a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l873_c7_6c0a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l876_c7_8936_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l873_c7_6c0a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_6c0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_6c0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l876_c7_8936_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_6c0a_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l873_c7_6c0a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l873_c7_6c0a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l876_c7_8936_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l873_c7_6c0a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c11_d34a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c11_d34a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c11_d34a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l876_c7_8936_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l876_c7_8936_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l881_c7_299d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l876_c7_8936_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c7_8936_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c7_8936_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l881_c7_299d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c7_8936_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c7_8936_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c7_8936_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c7_8936_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l876_c7_8936_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l876_c7_8936_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l881_c7_299d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l876_c7_8936_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l876_c7_8936_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l876_c7_8936_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l881_c7_299d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l876_c7_8936_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l876_c7_8936_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l876_c7_8936_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l881_c7_299d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l876_c7_8936_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l876_c7_8936_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l876_c7_8936_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l876_c7_8936_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l879_c32_2d20_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l879_c32_2d20_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l879_c32_2d20_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l879_c32_5740_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l879_c32_5740_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l879_c32_5740_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l879_c32_93ca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l879_c32_93ca_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l879_c32_93ca_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l879_c32_2d20_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l881_c11_ae83_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l881_c11_ae83_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l881_c11_ae83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l881_c7_299d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l881_c7_299d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_e6d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l881_c7_299d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l881_c7_299d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l884_c3_da94 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l881_c7_299d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l881_c7_299d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l881_c7_299d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l881_c7_299d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_e6d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l881_c7_299d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l881_c7_299d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_uxn_opcodes_h_l885_c3_5615 : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l881_c7_299d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l881_c7_299d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l881_c7_299d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l881_c7_299d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l881_c7_299d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l885_c24_353d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l885_c24_353d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l885_c24_353d_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l887_c11_0e9f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l887_c11_0e9f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l887_c11_0e9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_e6d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_e6d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_e6d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_e6d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_e6d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_e6d6_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l861_l887_l876_l873_l869_l866_DUPLICATE_89e1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l861_l876_l873_l869_l866_DUPLICATE_030b_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l861_l881_l876_l873_l869_l866_DUPLICATE_dda9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l861_l881_l873_l869_l866_DUPLICATE_4751_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l887_l881_l876_l873_l869_l866_DUPLICATE_731b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l881_l876_DUPLICATE_84bf_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l892_l857_DUPLICATE_1a3e_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l887_c11_0e9f_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l867_c3_722f := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_a5d8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l867_c3_722f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_7e08_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l874_c3_1d52 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_6c0a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l874_c3_1d52;
     VAR_MUX_uxn_opcodes_h_l879_c32_2d20_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c6_9887_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l881_c7_299d_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l863_c3_4960 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c2_a7a7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l863_c3_4960;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l881_c11_ae83_right := to_unsigned(5, 3);
     VAR_MUX_uxn_opcodes_h_l879_c32_2d20_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_e6d6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c11_d34a_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l871_c3_ca8d := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a5bb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l871_c3_ca8d;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_1001_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_e6d6_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l876_c7_8936_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l884_c3_da94 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l881_c7_299d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l884_c3_da94;
     VAR_BIN_OP_AND_uxn_opcodes_h_l879_c32_5740_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_efe0_right := to_unsigned(3, 2);
     VAR_BIN_OP_GT_uxn_opcodes_h_l879_c32_93ca_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l881_c7_299d_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c2_a7a7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_2898_right := to_unsigned(2, 2);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_1001_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l879_c32_5740_left := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l885_c24_353d_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l861_c2_a7a7_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l866_c7_a5d8_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l869_c7_a5bb_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l873_c7_6c0a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l876_c7_8936_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c6_9887_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_7e08_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_2898_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_efe0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c11_d34a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l881_c11_ae83_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l887_c11_0e9f_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l876_c7_8936_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l869_c7_a5bb_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l885_c24_353d_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l861_c2_a7a7_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l866_c7_a5d8_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l869_c7_a5bb_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l869_c11_2898] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l869_c11_2898_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_2898_left;
     BIN_OP_EQ_uxn_opcodes_h_l869_c11_2898_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_2898_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_2898_return_output := BIN_OP_EQ_uxn_opcodes_h_l869_c11_2898_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l861_l881_l876_l873_l869_l866_DUPLICATE_dda9 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l861_l881_l876_l873_l869_l866_DUPLICATE_dda9_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l873_c11_efe0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l873_c11_efe0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_efe0_left;
     BIN_OP_EQ_uxn_opcodes_h_l873_c11_efe0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_efe0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_efe0_return_output := BIN_OP_EQ_uxn_opcodes_h_l873_c11_efe0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l861_c6_9887] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l861_c6_9887_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c6_9887_left;
     BIN_OP_EQ_uxn_opcodes_h_l861_c6_9887_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c6_9887_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c6_9887_return_output := BIN_OP_EQ_uxn_opcodes_h_l861_c6_9887_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l879_c32_5740] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l879_c32_5740_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l879_c32_5740_left;
     BIN_OP_AND_uxn_opcodes_h_l879_c32_5740_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l879_c32_5740_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l879_c32_5740_return_output := BIN_OP_AND_uxn_opcodes_h_l879_c32_5740_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l876_c11_d34a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l876_c11_d34a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c11_d34a_left;
     BIN_OP_EQ_uxn_opcodes_h_l876_c11_d34a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c11_d34a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c11_d34a_return_output := BIN_OP_EQ_uxn_opcodes_h_l876_c11_d34a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l881_c11_ae83] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l881_c11_ae83_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l881_c11_ae83_left;
     BIN_OP_EQ_uxn_opcodes_h_l881_c11_ae83_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l881_c11_ae83_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l881_c11_ae83_return_output := BIN_OP_EQ_uxn_opcodes_h_l881_c11_ae83_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l861_l887_l876_l873_l869_l866_DUPLICATE_89e1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l861_l887_l876_l873_l869_l866_DUPLICATE_89e1_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l887_c11_0e9f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l887_c11_0e9f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l887_c11_0e9f_left;
     BIN_OP_EQ_uxn_opcodes_h_l887_c11_0e9f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l887_c11_0e9f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l887_c11_0e9f_return_output := BIN_OP_EQ_uxn_opcodes_h_l887_c11_0e9f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l866_c11_7e08] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l866_c11_7e08_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_7e08_left;
     BIN_OP_EQ_uxn_opcodes_h_l866_c11_7e08_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_7e08_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_7e08_return_output := BIN_OP_EQ_uxn_opcodes_h_l866_c11_7e08_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l861_l881_l873_l869_l866_DUPLICATE_4751 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l861_l881_l873_l869_l866_DUPLICATE_4751_return_output := result.is_sp_shift;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l861_l876_l873_l869_l866_DUPLICATE_030b LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l861_l876_l873_l869_l866_DUPLICATE_030b_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l887_l881_l876_l873_l869_l866_DUPLICATE_731b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l887_l881_l876_l873_l869_l866_DUPLICATE_731b_return_output := result.is_opc_done;

     -- BIN_OP_PLUS[uxn_opcodes_h_l885_c24_353d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l885_c24_353d_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l885_c24_353d_left;
     BIN_OP_PLUS_uxn_opcodes_h_l885_c24_353d_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l885_c24_353d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l885_c24_353d_return_output := BIN_OP_PLUS_uxn_opcodes_h_l885_c24_353d_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l881_l876_DUPLICATE_84bf LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l881_l876_DUPLICATE_84bf_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l879_c32_93ca_left := VAR_BIN_OP_AND_uxn_opcodes_h_l879_c32_5740_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_1001_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c6_9887_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l861_c2_a7a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c6_9887_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c2_a7a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c6_9887_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c2_a7a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c6_9887_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c2_a7a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c6_9887_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c2_a7a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c6_9887_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c2_a7a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c6_9887_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c2_a7a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c6_9887_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l861_c2_a7a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c6_9887_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l866_c7_a5d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_7e08_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_a5d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_7e08_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_a5d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_7e08_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_a5d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_7e08_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_a5d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_7e08_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_a5d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_7e08_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l866_c7_a5d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_7e08_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l866_c7_a5d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_7e08_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l869_c7_a5bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_2898_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a5bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_2898_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_a5bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_2898_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a5bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_2898_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a5bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_2898_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a5bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_2898_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l869_c7_a5bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_2898_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l869_c7_a5bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_2898_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l873_c7_6c0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_efe0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_6c0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_efe0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_6c0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_efe0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_6c0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_efe0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_6c0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_efe0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_6c0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_efe0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l873_c7_6c0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_efe0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l876_c7_8936_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c11_d34a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l876_c7_8936_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c11_d34a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l876_c7_8936_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c11_d34a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l876_c7_8936_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c11_d34a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c7_8936_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c11_d34a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c7_8936_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c11_d34a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l876_c7_8936_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l876_c11_d34a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l881_c7_299d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l881_c11_ae83_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l881_c7_299d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l881_c11_ae83_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l881_c7_299d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l881_c11_ae83_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l881_c7_299d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l881_c11_ae83_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l881_c7_299d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l881_c11_ae83_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_e6d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l887_c11_0e9f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_e6d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l887_c11_0e9f_return_output;
     VAR_result_stack_value_uxn_opcodes_h_l885_c3_5615 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l885_c24_353d_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c2_a7a7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l861_l876_l873_l869_l866_DUPLICATE_030b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_a5d8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l861_l876_l873_l869_l866_DUPLICATE_030b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a5bb_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l861_l876_l873_l869_l866_DUPLICATE_030b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_6c0a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l861_l876_l873_l869_l866_DUPLICATE_030b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c7_8936_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l861_l876_l873_l869_l866_DUPLICATE_030b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_a5d8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l887_l881_l876_l873_l869_l866_DUPLICATE_731b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a5bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l887_l881_l876_l873_l869_l866_DUPLICATE_731b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_6c0a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l887_l881_l876_l873_l869_l866_DUPLICATE_731b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l876_c7_8936_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l887_l881_l876_l873_l869_l866_DUPLICATE_731b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l881_c7_299d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l887_l881_l876_l873_l869_l866_DUPLICATE_731b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_e6d6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l887_l881_l876_l873_l869_l866_DUPLICATE_731b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c2_a7a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l861_l881_l873_l869_l866_DUPLICATE_4751_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_a5d8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l861_l881_l873_l869_l866_DUPLICATE_4751_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_a5bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l861_l881_l873_l869_l866_DUPLICATE_4751_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_6c0a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l861_l881_l873_l869_l866_DUPLICATE_4751_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l881_c7_299d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l861_l881_l873_l869_l866_DUPLICATE_4751_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c2_a7a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l861_l887_l876_l873_l869_l866_DUPLICATE_89e1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_a5d8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l861_l887_l876_l873_l869_l866_DUPLICATE_89e1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a5bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l861_l887_l876_l873_l869_l866_DUPLICATE_89e1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_6c0a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l861_l887_l876_l873_l869_l866_DUPLICATE_89e1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l876_c7_8936_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l861_l887_l876_l873_l869_l866_DUPLICATE_89e1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_e6d6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l861_l887_l876_l873_l869_l866_DUPLICATE_89e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c7_8936_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l881_l876_DUPLICATE_84bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l881_c7_299d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l881_l876_DUPLICATE_84bf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c2_a7a7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l861_l881_l876_l873_l869_l866_DUPLICATE_dda9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l866_c7_a5d8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l861_l881_l876_l873_l869_l866_DUPLICATE_dda9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l869_c7_a5bb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l861_l881_l876_l873_l869_l866_DUPLICATE_dda9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l873_c7_6c0a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l861_l881_l876_l873_l869_l866_DUPLICATE_dda9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l876_c7_8936_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l861_l881_l876_l873_l869_l866_DUPLICATE_dda9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l881_c7_299d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l861_l881_l876_l873_l869_l866_DUPLICATE_dda9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l881_c7_299d_iftrue := VAR_result_stack_value_uxn_opcodes_h_l885_c3_5615;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l887_c7_e6d6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_e6d6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_e6d6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_e6d6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_e6d6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_e6d6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_e6d6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_e6d6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_e6d6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l887_c7_e6d6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_e6d6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_e6d6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_e6d6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_e6d6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_e6d6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_e6d6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_e6d6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_e6d6_return_output;

     -- t8_MUX[uxn_opcodes_h_l869_c7_a5bb] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l869_c7_a5bb_cond <= VAR_t8_MUX_uxn_opcodes_h_l869_c7_a5bb_cond;
     t8_MUX_uxn_opcodes_h_l869_c7_a5bb_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l869_c7_a5bb_iftrue;
     t8_MUX_uxn_opcodes_h_l869_c7_a5bb_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l869_c7_a5bb_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output := t8_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l879_c32_93ca] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l879_c32_93ca_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l879_c32_93ca_left;
     BIN_OP_GT_uxn_opcodes_h_l879_c32_93ca_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l879_c32_93ca_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l879_c32_93ca_return_output := BIN_OP_GT_uxn_opcodes_h_l879_c32_93ca_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l881_c7_299d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l881_c7_299d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l881_c7_299d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l881_c7_299d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l881_c7_299d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l881_c7_299d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l881_c7_299d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l881_c7_299d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l881_c7_299d_return_output;

     -- n8_MUX[uxn_opcodes_h_l876_c7_8936] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l876_c7_8936_cond <= VAR_n8_MUX_uxn_opcodes_h_l876_c7_8936_cond;
     n8_MUX_uxn_opcodes_h_l876_c7_8936_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l876_c7_8936_iftrue;
     n8_MUX_uxn_opcodes_h_l876_c7_8936_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l876_c7_8936_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l876_c7_8936_return_output := n8_MUX_uxn_opcodes_h_l876_c7_8936_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l881_c7_299d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l881_c7_299d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l881_c7_299d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l881_c7_299d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l881_c7_299d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l881_c7_299d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l881_c7_299d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l881_c7_299d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l881_c7_299d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l881_c7_299d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l881_c7_299d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l881_c7_299d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l881_c7_299d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l881_c7_299d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l881_c7_299d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l881_c7_299d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l881_c7_299d_return_output := result_stack_value_MUX_uxn_opcodes_h_l881_c7_299d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l861_c1_1001] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_1001_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_1001_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_1001_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_1001_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_1001_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_1001_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_1001_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_1001_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l879_c32_2d20_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l879_c32_93ca_return_output;
     VAR_printf_uxn_opcodes_h_l862_c3_a64b_uxn_opcodes_h_l862_c3_a64b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_1001_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l873_c7_6c0a_iffalse := VAR_n8_MUX_uxn_opcodes_h_l876_c7_8936_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l881_c7_299d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_e6d6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l876_c7_8936_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l881_c7_299d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l881_c7_299d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_e6d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c7_8936_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l881_c7_299d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l876_c7_8936_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l881_c7_299d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l866_c7_a5d8_iffalse := VAR_t8_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l876_c7_8936] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l876_c7_8936_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l876_c7_8936_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l876_c7_8936_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l876_c7_8936_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l876_c7_8936_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l876_c7_8936_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l876_c7_8936_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l876_c7_8936_return_output;

     -- n8_MUX[uxn_opcodes_h_l873_c7_6c0a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l873_c7_6c0a_cond <= VAR_n8_MUX_uxn_opcodes_h_l873_c7_6c0a_cond;
     n8_MUX_uxn_opcodes_h_l873_c7_6c0a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l873_c7_6c0a_iftrue;
     n8_MUX_uxn_opcodes_h_l873_c7_6c0a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l873_c7_6c0a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l873_c7_6c0a_return_output := n8_MUX_uxn_opcodes_h_l873_c7_6c0a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l881_c7_299d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l881_c7_299d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l881_c7_299d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l881_c7_299d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l881_c7_299d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l881_c7_299d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l881_c7_299d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l881_c7_299d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l881_c7_299d_return_output;

     -- t8_MUX[uxn_opcodes_h_l866_c7_a5d8] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l866_c7_a5d8_cond <= VAR_t8_MUX_uxn_opcodes_h_l866_c7_a5d8_cond;
     t8_MUX_uxn_opcodes_h_l866_c7_a5d8_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l866_c7_a5d8_iftrue;
     t8_MUX_uxn_opcodes_h_l866_c7_a5d8_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l866_c7_a5d8_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output := t8_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l881_c7_299d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l881_c7_299d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l881_c7_299d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l881_c7_299d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l881_c7_299d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l881_c7_299d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l881_c7_299d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l881_c7_299d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l881_c7_299d_return_output;

     -- MUX[uxn_opcodes_h_l879_c32_2d20] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l879_c32_2d20_cond <= VAR_MUX_uxn_opcodes_h_l879_c32_2d20_cond;
     MUX_uxn_opcodes_h_l879_c32_2d20_iftrue <= VAR_MUX_uxn_opcodes_h_l879_c32_2d20_iftrue;
     MUX_uxn_opcodes_h_l879_c32_2d20_iffalse <= VAR_MUX_uxn_opcodes_h_l879_c32_2d20_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l879_c32_2d20_return_output := MUX_uxn_opcodes_h_l879_c32_2d20_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l876_c7_8936] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l876_c7_8936_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l876_c7_8936_cond;
     result_stack_value_MUX_uxn_opcodes_h_l876_c7_8936_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l876_c7_8936_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l876_c7_8936_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l876_c7_8936_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l876_c7_8936_return_output := result_stack_value_MUX_uxn_opcodes_h_l876_c7_8936_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l876_c7_8936] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c7_8936_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c7_8936_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c7_8936_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c7_8936_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c7_8936_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c7_8936_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c7_8936_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c7_8936_return_output;

     -- printf_uxn_opcodes_h_l862_c3_a64b[uxn_opcodes_h_l862_c3_a64b] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l862_c3_a64b_uxn_opcodes_h_l862_c3_a64b_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l862_c3_a64b_uxn_opcodes_h_l862_c3_a64b_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c7_8936_iftrue := VAR_MUX_uxn_opcodes_h_l879_c32_2d20_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l869_c7_a5bb_iffalse := VAR_n8_MUX_uxn_opcodes_h_l873_c7_6c0a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l876_c7_8936_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l881_c7_299d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_6c0a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l876_c7_8936_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l876_c7_8936_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l881_c7_299d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_6c0a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l876_c7_8936_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l873_c7_6c0a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l876_c7_8936_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l861_c2_a7a7_iffalse := VAR_t8_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l876_c7_8936] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c7_8936_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c7_8936_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c7_8936_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c7_8936_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c7_8936_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c7_8936_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c7_8936_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c7_8936_return_output;

     -- n8_MUX[uxn_opcodes_h_l869_c7_a5bb] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l869_c7_a5bb_cond <= VAR_n8_MUX_uxn_opcodes_h_l869_c7_a5bb_cond;
     n8_MUX_uxn_opcodes_h_l869_c7_a5bb_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l869_c7_a5bb_iftrue;
     n8_MUX_uxn_opcodes_h_l869_c7_a5bb_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l869_c7_a5bb_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output := n8_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l876_c7_8936] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l876_c7_8936_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l876_c7_8936_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l876_c7_8936_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l876_c7_8936_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l876_c7_8936_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l876_c7_8936_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l876_c7_8936_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l876_c7_8936_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l873_c7_6c0a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_6c0a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_6c0a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_6c0a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_6c0a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_6c0a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_6c0a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_6c0a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_6c0a_return_output;

     -- t8_MUX[uxn_opcodes_h_l861_c2_a7a7] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l861_c2_a7a7_cond <= VAR_t8_MUX_uxn_opcodes_h_l861_c2_a7a7_cond;
     t8_MUX_uxn_opcodes_h_l861_c2_a7a7_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l861_c2_a7a7_iftrue;
     t8_MUX_uxn_opcodes_h_l861_c2_a7a7_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l861_c2_a7a7_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output := t8_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l873_c7_6c0a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l873_c7_6c0a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l873_c7_6c0a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l873_c7_6c0a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l873_c7_6c0a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l873_c7_6c0a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l873_c7_6c0a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l873_c7_6c0a_return_output := result_stack_value_MUX_uxn_opcodes_h_l873_c7_6c0a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l873_c7_6c0a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_6c0a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_6c0a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_6c0a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_6c0a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_6c0a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_6c0a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_6c0a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_6c0a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l876_c7_8936] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l876_c7_8936_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l876_c7_8936_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l876_c7_8936_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l876_c7_8936_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l876_c7_8936_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l876_c7_8936_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l876_c7_8936_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l876_c7_8936_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l866_c7_a5d8_iffalse := VAR_n8_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_6c0a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l876_c7_8936_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_a5bb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l873_c7_6c0a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_6c0a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l876_c7_8936_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_6c0a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l876_c7_8936_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a5bb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_6c0a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l869_c7_a5bb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l873_c7_6c0a_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l873_c7_6c0a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_6c0a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_6c0a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_6c0a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_6c0a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_6c0a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_6c0a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_6c0a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_6c0a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l873_c7_6c0a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_6c0a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_6c0a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_6c0a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_6c0a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_6c0a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_6c0a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_6c0a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_6c0a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l869_c7_a5bb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_a5bb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_a5bb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_a5bb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_a5bb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_a5bb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_a5bb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l869_c7_a5bb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l869_c7_a5bb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l869_c7_a5bb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l869_c7_a5bb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l869_c7_a5bb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l869_c7_a5bb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l869_c7_a5bb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output := result_stack_value_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output;

     -- n8_MUX[uxn_opcodes_h_l866_c7_a5d8] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l866_c7_a5d8_cond <= VAR_n8_MUX_uxn_opcodes_h_l866_c7_a5d8_cond;
     n8_MUX_uxn_opcodes_h_l866_c7_a5d8_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l866_c7_a5d8_iftrue;
     n8_MUX_uxn_opcodes_h_l866_c7_a5d8_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l866_c7_a5d8_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output := n8_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l869_c7_a5bb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a5bb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a5bb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a5bb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a5bb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a5bb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a5bb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l873_c7_6c0a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_6c0a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_6c0a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_6c0a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_6c0a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_6c0a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_6c0a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_6c0a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_6c0a_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l861_c2_a7a7_iffalse := VAR_n8_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a5bb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_6c0a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_a5d8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a5bb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_6c0a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a5bb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l873_c7_6c0a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_a5d8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l866_c7_a5d8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l869_c7_a5bb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a5bb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a5bb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a5bb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a5bb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a5bb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a5bb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output;

     -- n8_MUX[uxn_opcodes_h_l861_c2_a7a7] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l861_c2_a7a7_cond <= VAR_n8_MUX_uxn_opcodes_h_l861_c2_a7a7_cond;
     n8_MUX_uxn_opcodes_h_l861_c2_a7a7_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l861_c2_a7a7_iftrue;
     n8_MUX_uxn_opcodes_h_l861_c2_a7a7_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l861_c2_a7a7_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output := n8_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l866_c7_a5d8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_a5d8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_a5d8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_a5d8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_a5d8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_a5d8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_a5d8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l866_c7_a5d8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_a5d8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_a5d8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_a5d8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_a5d8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_a5d8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_a5d8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l866_c7_a5d8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l866_c7_a5d8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l866_c7_a5d8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l866_c7_a5d8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l866_c7_a5d8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l866_c7_a5d8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l866_c7_a5d8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output := result_stack_value_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l869_c7_a5bb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a5bb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a5bb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a5bb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a5bb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a5bb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a5bb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l869_c7_a5bb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a5bb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a5bb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a5bb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a5bb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a5bb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a5bb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_a5d8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c2_a7a7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_a5d8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_a5d8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_a5bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c2_a7a7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c2_a7a7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l861_c2_a7a7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c2_a7a7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c2_a7a7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c2_a7a7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c2_a7a7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c2_a7a7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c2_a7a7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l866_c7_a5d8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_a5d8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_a5d8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_a5d8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_a5d8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_a5d8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_a5d8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l866_c7_a5d8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_a5d8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_a5d8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_a5d8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_a5d8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_a5d8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_a5d8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l866_c7_a5d8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_a5d8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_a5d8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_a5d8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_a5d8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_a5d8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_a5d8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l861_c2_a7a7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l861_c2_a7a7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c2_a7a7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l861_c2_a7a7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c2_a7a7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l861_c2_a7a7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c2_a7a7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l861_c2_a7a7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l861_c2_a7a7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c2_a7a7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l861_c2_a7a7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c2_a7a7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l861_c2_a7a7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c2_a7a7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output := result_stack_value_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c2_a7a7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c2_a7a7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c2_a7a7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_a5d8_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l861_c2_a7a7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c2_a7a7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c2_a7a7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c2_a7a7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c2_a7a7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c2_a7a7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c2_a7a7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l861_c2_a7a7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l861_c2_a7a7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c2_a7a7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l861_c2_a7a7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c2_a7a7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l861_c2_a7a7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c2_a7a7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l861_c2_a7a7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l861_c2_a7a7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c2_a7a7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l861_c2_a7a7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c2_a7a7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l861_c2_a7a7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c2_a7a7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l892_l857_DUPLICATE_1a3e LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l892_l857_DUPLICATE_1a3e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_53ff(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c2_a7a7_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l892_l857_DUPLICATE_1a3e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l892_l857_DUPLICATE_1a3e_return_output;
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
