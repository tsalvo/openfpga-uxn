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
entity add_0CLK_fd2391e7 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end add_0CLK_fd2391e7;
architecture arch of add_0CLK_fd2391e7 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l893_c6_9e61]
signal BIN_OP_EQ_uxn_opcodes_h_l893_c6_9e61_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l893_c6_9e61_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l893_c6_9e61_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l893_c1_932c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l893_c1_932c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l893_c1_932c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l893_c1_932c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l893_c1_932c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l893_c2_fa17]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_fa17_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_fa17_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l893_c2_fa17]
signal result_is_stack_read_MUX_uxn_opcodes_h_l893_c2_fa17_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l893_c2_fa17_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l893_c2_fa17]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_fa17_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_fa17_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l893_c2_fa17]
signal result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_fa17_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_fa17_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l893_c2_fa17]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_fa17_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_fa17_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l893_c2_fa17]
signal result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_fa17_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_fa17_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l893_c2_fa17]
signal result_stack_value_MUX_uxn_opcodes_h_l893_c2_fa17_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l893_c2_fa17_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l893_c2_fa17]
signal t8_MUX_uxn_opcodes_h_l893_c2_fa17_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l893_c2_fa17_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l893_c2_fa17]
signal n8_MUX_uxn_opcodes_h_l893_c2_fa17_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l893_c2_fa17_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l894_c3_d515[uxn_opcodes_h_l894_c3_d515]
signal printf_uxn_opcodes_h_l894_c3_d515_uxn_opcodes_h_l894_c3_d515_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l899_c11_53f5]
signal BIN_OP_EQ_uxn_opcodes_h_l899_c11_53f5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l899_c11_53f5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l899_c11_53f5_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l899_c7_b1da]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_b1da_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_b1da_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l899_c7_b1da]
signal result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_b1da_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_b1da_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l899_c7_b1da]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_b1da_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_b1da_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l899_c7_b1da]
signal result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_b1da_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_b1da_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l899_c7_b1da]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_b1da_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_b1da_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l899_c7_b1da]
signal result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_b1da_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_b1da_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l899_c7_b1da]
signal result_stack_value_MUX_uxn_opcodes_h_l899_c7_b1da_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l899_c7_b1da_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l899_c7_b1da]
signal t8_MUX_uxn_opcodes_h_l899_c7_b1da_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l899_c7_b1da_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l899_c7_b1da]
signal n8_MUX_uxn_opcodes_h_l899_c7_b1da_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l899_c7_b1da_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l902_c11_e365]
signal BIN_OP_EQ_uxn_opcodes_h_l902_c11_e365_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l902_c11_e365_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l902_c11_e365_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l902_c7_626b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_626b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_626b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_626b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_626b_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l902_c7_626b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_626b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_626b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_626b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_626b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l902_c7_626b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_626b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_626b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_626b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_626b_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l902_c7_626b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_626b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_626b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_626b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_626b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l902_c7_626b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_626b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_626b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_626b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_626b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l902_c7_626b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_626b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_626b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_626b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_626b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l902_c7_626b]
signal result_stack_value_MUX_uxn_opcodes_h_l902_c7_626b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l902_c7_626b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l902_c7_626b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l902_c7_626b_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l902_c7_626b]
signal t8_MUX_uxn_opcodes_h_l902_c7_626b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l902_c7_626b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l902_c7_626b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l902_c7_626b_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l902_c7_626b]
signal n8_MUX_uxn_opcodes_h_l902_c7_626b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l902_c7_626b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l902_c7_626b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l902_c7_626b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l906_c11_0254]
signal BIN_OP_EQ_uxn_opcodes_h_l906_c11_0254_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l906_c11_0254_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l906_c11_0254_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l906_c7_c53e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_c53e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_c53e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_c53e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_c53e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l906_c7_c53e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_c53e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_c53e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_c53e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_c53e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l906_c7_c53e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_c53e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_c53e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_c53e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_c53e_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l906_c7_c53e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_c53e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_c53e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_c53e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_c53e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l906_c7_c53e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_c53e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_c53e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_c53e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_c53e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l906_c7_c53e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_c53e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_c53e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_c53e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_c53e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l906_c7_c53e]
signal result_stack_value_MUX_uxn_opcodes_h_l906_c7_c53e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l906_c7_c53e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l906_c7_c53e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l906_c7_c53e_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l906_c7_c53e]
signal n8_MUX_uxn_opcodes_h_l906_c7_c53e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l906_c7_c53e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l906_c7_c53e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l906_c7_c53e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l909_c11_dd87]
signal BIN_OP_EQ_uxn_opcodes_h_l909_c11_dd87_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l909_c11_dd87_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l909_c11_dd87_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l909_c7_81ff]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_81ff_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_81ff_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_81ff_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_81ff_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l909_c7_81ff]
signal result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_81ff_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_81ff_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_81ff_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_81ff_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l909_c7_81ff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_81ff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_81ff_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_81ff_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_81ff_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l909_c7_81ff]
signal result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_81ff_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_81ff_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_81ff_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_81ff_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l909_c7_81ff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_81ff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_81ff_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_81ff_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_81ff_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l909_c7_81ff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_81ff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_81ff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_81ff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_81ff_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l909_c7_81ff]
signal result_stack_value_MUX_uxn_opcodes_h_l909_c7_81ff_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l909_c7_81ff_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l909_c7_81ff_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l909_c7_81ff_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l909_c7_81ff]
signal n8_MUX_uxn_opcodes_h_l909_c7_81ff_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l909_c7_81ff_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l909_c7_81ff_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l909_c7_81ff_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l913_c32_e850]
signal BIN_OP_AND_uxn_opcodes_h_l913_c32_e850_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l913_c32_e850_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l913_c32_e850_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l913_c32_c754]
signal BIN_OP_GT_uxn_opcodes_h_l913_c32_c754_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l913_c32_c754_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l913_c32_c754_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l913_c32_d805]
signal MUX_uxn_opcodes_h_l913_c32_d805_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l913_c32_d805_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l913_c32_d805_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l913_c32_d805_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l915_c11_f065]
signal BIN_OP_EQ_uxn_opcodes_h_l915_c11_f065_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l915_c11_f065_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l915_c11_f065_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l915_c7_2877]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_2877_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_2877_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_2877_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_2877_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l915_c7_2877]
signal result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_2877_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_2877_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_2877_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_2877_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l915_c7_2877]
signal result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_2877_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_2877_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_2877_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_2877_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l915_c7_2877]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_2877_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_2877_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_2877_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_2877_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l915_c7_2877]
signal result_stack_value_MUX_uxn_opcodes_h_l915_c7_2877_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l915_c7_2877_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l915_c7_2877_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l915_c7_2877_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l919_c24_3dc3]
signal BIN_OP_PLUS_uxn_opcodes_h_l919_c24_3dc3_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l919_c24_3dc3_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l919_c24_3dc3_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l921_c11_06f2]
signal BIN_OP_EQ_uxn_opcodes_h_l921_c11_06f2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l921_c11_06f2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l921_c11_06f2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l921_c7_3c8c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_3c8c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_3c8c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_3c8c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_3c8c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l921_c7_3c8c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_3c8c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_3c8c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_3c8c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_3c8c_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l893_c6_9e61
BIN_OP_EQ_uxn_opcodes_h_l893_c6_9e61 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l893_c6_9e61_left,
BIN_OP_EQ_uxn_opcodes_h_l893_c6_9e61_right,
BIN_OP_EQ_uxn_opcodes_h_l893_c6_9e61_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l893_c1_932c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l893_c1_932c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l893_c1_932c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l893_c1_932c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l893_c1_932c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l893_c1_932c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_fa17
result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_fa17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_fa17_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_fa17_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l893_c2_fa17
result_is_stack_read_MUX_uxn_opcodes_h_l893_c2_fa17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l893_c2_fa17_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l893_c2_fa17_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_fa17
result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_fa17 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_fa17_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_fa17_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_fa17
result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_fa17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_fa17_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_fa17_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_fa17
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_fa17 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_fa17_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_fa17_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_fa17
result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_fa17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_fa17_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_fa17_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l893_c2_fa17
result_stack_value_MUX_uxn_opcodes_h_l893_c2_fa17 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l893_c2_fa17_cond,
result_stack_value_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l893_c2_fa17_return_output);

-- t8_MUX_uxn_opcodes_h_l893_c2_fa17
t8_MUX_uxn_opcodes_h_l893_c2_fa17 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l893_c2_fa17_cond,
t8_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue,
t8_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse,
t8_MUX_uxn_opcodes_h_l893_c2_fa17_return_output);

-- n8_MUX_uxn_opcodes_h_l893_c2_fa17
n8_MUX_uxn_opcodes_h_l893_c2_fa17 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l893_c2_fa17_cond,
n8_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue,
n8_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse,
n8_MUX_uxn_opcodes_h_l893_c2_fa17_return_output);

-- printf_uxn_opcodes_h_l894_c3_d515_uxn_opcodes_h_l894_c3_d515
printf_uxn_opcodes_h_l894_c3_d515_uxn_opcodes_h_l894_c3_d515 : entity work.printf_uxn_opcodes_h_l894_c3_d515_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l894_c3_d515_uxn_opcodes_h_l894_c3_d515_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l899_c11_53f5
BIN_OP_EQ_uxn_opcodes_h_l899_c11_53f5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l899_c11_53f5_left,
BIN_OP_EQ_uxn_opcodes_h_l899_c11_53f5_right,
BIN_OP_EQ_uxn_opcodes_h_l899_c11_53f5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_b1da
result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_b1da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_b1da_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_b1da_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_b1da
result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_b1da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_b1da_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_b1da_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_b1da
result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_b1da : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_b1da_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_b1da_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_b1da
result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_b1da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_b1da_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_b1da_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_b1da
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_b1da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_b1da_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_b1da_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_b1da
result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_b1da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_b1da_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_b1da_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l899_c7_b1da
result_stack_value_MUX_uxn_opcodes_h_l899_c7_b1da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l899_c7_b1da_cond,
result_stack_value_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l899_c7_b1da_return_output);

-- t8_MUX_uxn_opcodes_h_l899_c7_b1da
t8_MUX_uxn_opcodes_h_l899_c7_b1da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l899_c7_b1da_cond,
t8_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue,
t8_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse,
t8_MUX_uxn_opcodes_h_l899_c7_b1da_return_output);

-- n8_MUX_uxn_opcodes_h_l899_c7_b1da
n8_MUX_uxn_opcodes_h_l899_c7_b1da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l899_c7_b1da_cond,
n8_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue,
n8_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse,
n8_MUX_uxn_opcodes_h_l899_c7_b1da_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l902_c11_e365
BIN_OP_EQ_uxn_opcodes_h_l902_c11_e365 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l902_c11_e365_left,
BIN_OP_EQ_uxn_opcodes_h_l902_c11_e365_right,
BIN_OP_EQ_uxn_opcodes_h_l902_c11_e365_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_626b
result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_626b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_626b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_626b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_626b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_626b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_626b
result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_626b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_626b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_626b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_626b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_626b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_626b
result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_626b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_626b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_626b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_626b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_626b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_626b
result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_626b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_626b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_626b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_626b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_626b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_626b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_626b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_626b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_626b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_626b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_626b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_626b
result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_626b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_626b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_626b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_626b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_626b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l902_c7_626b
result_stack_value_MUX_uxn_opcodes_h_l902_c7_626b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l902_c7_626b_cond,
result_stack_value_MUX_uxn_opcodes_h_l902_c7_626b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l902_c7_626b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l902_c7_626b_return_output);

-- t8_MUX_uxn_opcodes_h_l902_c7_626b
t8_MUX_uxn_opcodes_h_l902_c7_626b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l902_c7_626b_cond,
t8_MUX_uxn_opcodes_h_l902_c7_626b_iftrue,
t8_MUX_uxn_opcodes_h_l902_c7_626b_iffalse,
t8_MUX_uxn_opcodes_h_l902_c7_626b_return_output);

-- n8_MUX_uxn_opcodes_h_l902_c7_626b
n8_MUX_uxn_opcodes_h_l902_c7_626b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l902_c7_626b_cond,
n8_MUX_uxn_opcodes_h_l902_c7_626b_iftrue,
n8_MUX_uxn_opcodes_h_l902_c7_626b_iffalse,
n8_MUX_uxn_opcodes_h_l902_c7_626b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l906_c11_0254
BIN_OP_EQ_uxn_opcodes_h_l906_c11_0254 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l906_c11_0254_left,
BIN_OP_EQ_uxn_opcodes_h_l906_c11_0254_right,
BIN_OP_EQ_uxn_opcodes_h_l906_c11_0254_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_c53e
result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_c53e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_c53e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_c53e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_c53e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_c53e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_c53e
result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_c53e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_c53e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_c53e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_c53e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_c53e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_c53e
result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_c53e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_c53e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_c53e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_c53e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_c53e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_c53e
result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_c53e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_c53e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_c53e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_c53e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_c53e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_c53e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_c53e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_c53e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_c53e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_c53e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_c53e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_c53e
result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_c53e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_c53e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_c53e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_c53e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_c53e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l906_c7_c53e
result_stack_value_MUX_uxn_opcodes_h_l906_c7_c53e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l906_c7_c53e_cond,
result_stack_value_MUX_uxn_opcodes_h_l906_c7_c53e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l906_c7_c53e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l906_c7_c53e_return_output);

-- n8_MUX_uxn_opcodes_h_l906_c7_c53e
n8_MUX_uxn_opcodes_h_l906_c7_c53e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l906_c7_c53e_cond,
n8_MUX_uxn_opcodes_h_l906_c7_c53e_iftrue,
n8_MUX_uxn_opcodes_h_l906_c7_c53e_iffalse,
n8_MUX_uxn_opcodes_h_l906_c7_c53e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l909_c11_dd87
BIN_OP_EQ_uxn_opcodes_h_l909_c11_dd87 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l909_c11_dd87_left,
BIN_OP_EQ_uxn_opcodes_h_l909_c11_dd87_right,
BIN_OP_EQ_uxn_opcodes_h_l909_c11_dd87_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_81ff
result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_81ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_81ff_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_81ff_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_81ff_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_81ff_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_81ff
result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_81ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_81ff_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_81ff_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_81ff_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_81ff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_81ff
result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_81ff : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_81ff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_81ff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_81ff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_81ff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_81ff
result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_81ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_81ff_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_81ff_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_81ff_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_81ff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_81ff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_81ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_81ff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_81ff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_81ff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_81ff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_81ff
result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_81ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_81ff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_81ff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_81ff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_81ff_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l909_c7_81ff
result_stack_value_MUX_uxn_opcodes_h_l909_c7_81ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l909_c7_81ff_cond,
result_stack_value_MUX_uxn_opcodes_h_l909_c7_81ff_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l909_c7_81ff_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l909_c7_81ff_return_output);

-- n8_MUX_uxn_opcodes_h_l909_c7_81ff
n8_MUX_uxn_opcodes_h_l909_c7_81ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l909_c7_81ff_cond,
n8_MUX_uxn_opcodes_h_l909_c7_81ff_iftrue,
n8_MUX_uxn_opcodes_h_l909_c7_81ff_iffalse,
n8_MUX_uxn_opcodes_h_l909_c7_81ff_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l913_c32_e850
BIN_OP_AND_uxn_opcodes_h_l913_c32_e850 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l913_c32_e850_left,
BIN_OP_AND_uxn_opcodes_h_l913_c32_e850_right,
BIN_OP_AND_uxn_opcodes_h_l913_c32_e850_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l913_c32_c754
BIN_OP_GT_uxn_opcodes_h_l913_c32_c754 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l913_c32_c754_left,
BIN_OP_GT_uxn_opcodes_h_l913_c32_c754_right,
BIN_OP_GT_uxn_opcodes_h_l913_c32_c754_return_output);

-- MUX_uxn_opcodes_h_l913_c32_d805
MUX_uxn_opcodes_h_l913_c32_d805 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l913_c32_d805_cond,
MUX_uxn_opcodes_h_l913_c32_d805_iftrue,
MUX_uxn_opcodes_h_l913_c32_d805_iffalse,
MUX_uxn_opcodes_h_l913_c32_d805_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l915_c11_f065
BIN_OP_EQ_uxn_opcodes_h_l915_c11_f065 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l915_c11_f065_left,
BIN_OP_EQ_uxn_opcodes_h_l915_c11_f065_right,
BIN_OP_EQ_uxn_opcodes_h_l915_c11_f065_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_2877
result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_2877 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_2877_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_2877_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_2877_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_2877_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_2877
result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_2877 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_2877_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_2877_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_2877_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_2877_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_2877
result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_2877 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_2877_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_2877_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_2877_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_2877_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_2877
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_2877 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_2877_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_2877_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_2877_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_2877_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l915_c7_2877
result_stack_value_MUX_uxn_opcodes_h_l915_c7_2877 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l915_c7_2877_cond,
result_stack_value_MUX_uxn_opcodes_h_l915_c7_2877_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l915_c7_2877_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l915_c7_2877_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l919_c24_3dc3
BIN_OP_PLUS_uxn_opcodes_h_l919_c24_3dc3 : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l919_c24_3dc3_left,
BIN_OP_PLUS_uxn_opcodes_h_l919_c24_3dc3_right,
BIN_OP_PLUS_uxn_opcodes_h_l919_c24_3dc3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l921_c11_06f2
BIN_OP_EQ_uxn_opcodes_h_l921_c11_06f2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l921_c11_06f2_left,
BIN_OP_EQ_uxn_opcodes_h_l921_c11_06f2_right,
BIN_OP_EQ_uxn_opcodes_h_l921_c11_06f2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_3c8c
result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_3c8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_3c8c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_3c8c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_3c8c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_3c8c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_3c8c
result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_3c8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_3c8c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_3c8c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_3c8c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_3c8c_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l893_c6_9e61_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l893_c1_932c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_fa17_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l893_c2_fa17_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_fa17_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_fa17_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_fa17_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_fa17_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l893_c2_fa17_return_output,
 t8_MUX_uxn_opcodes_h_l893_c2_fa17_return_output,
 n8_MUX_uxn_opcodes_h_l893_c2_fa17_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l899_c11_53f5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_b1da_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_b1da_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_b1da_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_b1da_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_b1da_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_b1da_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l899_c7_b1da_return_output,
 t8_MUX_uxn_opcodes_h_l899_c7_b1da_return_output,
 n8_MUX_uxn_opcodes_h_l899_c7_b1da_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l902_c11_e365_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_626b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_626b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_626b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_626b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_626b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_626b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l902_c7_626b_return_output,
 t8_MUX_uxn_opcodes_h_l902_c7_626b_return_output,
 n8_MUX_uxn_opcodes_h_l902_c7_626b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l906_c11_0254_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_c53e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_c53e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_c53e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_c53e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_c53e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_c53e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l906_c7_c53e_return_output,
 n8_MUX_uxn_opcodes_h_l906_c7_c53e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l909_c11_dd87_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_81ff_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_81ff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_81ff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_81ff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_81ff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_81ff_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l909_c7_81ff_return_output,
 n8_MUX_uxn_opcodes_h_l909_c7_81ff_return_output,
 BIN_OP_AND_uxn_opcodes_h_l913_c32_e850_return_output,
 BIN_OP_GT_uxn_opcodes_h_l913_c32_c754_return_output,
 MUX_uxn_opcodes_h_l913_c32_d805_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l915_c11_f065_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_2877_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_2877_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_2877_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_2877_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l915_c7_2877_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l919_c24_3dc3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l921_c11_06f2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_3c8c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_3c8c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c6_9e61_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c6_9e61_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c6_9e61_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l893_c1_932c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l893_c1_932c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l893_c1_932c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l893_c1_932c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_b1da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_fa17_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_fa17_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_b1da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l893_c2_fa17_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l893_c2_fa17_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_b1da_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_fa17_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_fa17_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_b1da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_fa17_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_fa17_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l896_c3_6759 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_b1da_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_fa17_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_fa17_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_b1da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_fa17_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_fa17_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c7_b1da_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l893_c2_fa17_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l893_c2_fa17_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l899_c7_b1da_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l893_c2_fa17_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l893_c2_fa17_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l899_c7_b1da_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l893_c2_fa17_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l893_c2_fa17_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l894_c3_d515_uxn_opcodes_h_l894_c3_d515_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_53f5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_53f5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_53f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_626b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_b1da_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_626b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_b1da_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_626b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_b1da_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_626b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_b1da_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l900_c3_07a3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_626b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_b1da_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_626b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_b1da_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l902_c7_626b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c7_b1da_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l902_c7_626b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l899_c7_b1da_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l902_c7_626b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l899_c7_b1da_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l902_c11_e365_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l902_c11_e365_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l902_c11_e365_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_626b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_626b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_c53e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_626b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_626b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_626b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_c53e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_626b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_626b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_626b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_c53e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_626b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_626b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_626b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_c53e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_626b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_626b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l904_c3_3a8c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_626b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_c53e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_626b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_626b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_626b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_c53e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_626b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l902_c7_626b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l902_c7_626b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l906_c7_c53e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l902_c7_626b_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l902_c7_626b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l902_c7_626b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l902_c7_626b_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l902_c7_626b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l902_c7_626b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l906_c7_c53e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l902_c7_626b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_0254_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_0254_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_0254_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_c53e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_c53e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_81ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_c53e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_c53e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_c53e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_81ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_c53e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_c53e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_c53e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_81ff_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_c53e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_c53e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_c53e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_81ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_c53e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_c53e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l907_c3_160d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_c53e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_81ff_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_c53e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_c53e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_c53e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_81ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_c53e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l906_c7_c53e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l906_c7_c53e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l909_c7_81ff_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l906_c7_c53e_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l906_c7_c53e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l906_c7_c53e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l909_c7_81ff_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l906_c7_c53e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_dd87_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_dd87_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_dd87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_81ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_81ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_2877_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_81ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_81ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_81ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_81ff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_81ff_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_81ff_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_81ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_81ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_81ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_2877_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_81ff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_81ff_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_81ff_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_2877_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_81ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_81ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_81ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_2877_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_81ff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l909_c7_81ff_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l909_c7_81ff_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l915_c7_2877_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l909_c7_81ff_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l909_c7_81ff_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l909_c7_81ff_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l909_c7_81ff_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l913_c32_d805_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l913_c32_d805_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l913_c32_d805_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l913_c32_e850_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l913_c32_e850_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l913_c32_e850_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l913_c32_c754_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l913_c32_c754_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l913_c32_c754_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l913_c32_d805_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l915_c11_f065_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l915_c11_f065_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l915_c11_f065_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_2877_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_2877_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_2877_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_2877_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_2877_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_3c8c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_2877_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_2877_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_2877_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_3c8c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_2877_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_2877_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l918_c3_f3e3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_2877_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_2877_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l915_c7_2877_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_uxn_opcodes_h_l919_c3_910b : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l915_c7_2877_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l915_c7_2877_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l919_c24_3dc3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l919_c24_3dc3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l919_c24_3dc3_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_06f2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_06f2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_06f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_3c8c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_3c8c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_3c8c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_3c8c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_3c8c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_3c8c_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l893_l915_l906_l902_l899_DUPLICATE_7130_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l893_l909_l906_l902_l899_DUPLICATE_64b4_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l921_l893_l909_l906_l902_l899_DUPLICATE_0479_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l893_l915_l909_l906_l902_l899_DUPLICATE_f3a8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l906_l899_l909_l902_DUPLICATE_aa5e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l921_l915_l909_l906_l902_l899_DUPLICATE_24f2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l909_l915_DUPLICATE_a681_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l926_l889_DUPLICATE_b055_return_output : opcode_result_t;
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
     VAR_BIN_OP_GT_uxn_opcodes_h_l913_c32_c754_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l902_c11_e365_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_2877_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_dd87_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_53f5_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_2877_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_3c8c_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l893_c1_932c_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_81ff_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l900_c3_07a3 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l900_c3_07a3;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_0254_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l918_c3_f3e3 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_2877_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l918_c3_f3e3;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l896_c3_6759 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l896_c3_6759;
     VAR_BIN_OP_AND_uxn_opcodes_h_l913_c32_e850_right := to_unsigned(128, 8);
     VAR_MUX_uxn_opcodes_h_l913_c32_d805_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c6_9e61_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_06f2_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l915_c11_f065_right := to_unsigned(5, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_3c8c_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l907_c3_160d := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_c53e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l907_c3_160d;
     VAR_MUX_uxn_opcodes_h_l913_c32_d805_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_81ff_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l904_c3_3a8c := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_626b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l904_c3_3a8c;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l893_c1_932c_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l913_c32_e850_left := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l919_c24_3dc3_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l902_c7_626b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l906_c7_c53e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l909_c7_81ff_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c6_9e61_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_53f5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l902_c11_e365_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_0254_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_dd87_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l915_c11_f065_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_06f2_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l909_c7_81ff_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l902_c7_626b_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l919_c24_3dc3_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l902_c7_626b_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l902_c11_e365] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l902_c11_e365_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l902_c11_e365_left;
     BIN_OP_EQ_uxn_opcodes_h_l902_c11_e365_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l902_c11_e365_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l902_c11_e365_return_output := BIN_OP_EQ_uxn_opcodes_h_l902_c11_e365_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l921_l915_l909_l906_l902_l899_DUPLICATE_24f2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l921_l915_l909_l906_l902_l899_DUPLICATE_24f2_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l909_c11_dd87] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l909_c11_dd87_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_dd87_left;
     BIN_OP_EQ_uxn_opcodes_h_l909_c11_dd87_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_dd87_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_dd87_return_output := BIN_OP_EQ_uxn_opcodes_h_l909_c11_dd87_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l893_l909_l906_l902_l899_DUPLICATE_64b4 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l893_l909_l906_l902_l899_DUPLICATE_64b4_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l906_l899_l909_l902_DUPLICATE_aa5e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l906_l899_l909_l902_DUPLICATE_aa5e_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l915_c11_f065] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l915_c11_f065_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l915_c11_f065_left;
     BIN_OP_EQ_uxn_opcodes_h_l915_c11_f065_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l915_c11_f065_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l915_c11_f065_return_output := BIN_OP_EQ_uxn_opcodes_h_l915_c11_f065_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l909_l915_DUPLICATE_a681 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l909_l915_DUPLICATE_a681_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l893_l915_l906_l902_l899_DUPLICATE_7130 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l893_l915_l906_l902_l899_DUPLICATE_7130_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l893_l915_l909_l906_l902_l899_DUPLICATE_f3a8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l893_l915_l909_l906_l902_l899_DUPLICATE_f3a8_return_output := result.stack_value;

     -- BIN_OP_PLUS[uxn_opcodes_h_l919_c24_3dc3] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l919_c24_3dc3_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l919_c24_3dc3_left;
     BIN_OP_PLUS_uxn_opcodes_h_l919_c24_3dc3_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l919_c24_3dc3_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l919_c24_3dc3_return_output := BIN_OP_PLUS_uxn_opcodes_h_l919_c24_3dc3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l921_c11_06f2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l921_c11_06f2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_06f2_left;
     BIN_OP_EQ_uxn_opcodes_h_l921_c11_06f2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_06f2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_06f2_return_output := BIN_OP_EQ_uxn_opcodes_h_l921_c11_06f2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l893_c6_9e61] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l893_c6_9e61_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c6_9e61_left;
     BIN_OP_EQ_uxn_opcodes_h_l893_c6_9e61_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c6_9e61_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c6_9e61_return_output := BIN_OP_EQ_uxn_opcodes_h_l893_c6_9e61_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l913_c32_e850] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l913_c32_e850_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l913_c32_e850_left;
     BIN_OP_AND_uxn_opcodes_h_l913_c32_e850_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l913_c32_e850_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l913_c32_e850_return_output := BIN_OP_AND_uxn_opcodes_h_l913_c32_e850_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l906_c11_0254] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l906_c11_0254_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_0254_left;
     BIN_OP_EQ_uxn_opcodes_h_l906_c11_0254_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_0254_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_0254_return_output := BIN_OP_EQ_uxn_opcodes_h_l906_c11_0254_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l921_l893_l909_l906_l902_l899_DUPLICATE_0479 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l921_l893_l909_l906_l902_l899_DUPLICATE_0479_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l899_c11_53f5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l899_c11_53f5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_53f5_left;
     BIN_OP_EQ_uxn_opcodes_h_l899_c11_53f5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_53f5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_53f5_return_output := BIN_OP_EQ_uxn_opcodes_h_l899_c11_53f5_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l913_c32_c754_left := VAR_BIN_OP_AND_uxn_opcodes_h_l913_c32_e850_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l893_c1_932c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c6_9e61_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l893_c2_fa17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c6_9e61_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_fa17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c6_9e61_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_fa17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c6_9e61_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l893_c2_fa17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c6_9e61_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_fa17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c6_9e61_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_fa17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c6_9e61_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_fa17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c6_9e61_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l893_c2_fa17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c6_9e61_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l893_c2_fa17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l893_c6_9e61_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l899_c7_b1da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_53f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_b1da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_53f5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_b1da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_53f5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_b1da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_53f5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_b1da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_53f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_b1da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_53f5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_b1da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_53f5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c7_b1da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_53f5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l899_c7_b1da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_53f5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l902_c7_626b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l902_c11_e365_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_626b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l902_c11_e365_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_626b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l902_c11_e365_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_626b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l902_c11_e365_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_626b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l902_c11_e365_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_626b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l902_c11_e365_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_626b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l902_c11_e365_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l902_c7_626b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l902_c11_e365_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l902_c7_626b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l902_c11_e365_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l906_c7_c53e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_0254_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_c53e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_0254_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_c53e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_0254_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_c53e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_0254_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_c53e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_0254_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_c53e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_0254_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_c53e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_0254_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l906_c7_c53e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_0254_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l909_c7_81ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_dd87_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_81ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_dd87_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_81ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_dd87_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_81ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_dd87_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_81ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_dd87_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_81ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_dd87_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_81ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_dd87_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l909_c7_81ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_dd87_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_2877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l915_c11_f065_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_2877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l915_c11_f065_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_2877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l915_c11_f065_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_2877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l915_c11_f065_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l915_c7_2877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l915_c11_f065_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_3c8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_06f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_3c8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_06f2_return_output;
     VAR_result_stack_value_uxn_opcodes_h_l919_c3_910b := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l919_c24_3dc3_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l893_l909_l906_l902_l899_DUPLICATE_64b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l893_l909_l906_l902_l899_DUPLICATE_64b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_626b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l893_l909_l906_l902_l899_DUPLICATE_64b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_c53e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l893_l909_l906_l902_l899_DUPLICATE_64b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_81ff_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l893_l909_l906_l902_l899_DUPLICATE_64b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l921_l915_l909_l906_l902_l899_DUPLICATE_24f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_626b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l921_l915_l909_l906_l902_l899_DUPLICATE_24f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_c53e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l921_l915_l909_l906_l902_l899_DUPLICATE_24f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_81ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l921_l915_l909_l906_l902_l899_DUPLICATE_24f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_2877_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l921_l915_l909_l906_l902_l899_DUPLICATE_24f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_3c8c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l921_l915_l909_l906_l902_l899_DUPLICATE_24f2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l893_l915_l906_l902_l899_DUPLICATE_7130_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l893_l915_l906_l902_l899_DUPLICATE_7130_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_626b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l893_l915_l906_l902_l899_DUPLICATE_7130_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_c53e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l893_l915_l906_l902_l899_DUPLICATE_7130_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_2877_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l893_l915_l906_l902_l899_DUPLICATE_7130_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l906_l899_l909_l902_DUPLICATE_aa5e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_626b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l906_l899_l909_l902_DUPLICATE_aa5e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_c53e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l906_l899_l909_l902_DUPLICATE_aa5e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_81ff_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l906_l899_l909_l902_DUPLICATE_aa5e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l921_l893_l909_l906_l902_l899_DUPLICATE_0479_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l921_l893_l909_l906_l902_l899_DUPLICATE_0479_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_626b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l921_l893_l909_l906_l902_l899_DUPLICATE_0479_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_c53e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l921_l893_l909_l906_l902_l899_DUPLICATE_0479_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_81ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l921_l893_l909_l906_l902_l899_DUPLICATE_0479_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_3c8c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l921_l893_l909_l906_l902_l899_DUPLICATE_0479_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_81ff_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l909_l915_DUPLICATE_a681_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_2877_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l909_l915_DUPLICATE_a681_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l893_l915_l909_l906_l902_l899_DUPLICATE_f3a8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l893_l915_l909_l906_l902_l899_DUPLICATE_f3a8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l902_c7_626b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l893_l915_l909_l906_l902_l899_DUPLICATE_f3a8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l906_c7_c53e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l893_l915_l909_l906_l902_l899_DUPLICATE_f3a8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l909_c7_81ff_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l893_l915_l909_l906_l902_l899_DUPLICATE_f3a8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l915_c7_2877_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l893_l915_l909_l906_l902_l899_DUPLICATE_f3a8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l915_c7_2877_iftrue := VAR_result_stack_value_uxn_opcodes_h_l919_c3_910b;
     -- n8_MUX[uxn_opcodes_h_l909_c7_81ff] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l909_c7_81ff_cond <= VAR_n8_MUX_uxn_opcodes_h_l909_c7_81ff_cond;
     n8_MUX_uxn_opcodes_h_l909_c7_81ff_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l909_c7_81ff_iftrue;
     n8_MUX_uxn_opcodes_h_l909_c7_81ff_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l909_c7_81ff_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l909_c7_81ff_return_output := n8_MUX_uxn_opcodes_h_l909_c7_81ff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l921_c7_3c8c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_3c8c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_3c8c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_3c8c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_3c8c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_3c8c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_3c8c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_3c8c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_3c8c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l893_c1_932c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l893_c1_932c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l893_c1_932c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l893_c1_932c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l893_c1_932c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l893_c1_932c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l893_c1_932c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l893_c1_932c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l893_c1_932c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l921_c7_3c8c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_3c8c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_3c8c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_3c8c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_3c8c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_3c8c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_3c8c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_3c8c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_3c8c_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l913_c32_c754] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l913_c32_c754_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l913_c32_c754_left;
     BIN_OP_GT_uxn_opcodes_h_l913_c32_c754_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l913_c32_c754_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l913_c32_c754_return_output := BIN_OP_GT_uxn_opcodes_h_l913_c32_c754_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l915_c7_2877] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_2877_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_2877_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_2877_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_2877_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_2877_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_2877_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_2877_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_2877_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l915_c7_2877] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l915_c7_2877_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l915_c7_2877_cond;
     result_stack_value_MUX_uxn_opcodes_h_l915_c7_2877_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l915_c7_2877_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l915_c7_2877_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l915_c7_2877_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l915_c7_2877_return_output := result_stack_value_MUX_uxn_opcodes_h_l915_c7_2877_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l915_c7_2877] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_2877_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_2877_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_2877_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_2877_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_2877_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_2877_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_2877_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_2877_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l909_c7_81ff] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_81ff_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_81ff_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_81ff_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_81ff_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_81ff_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_81ff_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_81ff_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_81ff_return_output;

     -- t8_MUX[uxn_opcodes_h_l902_c7_626b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l902_c7_626b_cond <= VAR_t8_MUX_uxn_opcodes_h_l902_c7_626b_cond;
     t8_MUX_uxn_opcodes_h_l902_c7_626b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l902_c7_626b_iftrue;
     t8_MUX_uxn_opcodes_h_l902_c7_626b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l902_c7_626b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l902_c7_626b_return_output := t8_MUX_uxn_opcodes_h_l902_c7_626b_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l913_c32_d805_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l913_c32_c754_return_output;
     VAR_printf_uxn_opcodes_h_l894_c3_d515_uxn_opcodes_h_l894_c3_d515_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l893_c1_932c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l906_c7_c53e_iffalse := VAR_n8_MUX_uxn_opcodes_h_l909_c7_81ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_2877_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_3c8c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_81ff_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_2877_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_c53e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l909_c7_81ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_2877_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_3c8c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_81ff_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_2877_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l909_c7_81ff_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l915_c7_2877_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse := VAR_t8_MUX_uxn_opcodes_h_l902_c7_626b_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l909_c7_81ff] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_81ff_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_81ff_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_81ff_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_81ff_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_81ff_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_81ff_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_81ff_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_81ff_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l915_c7_2877] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_2877_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_2877_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_2877_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_2877_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_2877_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_2877_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_2877_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_2877_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l906_c7_c53e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_c53e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_c53e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_c53e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_c53e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_c53e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_c53e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_c53e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_c53e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l909_c7_81ff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_81ff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_81ff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_81ff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_81ff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_81ff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_81ff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_81ff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_81ff_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l909_c7_81ff] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l909_c7_81ff_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l909_c7_81ff_cond;
     result_stack_value_MUX_uxn_opcodes_h_l909_c7_81ff_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l909_c7_81ff_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l909_c7_81ff_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l909_c7_81ff_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l909_c7_81ff_return_output := result_stack_value_MUX_uxn_opcodes_h_l909_c7_81ff_return_output;

     -- t8_MUX[uxn_opcodes_h_l899_c7_b1da] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l899_c7_b1da_cond <= VAR_t8_MUX_uxn_opcodes_h_l899_c7_b1da_cond;
     t8_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue;
     t8_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l899_c7_b1da_return_output := t8_MUX_uxn_opcodes_h_l899_c7_b1da_return_output;

     -- MUX[uxn_opcodes_h_l913_c32_d805] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l913_c32_d805_cond <= VAR_MUX_uxn_opcodes_h_l913_c32_d805_cond;
     MUX_uxn_opcodes_h_l913_c32_d805_iftrue <= VAR_MUX_uxn_opcodes_h_l913_c32_d805_iftrue;
     MUX_uxn_opcodes_h_l913_c32_d805_iffalse <= VAR_MUX_uxn_opcodes_h_l913_c32_d805_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l913_c32_d805_return_output := MUX_uxn_opcodes_h_l913_c32_d805_return_output;

     -- n8_MUX[uxn_opcodes_h_l906_c7_c53e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l906_c7_c53e_cond <= VAR_n8_MUX_uxn_opcodes_h_l906_c7_c53e_cond;
     n8_MUX_uxn_opcodes_h_l906_c7_c53e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l906_c7_c53e_iftrue;
     n8_MUX_uxn_opcodes_h_l906_c7_c53e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l906_c7_c53e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l906_c7_c53e_return_output := n8_MUX_uxn_opcodes_h_l906_c7_c53e_return_output;

     -- printf_uxn_opcodes_h_l894_c3_d515[uxn_opcodes_h_l894_c3_d515] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l894_c3_d515_uxn_opcodes_h_l894_c3_d515_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l894_c3_d515_uxn_opcodes_h_l894_c3_d515_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l915_c7_2877] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_2877_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_2877_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_2877_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_2877_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_2877_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_2877_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_2877_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_2877_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_81ff_iftrue := VAR_MUX_uxn_opcodes_h_l913_c32_d805_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l902_c7_626b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l906_c7_c53e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_81ff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_2877_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_c53e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_81ff_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_626b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_c53e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_81ff_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_2877_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_c53e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_81ff_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l906_c7_c53e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l909_c7_81ff_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse := VAR_t8_MUX_uxn_opcodes_h_l899_c7_b1da_return_output;
     -- t8_MUX[uxn_opcodes_h_l893_c2_fa17] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l893_c2_fa17_cond <= VAR_t8_MUX_uxn_opcodes_h_l893_c2_fa17_cond;
     t8_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue;
     t8_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l893_c2_fa17_return_output := t8_MUX_uxn_opcodes_h_l893_c2_fa17_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l906_c7_c53e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l906_c7_c53e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l906_c7_c53e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l906_c7_c53e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l906_c7_c53e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l906_c7_c53e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l906_c7_c53e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l906_c7_c53e_return_output := result_stack_value_MUX_uxn_opcodes_h_l906_c7_c53e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l909_c7_81ff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_81ff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_81ff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_81ff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_81ff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_81ff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_81ff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_81ff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_81ff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l909_c7_81ff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_81ff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_81ff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_81ff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_81ff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_81ff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_81ff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_81ff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_81ff_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l902_c7_626b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_626b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_626b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_626b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_626b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_626b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_626b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_626b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_626b_return_output;

     -- n8_MUX[uxn_opcodes_h_l902_c7_626b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l902_c7_626b_cond <= VAR_n8_MUX_uxn_opcodes_h_l902_c7_626b_cond;
     n8_MUX_uxn_opcodes_h_l902_c7_626b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l902_c7_626b_iftrue;
     n8_MUX_uxn_opcodes_h_l902_c7_626b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l902_c7_626b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l902_c7_626b_return_output := n8_MUX_uxn_opcodes_h_l902_c7_626b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l909_c7_81ff] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_81ff_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_81ff_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_81ff_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_81ff_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_81ff_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_81ff_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_81ff_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_81ff_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l906_c7_c53e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_c53e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_c53e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_c53e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_c53e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_c53e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_c53e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_c53e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_c53e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l906_c7_c53e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_c53e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_c53e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_c53e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_c53e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_c53e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_c53e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_c53e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_c53e_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse := VAR_n8_MUX_uxn_opcodes_h_l902_c7_626b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_c53e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_81ff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_626b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_c53e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_626b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_c53e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_81ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_c53e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_81ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_626b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_c53e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l902_c7_626b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l906_c7_c53e_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l893_c2_fa17_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l906_c7_c53e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_c53e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_c53e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_c53e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_c53e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_c53e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_c53e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_c53e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_c53e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l906_c7_c53e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_c53e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_c53e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_c53e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_c53e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_c53e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_c53e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_c53e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_c53e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l902_c7_626b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_626b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_626b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_626b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_626b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_626b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_626b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_626b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_626b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l906_c7_c53e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_c53e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_c53e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_c53e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_c53e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_c53e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_c53e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_c53e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_c53e_return_output;

     -- n8_MUX[uxn_opcodes_h_l899_c7_b1da] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l899_c7_b1da_cond <= VAR_n8_MUX_uxn_opcodes_h_l899_c7_b1da_cond;
     n8_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue;
     n8_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l899_c7_b1da_return_output := n8_MUX_uxn_opcodes_h_l899_c7_b1da_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l902_c7_626b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l902_c7_626b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l902_c7_626b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l902_c7_626b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l902_c7_626b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l902_c7_626b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l902_c7_626b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l902_c7_626b_return_output := result_stack_value_MUX_uxn_opcodes_h_l902_c7_626b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l899_c7_b1da] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_b1da_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_b1da_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_b1da_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_b1da_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l902_c7_626b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_626b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_626b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_626b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_626b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_626b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_626b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_626b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_626b_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse := VAR_n8_MUX_uxn_opcodes_h_l899_c7_b1da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_626b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_c53e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_626b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_b1da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_626b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_c53e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_626b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_c53e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_626b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l902_c7_626b_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l899_c7_b1da] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_b1da_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_b1da_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_b1da_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_b1da_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l902_c7_626b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_626b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_626b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_626b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_626b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_626b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_626b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_626b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_626b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l899_c7_b1da] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_b1da_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_b1da_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_b1da_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_b1da_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l902_c7_626b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_626b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_626b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_626b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_626b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_626b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_626b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_626b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_626b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l899_c7_b1da] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l899_c7_b1da_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c7_b1da_cond;
     result_stack_value_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c7_b1da_return_output := result_stack_value_MUX_uxn_opcodes_h_l899_c7_b1da_return_output;

     -- n8_MUX[uxn_opcodes_h_l893_c2_fa17] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l893_c2_fa17_cond <= VAR_n8_MUX_uxn_opcodes_h_l893_c2_fa17_cond;
     n8_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue;
     n8_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l893_c2_fa17_return_output := n8_MUX_uxn_opcodes_h_l893_c2_fa17_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l902_c7_626b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_626b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_626b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_626b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_626b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_626b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_626b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_626b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_626b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l893_c2_fa17] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l893_c2_fa17_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l893_c2_fa17_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l893_c2_fa17_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l893_c2_fa17_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l893_c2_fa17_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_626b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_b1da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_626b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_626b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_b1da_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c7_b1da_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l899_c7_b1da] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_b1da_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_b1da_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_b1da_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_b1da_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l893_c2_fa17] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l893_c2_fa17_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l893_c2_fa17_cond;
     result_stack_value_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l893_c2_fa17_return_output := result_stack_value_MUX_uxn_opcodes_h_l893_c2_fa17_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l899_c7_b1da] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_b1da_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_b1da_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_b1da_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_b1da_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l893_c2_fa17] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_fa17_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_fa17_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_fa17_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_fa17_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l899_c7_b1da] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_b1da_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_b1da_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_b1da_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_b1da_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_b1da_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_b1da_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l893_c2_fa17] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_fa17_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_fa17_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_fa17_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_fa17_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_b1da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_b1da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_b1da_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l893_c2_fa17] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_fa17_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_fa17_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_fa17_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_fa17_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l893_c2_fa17] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_fa17_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_fa17_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_fa17_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_fa17_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l893_c2_fa17] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_fa17_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_fa17_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_fa17_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_fa17_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_fa17_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_fa17_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l926_l889_DUPLICATE_b055 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l926_l889_DUPLICATE_b055_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1ade(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l893_c2_fa17_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l893_c2_fa17_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l893_c2_fa17_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l893_c2_fa17_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l893_c2_fa17_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l893_c2_fa17_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l893_c2_fa17_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l926_l889_DUPLICATE_b055_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l926_l889_DUPLICATE_b055_return_output;
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
