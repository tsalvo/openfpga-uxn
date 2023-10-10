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
entity and_0CLK_fd2391e7 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end and_0CLK_fd2391e7;
architecture arch of and_0CLK_fd2391e7 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l994_c6_4eca]
signal BIN_OP_EQ_uxn_opcodes_h_l994_c6_4eca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l994_c6_4eca_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l994_c6_4eca_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l994_c1_7098]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l994_c1_7098_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l994_c1_7098_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l994_c1_7098_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l994_c1_7098_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l994_c2_a8bc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l994_c2_a8bc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l994_c2_a8bc]
signal result_is_stack_read_MUX_uxn_opcodes_h_l994_c2_a8bc_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l994_c2_a8bc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c2_a8bc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l994_c2_a8bc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l994_c2_a8bc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l994_c2_a8bc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c2_a8bc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l994_c2_a8bc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l994_c2_a8bc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l994_c2_a8bc]
signal result_stack_value_MUX_uxn_opcodes_h_l994_c2_a8bc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l994_c2_a8bc]
signal t8_MUX_uxn_opcodes_h_l994_c2_a8bc_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l994_c2_a8bc]
signal n8_MUX_uxn_opcodes_h_l994_c2_a8bc_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l995_c3_847e[uxn_opcodes_h_l995_c3_847e]
signal printf_uxn_opcodes_h_l995_c3_847e_uxn_opcodes_h_l995_c3_847e_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1000_c11_d4ae]
signal BIN_OP_EQ_uxn_opcodes_h_l1000_c11_d4ae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1000_c11_d4ae_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1000_c11_d4ae_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1000_c7_ec9b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1000_c7_ec9b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1000_c7_ec9b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1000_c7_ec9b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1000_c7_ec9b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1000_c7_ec9b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1000_c7_ec9b]
signal result_stack_value_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1000_c7_ec9b]
signal t8_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1000_c7_ec9b]
signal n8_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1003_c11_3d78]
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_3d78_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_3d78_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_3d78_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1003_c7_1d53]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_1d53_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1003_c7_1d53]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_1d53_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1003_c7_1d53]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_1d53_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1003_c7_1d53]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_1d53_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1003_c7_1d53]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_1d53_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1003_c7_1d53]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_1d53_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1003_c7_1d53]
signal result_stack_value_MUX_uxn_opcodes_h_l1003_c7_1d53_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1003_c7_1d53]
signal t8_MUX_uxn_opcodes_h_l1003_c7_1d53_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1003_c7_1d53]
signal n8_MUX_uxn_opcodes_h_l1003_c7_1d53_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1007_c11_c0f7]
signal BIN_OP_EQ_uxn_opcodes_h_l1007_c11_c0f7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1007_c11_c0f7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1007_c11_c0f7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1007_c7_7182]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_7182_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_7182_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_7182_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_7182_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1007_c7_7182]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_7182_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_7182_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_7182_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_7182_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1007_c7_7182]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_7182_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_7182_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_7182_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_7182_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1007_c7_7182]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_7182_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_7182_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_7182_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_7182_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1007_c7_7182]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_7182_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_7182_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_7182_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_7182_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1007_c7_7182]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_7182_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_7182_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_7182_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_7182_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1007_c7_7182]
signal result_stack_value_MUX_uxn_opcodes_h_l1007_c7_7182_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1007_c7_7182_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1007_c7_7182_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1007_c7_7182_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1007_c7_7182]
signal n8_MUX_uxn_opcodes_h_l1007_c7_7182_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1007_c7_7182_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1007_c7_7182_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1007_c7_7182_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1010_c11_12d1]
signal BIN_OP_EQ_uxn_opcodes_h_l1010_c11_12d1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1010_c11_12d1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1010_c11_12d1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1010_c7_9a2d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1010_c7_9a2d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_9a2d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_9a2d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_9a2d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1010_c7_9a2d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1010_c7_9a2d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_9a2d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_9a2d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_9a2d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1010_c7_9a2d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_9a2d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_9a2d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_9a2d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1010_c7_9a2d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_9a2d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_9a2d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_9a2d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1010_c7_9a2d]
signal result_stack_value_MUX_uxn_opcodes_h_l1010_c7_9a2d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1010_c7_9a2d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1010_c7_9a2d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1010_c7_9a2d]
signal n8_MUX_uxn_opcodes_h_l1010_c7_9a2d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1010_c7_9a2d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1010_c7_9a2d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1014_c32_76cd]
signal BIN_OP_AND_uxn_opcodes_h_l1014_c32_76cd_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1014_c32_76cd_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1014_c32_76cd_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1014_c32_eb66]
signal BIN_OP_GT_uxn_opcodes_h_l1014_c32_eb66_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1014_c32_eb66_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1014_c32_eb66_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1014_c32_373f]
signal MUX_uxn_opcodes_h_l1014_c32_373f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1014_c32_373f_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1014_c32_373f_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1014_c32_373f_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1016_c11_4bc8]
signal BIN_OP_EQ_uxn_opcodes_h_l1016_c11_4bc8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1016_c11_4bc8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1016_c11_4bc8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1016_c7_59f5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_59f5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_59f5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_59f5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_59f5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1016_c7_59f5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_59f5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_59f5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_59f5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_59f5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1016_c7_59f5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_59f5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_59f5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_59f5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_59f5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1016_c7_59f5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_59f5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_59f5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_59f5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_59f5_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1016_c7_59f5]
signal result_stack_value_MUX_uxn_opcodes_h_l1016_c7_59f5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1016_c7_59f5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1016_c7_59f5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1016_c7_59f5_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1020_c24_68f5]
signal BIN_OP_AND_uxn_opcodes_h_l1020_c24_68f5_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1020_c24_68f5_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1020_c24_68f5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1022_c11_d062]
signal BIN_OP_EQ_uxn_opcodes_h_l1022_c11_d062_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1022_c11_d062_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1022_c11_d062_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1022_c7_7163]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7163_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7163_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7163_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7163_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1022_c7_7163]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7163_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7163_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7163_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7163_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l994_c6_4eca
BIN_OP_EQ_uxn_opcodes_h_l994_c6_4eca : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l994_c6_4eca_left,
BIN_OP_EQ_uxn_opcodes_h_l994_c6_4eca_right,
BIN_OP_EQ_uxn_opcodes_h_l994_c6_4eca_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l994_c1_7098
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l994_c1_7098 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l994_c1_7098_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l994_c1_7098_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l994_c1_7098_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l994_c1_7098_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l994_c2_a8bc
result_is_sp_shift_MUX_uxn_opcodes_h_l994_c2_a8bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l994_c2_a8bc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l994_c2_a8bc
result_is_stack_read_MUX_uxn_opcodes_h_l994_c2_a8bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l994_c2_a8bc_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c2_a8bc
result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c2_a8bc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c2_a8bc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l994_c2_a8bc
result_is_stack_write_MUX_uxn_opcodes_h_l994_c2_a8bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l994_c2_a8bc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c2_a8bc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c2_a8bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c2_a8bc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l994_c2_a8bc
result_is_opc_done_MUX_uxn_opcodes_h_l994_c2_a8bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l994_c2_a8bc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l994_c2_a8bc
result_stack_value_MUX_uxn_opcodes_h_l994_c2_a8bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l994_c2_a8bc_cond,
result_stack_value_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output);

-- t8_MUX_uxn_opcodes_h_l994_c2_a8bc
t8_MUX_uxn_opcodes_h_l994_c2_a8bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l994_c2_a8bc_cond,
t8_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue,
t8_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse,
t8_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output);

-- n8_MUX_uxn_opcodes_h_l994_c2_a8bc
n8_MUX_uxn_opcodes_h_l994_c2_a8bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l994_c2_a8bc_cond,
n8_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue,
n8_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse,
n8_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output);

-- printf_uxn_opcodes_h_l995_c3_847e_uxn_opcodes_h_l995_c3_847e
printf_uxn_opcodes_h_l995_c3_847e_uxn_opcodes_h_l995_c3_847e : entity work.printf_uxn_opcodes_h_l995_c3_847e_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l995_c3_847e_uxn_opcodes_h_l995_c3_847e_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1000_c11_d4ae
BIN_OP_EQ_uxn_opcodes_h_l1000_c11_d4ae : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1000_c11_d4ae_left,
BIN_OP_EQ_uxn_opcodes_h_l1000_c11_d4ae_right,
BIN_OP_EQ_uxn_opcodes_h_l1000_c11_d4ae_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b
result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_ec9b
result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_ec9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_ec9b
result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_ec9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_ec9b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_ec9b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_ec9b
result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_ec9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1000_c7_ec9b
result_stack_value_MUX_uxn_opcodes_h_l1000_c7_ec9b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output);

-- t8_MUX_uxn_opcodes_h_l1000_c7_ec9b
t8_MUX_uxn_opcodes_h_l1000_c7_ec9b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond,
t8_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue,
t8_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse,
t8_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output);

-- n8_MUX_uxn_opcodes_h_l1000_c7_ec9b
n8_MUX_uxn_opcodes_h_l1000_c7_ec9b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond,
n8_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue,
n8_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse,
n8_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1003_c11_3d78
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_3d78 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_3d78_left,
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_3d78_right,
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_3d78_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_1d53
result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_1d53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_1d53_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_1d53
result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_1d53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_1d53_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_1d53
result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_1d53 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_1d53_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_1d53
result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_1d53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_1d53_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_1d53
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_1d53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_1d53_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_1d53
result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_1d53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_1d53_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1003_c7_1d53
result_stack_value_MUX_uxn_opcodes_h_l1003_c7_1d53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1003_c7_1d53_cond,
result_stack_value_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output);

-- t8_MUX_uxn_opcodes_h_l1003_c7_1d53
t8_MUX_uxn_opcodes_h_l1003_c7_1d53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1003_c7_1d53_cond,
t8_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue,
t8_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse,
t8_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output);

-- n8_MUX_uxn_opcodes_h_l1003_c7_1d53
n8_MUX_uxn_opcodes_h_l1003_c7_1d53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1003_c7_1d53_cond,
n8_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue,
n8_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse,
n8_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1007_c11_c0f7
BIN_OP_EQ_uxn_opcodes_h_l1007_c11_c0f7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1007_c11_c0f7_left,
BIN_OP_EQ_uxn_opcodes_h_l1007_c11_c0f7_right,
BIN_OP_EQ_uxn_opcodes_h_l1007_c11_c0f7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_7182
result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_7182 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_7182_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_7182_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_7182_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_7182_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_7182
result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_7182 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_7182_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_7182_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_7182_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_7182_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_7182
result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_7182 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_7182_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_7182_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_7182_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_7182_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_7182
result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_7182 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_7182_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_7182_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_7182_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_7182_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_7182
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_7182 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_7182_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_7182_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_7182_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_7182_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_7182
result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_7182 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_7182_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_7182_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_7182_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_7182_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1007_c7_7182
result_stack_value_MUX_uxn_opcodes_h_l1007_c7_7182 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1007_c7_7182_cond,
result_stack_value_MUX_uxn_opcodes_h_l1007_c7_7182_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1007_c7_7182_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1007_c7_7182_return_output);

-- n8_MUX_uxn_opcodes_h_l1007_c7_7182
n8_MUX_uxn_opcodes_h_l1007_c7_7182 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1007_c7_7182_cond,
n8_MUX_uxn_opcodes_h_l1007_c7_7182_iftrue,
n8_MUX_uxn_opcodes_h_l1007_c7_7182_iffalse,
n8_MUX_uxn_opcodes_h_l1007_c7_7182_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1010_c11_12d1
BIN_OP_EQ_uxn_opcodes_h_l1010_c11_12d1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1010_c11_12d1_left,
BIN_OP_EQ_uxn_opcodes_h_l1010_c11_12d1_right,
BIN_OP_EQ_uxn_opcodes_h_l1010_c11_12d1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d
result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_9a2d
result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_9a2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_9a2d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_9a2d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_9a2d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_9a2d
result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_9a2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_9a2d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_9a2d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_9a2d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_9a2d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_9a2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_9a2d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_9a2d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_9a2d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_9a2d
result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_9a2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_9a2d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_9a2d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_9a2d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1010_c7_9a2d
result_stack_value_MUX_uxn_opcodes_h_l1010_c7_9a2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1010_c7_9a2d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1010_c7_9a2d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1010_c7_9a2d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output);

-- n8_MUX_uxn_opcodes_h_l1010_c7_9a2d
n8_MUX_uxn_opcodes_h_l1010_c7_9a2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1010_c7_9a2d_cond,
n8_MUX_uxn_opcodes_h_l1010_c7_9a2d_iftrue,
n8_MUX_uxn_opcodes_h_l1010_c7_9a2d_iffalse,
n8_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1014_c32_76cd
BIN_OP_AND_uxn_opcodes_h_l1014_c32_76cd : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1014_c32_76cd_left,
BIN_OP_AND_uxn_opcodes_h_l1014_c32_76cd_right,
BIN_OP_AND_uxn_opcodes_h_l1014_c32_76cd_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1014_c32_eb66
BIN_OP_GT_uxn_opcodes_h_l1014_c32_eb66 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1014_c32_eb66_left,
BIN_OP_GT_uxn_opcodes_h_l1014_c32_eb66_right,
BIN_OP_GT_uxn_opcodes_h_l1014_c32_eb66_return_output);

-- MUX_uxn_opcodes_h_l1014_c32_373f
MUX_uxn_opcodes_h_l1014_c32_373f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1014_c32_373f_cond,
MUX_uxn_opcodes_h_l1014_c32_373f_iftrue,
MUX_uxn_opcodes_h_l1014_c32_373f_iffalse,
MUX_uxn_opcodes_h_l1014_c32_373f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1016_c11_4bc8
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_4bc8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_4bc8_left,
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_4bc8_right,
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_4bc8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_59f5
result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_59f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_59f5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_59f5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_59f5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_59f5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_59f5
result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_59f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_59f5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_59f5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_59f5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_59f5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_59f5
result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_59f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_59f5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_59f5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_59f5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_59f5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_59f5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_59f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_59f5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_59f5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_59f5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_59f5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1016_c7_59f5
result_stack_value_MUX_uxn_opcodes_h_l1016_c7_59f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1016_c7_59f5_cond,
result_stack_value_MUX_uxn_opcodes_h_l1016_c7_59f5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1016_c7_59f5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1016_c7_59f5_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1020_c24_68f5
BIN_OP_AND_uxn_opcodes_h_l1020_c24_68f5 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1020_c24_68f5_left,
BIN_OP_AND_uxn_opcodes_h_l1020_c24_68f5_right,
BIN_OP_AND_uxn_opcodes_h_l1020_c24_68f5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1022_c11_d062
BIN_OP_EQ_uxn_opcodes_h_l1022_c11_d062 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1022_c11_d062_left,
BIN_OP_EQ_uxn_opcodes_h_l1022_c11_d062_right,
BIN_OP_EQ_uxn_opcodes_h_l1022_c11_d062_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7163
result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7163 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7163_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7163_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7163_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7163_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7163
result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7163 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7163_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7163_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7163_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7163_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l994_c6_4eca_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l994_c1_7098_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output,
 t8_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output,
 n8_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1000_c11_d4ae_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output,
 t8_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output,
 n8_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1003_c11_3d78_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output,
 t8_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output,
 n8_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1007_c11_c0f7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_7182_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_7182_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_7182_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_7182_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_7182_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_7182_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1007_c7_7182_return_output,
 n8_MUX_uxn_opcodes_h_l1007_c7_7182_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1010_c11_12d1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output,
 n8_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1014_c32_76cd_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1014_c32_eb66_return_output,
 MUX_uxn_opcodes_h_l1014_c32_373f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1016_c11_4bc8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_59f5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_59f5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_59f5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_59f5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1016_c7_59f5_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1020_c24_68f5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1022_c11_d062_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7163_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7163_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c6_4eca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c6_4eca_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c6_4eca_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l994_c1_7098_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l994_c1_7098_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l994_c1_7098_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l994_c1_7098_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l994_c2_a8bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l994_c2_a8bc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c2_a8bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l994_c2_a8bc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l997_c3_dd6d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c2_a8bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l994_c2_a8bc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l994_c2_a8bc_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l994_c2_a8bc_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l994_c2_a8bc_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l995_c3_847e_uxn_opcodes_h_l995_c3_847e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c11_d4ae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c11_d4ae_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c11_d4ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1001_c3_ec30 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_3d78_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_3d78_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_3d78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_7182_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_1d53_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_7182_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_1d53_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_7182_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_1d53_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_7182_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_1d53_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1005_c3_4d6a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_7182_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_1d53_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_7182_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_1d53_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1007_c7_7182_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1003_c7_1d53_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1003_c7_1d53_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1007_c7_7182_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1003_c7_1d53_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_c0f7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_c0f7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_c0f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_7182_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_7182_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_7182_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_7182_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_7182_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_7182_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_7182_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_7182_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_7182_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_7182_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_7182_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_7182_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_7182_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1008_c3_3882 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_7182_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_7182_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_7182_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_7182_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_7182_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1007_c7_7182_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1007_c7_7182_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1007_c7_7182_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1007_c7_7182_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1007_c7_7182_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1007_c7_7182_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_12d1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_12d1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_12d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_59f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_9a2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_9a2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_9a2d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_9a2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_9a2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_59f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_9a2d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_9a2d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_9a2d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_59f5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_9a2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_9a2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_9a2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_59f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_9a2d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1010_c7_9a2d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1010_c7_9a2d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_59f5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1010_c7_9a2d_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1010_c7_9a2d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1010_c7_9a2d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1010_c7_9a2d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1014_c32_373f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1014_c32_373f_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1014_c32_373f_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1014_c32_76cd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1014_c32_76cd_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1014_c32_76cd_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1014_c32_eb66_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1014_c32_eb66_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1014_c32_eb66_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1014_c32_373f_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_4bc8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_4bc8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_4bc8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_59f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_59f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_59f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_59f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_59f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7163_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_59f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_59f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_59f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7163_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_59f5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_59f5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1019_c3_c494 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_59f5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_59f5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_59f5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_59f5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_59f5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1020_c24_68f5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1020_c24_68f5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1020_c24_68f5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_d062_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_d062_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_d062_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7163_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7163_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7163_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7163_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7163_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7163_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1007_l1003_l1000_l994_l1016_DUPLICATE_d351_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1007_l1003_l1000_l994_l1010_DUPLICATE_f9e3_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1007_l1003_l1000_l994_l1022_l1010_DUPLICATE_cffd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1007_l1003_l1000_l994_l1016_l1010_DUPLICATE_c3d0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1003_l1007_l1000_l1010_DUPLICATE_edc3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1007_l1003_l1000_l1022_l1016_l1010_DUPLICATE_4241_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1016_l1010_DUPLICATE_4d2c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1027_l990_DUPLICATE_76b9_return_output : opcode_result_t;
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
     VAR_MUX_uxn_opcodes_h_l1014_c32_373f_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c11_d4ae_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l997_c3_dd6d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l997_c3_dd6d;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7163_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_4bc8_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_c0f7_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1001_c3_ec30 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1001_c3_ec30;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_59f5_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1008_c3_3882 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_7182_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1008_c3_3882;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_9a2d_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_d062_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_12d1_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c6_4eca_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1019_c3_c494 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_59f5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1019_c3_c494;
     VAR_MUX_uxn_opcodes_h_l1014_c32_373f_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_59f5_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1014_c32_76cd_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_3d78_right := to_unsigned(2, 2);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1014_c32_eb66_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7163_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1005_c3_4d6a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1005_c3_4d6a;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l994_c1_7098_iffalse := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l994_c1_7098_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1014_c32_76cd_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1020_c24_68f5_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1007_c7_7182_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1010_c7_9a2d_iffalse := n8;
     VAR_n8_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c11_d4ae_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_3d78_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_c0f7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_12d1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_4bc8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_d062_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c6_4eca_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1010_c7_9a2d_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1020_c24_68f5_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1003_l1007_l1000_l1010_DUPLICATE_edc3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1003_l1007_l1000_l1010_DUPLICATE_edc3_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1010_c11_12d1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1010_c11_12d1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_12d1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1010_c11_12d1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_12d1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_12d1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1010_c11_12d1_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1020_c24_68f5] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1020_c24_68f5_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1020_c24_68f5_left;
     BIN_OP_AND_uxn_opcodes_h_l1020_c24_68f5_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1020_c24_68f5_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1020_c24_68f5_return_output := BIN_OP_AND_uxn_opcodes_h_l1020_c24_68f5_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1007_l1003_l1000_l994_l1016_l1010_DUPLICATE_c3d0 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1007_l1003_l1000_l994_l1016_l1010_DUPLICATE_c3d0_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1003_c11_3d78] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1003_c11_3d78_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_3d78_left;
     BIN_OP_EQ_uxn_opcodes_h_l1003_c11_3d78_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_3d78_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_3d78_return_output := BIN_OP_EQ_uxn_opcodes_h_l1003_c11_3d78_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1016_c11_4bc8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1016_c11_4bc8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_4bc8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1016_c11_4bc8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_4bc8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_4bc8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1016_c11_4bc8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1000_c11_d4ae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1000_c11_d4ae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c11_d4ae_left;
     BIN_OP_EQ_uxn_opcodes_h_l1000_c11_d4ae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c11_d4ae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c11_d4ae_return_output := BIN_OP_EQ_uxn_opcodes_h_l1000_c11_d4ae_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1007_l1003_l1000_l1022_l1016_l1010_DUPLICATE_4241 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1007_l1003_l1000_l1022_l1016_l1010_DUPLICATE_4241_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1022_c11_d062] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1022_c11_d062_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_d062_left;
     BIN_OP_EQ_uxn_opcodes_h_l1022_c11_d062_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_d062_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_d062_return_output := BIN_OP_EQ_uxn_opcodes_h_l1022_c11_d062_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1007_l1003_l1000_l994_l1010_DUPLICATE_f9e3 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1007_l1003_l1000_l994_l1010_DUPLICATE_f9e3_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1016_l1010_DUPLICATE_4d2c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1016_l1010_DUPLICATE_4d2c_return_output := result.stack_address_sp_offset;

     -- BIN_OP_AND[uxn_opcodes_h_l1014_c32_76cd] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1014_c32_76cd_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1014_c32_76cd_left;
     BIN_OP_AND_uxn_opcodes_h_l1014_c32_76cd_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1014_c32_76cd_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1014_c32_76cd_return_output := BIN_OP_AND_uxn_opcodes_h_l1014_c32_76cd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1007_c11_c0f7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1007_c11_c0f7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_c0f7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1007_c11_c0f7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_c0f7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_c0f7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1007_c11_c0f7_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1007_l1003_l1000_l994_l1016_DUPLICATE_d351 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1007_l1003_l1000_l994_l1016_DUPLICATE_d351_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1007_l1003_l1000_l994_l1022_l1010_DUPLICATE_cffd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1007_l1003_l1000_l994_l1022_l1010_DUPLICATE_cffd_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l994_c6_4eca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l994_c6_4eca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c6_4eca_left;
     BIN_OP_EQ_uxn_opcodes_h_l994_c6_4eca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c6_4eca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c6_4eca_return_output := BIN_OP_EQ_uxn_opcodes_h_l994_c6_4eca_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1014_c32_eb66_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1014_c32_76cd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_59f5_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l1020_c24_68f5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c11_d4ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c11_d4ae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c11_d4ae_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c11_d4ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c11_d4ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c11_d4ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c11_d4ae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c11_d4ae_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c11_d4ae_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1003_c7_1d53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_3d78_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_1d53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_3d78_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_1d53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_3d78_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_1d53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_3d78_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_1d53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_3d78_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_1d53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_3d78_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_1d53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_3d78_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1003_c7_1d53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_3d78_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1003_c7_1d53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_3d78_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1007_c7_7182_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_c0f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_7182_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_c0f7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_7182_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_c0f7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_7182_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_c0f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_7182_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_c0f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_7182_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_c0f7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_7182_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_c0f7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1007_c7_7182_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_c0f7_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1010_c7_9a2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_12d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_9a2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_12d1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_12d1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_9a2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_12d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_9a2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_12d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_12d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_9a2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_12d1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1010_c7_9a2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_12d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_59f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_4bc8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_59f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_4bc8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_59f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_4bc8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_59f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_4bc8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_59f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_4bc8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7163_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_d062_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7163_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_d062_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l994_c1_7098_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c6_4eca_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l994_c2_a8bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c6_4eca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l994_c2_a8bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c6_4eca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l994_c2_a8bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c6_4eca_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l994_c2_a8bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c6_4eca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l994_c2_a8bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c6_4eca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c2_a8bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c6_4eca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c2_a8bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c6_4eca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l994_c2_a8bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c6_4eca_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l994_c2_a8bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c6_4eca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1007_l1003_l1000_l994_l1010_DUPLICATE_f9e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1007_l1003_l1000_l994_l1010_DUPLICATE_f9e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_7182_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1007_l1003_l1000_l994_l1010_DUPLICATE_f9e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1007_l1003_l1000_l994_l1010_DUPLICATE_f9e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1007_l1003_l1000_l994_l1010_DUPLICATE_f9e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1007_l1003_l1000_l1022_l1016_l1010_DUPLICATE_4241_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1007_l1003_l1000_l1022_l1016_l1010_DUPLICATE_4241_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_7182_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1007_l1003_l1000_l1022_l1016_l1010_DUPLICATE_4241_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_9a2d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1007_l1003_l1000_l1022_l1016_l1010_DUPLICATE_4241_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_59f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1007_l1003_l1000_l1022_l1016_l1010_DUPLICATE_4241_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7163_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1007_l1003_l1000_l1022_l1016_l1010_DUPLICATE_4241_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1007_l1003_l1000_l994_l1016_DUPLICATE_d351_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1007_l1003_l1000_l994_l1016_DUPLICATE_d351_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_7182_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1007_l1003_l1000_l994_l1016_DUPLICATE_d351_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_59f5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1007_l1003_l1000_l994_l1016_DUPLICATE_d351_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1007_l1003_l1000_l994_l1016_DUPLICATE_d351_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1003_l1007_l1000_l1010_DUPLICATE_edc3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1003_l1007_l1000_l1010_DUPLICATE_edc3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_7182_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1003_l1007_l1000_l1010_DUPLICATE_edc3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_9a2d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1003_l1007_l1000_l1010_DUPLICATE_edc3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1007_l1003_l1000_l994_l1022_l1010_DUPLICATE_cffd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1007_l1003_l1000_l994_l1022_l1010_DUPLICATE_cffd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_7182_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1007_l1003_l1000_l994_l1022_l1010_DUPLICATE_cffd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_9a2d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1007_l1003_l1000_l994_l1022_l1010_DUPLICATE_cffd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7163_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1007_l1003_l1000_l994_l1022_l1010_DUPLICATE_cffd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1007_l1003_l1000_l994_l1022_l1010_DUPLICATE_cffd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_9a2d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1016_l1010_DUPLICATE_4d2c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_59f5_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1016_l1010_DUPLICATE_4d2c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1007_l1003_l1000_l994_l1016_l1010_DUPLICATE_c3d0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1007_l1003_l1000_l994_l1016_l1010_DUPLICATE_c3d0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1007_c7_7182_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1007_l1003_l1000_l994_l1016_l1010_DUPLICATE_c3d0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1010_c7_9a2d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1007_l1003_l1000_l994_l1016_l1010_DUPLICATE_c3d0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_59f5_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1007_l1003_l1000_l994_l1016_l1010_DUPLICATE_c3d0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1007_l1003_l1000_l994_l1016_l1010_DUPLICATE_c3d0_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1022_c7_7163] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7163_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7163_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7163_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7163_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7163_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7163_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7163_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7163_return_output;

     -- t8_MUX[uxn_opcodes_h_l1003_c7_1d53] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1003_c7_1d53_cond <= VAR_t8_MUX_uxn_opcodes_h_l1003_c7_1d53_cond;
     t8_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue;
     t8_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output := t8_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l994_c1_7098] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l994_c1_7098_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l994_c1_7098_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l994_c1_7098_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l994_c1_7098_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l994_c1_7098_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l994_c1_7098_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l994_c1_7098_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l994_c1_7098_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1016_c7_59f5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_59f5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_59f5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_59f5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_59f5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_59f5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_59f5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_59f5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_59f5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1010_c7_9a2d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_9a2d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_9a2d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_9a2d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_9a2d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_9a2d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_9a2d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1016_c7_59f5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1016_c7_59f5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_59f5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1016_c7_59f5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_59f5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1016_c7_59f5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_59f5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_59f5_return_output := result_stack_value_MUX_uxn_opcodes_h_l1016_c7_59f5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1016_c7_59f5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_59f5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_59f5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_59f5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_59f5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_59f5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_59f5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_59f5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_59f5_return_output;

     -- n8_MUX[uxn_opcodes_h_l1010_c7_9a2d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1010_c7_9a2d_cond <= VAR_n8_MUX_uxn_opcodes_h_l1010_c7_9a2d_cond;
     n8_MUX_uxn_opcodes_h_l1010_c7_9a2d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1010_c7_9a2d_iftrue;
     n8_MUX_uxn_opcodes_h_l1010_c7_9a2d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1010_c7_9a2d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output := n8_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1014_c32_eb66] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1014_c32_eb66_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1014_c32_eb66_left;
     BIN_OP_GT_uxn_opcodes_h_l1014_c32_eb66_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1014_c32_eb66_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1014_c32_eb66_return_output := BIN_OP_GT_uxn_opcodes_h_l1014_c32_eb66_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1022_c7_7163] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7163_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7163_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7163_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7163_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7163_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7163_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7163_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7163_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1014_c32_373f_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1014_c32_eb66_return_output;
     VAR_printf_uxn_opcodes_h_l995_c3_847e_uxn_opcodes_h_l995_c3_847e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l994_c1_7098_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1007_c7_7182_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_59f5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1022_c7_7163_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_59f5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_7182_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_59f5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1022_c7_7163_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_9a2d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_59f5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1010_c7_9a2d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_59f5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output;
     -- printf_uxn_opcodes_h_l995_c3_847e[uxn_opcodes_h_l995_c3_847e] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l995_c3_847e_uxn_opcodes_h_l995_c3_847e_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l995_c3_847e_uxn_opcodes_h_l995_c3_847e_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1007_c7_7182] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_7182_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_7182_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_7182_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_7182_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_7182_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_7182_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_7182_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_7182_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1010_c7_9a2d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1010_c7_9a2d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1010_c7_9a2d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1010_c7_9a2d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1010_c7_9a2d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1010_c7_9a2d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1010_c7_9a2d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1010_c7_9a2d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1010_c7_9a2d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_9a2d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_9a2d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_9a2d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_9a2d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_9a2d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_9a2d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output;

     -- n8_MUX[uxn_opcodes_h_l1007_c7_7182] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1007_c7_7182_cond <= VAR_n8_MUX_uxn_opcodes_h_l1007_c7_7182_cond;
     n8_MUX_uxn_opcodes_h_l1007_c7_7182_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1007_c7_7182_iftrue;
     n8_MUX_uxn_opcodes_h_l1007_c7_7182_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1007_c7_7182_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1007_c7_7182_return_output := n8_MUX_uxn_opcodes_h_l1007_c7_7182_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1016_c7_59f5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_59f5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_59f5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_59f5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_59f5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_59f5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_59f5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_59f5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_59f5_return_output;

     -- MUX[uxn_opcodes_h_l1014_c32_373f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1014_c32_373f_cond <= VAR_MUX_uxn_opcodes_h_l1014_c32_373f_cond;
     MUX_uxn_opcodes_h_l1014_c32_373f_iftrue <= VAR_MUX_uxn_opcodes_h_l1014_c32_373f_iftrue;
     MUX_uxn_opcodes_h_l1014_c32_373f_iffalse <= VAR_MUX_uxn_opcodes_h_l1014_c32_373f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1014_c32_373f_return_output := MUX_uxn_opcodes_h_l1014_c32_373f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1016_c7_59f5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_59f5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_59f5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_59f5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_59f5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_59f5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_59f5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_59f5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_59f5_return_output;

     -- t8_MUX[uxn_opcodes_h_l1000_c7_ec9b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond <= VAR_t8_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond;
     t8_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue;
     t8_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output := t8_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d_iftrue := VAR_MUX_uxn_opcodes_h_l1014_c32_373f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1007_c7_7182_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_9a2d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_59f5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_7182_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1007_c7_7182_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_9a2d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_59f5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_7182_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1007_c7_7182_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1007_c7_7182] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_7182_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_7182_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_7182_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_7182_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_7182_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_7182_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_7182_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_7182_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1007_c7_7182] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_7182_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_7182_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_7182_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_7182_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_7182_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_7182_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_7182_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_7182_return_output;

     -- n8_MUX[uxn_opcodes_h_l1003_c7_1d53] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1003_c7_1d53_cond <= VAR_n8_MUX_uxn_opcodes_h_l1003_c7_1d53_cond;
     n8_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue;
     n8_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output := n8_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1010_c7_9a2d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_9a2d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_9a2d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_9a2d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_9a2d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_9a2d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_9a2d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1003_c7_1d53] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_1d53_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_1d53_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1010_c7_9a2d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_9a2d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_9a2d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_9a2d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_9a2d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_9a2d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_9a2d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1007_c7_7182] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1007_c7_7182_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1007_c7_7182_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1007_c7_7182_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1007_c7_7182_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1007_c7_7182_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1007_c7_7182_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1007_c7_7182_return_output := result_stack_value_MUX_uxn_opcodes_h_l1007_c7_7182_return_output;

     -- t8_MUX[uxn_opcodes_h_l994_c2_a8bc] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l994_c2_a8bc_cond <= VAR_t8_MUX_uxn_opcodes_h_l994_c2_a8bc_cond;
     t8_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue;
     t8_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output := t8_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1010_c7_9a2d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_7182_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1007_c7_7182_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_7182_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_7182_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1010_c7_9a2d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1007_c7_7182_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1007_c7_7182_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output;
     -- n8_MUX[uxn_opcodes_h_l1000_c7_ec9b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond <= VAR_n8_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond;
     n8_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue;
     n8_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output := n8_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1003_c7_1d53] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_1d53_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_1d53_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1003_c7_1d53] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1003_c7_1d53_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1003_c7_1d53_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output := result_stack_value_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1000_c7_ec9b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1007_c7_7182] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_7182_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_7182_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_7182_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_7182_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_7182_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_7182_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_7182_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_7182_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1007_c7_7182] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_7182_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_7182_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_7182_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_7182_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_7182_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_7182_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_7182_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_7182_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1003_c7_1d53] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_1d53_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_1d53_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1007_c7_7182] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_7182_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_7182_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_7182_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_7182_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_7182_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_7182_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_7182_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_7182_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1007_c7_7182_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1007_c7_7182_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1007_c7_7182_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l994_c2_a8bc] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l994_c2_a8bc_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l994_c2_a8bc_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1003_c7_1d53] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_1d53_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_1d53_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1003_c7_1d53] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_1d53_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_1d53_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1000_c7_ec9b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1000_c7_ec9b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output;

     -- n8_MUX[uxn_opcodes_h_l994_c2_a8bc] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l994_c2_a8bc_cond <= VAR_n8_MUX_uxn_opcodes_h_l994_c2_a8bc_cond;
     n8_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue;
     n8_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output := n8_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1000_c7_ec9b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1003_c7_1d53] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_1d53_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_1d53_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_1d53_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_1d53_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_1d53_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1000_c7_ec9b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1000_c7_ec9b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1000_c7_ec9b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_ec9b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_ec9b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_ec9b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l994_c2_a8bc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l994_c2_a8bc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l994_c2_a8bc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output := result_stack_value_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l994_c2_a8bc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l994_c2_a8bc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l994_c2_a8bc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l994_c2_a8bc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c2_a8bc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c2_a8bc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_ec9b_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l994_c2_a8bc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l994_c2_a8bc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l994_c2_a8bc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l994_c2_a8bc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c2_a8bc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c2_a8bc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l994_c2_a8bc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l994_c2_a8bc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l994_c2_a8bc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l994_c2_a8bc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l994_c2_a8bc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1027_l990_DUPLICATE_76b9 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1027_l990_DUPLICATE_76b9_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1ade(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l994_c2_a8bc_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1027_l990_DUPLICATE_76b9_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1027_l990_DUPLICATE_76b9_return_output;
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
