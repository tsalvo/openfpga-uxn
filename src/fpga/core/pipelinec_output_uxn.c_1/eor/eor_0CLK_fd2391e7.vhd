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
entity eor_0CLK_fd2391e7 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end eor_0CLK_fd2391e7;
architecture arch of eor_0CLK_fd2391e7 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l991_c6_5427]
signal BIN_OP_EQ_uxn_opcodes_h_l991_c6_5427_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l991_c6_5427_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l991_c6_5427_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l991_c1_4660]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l991_c1_4660_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l991_c1_4660_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l991_c1_4660_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l991_c1_4660_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l991_c2_1fab]
signal t8_MUX_uxn_opcodes_h_l991_c2_1fab_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l991_c2_1fab_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l991_c2_1fab]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l991_c2_1fab_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l991_c2_1fab_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l991_c2_1fab]
signal result_stack_value_MUX_uxn_opcodes_h_l991_c2_1fab_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l991_c2_1fab_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l991_c2_1fab]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c2_1fab_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c2_1fab_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l991_c2_1fab]
signal result_is_stack_write_MUX_uxn_opcodes_h_l991_c2_1fab_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l991_c2_1fab_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l991_c2_1fab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l991_c2_1fab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l991_c2_1fab_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l991_c2_1fab]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c2_1fab_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c2_1fab_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l991_c2_1fab]
signal result_is_stack_read_MUX_uxn_opcodes_h_l991_c2_1fab_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l991_c2_1fab_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l991_c2_1fab]
signal n8_MUX_uxn_opcodes_h_l991_c2_1fab_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l991_c2_1fab_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l992_c3_2f6e[uxn_opcodes_h_l992_c3_2f6e]
signal printf_uxn_opcodes_h_l992_c3_2f6e_uxn_opcodes_h_l992_c3_2f6e_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l997_c11_a528]
signal BIN_OP_EQ_uxn_opcodes_h_l997_c11_a528_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l997_c11_a528_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l997_c11_a528_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l997_c7_4b87]
signal t8_MUX_uxn_opcodes_h_l997_c7_4b87_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l997_c7_4b87_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l997_c7_4b87]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4b87_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4b87_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l997_c7_4b87]
signal result_stack_value_MUX_uxn_opcodes_h_l997_c7_4b87_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l997_c7_4b87_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l997_c7_4b87]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_4b87_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_4b87_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l997_c7_4b87]
signal result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4b87_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4b87_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l997_c7_4b87]
signal result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4b87_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4b87_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l997_c7_4b87]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4b87_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4b87_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l997_c7_4b87]
signal result_is_stack_read_MUX_uxn_opcodes_h_l997_c7_4b87_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l997_c7_4b87_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l997_c7_4b87]
signal n8_MUX_uxn_opcodes_h_l997_c7_4b87_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l997_c7_4b87_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1000_c11_a98b]
signal BIN_OP_EQ_uxn_opcodes_h_l1000_c11_a98b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1000_c11_a98b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1000_c11_a98b_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1000_c7_9012]
signal t8_MUX_uxn_opcodes_h_l1000_c7_9012_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1000_c7_9012_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1000_c7_9012]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_9012_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_9012_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1000_c7_9012]
signal result_stack_value_MUX_uxn_opcodes_h_l1000_c7_9012_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1000_c7_9012_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1000_c7_9012]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_9012_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_9012_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1000_c7_9012]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_9012_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_9012_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1000_c7_9012]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_9012_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_9012_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1000_c7_9012]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_9012_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_9012_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1000_c7_9012]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_9012_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_9012_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1000_c7_9012]
signal n8_MUX_uxn_opcodes_h_l1000_c7_9012_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1000_c7_9012_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1004_c11_5475]
signal BIN_OP_EQ_uxn_opcodes_h_l1004_c11_5475_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1004_c11_5475_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1004_c11_5475_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1004_c7_5644]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_5644_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_5644_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_5644_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_5644_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1004_c7_5644]
signal result_stack_value_MUX_uxn_opcodes_h_l1004_c7_5644_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1004_c7_5644_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1004_c7_5644_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1004_c7_5644_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1004_c7_5644]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_5644_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_5644_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_5644_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_5644_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1004_c7_5644]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_5644_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_5644_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_5644_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_5644_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1004_c7_5644]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_5644_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_5644_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_5644_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_5644_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1004_c7_5644]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_5644_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_5644_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_5644_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_5644_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1004_c7_5644]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1004_c7_5644_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1004_c7_5644_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1004_c7_5644_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1004_c7_5644_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1004_c7_5644]
signal n8_MUX_uxn_opcodes_h_l1004_c7_5644_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1004_c7_5644_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1004_c7_5644_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1004_c7_5644_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1007_c11_7813]
signal BIN_OP_EQ_uxn_opcodes_h_l1007_c11_7813_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1007_c11_7813_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1007_c11_7813_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1007_c7_8324]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_8324_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_8324_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_8324_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_8324_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1007_c7_8324]
signal result_stack_value_MUX_uxn_opcodes_h_l1007_c7_8324_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1007_c7_8324_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1007_c7_8324_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1007_c7_8324_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1007_c7_8324]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_8324_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_8324_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_8324_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_8324_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1007_c7_8324]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_8324_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_8324_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_8324_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_8324_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1007_c7_8324]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_8324_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_8324_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_8324_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_8324_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1007_c7_8324]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_8324_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_8324_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_8324_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_8324_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1007_c7_8324]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_8324_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_8324_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_8324_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_8324_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1007_c7_8324]
signal n8_MUX_uxn_opcodes_h_l1007_c7_8324_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1007_c7_8324_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1007_c7_8324_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1007_c7_8324_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1011_c32_f625]
signal BIN_OP_AND_uxn_opcodes_h_l1011_c32_f625_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1011_c32_f625_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1011_c32_f625_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1011_c32_3325]
signal BIN_OP_GT_uxn_opcodes_h_l1011_c32_3325_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1011_c32_3325_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1011_c32_3325_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1011_c32_3664]
signal MUX_uxn_opcodes_h_l1011_c32_3664_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1011_c32_3664_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1011_c32_3664_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1011_c32_3664_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1013_c11_69b6]
signal BIN_OP_EQ_uxn_opcodes_h_l1013_c11_69b6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1013_c11_69b6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1013_c11_69b6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1013_c7_3273]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_3273_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_3273_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_3273_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_3273_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1013_c7_3273]
signal result_stack_value_MUX_uxn_opcodes_h_l1013_c7_3273_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1013_c7_3273_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1013_c7_3273_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1013_c7_3273_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1013_c7_3273]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_3273_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_3273_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_3273_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_3273_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1013_c7_3273]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_3273_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_3273_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_3273_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_3273_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1013_c7_3273]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_3273_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_3273_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_3273_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_3273_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l1017_c24_e9a7]
signal BIN_OP_XOR_uxn_opcodes_h_l1017_c24_e9a7_left : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1017_c24_e9a7_right : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1017_c24_e9a7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1019_c11_bbf9]
signal BIN_OP_EQ_uxn_opcodes_h_l1019_c11_bbf9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1019_c11_bbf9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1019_c11_bbf9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1019_c7_2390]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_2390_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_2390_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_2390_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_2390_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1019_c7_2390]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_2390_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_2390_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_2390_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_2390_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l991_c6_5427
BIN_OP_EQ_uxn_opcodes_h_l991_c6_5427 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l991_c6_5427_left,
BIN_OP_EQ_uxn_opcodes_h_l991_c6_5427_right,
BIN_OP_EQ_uxn_opcodes_h_l991_c6_5427_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l991_c1_4660
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l991_c1_4660 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l991_c1_4660_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l991_c1_4660_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l991_c1_4660_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l991_c1_4660_return_output);

-- t8_MUX_uxn_opcodes_h_l991_c2_1fab
t8_MUX_uxn_opcodes_h_l991_c2_1fab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l991_c2_1fab_cond,
t8_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue,
t8_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse,
t8_MUX_uxn_opcodes_h_l991_c2_1fab_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l991_c2_1fab
result_is_sp_shift_MUX_uxn_opcodes_h_l991_c2_1fab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l991_c2_1fab_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l991_c2_1fab_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l991_c2_1fab
result_stack_value_MUX_uxn_opcodes_h_l991_c2_1fab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l991_c2_1fab_cond,
result_stack_value_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l991_c2_1fab_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c2_1fab
result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c2_1fab : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c2_1fab_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c2_1fab_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l991_c2_1fab
result_is_stack_write_MUX_uxn_opcodes_h_l991_c2_1fab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l991_c2_1fab_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l991_c2_1fab_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l991_c2_1fab
result_is_opc_done_MUX_uxn_opcodes_h_l991_c2_1fab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l991_c2_1fab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l991_c2_1fab_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c2_1fab
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c2_1fab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c2_1fab_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c2_1fab_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l991_c2_1fab
result_is_stack_read_MUX_uxn_opcodes_h_l991_c2_1fab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l991_c2_1fab_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l991_c2_1fab_return_output);

-- n8_MUX_uxn_opcodes_h_l991_c2_1fab
n8_MUX_uxn_opcodes_h_l991_c2_1fab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l991_c2_1fab_cond,
n8_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue,
n8_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse,
n8_MUX_uxn_opcodes_h_l991_c2_1fab_return_output);

-- printf_uxn_opcodes_h_l992_c3_2f6e_uxn_opcodes_h_l992_c3_2f6e
printf_uxn_opcodes_h_l992_c3_2f6e_uxn_opcodes_h_l992_c3_2f6e : entity work.printf_uxn_opcodes_h_l992_c3_2f6e_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l992_c3_2f6e_uxn_opcodes_h_l992_c3_2f6e_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l997_c11_a528
BIN_OP_EQ_uxn_opcodes_h_l997_c11_a528 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l997_c11_a528_left,
BIN_OP_EQ_uxn_opcodes_h_l997_c11_a528_right,
BIN_OP_EQ_uxn_opcodes_h_l997_c11_a528_return_output);

-- t8_MUX_uxn_opcodes_h_l997_c7_4b87
t8_MUX_uxn_opcodes_h_l997_c7_4b87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l997_c7_4b87_cond,
t8_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue,
t8_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse,
t8_MUX_uxn_opcodes_h_l997_c7_4b87_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4b87
result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4b87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4b87_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4b87_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l997_c7_4b87
result_stack_value_MUX_uxn_opcodes_h_l997_c7_4b87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l997_c7_4b87_cond,
result_stack_value_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l997_c7_4b87_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_4b87
result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_4b87 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_4b87_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_4b87_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4b87
result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4b87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4b87_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4b87_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4b87
result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4b87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4b87_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4b87_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4b87
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4b87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4b87_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4b87_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l997_c7_4b87
result_is_stack_read_MUX_uxn_opcodes_h_l997_c7_4b87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l997_c7_4b87_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l997_c7_4b87_return_output);

-- n8_MUX_uxn_opcodes_h_l997_c7_4b87
n8_MUX_uxn_opcodes_h_l997_c7_4b87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l997_c7_4b87_cond,
n8_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue,
n8_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse,
n8_MUX_uxn_opcodes_h_l997_c7_4b87_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1000_c11_a98b
BIN_OP_EQ_uxn_opcodes_h_l1000_c11_a98b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1000_c11_a98b_left,
BIN_OP_EQ_uxn_opcodes_h_l1000_c11_a98b_right,
BIN_OP_EQ_uxn_opcodes_h_l1000_c11_a98b_return_output);

-- t8_MUX_uxn_opcodes_h_l1000_c7_9012
t8_MUX_uxn_opcodes_h_l1000_c7_9012 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1000_c7_9012_cond,
t8_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue,
t8_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse,
t8_MUX_uxn_opcodes_h_l1000_c7_9012_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_9012
result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_9012 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_9012_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_9012_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1000_c7_9012
result_stack_value_MUX_uxn_opcodes_h_l1000_c7_9012 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1000_c7_9012_cond,
result_stack_value_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1000_c7_9012_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_9012
result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_9012 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_9012_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_9012_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_9012
result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_9012 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_9012_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_9012_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_9012
result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_9012 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_9012_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_9012_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_9012
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_9012 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_9012_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_9012_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_9012
result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_9012 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_9012_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_9012_return_output);

-- n8_MUX_uxn_opcodes_h_l1000_c7_9012
n8_MUX_uxn_opcodes_h_l1000_c7_9012 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1000_c7_9012_cond,
n8_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue,
n8_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse,
n8_MUX_uxn_opcodes_h_l1000_c7_9012_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1004_c11_5475
BIN_OP_EQ_uxn_opcodes_h_l1004_c11_5475 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1004_c11_5475_left,
BIN_OP_EQ_uxn_opcodes_h_l1004_c11_5475_right,
BIN_OP_EQ_uxn_opcodes_h_l1004_c11_5475_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_5644
result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_5644 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_5644_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_5644_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_5644_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_5644_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1004_c7_5644
result_stack_value_MUX_uxn_opcodes_h_l1004_c7_5644 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1004_c7_5644_cond,
result_stack_value_MUX_uxn_opcodes_h_l1004_c7_5644_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1004_c7_5644_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1004_c7_5644_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_5644
result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_5644 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_5644_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_5644_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_5644_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_5644_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_5644
result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_5644 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_5644_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_5644_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_5644_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_5644_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_5644
result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_5644 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_5644_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_5644_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_5644_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_5644_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_5644
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_5644 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_5644_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_5644_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_5644_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_5644_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1004_c7_5644
result_is_stack_read_MUX_uxn_opcodes_h_l1004_c7_5644 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1004_c7_5644_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1004_c7_5644_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1004_c7_5644_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1004_c7_5644_return_output);

-- n8_MUX_uxn_opcodes_h_l1004_c7_5644
n8_MUX_uxn_opcodes_h_l1004_c7_5644 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1004_c7_5644_cond,
n8_MUX_uxn_opcodes_h_l1004_c7_5644_iftrue,
n8_MUX_uxn_opcodes_h_l1004_c7_5644_iffalse,
n8_MUX_uxn_opcodes_h_l1004_c7_5644_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1007_c11_7813
BIN_OP_EQ_uxn_opcodes_h_l1007_c11_7813 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1007_c11_7813_left,
BIN_OP_EQ_uxn_opcodes_h_l1007_c11_7813_right,
BIN_OP_EQ_uxn_opcodes_h_l1007_c11_7813_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_8324
result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_8324 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_8324_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_8324_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_8324_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_8324_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1007_c7_8324
result_stack_value_MUX_uxn_opcodes_h_l1007_c7_8324 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1007_c7_8324_cond,
result_stack_value_MUX_uxn_opcodes_h_l1007_c7_8324_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1007_c7_8324_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1007_c7_8324_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_8324
result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_8324 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_8324_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_8324_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_8324_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_8324_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_8324
result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_8324 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_8324_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_8324_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_8324_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_8324_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_8324
result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_8324 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_8324_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_8324_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_8324_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_8324_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_8324
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_8324 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_8324_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_8324_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_8324_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_8324_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_8324
result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_8324 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_8324_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_8324_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_8324_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_8324_return_output);

-- n8_MUX_uxn_opcodes_h_l1007_c7_8324
n8_MUX_uxn_opcodes_h_l1007_c7_8324 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1007_c7_8324_cond,
n8_MUX_uxn_opcodes_h_l1007_c7_8324_iftrue,
n8_MUX_uxn_opcodes_h_l1007_c7_8324_iffalse,
n8_MUX_uxn_opcodes_h_l1007_c7_8324_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1011_c32_f625
BIN_OP_AND_uxn_opcodes_h_l1011_c32_f625 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1011_c32_f625_left,
BIN_OP_AND_uxn_opcodes_h_l1011_c32_f625_right,
BIN_OP_AND_uxn_opcodes_h_l1011_c32_f625_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1011_c32_3325
BIN_OP_GT_uxn_opcodes_h_l1011_c32_3325 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1011_c32_3325_left,
BIN_OP_GT_uxn_opcodes_h_l1011_c32_3325_right,
BIN_OP_GT_uxn_opcodes_h_l1011_c32_3325_return_output);

-- MUX_uxn_opcodes_h_l1011_c32_3664
MUX_uxn_opcodes_h_l1011_c32_3664 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1011_c32_3664_cond,
MUX_uxn_opcodes_h_l1011_c32_3664_iftrue,
MUX_uxn_opcodes_h_l1011_c32_3664_iffalse,
MUX_uxn_opcodes_h_l1011_c32_3664_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1013_c11_69b6
BIN_OP_EQ_uxn_opcodes_h_l1013_c11_69b6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1013_c11_69b6_left,
BIN_OP_EQ_uxn_opcodes_h_l1013_c11_69b6_right,
BIN_OP_EQ_uxn_opcodes_h_l1013_c11_69b6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_3273
result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_3273 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_3273_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_3273_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_3273_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_3273_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1013_c7_3273
result_stack_value_MUX_uxn_opcodes_h_l1013_c7_3273 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1013_c7_3273_cond,
result_stack_value_MUX_uxn_opcodes_h_l1013_c7_3273_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1013_c7_3273_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1013_c7_3273_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_3273
result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_3273 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_3273_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_3273_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_3273_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_3273_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_3273
result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_3273 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_3273_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_3273_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_3273_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_3273_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_3273
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_3273 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_3273_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_3273_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_3273_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_3273_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l1017_c24_e9a7
BIN_OP_XOR_uxn_opcodes_h_l1017_c24_e9a7 : entity work.BIN_OP_XOR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l1017_c24_e9a7_left,
BIN_OP_XOR_uxn_opcodes_h_l1017_c24_e9a7_right,
BIN_OP_XOR_uxn_opcodes_h_l1017_c24_e9a7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1019_c11_bbf9
BIN_OP_EQ_uxn_opcodes_h_l1019_c11_bbf9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1019_c11_bbf9_left,
BIN_OP_EQ_uxn_opcodes_h_l1019_c11_bbf9_right,
BIN_OP_EQ_uxn_opcodes_h_l1019_c11_bbf9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_2390
result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_2390 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_2390_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_2390_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_2390_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_2390_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_2390
result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_2390 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_2390_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_2390_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_2390_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_2390_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l991_c6_5427_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l991_c1_4660_return_output,
 t8_MUX_uxn_opcodes_h_l991_c2_1fab_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l991_c2_1fab_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l991_c2_1fab_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c2_1fab_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l991_c2_1fab_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l991_c2_1fab_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c2_1fab_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l991_c2_1fab_return_output,
 n8_MUX_uxn_opcodes_h_l991_c2_1fab_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l997_c11_a528_return_output,
 t8_MUX_uxn_opcodes_h_l997_c7_4b87_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4b87_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l997_c7_4b87_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_4b87_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4b87_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4b87_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4b87_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l997_c7_4b87_return_output,
 n8_MUX_uxn_opcodes_h_l997_c7_4b87_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1000_c11_a98b_return_output,
 t8_MUX_uxn_opcodes_h_l1000_c7_9012_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_9012_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1000_c7_9012_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_9012_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_9012_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_9012_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_9012_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_9012_return_output,
 n8_MUX_uxn_opcodes_h_l1000_c7_9012_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1004_c11_5475_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_5644_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1004_c7_5644_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_5644_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_5644_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_5644_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_5644_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1004_c7_5644_return_output,
 n8_MUX_uxn_opcodes_h_l1004_c7_5644_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1007_c11_7813_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_8324_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1007_c7_8324_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_8324_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_8324_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_8324_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_8324_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_8324_return_output,
 n8_MUX_uxn_opcodes_h_l1007_c7_8324_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1011_c32_f625_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1011_c32_3325_return_output,
 MUX_uxn_opcodes_h_l1011_c32_3664_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1013_c11_69b6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_3273_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1013_c7_3273_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_3273_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_3273_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_3273_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l1017_c24_e9a7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1019_c11_bbf9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_2390_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_2390_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c6_5427_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c6_5427_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c6_5427_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l991_c1_4660_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l991_c1_4660_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l991_c1_4660_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l991_c1_4660_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l997_c7_4b87_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l991_c2_1fab_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l991_c2_1fab_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4b87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c2_1fab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c2_1fab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l997_c7_4b87_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c2_1fab_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c2_1fab_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_4b87_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c2_1fab_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c2_1fab_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4b87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c2_1fab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c2_1fab_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4b87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c2_1fab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c2_1fab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l994_c3_b0f2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4b87_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c2_1fab_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c2_1fab_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l997_c7_4b87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c2_1fab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c2_1fab_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l997_c7_4b87_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l991_c2_1fab_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l991_c2_1fab_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l992_c3_2f6e_uxn_opcodes_h_l992_c3_2f6e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_a528_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_a528_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_a528_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1000_c7_9012_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l997_c7_4b87_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_9012_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4b87_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c7_9012_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l997_c7_4b87_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_9012_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_4b87_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_9012_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4b87_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_9012_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4b87_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l998_c3_73d1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_9012_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4b87_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_9012_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l997_c7_4b87_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1000_c7_9012_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l997_c7_4b87_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c11_a98b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c11_a98b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c11_a98b_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1000_c7_9012_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_5644_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_9012_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1004_c7_5644_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c7_9012_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_5644_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_9012_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_5644_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_9012_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_5644_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_9012_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1002_c3_3b10 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_5644_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_9012_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1004_c7_5644_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_9012_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1004_c7_5644_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1000_c7_9012_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_5475_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_5475_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_5475_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_5644_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_5644_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_8324_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_5644_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1004_c7_5644_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1004_c7_5644_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1007_c7_8324_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1004_c7_5644_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_5644_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_5644_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_8324_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_5644_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_5644_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_5644_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_8324_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_5644_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_5644_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_5644_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_8324_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_5644_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_5644_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1005_c3_1cd6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_5644_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_8324_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_5644_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1004_c7_5644_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1004_c7_5644_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_8324_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1004_c7_5644_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1004_c7_5644_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1004_c7_5644_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1007_c7_8324_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1004_c7_5644_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_7813_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_7813_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_7813_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_8324_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_8324_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_3273_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_8324_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1007_c7_8324_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1007_c7_8324_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1013_c7_3273_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1007_c7_8324_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_8324_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_8324_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_8324_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_8324_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_8324_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_3273_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_8324_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_8324_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_8324_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_3273_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_8324_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_8324_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_8324_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_3273_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_8324_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_8324_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_8324_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_8324_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1007_c7_8324_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1007_c7_8324_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1007_c7_8324_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1011_c32_3664_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1011_c32_3664_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1011_c32_3664_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1011_c32_f625_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1011_c32_f625_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1011_c32_f625_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1011_c32_3325_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1011_c32_3325_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1011_c32_3325_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1011_c32_3664_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_69b6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_69b6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_69b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_3273_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_3273_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_3273_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1013_c7_3273_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1013_c7_3273_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1013_c7_3273_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_3273_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_3273_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_2390_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_3273_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_3273_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_3273_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_2390_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_3273_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_3273_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1016_c3_3fa0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_3273_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_3273_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1017_c24_e9a7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1017_c24_e9a7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1017_c24_e9a7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_bbf9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_bbf9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_bbf9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_2390_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_2390_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_2390_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_2390_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_2390_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_2390_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1013_l1000_l1004_l997_l991_DUPLICATE_633b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1013_l1007_l1000_l1004_l997_l991_DUPLICATE_8908_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1007_l1000_l1004_l997_l991_DUPLICATE_58a8_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1007_l1000_l1004_l997_l991_l1019_DUPLICATE_a4b7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1013_l1007_l1000_l1004_l997_l1019_DUPLICATE_6dfb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1000_l1004_l997_l1007_DUPLICATE_1890_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1013_l1007_DUPLICATE_d68c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l987_l1024_DUPLICATE_1100_return_output : opcode_result_t;
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
     VAR_MUX_uxn_opcodes_h_l1011_c32_3664_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_7813_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l1011_c32_3664_iffalse := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c11_a98b_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_3273_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c6_5427_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1005_c3_1cd6 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_5644_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1005_c3_1cd6;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1016_c3_3fa0 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_3273_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1016_c3_3fa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_5475_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l998_c3_73d1 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l998_c3_73d1;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l994_c3_b0f2 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l994_c3_b0f2;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_2390_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_3273_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_bbf9_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1002_c3_3b10 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1002_c3_3b10;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_8324_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_8324_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l991_c1_4660_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1011_c32_3325_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_a528_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_69b6_right := to_unsigned(5, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1011_c32_f625_right := to_unsigned(128, 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_2390_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l991_c1_4660_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1011_c32_f625_left := VAR_ins;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1017_c24_e9a7_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1004_c7_5644_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1007_c7_8324_iffalse := n8;
     VAR_n8_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c11_a98b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_5475_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_7813_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_69b6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_bbf9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c6_5427_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_a528_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1007_c7_8324_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1017_c24_e9a7_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1000_l1004_l997_l1007_DUPLICATE_1890 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1000_l1004_l997_l1007_DUPLICATE_1890_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1019_c11_bbf9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1019_c11_bbf9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_bbf9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1019_c11_bbf9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_bbf9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_bbf9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1019_c11_bbf9_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1007_l1000_l1004_l997_l991_DUPLICATE_58a8 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1007_l1000_l1004_l997_l991_DUPLICATE_58a8_return_output := result.sp_relative_shift;

     -- BIN_OP_XOR[uxn_opcodes_h_l1017_c24_e9a7] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l1017_c24_e9a7_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1017_c24_e9a7_left;
     BIN_OP_XOR_uxn_opcodes_h_l1017_c24_e9a7_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1017_c24_e9a7_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1017_c24_e9a7_return_output := BIN_OP_XOR_uxn_opcodes_h_l1017_c24_e9a7_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1013_l1007_l1000_l1004_l997_l991_DUPLICATE_8908 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1013_l1007_l1000_l1004_l997_l991_DUPLICATE_8908_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l991_c6_5427] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l991_c6_5427_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c6_5427_left;
     BIN_OP_EQ_uxn_opcodes_h_l991_c6_5427_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c6_5427_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c6_5427_return_output := BIN_OP_EQ_uxn_opcodes_h_l991_c6_5427_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l997_c11_a528] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l997_c11_a528_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_a528_left;
     BIN_OP_EQ_uxn_opcodes_h_l997_c11_a528_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_a528_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_a528_return_output := BIN_OP_EQ_uxn_opcodes_h_l997_c11_a528_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1007_c11_7813] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1007_c11_7813_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_7813_left;
     BIN_OP_EQ_uxn_opcodes_h_l1007_c11_7813_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_7813_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_7813_return_output := BIN_OP_EQ_uxn_opcodes_h_l1007_c11_7813_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1004_c11_5475] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1004_c11_5475_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_5475_left;
     BIN_OP_EQ_uxn_opcodes_h_l1004_c11_5475_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_5475_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_5475_return_output := BIN_OP_EQ_uxn_opcodes_h_l1004_c11_5475_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1013_l1007_DUPLICATE_d68c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1013_l1007_DUPLICATE_d68c_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1007_l1000_l1004_l997_l991_l1019_DUPLICATE_a4b7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1007_l1000_l1004_l997_l991_l1019_DUPLICATE_a4b7_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1013_l1000_l1004_l997_l991_DUPLICATE_633b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1013_l1000_l1004_l997_l991_DUPLICATE_633b_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1013_l1007_l1000_l1004_l997_l1019_DUPLICATE_6dfb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1013_l1007_l1000_l1004_l997_l1019_DUPLICATE_6dfb_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1000_c11_a98b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1000_c11_a98b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c11_a98b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1000_c11_a98b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c11_a98b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c11_a98b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1000_c11_a98b_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1011_c32_f625] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1011_c32_f625_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1011_c32_f625_left;
     BIN_OP_AND_uxn_opcodes_h_l1011_c32_f625_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1011_c32_f625_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1011_c32_f625_return_output := BIN_OP_AND_uxn_opcodes_h_l1011_c32_f625_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1013_c11_69b6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1013_c11_69b6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_69b6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1013_c11_69b6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_69b6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_69b6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1013_c11_69b6_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1011_c32_3325_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1011_c32_f625_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1000_c7_9012_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c11_a98b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_9012_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c11_a98b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_9012_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c11_a98b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_9012_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c11_a98b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_9012_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c11_a98b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_9012_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c11_a98b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_9012_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c11_a98b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c7_9012_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c11_a98b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1000_c7_9012_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c11_a98b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1004_c7_5644_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_5475_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_5644_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_5475_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_5644_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_5475_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1004_c7_5644_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_5475_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_5644_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_5475_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_5644_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_5475_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_5644_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_5475_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1004_c7_5644_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_5475_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1007_c7_8324_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_7813_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_8324_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_7813_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_8324_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_7813_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_8324_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_7813_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_8324_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_7813_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_8324_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_7813_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_8324_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_7813_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1007_c7_8324_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_7813_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_3273_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_69b6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_3273_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_69b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_3273_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_69b6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_3273_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_69b6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1013_c7_3273_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_69b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_2390_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_bbf9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_2390_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_bbf9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l991_c1_4660_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c6_5427_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l991_c2_1fab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c6_5427_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c2_1fab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c6_5427_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c2_1fab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c6_5427_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c2_1fab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c6_5427_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c2_1fab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c6_5427_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c2_1fab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c6_5427_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c2_1fab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c6_5427_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c2_1fab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c6_5427_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l991_c2_1fab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c6_5427_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l997_c7_4b87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_a528_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4b87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_a528_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4b87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_a528_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l997_c7_4b87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_a528_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4b87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_a528_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_4b87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_a528_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4b87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_a528_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l997_c7_4b87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_a528_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l997_c7_4b87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_a528_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1013_c7_3273_iftrue := VAR_BIN_OP_XOR_uxn_opcodes_h_l1017_c24_e9a7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1007_l1000_l1004_l997_l991_DUPLICATE_58a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_5644_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1007_l1000_l1004_l997_l991_DUPLICATE_58a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_8324_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1007_l1000_l1004_l997_l991_DUPLICATE_58a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1007_l1000_l1004_l997_l991_DUPLICATE_58a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1007_l1000_l1004_l997_l991_DUPLICATE_58a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1013_l1007_l1000_l1004_l997_l1019_DUPLICATE_6dfb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_5644_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1013_l1007_l1000_l1004_l997_l1019_DUPLICATE_6dfb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_8324_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1013_l1007_l1000_l1004_l997_l1019_DUPLICATE_6dfb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_3273_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1013_l1007_l1000_l1004_l997_l1019_DUPLICATE_6dfb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_2390_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1013_l1007_l1000_l1004_l997_l1019_DUPLICATE_6dfb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1013_l1007_l1000_l1004_l997_l1019_DUPLICATE_6dfb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1013_l1000_l1004_l997_l991_DUPLICATE_633b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_5644_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1013_l1000_l1004_l997_l991_DUPLICATE_633b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_3273_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1013_l1000_l1004_l997_l991_DUPLICATE_633b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1013_l1000_l1004_l997_l991_DUPLICATE_633b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1013_l1000_l1004_l997_l991_DUPLICATE_633b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1000_l1004_l997_l1007_DUPLICATE_1890_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1004_c7_5644_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1000_l1004_l997_l1007_DUPLICATE_1890_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_8324_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1000_l1004_l997_l1007_DUPLICATE_1890_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1000_l1004_l997_l1007_DUPLICATE_1890_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1007_l1000_l1004_l997_l991_l1019_DUPLICATE_a4b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_5644_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1007_l1000_l1004_l997_l991_l1019_DUPLICATE_a4b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_8324_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1007_l1000_l1004_l997_l991_l1019_DUPLICATE_a4b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_2390_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1007_l1000_l1004_l997_l991_l1019_DUPLICATE_a4b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1007_l1000_l1004_l997_l991_l1019_DUPLICATE_a4b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1007_l1000_l1004_l997_l991_l1019_DUPLICATE_a4b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_8324_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1013_l1007_DUPLICATE_d68c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_3273_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1013_l1007_DUPLICATE_d68c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1013_l1007_l1000_l1004_l997_l991_DUPLICATE_8908_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1004_c7_5644_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1013_l1007_l1000_l1004_l997_l991_DUPLICATE_8908_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1007_c7_8324_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1013_l1007_l1000_l1004_l997_l991_DUPLICATE_8908_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1013_c7_3273_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1013_l1007_l1000_l1004_l997_l991_DUPLICATE_8908_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1013_l1007_l1000_l1004_l997_l991_DUPLICATE_8908_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1013_l1007_l1000_l1004_l997_l991_DUPLICATE_8908_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1007_c7_8324] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_8324_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_8324_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_8324_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_8324_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_8324_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_8324_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_8324_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_8324_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l991_c1_4660] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l991_c1_4660_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l991_c1_4660_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l991_c1_4660_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l991_c1_4660_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l991_c1_4660_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l991_c1_4660_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l991_c1_4660_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l991_c1_4660_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1013_c7_3273] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_3273_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_3273_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_3273_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_3273_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_3273_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_3273_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_3273_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_3273_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1011_c32_3325] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1011_c32_3325_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1011_c32_3325_left;
     BIN_OP_GT_uxn_opcodes_h_l1011_c32_3325_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1011_c32_3325_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1011_c32_3325_return_output := BIN_OP_GT_uxn_opcodes_h_l1011_c32_3325_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1013_c7_3273] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1013_c7_3273_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1013_c7_3273_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1013_c7_3273_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1013_c7_3273_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1013_c7_3273_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1013_c7_3273_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1013_c7_3273_return_output := result_stack_value_MUX_uxn_opcodes_h_l1013_c7_3273_return_output;

     -- n8_MUX[uxn_opcodes_h_l1007_c7_8324] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1007_c7_8324_cond <= VAR_n8_MUX_uxn_opcodes_h_l1007_c7_8324_cond;
     n8_MUX_uxn_opcodes_h_l1007_c7_8324_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1007_c7_8324_iftrue;
     n8_MUX_uxn_opcodes_h_l1007_c7_8324_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1007_c7_8324_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1007_c7_8324_return_output := n8_MUX_uxn_opcodes_h_l1007_c7_8324_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1019_c7_2390] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_2390_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_2390_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_2390_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_2390_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_2390_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_2390_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_2390_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_2390_return_output;

     -- t8_MUX[uxn_opcodes_h_l1000_c7_9012] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1000_c7_9012_cond <= VAR_t8_MUX_uxn_opcodes_h_l1000_c7_9012_cond;
     t8_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue;
     t8_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1000_c7_9012_return_output := t8_MUX_uxn_opcodes_h_l1000_c7_9012_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1013_c7_3273] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_3273_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_3273_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_3273_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_3273_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_3273_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_3273_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_3273_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_3273_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1019_c7_2390] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_2390_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_2390_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_2390_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_2390_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_2390_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_2390_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_2390_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_2390_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1011_c32_3664_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1011_c32_3325_return_output;
     VAR_printf_uxn_opcodes_h_l992_c3_2f6e_uxn_opcodes_h_l992_c3_2f6e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l991_c1_4660_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1004_c7_5644_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1007_c7_8324_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_3273_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_2390_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_8324_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_3273_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1004_c7_5644_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_8324_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_3273_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_2390_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_8324_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_3273_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1007_c7_8324_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1013_c7_3273_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1000_c7_9012_return_output;
     -- MUX[uxn_opcodes_h_l1011_c32_3664] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1011_c32_3664_cond <= VAR_MUX_uxn_opcodes_h_l1011_c32_3664_cond;
     MUX_uxn_opcodes_h_l1011_c32_3664_iftrue <= VAR_MUX_uxn_opcodes_h_l1011_c32_3664_iftrue;
     MUX_uxn_opcodes_h_l1011_c32_3664_iffalse <= VAR_MUX_uxn_opcodes_h_l1011_c32_3664_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1011_c32_3664_return_output := MUX_uxn_opcodes_h_l1011_c32_3664_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1007_c7_8324] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_8324_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_8324_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_8324_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_8324_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_8324_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_8324_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_8324_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_8324_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1013_c7_3273] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_3273_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_3273_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_3273_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_3273_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_3273_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_3273_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_3273_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_3273_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1013_c7_3273] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_3273_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_3273_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_3273_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_3273_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_3273_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_3273_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_3273_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_3273_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1007_c7_8324] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1007_c7_8324_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1007_c7_8324_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1007_c7_8324_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1007_c7_8324_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1007_c7_8324_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1007_c7_8324_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1007_c7_8324_return_output := result_stack_value_MUX_uxn_opcodes_h_l1007_c7_8324_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1007_c7_8324] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_8324_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_8324_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_8324_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_8324_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_8324_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_8324_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_8324_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_8324_return_output;

     -- n8_MUX[uxn_opcodes_h_l1004_c7_5644] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1004_c7_5644_cond <= VAR_n8_MUX_uxn_opcodes_h_l1004_c7_5644_cond;
     n8_MUX_uxn_opcodes_h_l1004_c7_5644_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1004_c7_5644_iftrue;
     n8_MUX_uxn_opcodes_h_l1004_c7_5644_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1004_c7_5644_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1004_c7_5644_return_output := n8_MUX_uxn_opcodes_h_l1004_c7_5644_return_output;

     -- t8_MUX[uxn_opcodes_h_l997_c7_4b87] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l997_c7_4b87_cond <= VAR_t8_MUX_uxn_opcodes_h_l997_c7_4b87_cond;
     t8_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue;
     t8_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l997_c7_4b87_return_output := t8_MUX_uxn_opcodes_h_l997_c7_4b87_return_output;

     -- printf_uxn_opcodes_h_l992_c3_2f6e[uxn_opcodes_h_l992_c3_2f6e] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l992_c3_2f6e_uxn_opcodes_h_l992_c3_2f6e_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l992_c3_2f6e_uxn_opcodes_h_l992_c3_2f6e_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1004_c7_5644] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1004_c7_5644_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1004_c7_5644_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1004_c7_5644_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1004_c7_5644_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1004_c7_5644_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1004_c7_5644_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1004_c7_5644_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1004_c7_5644_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_8324_iftrue := VAR_MUX_uxn_opcodes_h_l1011_c32_3664_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1004_c7_5644_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_8324_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_3273_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_5644_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_8324_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1004_c7_5644_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_8324_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_3273_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_5644_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_8324_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1004_c7_5644_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1007_c7_8324_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse := VAR_t8_MUX_uxn_opcodes_h_l997_c7_4b87_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1007_c7_8324] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_8324_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_8324_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_8324_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_8324_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_8324_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_8324_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_8324_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_8324_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1007_c7_8324] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_8324_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_8324_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_8324_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_8324_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_8324_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_8324_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_8324_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_8324_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1004_c7_5644] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1004_c7_5644_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1004_c7_5644_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1004_c7_5644_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1004_c7_5644_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1004_c7_5644_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1004_c7_5644_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1004_c7_5644_return_output := result_stack_value_MUX_uxn_opcodes_h_l1004_c7_5644_return_output;

     -- t8_MUX[uxn_opcodes_h_l991_c2_1fab] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l991_c2_1fab_cond <= VAR_t8_MUX_uxn_opcodes_h_l991_c2_1fab_cond;
     t8_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue;
     t8_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l991_c2_1fab_return_output := t8_MUX_uxn_opcodes_h_l991_c2_1fab_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1004_c7_5644] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_5644_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_5644_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_5644_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_5644_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_5644_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_5644_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_5644_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_5644_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1007_c7_8324] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_8324_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_8324_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_8324_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_8324_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_8324_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_8324_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_8324_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_8324_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1000_c7_9012] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_9012_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_9012_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_9012_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_9012_return_output;

     -- n8_MUX[uxn_opcodes_h_l1000_c7_9012] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1000_c7_9012_cond <= VAR_n8_MUX_uxn_opcodes_h_l1000_c7_9012_cond;
     n8_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue;
     n8_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1000_c7_9012_return_output := n8_MUX_uxn_opcodes_h_l1000_c7_9012_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1004_c7_5644] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_5644_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_5644_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_5644_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_5644_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_5644_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_5644_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_5644_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_5644_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1000_c7_9012_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_5644_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_8324_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_5644_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_9012_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_5644_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_8324_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_5644_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_8324_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_5644_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1004_c7_5644_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l991_c2_1fab_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l997_c7_4b87] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l997_c7_4b87_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l997_c7_4b87_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l997_c7_4b87_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l997_c7_4b87_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1004_c7_5644] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_5644_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_5644_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_5644_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_5644_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_5644_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_5644_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_5644_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_5644_return_output;

     -- n8_MUX[uxn_opcodes_h_l997_c7_4b87] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l997_c7_4b87_cond <= VAR_n8_MUX_uxn_opcodes_h_l997_c7_4b87_cond;
     n8_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue;
     n8_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l997_c7_4b87_return_output := n8_MUX_uxn_opcodes_h_l997_c7_4b87_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1000_c7_9012] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_9012_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_9012_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_9012_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_9012_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1000_c7_9012] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1000_c7_9012_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c7_9012_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c7_9012_return_output := result_stack_value_MUX_uxn_opcodes_h_l1000_c7_9012_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1004_c7_5644] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_5644_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_5644_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_5644_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_5644_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_5644_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_5644_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_5644_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_5644_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1000_c7_9012] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_9012_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_9012_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_9012_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_9012_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1004_c7_5644] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_5644_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_5644_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_5644_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_5644_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_5644_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_5644_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_5644_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_5644_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse := VAR_n8_MUX_uxn_opcodes_h_l997_c7_4b87_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_5644_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_9012_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l997_c7_4b87_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_5644_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_5644_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_9012_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c7_9012_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1000_c7_9012] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_9012_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_9012_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_9012_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_9012_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1000_c7_9012] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_9012_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_9012_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_9012_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_9012_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1000_c7_9012] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_9012_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_9012_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_9012_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_9012_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_9012_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_9012_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l997_c7_4b87] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l997_c7_4b87_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l997_c7_4b87_cond;
     result_stack_value_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l997_c7_4b87_return_output := result_stack_value_MUX_uxn_opcodes_h_l997_c7_4b87_return_output;

     -- n8_MUX[uxn_opcodes_h_l991_c2_1fab] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l991_c2_1fab_cond <= VAR_n8_MUX_uxn_opcodes_h_l991_c2_1fab_cond;
     n8_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue;
     n8_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l991_c2_1fab_return_output := n8_MUX_uxn_opcodes_h_l991_c2_1fab_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l997_c7_4b87] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4b87_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4b87_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4b87_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4b87_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l997_c7_4b87] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4b87_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4b87_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4b87_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4b87_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l991_c2_1fab] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l991_c2_1fab_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c2_1fab_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c2_1fab_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l991_c2_1fab_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l991_c2_1fab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_9012_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_4b87_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_9012_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_9012_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_4b87_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l997_c7_4b87_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l991_c2_1fab] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l991_c2_1fab_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c2_1fab_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c2_1fab_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l991_c2_1fab_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l991_c2_1fab] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c2_1fab_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c2_1fab_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c2_1fab_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c2_1fab_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l997_c7_4b87] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_4b87_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_4b87_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_4b87_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_4b87_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l997_c7_4b87] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4b87_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4b87_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4b87_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4b87_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l997_c7_4b87] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4b87_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4b87_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4b87_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4b87_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4b87_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4b87_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l991_c2_1fab] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l991_c2_1fab_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c2_1fab_cond;
     result_stack_value_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c2_1fab_return_output := result_stack_value_MUX_uxn_opcodes_h_l991_c2_1fab_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_4b87_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_4b87_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_4b87_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l991_c2_1fab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l991_c2_1fab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c2_1fab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c2_1fab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l991_c2_1fab_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l991_c2_1fab] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l991_c2_1fab_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c2_1fab_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c2_1fab_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l991_c2_1fab_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l991_c2_1fab] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c2_1fab_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c2_1fab_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c2_1fab_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c2_1fab_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c2_1fab_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c2_1fab_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l987_l1024_DUPLICATE_1100 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l987_l1024_DUPLICATE_1100_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e56b(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c2_1fab_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l991_c2_1fab_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c2_1fab_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c2_1fab_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c2_1fab_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c2_1fab_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l991_c2_1fab_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l987_l1024_DUPLICATE_1100_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l987_l1024_DUPLICATE_1100_return_output;
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
