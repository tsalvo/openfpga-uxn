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
entity lth_0CLK_7c2e709f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lth_0CLK_7c2e709f;
architecture arch of lth_0CLK_7c2e709f is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2127_c6_2d0a]
signal BIN_OP_EQ_uxn_opcodes_h_l2127_c6_2d0a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2127_c6_2d0a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2127_c6_2d0a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2127_c1_65d3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2127_c1_65d3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2127_c1_65d3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2127_c1_65d3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2127_c1_65d3_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2127_c2_4fc3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2127_c2_4fc3]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2127_c2_4fc3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2127_c2_4fc3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2127_c2_4fc3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2127_c2_4fc3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2127_c2_4fc3]
signal result_stack_value_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2127_c2_4fc3]
signal t8_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2127_c2_4fc3]
signal n8_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l2128_c3_7813[uxn_opcodes_h_l2128_c3_7813]
signal printf_uxn_opcodes_h_l2128_c3_7813_uxn_opcodes_h_l2128_c3_7813_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2133_c11_05e6]
signal BIN_OP_EQ_uxn_opcodes_h_l2133_c11_05e6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2133_c11_05e6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2133_c11_05e6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2133_c7_9ca4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2133_c7_9ca4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2133_c7_9ca4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2133_c7_9ca4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2133_c7_9ca4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2133_c7_9ca4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2133_c7_9ca4]
signal result_stack_value_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2133_c7_9ca4]
signal t8_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2133_c7_9ca4]
signal n8_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2136_c11_05d2]
signal BIN_OP_EQ_uxn_opcodes_h_l2136_c11_05d2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2136_c11_05d2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2136_c11_05d2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2136_c7_4fd5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2136_c7_4fd5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2136_c7_4fd5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2136_c7_4fd5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2136_c7_4fd5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2136_c7_4fd5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2136_c7_4fd5]
signal result_stack_value_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2136_c7_4fd5]
signal t8_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2136_c7_4fd5]
signal n8_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2140_c11_546b]
signal BIN_OP_EQ_uxn_opcodes_h_l2140_c11_546b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2140_c11_546b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2140_c11_546b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2140_c7_93a8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_93a8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_93a8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_93a8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2140_c7_93a8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2140_c7_93a8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2140_c7_93a8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2140_c7_93a8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2140_c7_93a8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_93a8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_93a8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_93a8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2140_c7_93a8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_93a8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_93a8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_93a8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2140_c7_93a8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_93a8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_93a8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_93a8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2140_c7_93a8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_93a8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_93a8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_93a8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2140_c7_93a8]
signal result_stack_value_MUX_uxn_opcodes_h_l2140_c7_93a8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2140_c7_93a8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2140_c7_93a8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2140_c7_93a8]
signal n8_MUX_uxn_opcodes_h_l2140_c7_93a8_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2140_c7_93a8_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2140_c7_93a8_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2143_c11_3fde]
signal BIN_OP_EQ_uxn_opcodes_h_l2143_c11_3fde_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2143_c11_3fde_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2143_c11_3fde_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2143_c7_26ee]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_26ee_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_26ee_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_26ee_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2143_c7_26ee]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2143_c7_26ee_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2143_c7_26ee_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2143_c7_26ee_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2143_c7_26ee]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_26ee_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_26ee_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_26ee_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2143_c7_26ee]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_26ee_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_26ee_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_26ee_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2143_c7_26ee]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_26ee_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_26ee_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_26ee_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2143_c7_26ee]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_26ee_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_26ee_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_26ee_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2143_c7_26ee]
signal result_stack_value_MUX_uxn_opcodes_h_l2143_c7_26ee_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2143_c7_26ee_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2143_c7_26ee_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2143_c7_26ee]
signal n8_MUX_uxn_opcodes_h_l2143_c7_26ee_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2143_c7_26ee_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2143_c7_26ee_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2147_c32_42ee]
signal BIN_OP_AND_uxn_opcodes_h_l2147_c32_42ee_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2147_c32_42ee_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2147_c32_42ee_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2147_c32_2220]
signal BIN_OP_GT_uxn_opcodes_h_l2147_c32_2220_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2147_c32_2220_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2147_c32_2220_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2147_c32_8d08]
signal MUX_uxn_opcodes_h_l2147_c32_8d08_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2147_c32_8d08_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2147_c32_8d08_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2147_c32_8d08_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2149_c11_ad83]
signal BIN_OP_EQ_uxn_opcodes_h_l2149_c11_ad83_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2149_c11_ad83_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2149_c11_ad83_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2149_c7_d390]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_d390_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_d390_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_d390_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_d390_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2149_c7_d390]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_d390_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_d390_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_d390_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_d390_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2149_c7_d390]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_d390_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_d390_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_d390_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_d390_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2149_c7_d390]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_d390_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_d390_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_d390_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_d390_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2149_c7_d390]
signal result_stack_value_MUX_uxn_opcodes_h_l2149_c7_d390_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2149_c7_d390_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2149_c7_d390_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2149_c7_d390_return_output : unsigned(7 downto 0);

-- BIN_OP_LT[uxn_opcodes_h_l2153_c24_134a]
signal BIN_OP_LT_uxn_opcodes_h_l2153_c24_134a_left : unsigned(7 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l2153_c24_134a_right : unsigned(7 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l2153_c24_134a_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2153_c24_b0db]
signal MUX_uxn_opcodes_h_l2153_c24_b0db_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2153_c24_b0db_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2153_c24_b0db_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2153_c24_b0db_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2155_c11_3d89]
signal BIN_OP_EQ_uxn_opcodes_h_l2155_c11_3d89_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2155_c11_3d89_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2155_c11_3d89_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2155_c7_5421]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_5421_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_5421_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_5421_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_5421_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2155_c7_5421]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_5421_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_5421_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_5421_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_5421_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_1ade( ref_toks_0 : opcode_result_t;
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
      base.is_stack_read := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2127_c6_2d0a
BIN_OP_EQ_uxn_opcodes_h_l2127_c6_2d0a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2127_c6_2d0a_left,
BIN_OP_EQ_uxn_opcodes_h_l2127_c6_2d0a_right,
BIN_OP_EQ_uxn_opcodes_h_l2127_c6_2d0a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2127_c1_65d3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2127_c1_65d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2127_c1_65d3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2127_c1_65d3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2127_c1_65d3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2127_c1_65d3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3
result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2127_c2_4fc3
result_is_stack_read_MUX_uxn_opcodes_h_l2127_c2_4fc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3
result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2127_c2_4fc3
result_is_stack_write_MUX_uxn_opcodes_h_l2127_c2_4fc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c2_4fc3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c2_4fc3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2127_c2_4fc3
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c2_4fc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2127_c2_4fc3
result_stack_value_MUX_uxn_opcodes_h_l2127_c2_4fc3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond,
result_stack_value_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output);

-- t8_MUX_uxn_opcodes_h_l2127_c2_4fc3
t8_MUX_uxn_opcodes_h_l2127_c2_4fc3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond,
t8_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue,
t8_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse,
t8_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output);

-- n8_MUX_uxn_opcodes_h_l2127_c2_4fc3
n8_MUX_uxn_opcodes_h_l2127_c2_4fc3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond,
n8_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue,
n8_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse,
n8_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output);

-- printf_uxn_opcodes_h_l2128_c3_7813_uxn_opcodes_h_l2128_c3_7813
printf_uxn_opcodes_h_l2128_c3_7813_uxn_opcodes_h_l2128_c3_7813 : entity work.printf_uxn_opcodes_h_l2128_c3_7813_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2128_c3_7813_uxn_opcodes_h_l2128_c3_7813_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2133_c11_05e6
BIN_OP_EQ_uxn_opcodes_h_l2133_c11_05e6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2133_c11_05e6_left,
BIN_OP_EQ_uxn_opcodes_h_l2133_c11_05e6_right,
BIN_OP_EQ_uxn_opcodes_h_l2133_c11_05e6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4
result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2133_c7_9ca4
result_is_stack_read_MUX_uxn_opcodes_h_l2133_c7_9ca4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_9ca4
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_9ca4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_9ca4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_9ca4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_9ca4
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_9ca4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2133_c7_9ca4
result_stack_value_MUX_uxn_opcodes_h_l2133_c7_9ca4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond,
result_stack_value_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output);

-- t8_MUX_uxn_opcodes_h_l2133_c7_9ca4
t8_MUX_uxn_opcodes_h_l2133_c7_9ca4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond,
t8_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue,
t8_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse,
t8_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output);

-- n8_MUX_uxn_opcodes_h_l2133_c7_9ca4
n8_MUX_uxn_opcodes_h_l2133_c7_9ca4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond,
n8_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue,
n8_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse,
n8_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2136_c11_05d2
BIN_OP_EQ_uxn_opcodes_h_l2136_c11_05d2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2136_c11_05d2_left,
BIN_OP_EQ_uxn_opcodes_h_l2136_c11_05d2_right,
BIN_OP_EQ_uxn_opcodes_h_l2136_c11_05d2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5
result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2136_c7_4fd5
result_is_stack_read_MUX_uxn_opcodes_h_l2136_c7_4fd5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5
result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4fd5
result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4fd5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4fd5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4fd5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4fd5
result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4fd5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2136_c7_4fd5
result_stack_value_MUX_uxn_opcodes_h_l2136_c7_4fd5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond,
result_stack_value_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output);

-- t8_MUX_uxn_opcodes_h_l2136_c7_4fd5
t8_MUX_uxn_opcodes_h_l2136_c7_4fd5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond,
t8_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue,
t8_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse,
t8_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output);

-- n8_MUX_uxn_opcodes_h_l2136_c7_4fd5
n8_MUX_uxn_opcodes_h_l2136_c7_4fd5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond,
n8_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue,
n8_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse,
n8_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2140_c11_546b
BIN_OP_EQ_uxn_opcodes_h_l2140_c11_546b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2140_c11_546b_left,
BIN_OP_EQ_uxn_opcodes_h_l2140_c11_546b_right,
BIN_OP_EQ_uxn_opcodes_h_l2140_c11_546b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_93a8
result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_93a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_93a8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_93a8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_93a8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2140_c7_93a8
result_is_stack_read_MUX_uxn_opcodes_h_l2140_c7_93a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2140_c7_93a8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2140_c7_93a8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2140_c7_93a8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_93a8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_93a8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_93a8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_93a8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_93a8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_93a8
result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_93a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_93a8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_93a8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_93a8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_93a8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_93a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_93a8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_93a8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_93a8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_93a8
result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_93a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_93a8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_93a8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_93a8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2140_c7_93a8
result_stack_value_MUX_uxn_opcodes_h_l2140_c7_93a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2140_c7_93a8_cond,
result_stack_value_MUX_uxn_opcodes_h_l2140_c7_93a8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2140_c7_93a8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output);

-- n8_MUX_uxn_opcodes_h_l2140_c7_93a8
n8_MUX_uxn_opcodes_h_l2140_c7_93a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2140_c7_93a8_cond,
n8_MUX_uxn_opcodes_h_l2140_c7_93a8_iftrue,
n8_MUX_uxn_opcodes_h_l2140_c7_93a8_iffalse,
n8_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2143_c11_3fde
BIN_OP_EQ_uxn_opcodes_h_l2143_c11_3fde : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2143_c11_3fde_left,
BIN_OP_EQ_uxn_opcodes_h_l2143_c11_3fde_right,
BIN_OP_EQ_uxn_opcodes_h_l2143_c11_3fde_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_26ee
result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_26ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_26ee_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_26ee_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_26ee_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2143_c7_26ee
result_is_stack_read_MUX_uxn_opcodes_h_l2143_c7_26ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2143_c7_26ee_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2143_c7_26ee_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2143_c7_26ee_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_26ee
result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_26ee : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_26ee_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_26ee_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_26ee_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_26ee
result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_26ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_26ee_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_26ee_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_26ee_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_26ee
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_26ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_26ee_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_26ee_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_26ee_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_26ee
result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_26ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_26ee_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_26ee_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_26ee_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2143_c7_26ee
result_stack_value_MUX_uxn_opcodes_h_l2143_c7_26ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2143_c7_26ee_cond,
result_stack_value_MUX_uxn_opcodes_h_l2143_c7_26ee_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2143_c7_26ee_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output);

-- n8_MUX_uxn_opcodes_h_l2143_c7_26ee
n8_MUX_uxn_opcodes_h_l2143_c7_26ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2143_c7_26ee_cond,
n8_MUX_uxn_opcodes_h_l2143_c7_26ee_iftrue,
n8_MUX_uxn_opcodes_h_l2143_c7_26ee_iffalse,
n8_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2147_c32_42ee
BIN_OP_AND_uxn_opcodes_h_l2147_c32_42ee : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2147_c32_42ee_left,
BIN_OP_AND_uxn_opcodes_h_l2147_c32_42ee_right,
BIN_OP_AND_uxn_opcodes_h_l2147_c32_42ee_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2147_c32_2220
BIN_OP_GT_uxn_opcodes_h_l2147_c32_2220 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2147_c32_2220_left,
BIN_OP_GT_uxn_opcodes_h_l2147_c32_2220_right,
BIN_OP_GT_uxn_opcodes_h_l2147_c32_2220_return_output);

-- MUX_uxn_opcodes_h_l2147_c32_8d08
MUX_uxn_opcodes_h_l2147_c32_8d08 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2147_c32_8d08_cond,
MUX_uxn_opcodes_h_l2147_c32_8d08_iftrue,
MUX_uxn_opcodes_h_l2147_c32_8d08_iffalse,
MUX_uxn_opcodes_h_l2147_c32_8d08_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2149_c11_ad83
BIN_OP_EQ_uxn_opcodes_h_l2149_c11_ad83 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2149_c11_ad83_left,
BIN_OP_EQ_uxn_opcodes_h_l2149_c11_ad83_right,
BIN_OP_EQ_uxn_opcodes_h_l2149_c11_ad83_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_d390
result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_d390 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_d390_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_d390_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_d390_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_d390_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_d390
result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_d390 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_d390_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_d390_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_d390_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_d390_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_d390
result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_d390 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_d390_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_d390_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_d390_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_d390_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_d390
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_d390 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_d390_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_d390_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_d390_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_d390_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2149_c7_d390
result_stack_value_MUX_uxn_opcodes_h_l2149_c7_d390 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2149_c7_d390_cond,
result_stack_value_MUX_uxn_opcodes_h_l2149_c7_d390_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2149_c7_d390_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2149_c7_d390_return_output);

-- BIN_OP_LT_uxn_opcodes_h_l2153_c24_134a
BIN_OP_LT_uxn_opcodes_h_l2153_c24_134a : entity work.BIN_OP_LT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_opcodes_h_l2153_c24_134a_left,
BIN_OP_LT_uxn_opcodes_h_l2153_c24_134a_right,
BIN_OP_LT_uxn_opcodes_h_l2153_c24_134a_return_output);

-- MUX_uxn_opcodes_h_l2153_c24_b0db
MUX_uxn_opcodes_h_l2153_c24_b0db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2153_c24_b0db_cond,
MUX_uxn_opcodes_h_l2153_c24_b0db_iftrue,
MUX_uxn_opcodes_h_l2153_c24_b0db_iffalse,
MUX_uxn_opcodes_h_l2153_c24_b0db_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2155_c11_3d89
BIN_OP_EQ_uxn_opcodes_h_l2155_c11_3d89 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2155_c11_3d89_left,
BIN_OP_EQ_uxn_opcodes_h_l2155_c11_3d89_right,
BIN_OP_EQ_uxn_opcodes_h_l2155_c11_3d89_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_5421
result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_5421 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_5421_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_5421_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_5421_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_5421_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_5421
result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_5421 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_5421_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_5421_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_5421_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_5421_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2127_c6_2d0a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2127_c1_65d3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output,
 t8_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output,
 n8_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2133_c11_05e6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output,
 t8_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output,
 n8_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2136_c11_05d2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output,
 t8_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output,
 n8_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2140_c11_546b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output,
 n8_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2143_c11_3fde_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output,
 n8_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2147_c32_42ee_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2147_c32_2220_return_output,
 MUX_uxn_opcodes_h_l2147_c32_8d08_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2149_c11_ad83_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_d390_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_d390_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_d390_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_d390_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2149_c7_d390_return_output,
 BIN_OP_LT_uxn_opcodes_h_l2153_c24_134a_return_output,
 MUX_uxn_opcodes_h_l2153_c24_b0db_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2155_c11_3d89_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_5421_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_5421_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c6_2d0a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c6_2d0a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c6_2d0a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2127_c1_65d3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2127_c1_65d3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2127_c1_65d3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2127_c1_65d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2130_c3_55db : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2128_c3_7813_uxn_opcodes_h_l2128_c3_7813_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_05e6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_05e6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_05e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2134_c3_6abf : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_05d2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_05d2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_05d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2138_c3_2be3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2140_c11_546b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2140_c11_546b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2140_c11_546b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_93a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_93a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_93a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2140_c7_93a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2140_c7_93a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2140_c7_93a8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_93a8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_93a8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_93a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_93a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_93a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_93a8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_93a8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2141_c3_179b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_93a8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_93a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_93a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_93a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_93a8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2140_c7_93a8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2140_c7_93a8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2140_c7_93a8_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2140_c7_93a8_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2140_c7_93a8_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2140_c7_93a8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2143_c11_3fde_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2143_c11_3fde_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2143_c11_3fde_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_26ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_26ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_d390_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_26ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2143_c7_26ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2143_c7_26ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2143_c7_26ee_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_26ee_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_26ee_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_26ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_26ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_26ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_d390_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_26ee_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_26ee_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_26ee_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_d390_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_26ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_26ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_26ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_d390_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_26ee_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2143_c7_26ee_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2143_c7_26ee_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2149_c7_d390_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2143_c7_26ee_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2143_c7_26ee_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2143_c7_26ee_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2143_c7_26ee_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2147_c32_8d08_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2147_c32_8d08_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2147_c32_8d08_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2147_c32_42ee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2147_c32_42ee_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2147_c32_42ee_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2147_c32_2220_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2147_c32_2220_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2147_c32_2220_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2147_c32_8d08_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_ad83_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_ad83_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_ad83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_d390_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_d390_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_d390_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_d390_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_d390_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_5421_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_d390_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_d390_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_d390_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_5421_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_d390_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_d390_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2152_c3_ae1f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_d390_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_d390_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2149_c7_d390_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2149_c7_d390_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2149_c7_d390_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2153_c24_b0db_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2153_c24_b0db_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2153_c24_b0db_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l2153_c24_134a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l2153_c24_134a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l2153_c24_134a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2153_c24_b0db_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2155_c11_3d89_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2155_c11_3d89_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2155_c11_3d89_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_5421_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_5421_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_5421_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_5421_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_5421_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_5421_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2140_l2136_l2133_l2127_l2149_DUPLICATE_0dba_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2143_l2140_l2136_l2133_l2127_DUPLICATE_45c9_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2143_l2140_l2136_l2133_l2127_l2155_DUPLICATE_15fd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2143_l2140_l2136_l2133_l2127_l2149_DUPLICATE_ab80_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2133_l2143_l2136_l2140_DUPLICATE_4d23_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2143_l2140_l2136_l2133_l2155_l2149_DUPLICATE_c4f0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2143_l2149_DUPLICATE_2932_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2160_l2123_DUPLICATE_e6aa_return_output : opcode_result_t;
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
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2143_c7_26ee_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_ad83_right := to_unsigned(5, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2127_c1_65d3_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_5421_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_d390_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2134_c3_6abf := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2134_c3_6abf;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2130_c3_55db := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2130_c3_55db;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2140_c11_546b_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2155_c11_3d89_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2152_c3_ae1f := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_d390_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2152_c3_ae1f;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_5421_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2147_c32_42ee_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2138_c3_2be3 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2138_c3_2be3;
     VAR_MUX_uxn_opcodes_h_l2153_c24_b0db_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2143_c11_3fde_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l2147_c32_8d08_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_d390_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2141_c3_179b := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_93a8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2141_c3_179b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_05d2_right := to_unsigned(2, 2);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2147_c32_2220_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2147_c32_8d08_iffalse := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_05e6_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c6_2d0a_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2153_c24_b0db_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_26ee_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2127_c1_65d3_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2147_c32_42ee_left := VAR_ins;
     VAR_BIN_OP_LT_uxn_opcodes_h_l2153_c24_134a_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2140_c7_93a8_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2143_c7_26ee_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c6_2d0a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_05e6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_05d2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2140_c11_546b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2143_c11_3fde_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_ad83_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2155_c11_3d89_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2143_c7_26ee_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_LT_uxn_opcodes_h_l2153_c24_134a_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l2127_c6_2d0a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2127_c6_2d0a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c6_2d0a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2127_c6_2d0a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c6_2d0a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c6_2d0a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2127_c6_2d0a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2143_c11_3fde] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2143_c11_3fde_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2143_c11_3fde_left;
     BIN_OP_EQ_uxn_opcodes_h_l2143_c11_3fde_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2143_c11_3fde_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2143_c11_3fde_return_output := BIN_OP_EQ_uxn_opcodes_h_l2143_c11_3fde_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2136_c11_05d2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2136_c11_05d2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_05d2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2136_c11_05d2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_05d2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_05d2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2136_c11_05d2_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2143_l2140_l2136_l2133_l2127_DUPLICATE_45c9 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2143_l2140_l2136_l2133_l2127_DUPLICATE_45c9_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2140_c11_546b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2140_c11_546b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2140_c11_546b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2140_c11_546b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2140_c11_546b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2140_c11_546b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2140_c11_546b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2155_c11_3d89] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2155_c11_3d89_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2155_c11_3d89_left;
     BIN_OP_EQ_uxn_opcodes_h_l2155_c11_3d89_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2155_c11_3d89_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2155_c11_3d89_return_output := BIN_OP_EQ_uxn_opcodes_h_l2155_c11_3d89_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2143_l2140_l2136_l2133_l2155_l2149_DUPLICATE_c4f0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2143_l2140_l2136_l2133_l2155_l2149_DUPLICATE_c4f0_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2149_c11_ad83] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2149_c11_ad83_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_ad83_left;
     BIN_OP_EQ_uxn_opcodes_h_l2149_c11_ad83_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_ad83_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_ad83_return_output := BIN_OP_EQ_uxn_opcodes_h_l2149_c11_ad83_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2143_l2149_DUPLICATE_2932 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2143_l2149_DUPLICATE_2932_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2140_l2136_l2133_l2127_l2149_DUPLICATE_0dba LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2140_l2136_l2133_l2127_l2149_DUPLICATE_0dba_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2133_c11_05e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2133_c11_05e6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_05e6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2133_c11_05e6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_05e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_05e6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2133_c11_05e6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2133_l2143_l2136_l2140_DUPLICATE_4d23 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2133_l2143_l2136_l2140_DUPLICATE_4d23_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2143_l2140_l2136_l2133_l2127_l2149_DUPLICATE_ab80 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2143_l2140_l2136_l2133_l2127_l2149_DUPLICATE_ab80_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2143_l2140_l2136_l2133_l2127_l2155_DUPLICATE_15fd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2143_l2140_l2136_l2133_l2127_l2155_DUPLICATE_15fd_return_output := result.is_stack_write;

     -- BIN_OP_AND[uxn_opcodes_h_l2147_c32_42ee] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2147_c32_42ee_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2147_c32_42ee_left;
     BIN_OP_AND_uxn_opcodes_h_l2147_c32_42ee_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2147_c32_42ee_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2147_c32_42ee_return_output := BIN_OP_AND_uxn_opcodes_h_l2147_c32_42ee_return_output;

     -- BIN_OP_LT[uxn_opcodes_h_l2153_c24_134a] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_opcodes_h_l2153_c24_134a_left <= VAR_BIN_OP_LT_uxn_opcodes_h_l2153_c24_134a_left;
     BIN_OP_LT_uxn_opcodes_h_l2153_c24_134a_right <= VAR_BIN_OP_LT_uxn_opcodes_h_l2153_c24_134a_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_opcodes_h_l2153_c24_134a_return_output := BIN_OP_LT_uxn_opcodes_h_l2153_c24_134a_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2147_c32_2220_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2147_c32_42ee_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2127_c1_65d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c6_2d0a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c6_2d0a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c6_2d0a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c6_2d0a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c6_2d0a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c6_2d0a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c6_2d0a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c6_2d0a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c6_2d0a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c6_2d0a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_05e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_05e6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_05e6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_05e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_05e6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_05e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_05e6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_05e6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_05e6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_05d2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_05d2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_05d2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_05d2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_05d2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_05d2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_05d2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_05d2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_05d2_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2140_c7_93a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2140_c11_546b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_93a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2140_c11_546b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_93a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2140_c11_546b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2140_c7_93a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2140_c11_546b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_93a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2140_c11_546b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_93a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2140_c11_546b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_93a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2140_c11_546b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2140_c7_93a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2140_c11_546b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2143_c7_26ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2143_c11_3fde_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_26ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2143_c11_3fde_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_26ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2143_c11_3fde_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2143_c7_26ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2143_c11_3fde_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_26ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2143_c11_3fde_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_26ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2143_c11_3fde_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_26ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2143_c11_3fde_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2143_c7_26ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2143_c11_3fde_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_d390_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_ad83_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_d390_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_ad83_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_d390_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_ad83_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_d390_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_ad83_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2149_c7_d390_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_ad83_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_5421_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2155_c11_3d89_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_5421_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2155_c11_3d89_return_output;
     VAR_MUX_uxn_opcodes_h_l2153_c24_b0db_cond := VAR_BIN_OP_LT_uxn_opcodes_h_l2153_c24_134a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2143_l2140_l2136_l2133_l2127_DUPLICATE_45c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2143_l2140_l2136_l2133_l2127_DUPLICATE_45c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2143_l2140_l2136_l2133_l2127_DUPLICATE_45c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_93a8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2143_l2140_l2136_l2133_l2127_DUPLICATE_45c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_26ee_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2143_l2140_l2136_l2133_l2127_DUPLICATE_45c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2143_l2140_l2136_l2133_l2155_l2149_DUPLICATE_c4f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2143_l2140_l2136_l2133_l2155_l2149_DUPLICATE_c4f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_93a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2143_l2140_l2136_l2133_l2155_l2149_DUPLICATE_c4f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_26ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2143_l2140_l2136_l2133_l2155_l2149_DUPLICATE_c4f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_d390_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2143_l2140_l2136_l2133_l2155_l2149_DUPLICATE_c4f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_5421_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2143_l2140_l2136_l2133_l2155_l2149_DUPLICATE_c4f0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2140_l2136_l2133_l2127_l2149_DUPLICATE_0dba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2140_l2136_l2133_l2127_l2149_DUPLICATE_0dba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2140_l2136_l2133_l2127_l2149_DUPLICATE_0dba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_93a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2140_l2136_l2133_l2127_l2149_DUPLICATE_0dba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_d390_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2140_l2136_l2133_l2127_l2149_DUPLICATE_0dba_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2133_l2143_l2136_l2140_DUPLICATE_4d23_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2133_l2143_l2136_l2140_DUPLICATE_4d23_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2140_c7_93a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2133_l2143_l2136_l2140_DUPLICATE_4d23_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2143_c7_26ee_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2133_l2143_l2136_l2140_DUPLICATE_4d23_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2143_l2140_l2136_l2133_l2127_l2155_DUPLICATE_15fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2143_l2140_l2136_l2133_l2127_l2155_DUPLICATE_15fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2143_l2140_l2136_l2133_l2127_l2155_DUPLICATE_15fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_93a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2143_l2140_l2136_l2133_l2127_l2155_DUPLICATE_15fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_26ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2143_l2140_l2136_l2133_l2127_l2155_DUPLICATE_15fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_5421_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2143_l2140_l2136_l2133_l2127_l2155_DUPLICATE_15fd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_26ee_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2143_l2149_DUPLICATE_2932_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_d390_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2143_l2149_DUPLICATE_2932_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2143_l2140_l2136_l2133_l2127_l2149_DUPLICATE_ab80_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2143_l2140_l2136_l2133_l2127_l2149_DUPLICATE_ab80_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2143_l2140_l2136_l2133_l2127_l2149_DUPLICATE_ab80_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2140_c7_93a8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2143_l2140_l2136_l2133_l2127_l2149_DUPLICATE_ab80_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2143_c7_26ee_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2143_l2140_l2136_l2133_l2127_l2149_DUPLICATE_ab80_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2149_c7_d390_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2143_l2140_l2136_l2133_l2127_l2149_DUPLICATE_ab80_return_output;
     -- t8_MUX[uxn_opcodes_h_l2136_c7_4fd5] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond <= VAR_t8_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond;
     t8_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue;
     t8_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output := t8_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2143_c7_26ee] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2143_c7_26ee_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2143_c7_26ee_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2143_c7_26ee_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2143_c7_26ee_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2143_c7_26ee_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2143_c7_26ee_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output;

     -- n8_MUX[uxn_opcodes_h_l2143_c7_26ee] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2143_c7_26ee_cond <= VAR_n8_MUX_uxn_opcodes_h_l2143_c7_26ee_cond;
     n8_MUX_uxn_opcodes_h_l2143_c7_26ee_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2143_c7_26ee_iftrue;
     n8_MUX_uxn_opcodes_h_l2143_c7_26ee_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2143_c7_26ee_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output := n8_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2149_c7_d390] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_d390_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_d390_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_d390_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_d390_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_d390_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_d390_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_d390_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_d390_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2149_c7_d390] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_d390_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_d390_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_d390_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_d390_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_d390_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_d390_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_d390_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_d390_return_output;

     -- MUX[uxn_opcodes_h_l2153_c24_b0db] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2153_c24_b0db_cond <= VAR_MUX_uxn_opcodes_h_l2153_c24_b0db_cond;
     MUX_uxn_opcodes_h_l2153_c24_b0db_iftrue <= VAR_MUX_uxn_opcodes_h_l2153_c24_b0db_iftrue;
     MUX_uxn_opcodes_h_l2153_c24_b0db_iffalse <= VAR_MUX_uxn_opcodes_h_l2153_c24_b0db_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2153_c24_b0db_return_output := MUX_uxn_opcodes_h_l2153_c24_b0db_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2155_c7_5421] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_5421_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_5421_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_5421_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_5421_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_5421_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_5421_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_5421_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_5421_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2147_c32_2220] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2147_c32_2220_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2147_c32_2220_left;
     BIN_OP_GT_uxn_opcodes_h_l2147_c32_2220_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2147_c32_2220_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2147_c32_2220_return_output := BIN_OP_GT_uxn_opcodes_h_l2147_c32_2220_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2155_c7_5421] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_5421_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_5421_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_5421_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_5421_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_5421_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_5421_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_5421_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_5421_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2127_c1_65d3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2127_c1_65d3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2127_c1_65d3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2127_c1_65d3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2127_c1_65d3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2127_c1_65d3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2127_c1_65d3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2127_c1_65d3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2127_c1_65d3_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2147_c32_8d08_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2147_c32_2220_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2149_c7_d390_iftrue := VAR_MUX_uxn_opcodes_h_l2153_c24_b0db_return_output;
     VAR_printf_uxn_opcodes_h_l2128_c3_7813_uxn_opcodes_h_l2128_c3_7813_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2127_c1_65d3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2140_c7_93a8_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_d390_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2155_c7_5421_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_26ee_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_d390_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2140_c7_93a8_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_d390_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2155_c7_5421_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_26ee_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_d390_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2143_c7_26ee] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_26ee_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_26ee_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_26ee_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_26ee_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_26ee_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_26ee_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2149_c7_d390] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_d390_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_d390_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_d390_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_d390_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_d390_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_d390_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_d390_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_d390_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2143_c7_26ee] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_26ee_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_26ee_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_26ee_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_26ee_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_26ee_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_26ee_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output;

     -- MUX[uxn_opcodes_h_l2147_c32_8d08] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2147_c32_8d08_cond <= VAR_MUX_uxn_opcodes_h_l2147_c32_8d08_cond;
     MUX_uxn_opcodes_h_l2147_c32_8d08_iftrue <= VAR_MUX_uxn_opcodes_h_l2147_c32_8d08_iftrue;
     MUX_uxn_opcodes_h_l2147_c32_8d08_iffalse <= VAR_MUX_uxn_opcodes_h_l2147_c32_8d08_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2147_c32_8d08_return_output := MUX_uxn_opcodes_h_l2147_c32_8d08_return_output;

     -- t8_MUX[uxn_opcodes_h_l2133_c7_9ca4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond <= VAR_t8_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond;
     t8_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue;
     t8_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output := t8_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2149_c7_d390] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_d390_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_d390_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_d390_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_d390_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_d390_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_d390_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_d390_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_d390_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2149_c7_d390] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2149_c7_d390_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2149_c7_d390_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2149_c7_d390_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2149_c7_d390_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2149_c7_d390_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2149_c7_d390_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2149_c7_d390_return_output := result_stack_value_MUX_uxn_opcodes_h_l2149_c7_d390_return_output;

     -- n8_MUX[uxn_opcodes_h_l2140_c7_93a8] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2140_c7_93a8_cond <= VAR_n8_MUX_uxn_opcodes_h_l2140_c7_93a8_cond;
     n8_MUX_uxn_opcodes_h_l2140_c7_93a8_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2140_c7_93a8_iftrue;
     n8_MUX_uxn_opcodes_h_l2140_c7_93a8_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2140_c7_93a8_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output := n8_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output;

     -- printf_uxn_opcodes_h_l2128_c3_7813[uxn_opcodes_h_l2128_c3_7813] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2128_c3_7813_uxn_opcodes_h_l2128_c3_7813_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2128_c3_7813_uxn_opcodes_h_l2128_c3_7813_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2140_c7_93a8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2140_c7_93a8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2140_c7_93a8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2140_c7_93a8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2140_c7_93a8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2140_c7_93a8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2140_c7_93a8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_26ee_iftrue := VAR_MUX_uxn_opcodes_h_l2147_c32_8d08_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_26ee_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_d390_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_93a8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_26ee_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_d390_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_93a8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2143_c7_26ee_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2149_c7_d390_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2143_c7_26ee] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_26ee_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_26ee_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_26ee_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_26ee_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_26ee_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_26ee_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2140_c7_93a8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_93a8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_93a8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_93a8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_93a8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_93a8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_93a8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output;

     -- t8_MUX[uxn_opcodes_h_l2127_c2_4fc3] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond <= VAR_t8_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond;
     t8_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue;
     t8_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output := t8_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output;

     -- n8_MUX[uxn_opcodes_h_l2136_c7_4fd5] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond <= VAR_n8_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond;
     n8_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue;
     n8_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output := n8_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2136_c7_4fd5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2143_c7_26ee] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2143_c7_26ee_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2143_c7_26ee_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2143_c7_26ee_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2143_c7_26ee_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2143_c7_26ee_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2143_c7_26ee_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output := result_stack_value_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2140_c7_93a8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_93a8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_93a8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_93a8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_93a8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_93a8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_93a8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2143_c7_26ee] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_26ee_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_26ee_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_26ee_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_26ee_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_26ee_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_26ee_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2143_c7_26ee] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_26ee_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_26ee_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_26ee_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_26ee_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_26ee_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_26ee_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_93a8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_93a8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_93a8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2140_c7_93a8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2143_c7_26ee_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2136_c7_4fd5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2140_c7_93a8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2140_c7_93a8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2140_c7_93a8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2140_c7_93a8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2140_c7_93a8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2140_c7_93a8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2140_c7_93a8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output := result_stack_value_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output;

     -- n8_MUX[uxn_opcodes_h_l2133_c7_9ca4] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond <= VAR_n8_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond;
     n8_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue;
     n8_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output := n8_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2140_c7_93a8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_93a8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_93a8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_93a8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_93a8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_93a8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_93a8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2133_c7_9ca4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2140_c7_93a8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_93a8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_93a8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_93a8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_93a8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_93a8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_93a8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2140_c7_93a8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_93a8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_93a8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_93a8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_93a8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_93a8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_93a8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2136_c7_4fd5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2140_c7_93a8_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2133_c7_9ca4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2133_c7_9ca4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output;

     -- n8_MUX[uxn_opcodes_h_l2127_c2_4fc3] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond <= VAR_n8_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond;
     n8_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue;
     n8_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output := n8_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2136_c7_4fd5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2136_c7_4fd5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2136_c7_4fd5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output := result_stack_value_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2136_c7_4fd5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4fd5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4fd5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4fd5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2127_c2_4fc3] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2136_c7_4fd5_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2133_c7_9ca4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2133_c7_9ca4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2127_c2_4fc3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2133_c7_9ca4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output := result_stack_value_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2133_c7_9ca4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_9ca4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_9ca4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_9ca4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2127_c2_4fc3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2133_c7_9ca4_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2127_c2_4fc3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2127_c2_4fc3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2127_c2_4fc3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2127_c2_4fc3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2127_c2_4fc3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2127_c2_4fc3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2127_c2_4fc3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output := result_stack_value_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2160_l2123_DUPLICATE_e6aa LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2160_l2123_DUPLICATE_e6aa_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1ade(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2127_c2_4fc3_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2160_l2123_DUPLICATE_e6aa_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2160_l2123_DUPLICATE_e6aa_return_output;
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
