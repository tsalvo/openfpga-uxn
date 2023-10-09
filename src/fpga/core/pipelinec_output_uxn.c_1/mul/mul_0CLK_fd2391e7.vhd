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
-- BIN_OP_EQ[uxn_opcodes_h_l2247_c6_4ad3]
signal BIN_OP_EQ_uxn_opcodes_h_l2247_c6_4ad3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2247_c6_4ad3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2247_c6_4ad3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2247_c1_2b79]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2247_c1_2b79_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2247_c1_2b79_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2247_c1_2b79_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2247_c1_2b79_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2247_c2_c496]
signal t8_MUX_uxn_opcodes_h_l2247_c2_c496_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2247_c2_c496_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2247_c2_c496]
signal n8_MUX_uxn_opcodes_h_l2247_c2_c496_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2247_c2_c496_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2247_c2_c496]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2247_c2_c496_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2247_c2_c496_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2247_c2_c496]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c2_c496_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c2_c496_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2247_c2_c496]
signal result_stack_value_MUX_uxn_opcodes_h_l2247_c2_c496_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2247_c2_c496_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2247_c2_c496]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c2_c496_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c2_c496_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2247_c2_c496]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2247_c2_c496_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2247_c2_c496_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2247_c2_c496]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2247_c2_c496_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2247_c2_c496_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2247_c2_c496]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c2_c496_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c2_c496_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l2248_c3_e70b[uxn_opcodes_h_l2248_c3_e70b]
signal printf_uxn_opcodes_h_l2248_c3_e70b_uxn_opcodes_h_l2248_c3_e70b_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2253_c11_3016]
signal BIN_OP_EQ_uxn_opcodes_h_l2253_c11_3016_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2253_c11_3016_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2253_c11_3016_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2253_c7_a0ef]
signal t8_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2253_c7_a0ef]
signal n8_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2253_c7_a0ef]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2253_c7_a0ef]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2253_c7_a0ef]
signal result_stack_value_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2253_c7_a0ef]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2253_c7_a0ef]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2253_c7_a0ef]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2253_c7_a0ef]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2256_c11_2df3]
signal BIN_OP_EQ_uxn_opcodes_h_l2256_c11_2df3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2256_c11_2df3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2256_c11_2df3_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2256_c7_2177]
signal t8_MUX_uxn_opcodes_h_l2256_c7_2177_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2256_c7_2177_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2256_c7_2177]
signal n8_MUX_uxn_opcodes_h_l2256_c7_2177_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2256_c7_2177_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2256_c7_2177]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2256_c7_2177_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2256_c7_2177_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2256_c7_2177]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2256_c7_2177_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2256_c7_2177_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2256_c7_2177]
signal result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2177_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2177_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2256_c7_2177]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2177_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2177_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2256_c7_2177]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2177_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2177_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2256_c7_2177]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2177_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2177_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2256_c7_2177]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2177_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2177_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2260_c11_b2dd]
signal BIN_OP_EQ_uxn_opcodes_h_l2260_c11_b2dd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2260_c11_b2dd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2260_c11_b2dd_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2260_c7_e35d]
signal n8_MUX_uxn_opcodes_h_l2260_c7_e35d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2260_c7_e35d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2260_c7_e35d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2260_c7_e35d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_e35d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_e35d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_e35d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2260_c7_e35d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_e35d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_e35d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_e35d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2260_c7_e35d]
signal result_stack_value_MUX_uxn_opcodes_h_l2260_c7_e35d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2260_c7_e35d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2260_c7_e35d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2260_c7_e35d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_e35d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_e35d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_e35d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2260_c7_e35d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_e35d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_e35d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_e35d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2260_c7_e35d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_e35d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_e35d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_e35d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2260_c7_e35d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_e35d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_e35d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_e35d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2263_c11_f87d]
signal BIN_OP_EQ_uxn_opcodes_h_l2263_c11_f87d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2263_c11_f87d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2263_c11_f87d_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2263_c7_2634]
signal n8_MUX_uxn_opcodes_h_l2263_c7_2634_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2263_c7_2634_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2263_c7_2634_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2263_c7_2634_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2263_c7_2634]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_2634_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_2634_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_2634_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_2634_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2263_c7_2634]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_2634_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_2634_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_2634_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_2634_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2263_c7_2634]
signal result_stack_value_MUX_uxn_opcodes_h_l2263_c7_2634_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2263_c7_2634_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2263_c7_2634_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2263_c7_2634_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2263_c7_2634]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_2634_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_2634_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_2634_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_2634_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2263_c7_2634]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_2634_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_2634_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_2634_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_2634_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2263_c7_2634]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_2634_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_2634_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_2634_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_2634_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2263_c7_2634]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_2634_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_2634_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_2634_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_2634_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2267_c32_a917]
signal BIN_OP_AND_uxn_opcodes_h_l2267_c32_a917_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2267_c32_a917_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2267_c32_a917_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2267_c32_c37f]
signal BIN_OP_GT_uxn_opcodes_h_l2267_c32_c37f_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2267_c32_c37f_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2267_c32_c37f_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2267_c32_765b]
signal MUX_uxn_opcodes_h_l2267_c32_765b_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2267_c32_765b_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2267_c32_765b_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2267_c32_765b_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2269_c11_a54d]
signal BIN_OP_EQ_uxn_opcodes_h_l2269_c11_a54d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2269_c11_a54d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2269_c11_a54d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2269_c7_431c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_431c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_431c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_431c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_431c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2269_c7_431c]
signal result_stack_value_MUX_uxn_opcodes_h_l2269_c7_431c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2269_c7_431c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2269_c7_431c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2269_c7_431c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2269_c7_431c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_431c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_431c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_431c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_431c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2269_c7_431c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_431c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_431c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_431c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_431c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2269_c7_431c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_431c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_431c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_431c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_431c_return_output : unsigned(7 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2273_c24_06c4]
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2273_c24_06c4_left : unsigned(7 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2273_c24_06c4_right : unsigned(7 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2273_c24_06c4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2275_c11_d4f2]
signal BIN_OP_EQ_uxn_opcodes_h_l2275_c11_d4f2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2275_c11_d4f2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2275_c11_d4f2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2275_c7_10c9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_10c9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_10c9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_10c9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_10c9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2275_c7_10c9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_10c9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_10c9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_10c9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_10c9_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2247_c6_4ad3
BIN_OP_EQ_uxn_opcodes_h_l2247_c6_4ad3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2247_c6_4ad3_left,
BIN_OP_EQ_uxn_opcodes_h_l2247_c6_4ad3_right,
BIN_OP_EQ_uxn_opcodes_h_l2247_c6_4ad3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2247_c1_2b79
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2247_c1_2b79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2247_c1_2b79_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2247_c1_2b79_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2247_c1_2b79_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2247_c1_2b79_return_output);

-- t8_MUX_uxn_opcodes_h_l2247_c2_c496
t8_MUX_uxn_opcodes_h_l2247_c2_c496 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2247_c2_c496_cond,
t8_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue,
t8_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse,
t8_MUX_uxn_opcodes_h_l2247_c2_c496_return_output);

-- n8_MUX_uxn_opcodes_h_l2247_c2_c496
n8_MUX_uxn_opcodes_h_l2247_c2_c496 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2247_c2_c496_cond,
n8_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue,
n8_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse,
n8_MUX_uxn_opcodes_h_l2247_c2_c496_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2247_c2_c496
result_is_stack_read_MUX_uxn_opcodes_h_l2247_c2_c496 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2247_c2_c496_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2247_c2_c496_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c2_c496
result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c2_c496 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c2_c496_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c2_c496_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2247_c2_c496
result_stack_value_MUX_uxn_opcodes_h_l2247_c2_c496 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2247_c2_c496_cond,
result_stack_value_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2247_c2_c496_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c2_c496
result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c2_c496 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c2_c496_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c2_c496_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2247_c2_c496
result_is_stack_write_MUX_uxn_opcodes_h_l2247_c2_c496 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2247_c2_c496_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2247_c2_c496_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2247_c2_c496
result_is_opc_done_MUX_uxn_opcodes_h_l2247_c2_c496 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2247_c2_c496_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2247_c2_c496_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c2_c496
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c2_c496 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c2_c496_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c2_c496_return_output);

-- printf_uxn_opcodes_h_l2248_c3_e70b_uxn_opcodes_h_l2248_c3_e70b
printf_uxn_opcodes_h_l2248_c3_e70b_uxn_opcodes_h_l2248_c3_e70b : entity work.printf_uxn_opcodes_h_l2248_c3_e70b_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2248_c3_e70b_uxn_opcodes_h_l2248_c3_e70b_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2253_c11_3016
BIN_OP_EQ_uxn_opcodes_h_l2253_c11_3016 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2253_c11_3016_left,
BIN_OP_EQ_uxn_opcodes_h_l2253_c11_3016_right,
BIN_OP_EQ_uxn_opcodes_h_l2253_c11_3016_return_output);

-- t8_MUX_uxn_opcodes_h_l2253_c7_a0ef
t8_MUX_uxn_opcodes_h_l2253_c7_a0ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond,
t8_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue,
t8_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse,
t8_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output);

-- n8_MUX_uxn_opcodes_h_l2253_c7_a0ef
n8_MUX_uxn_opcodes_h_l2253_c7_a0ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond,
n8_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue,
n8_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse,
n8_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_a0ef
result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_a0ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef
result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2253_c7_a0ef
result_stack_value_MUX_uxn_opcodes_h_l2253_c7_a0ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond,
result_stack_value_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef
result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_a0ef
result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_a0ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_a0ef
result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_a0ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_a0ef
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_a0ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2256_c11_2df3
BIN_OP_EQ_uxn_opcodes_h_l2256_c11_2df3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2256_c11_2df3_left,
BIN_OP_EQ_uxn_opcodes_h_l2256_c11_2df3_right,
BIN_OP_EQ_uxn_opcodes_h_l2256_c11_2df3_return_output);

-- t8_MUX_uxn_opcodes_h_l2256_c7_2177
t8_MUX_uxn_opcodes_h_l2256_c7_2177 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2256_c7_2177_cond,
t8_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue,
t8_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse,
t8_MUX_uxn_opcodes_h_l2256_c7_2177_return_output);

-- n8_MUX_uxn_opcodes_h_l2256_c7_2177
n8_MUX_uxn_opcodes_h_l2256_c7_2177 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2256_c7_2177_cond,
n8_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue,
n8_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse,
n8_MUX_uxn_opcodes_h_l2256_c7_2177_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2256_c7_2177
result_is_stack_read_MUX_uxn_opcodes_h_l2256_c7_2177 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2256_c7_2177_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2256_c7_2177_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2256_c7_2177
result_sp_relative_shift_MUX_uxn_opcodes_h_l2256_c7_2177 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2256_c7_2177_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2256_c7_2177_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2177
result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2177 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2177_cond,
result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2177_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2177
result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2177 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2177_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2177_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2177
result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2177 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2177_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2177_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2177
result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2177 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2177_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2177_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2177
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2177 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2177_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2177_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2260_c11_b2dd
BIN_OP_EQ_uxn_opcodes_h_l2260_c11_b2dd : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2260_c11_b2dd_left,
BIN_OP_EQ_uxn_opcodes_h_l2260_c11_b2dd_right,
BIN_OP_EQ_uxn_opcodes_h_l2260_c11_b2dd_return_output);

-- n8_MUX_uxn_opcodes_h_l2260_c7_e35d
n8_MUX_uxn_opcodes_h_l2260_c7_e35d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2260_c7_e35d_cond,
n8_MUX_uxn_opcodes_h_l2260_c7_e35d_iftrue,
n8_MUX_uxn_opcodes_h_l2260_c7_e35d_iffalse,
n8_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_e35d
result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_e35d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_e35d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_e35d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_e35d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_e35d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_e35d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_e35d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_e35d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_e35d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2260_c7_e35d
result_stack_value_MUX_uxn_opcodes_h_l2260_c7_e35d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2260_c7_e35d_cond,
result_stack_value_MUX_uxn_opcodes_h_l2260_c7_e35d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2260_c7_e35d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_e35d
result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_e35d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_e35d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_e35d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_e35d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_e35d
result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_e35d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_e35d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_e35d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_e35d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_e35d
result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_e35d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_e35d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_e35d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_e35d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_e35d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_e35d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_e35d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_e35d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_e35d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2263_c11_f87d
BIN_OP_EQ_uxn_opcodes_h_l2263_c11_f87d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2263_c11_f87d_left,
BIN_OP_EQ_uxn_opcodes_h_l2263_c11_f87d_right,
BIN_OP_EQ_uxn_opcodes_h_l2263_c11_f87d_return_output);

-- n8_MUX_uxn_opcodes_h_l2263_c7_2634
n8_MUX_uxn_opcodes_h_l2263_c7_2634 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2263_c7_2634_cond,
n8_MUX_uxn_opcodes_h_l2263_c7_2634_iftrue,
n8_MUX_uxn_opcodes_h_l2263_c7_2634_iffalse,
n8_MUX_uxn_opcodes_h_l2263_c7_2634_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_2634
result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_2634 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_2634_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_2634_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_2634_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_2634_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_2634
result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_2634 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_2634_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_2634_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_2634_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_2634_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2263_c7_2634
result_stack_value_MUX_uxn_opcodes_h_l2263_c7_2634 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2263_c7_2634_cond,
result_stack_value_MUX_uxn_opcodes_h_l2263_c7_2634_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2263_c7_2634_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2263_c7_2634_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_2634
result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_2634 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_2634_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_2634_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_2634_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_2634_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_2634
result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_2634 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_2634_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_2634_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_2634_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_2634_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_2634
result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_2634 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_2634_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_2634_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_2634_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_2634_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_2634
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_2634 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_2634_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_2634_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_2634_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_2634_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2267_c32_a917
BIN_OP_AND_uxn_opcodes_h_l2267_c32_a917 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2267_c32_a917_left,
BIN_OP_AND_uxn_opcodes_h_l2267_c32_a917_right,
BIN_OP_AND_uxn_opcodes_h_l2267_c32_a917_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2267_c32_c37f
BIN_OP_GT_uxn_opcodes_h_l2267_c32_c37f : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2267_c32_c37f_left,
BIN_OP_GT_uxn_opcodes_h_l2267_c32_c37f_right,
BIN_OP_GT_uxn_opcodes_h_l2267_c32_c37f_return_output);

-- MUX_uxn_opcodes_h_l2267_c32_765b
MUX_uxn_opcodes_h_l2267_c32_765b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2267_c32_765b_cond,
MUX_uxn_opcodes_h_l2267_c32_765b_iftrue,
MUX_uxn_opcodes_h_l2267_c32_765b_iffalse,
MUX_uxn_opcodes_h_l2267_c32_765b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2269_c11_a54d
BIN_OP_EQ_uxn_opcodes_h_l2269_c11_a54d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2269_c11_a54d_left,
BIN_OP_EQ_uxn_opcodes_h_l2269_c11_a54d_right,
BIN_OP_EQ_uxn_opcodes_h_l2269_c11_a54d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_431c
result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_431c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_431c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_431c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_431c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_431c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2269_c7_431c
result_stack_value_MUX_uxn_opcodes_h_l2269_c7_431c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2269_c7_431c_cond,
result_stack_value_MUX_uxn_opcodes_h_l2269_c7_431c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2269_c7_431c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2269_c7_431c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_431c
result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_431c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_431c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_431c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_431c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_431c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_431c
result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_431c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_431c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_431c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_431c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_431c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_431c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_431c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_431c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_431c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_431c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_431c_return_output);

-- BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2273_c24_06c4
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2273_c24_06c4 : entity work.BIN_OP_INFERRED_MULT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2273_c24_06c4_left,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2273_c24_06c4_right,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2273_c24_06c4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2275_c11_d4f2
BIN_OP_EQ_uxn_opcodes_h_l2275_c11_d4f2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2275_c11_d4f2_left,
BIN_OP_EQ_uxn_opcodes_h_l2275_c11_d4f2_right,
BIN_OP_EQ_uxn_opcodes_h_l2275_c11_d4f2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_10c9
result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_10c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_10c9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_10c9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_10c9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_10c9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_10c9
result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_10c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_10c9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_10c9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_10c9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_10c9_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2247_c6_4ad3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2247_c1_2b79_return_output,
 t8_MUX_uxn_opcodes_h_l2247_c2_c496_return_output,
 n8_MUX_uxn_opcodes_h_l2247_c2_c496_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2247_c2_c496_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c2_c496_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2247_c2_c496_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c2_c496_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2247_c2_c496_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2247_c2_c496_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c2_c496_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2253_c11_3016_return_output,
 t8_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output,
 n8_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2256_c11_2df3_return_output,
 t8_MUX_uxn_opcodes_h_l2256_c7_2177_return_output,
 n8_MUX_uxn_opcodes_h_l2256_c7_2177_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2256_c7_2177_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2256_c7_2177_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2177_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2177_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2177_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2177_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2177_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2260_c11_b2dd_return_output,
 n8_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2263_c11_f87d_return_output,
 n8_MUX_uxn_opcodes_h_l2263_c7_2634_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_2634_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_2634_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2263_c7_2634_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_2634_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_2634_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_2634_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_2634_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2267_c32_a917_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2267_c32_c37f_return_output,
 MUX_uxn_opcodes_h_l2267_c32_765b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2269_c11_a54d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_431c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2269_c7_431c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_431c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_431c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_431c_return_output,
 BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2273_c24_06c4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2275_c11_d4f2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_10c9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_10c9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c6_4ad3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c6_4ad3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c6_4ad3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2247_c1_2b79_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2247_c1_2b79_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2247_c1_2b79_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2247_c1_2b79_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2247_c2_c496_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2247_c2_c496_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2247_c2_c496_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2247_c2_c496_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2247_c2_c496_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2247_c2_c496_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c2_c496_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c2_c496_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2247_c2_c496_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2247_c2_c496_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c2_c496_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c2_c496_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2247_c2_c496_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2247_c2_c496_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c2_c496_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c2_c496_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2250_c3_ea3e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c2_c496_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c2_c496_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2248_c3_e70b_uxn_opcodes_h_l2248_c3_e70b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2253_c11_3016_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2253_c11_3016_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2253_c11_3016_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2256_c7_2177_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2256_c7_2177_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2256_c7_2177_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2256_c7_2177_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2177_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2177_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2177_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2177_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2254_c3_0821 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2177_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2256_c11_2df3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2256_c11_2df3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2256_c11_2df3_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2256_c7_2177_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2256_c7_2177_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2256_c7_2177_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2256_c7_2177_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2177_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2177_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2177_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2177_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2258_c3_d081 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2177_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c11_b2dd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c11_b2dd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c11_b2dd_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2260_c7_e35d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2260_c7_e35d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2263_c7_2634_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2260_c7_e35d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_e35d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_e35d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_2634_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_e35d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_e35d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_e35d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_2634_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_e35d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2260_c7_e35d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2260_c7_e35d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2263_c7_2634_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2260_c7_e35d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_e35d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_e35d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_2634_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_e35d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_e35d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_e35d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_2634_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_e35d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_e35d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_e35d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_2634_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_e35d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_e35d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2261_c3_4ddf : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_e35d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_2634_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_e35d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2263_c11_f87d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2263_c11_f87d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2263_c11_f87d_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2263_c7_2634_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2263_c7_2634_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2263_c7_2634_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_2634_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_2634_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_2634_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_2634_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_2634_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_2634_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2263_c7_2634_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2263_c7_2634_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2269_c7_431c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2263_c7_2634_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_2634_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_2634_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_431c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_2634_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_2634_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_2634_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_431c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_2634_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_2634_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_2634_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_431c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_2634_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_2634_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_2634_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_431c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_2634_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2267_c32_765b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2267_c32_765b_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2267_c32_765b_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2267_c32_a917_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2267_c32_a917_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2267_c32_a917_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2267_c32_c37f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2267_c32_c37f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2267_c32_c37f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2267_c32_765b_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c11_a54d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c11_a54d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c11_a54d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_431c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_431c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_431c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2269_c7_431c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_uxn_opcodes_h_l2273_c3_6766 : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2269_c7_431c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2269_c7_431c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_431c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_431c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_10c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_431c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_431c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_431c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_10c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_431c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_431c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2272_c3_b6dc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_431c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_431c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2273_c24_06c4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2273_c24_06c4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2273_c24_06c4_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_d4f2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_d4f2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_d4f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_10c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_10c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_10c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_10c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_10c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_10c9_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2260_l2256_l2253_l2247_l2263_DUPLICATE_0ded_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2260_l2256_l2253_l2247_l2269_l2263_DUPLICATE_b1cd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2260_l2256_l2253_l2247_l2269_DUPLICATE_3f99_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2260_l2256_l2253_l2247_l2275_l2263_DUPLICATE_7374_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2260_l2253_l2263_l2256_DUPLICATE_b094_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2260_l2256_l2253_l2275_l2269_l2263_DUPLICATE_a74d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2263_l2269_DUPLICATE_b208_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2280_l2243_DUPLICATE_a226_return_output : opcode_result_t;
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
     VAR_BIN_OP_GT_uxn_opcodes_h_l2267_c32_c37f_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2267_c32_a917_right := to_unsigned(128, 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_10c9_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_10c9_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_431c_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2250_c3_ea3e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2250_c3_ea3e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2254_c3_0821 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2254_c3_0821;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_d4f2_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c11_b2dd_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2253_c11_3016_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2263_c11_f87d_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c6_4ad3_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2247_c1_2b79_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c11_a54d_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_2634_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_2634_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2258_c3_d081 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2258_c3_d081;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2272_c3_b6dc := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_431c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2272_c3_b6dc;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2261_c3_4ddf := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_e35d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2261_c3_4ddf;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_431c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2256_c11_2df3_right := to_unsigned(2, 2);
     VAR_MUX_uxn_opcodes_h_l2267_c32_765b_iffalse := resize(to_signed(-1, 2), 8);
     VAR_MUX_uxn_opcodes_h_l2267_c32_765b_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2247_c1_2b79_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2267_c32_a917_left := VAR_ins;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2273_c24_06c4_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2260_c7_e35d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2263_c7_2634_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c6_4ad3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2253_c11_3016_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2256_c11_2df3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c11_b2dd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2263_c11_f87d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c11_a54d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_d4f2_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2263_c7_2634_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2273_c24_06c4_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l2269_c11_a54d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2269_c11_a54d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c11_a54d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2269_c11_a54d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c11_a54d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c11_a54d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2269_c11_a54d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2260_l2256_l2253_l2275_l2269_l2263_DUPLICATE_a74d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2260_l2256_l2253_l2275_l2269_l2263_DUPLICATE_a74d_return_output := result.is_opc_done;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2260_l2256_l2253_l2247_l2263_DUPLICATE_0ded LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2260_l2256_l2253_l2247_l2263_DUPLICATE_0ded_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2275_c11_d4f2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2275_c11_d4f2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_d4f2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2275_c11_d4f2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_d4f2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_d4f2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2275_c11_d4f2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2260_l2256_l2253_l2247_l2275_l2263_DUPLICATE_7374 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2260_l2256_l2253_l2247_l2275_l2263_DUPLICATE_7374_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2253_c11_3016] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2253_c11_3016_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2253_c11_3016_left;
     BIN_OP_EQ_uxn_opcodes_h_l2253_c11_3016_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2253_c11_3016_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2253_c11_3016_return_output := BIN_OP_EQ_uxn_opcodes_h_l2253_c11_3016_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2263_l2269_DUPLICATE_b208 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2263_l2269_DUPLICATE_b208_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2247_c6_4ad3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2247_c6_4ad3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c6_4ad3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2247_c6_4ad3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c6_4ad3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c6_4ad3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2247_c6_4ad3_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2260_l2256_l2253_l2247_l2269_l2263_DUPLICATE_b1cd LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2260_l2256_l2253_l2247_l2269_l2263_DUPLICATE_b1cd_return_output := result.stack_value;

     -- BIN_OP_AND[uxn_opcodes_h_l2267_c32_a917] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2267_c32_a917_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2267_c32_a917_left;
     BIN_OP_AND_uxn_opcodes_h_l2267_c32_a917_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2267_c32_a917_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2267_c32_a917_return_output := BIN_OP_AND_uxn_opcodes_h_l2267_c32_a917_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2260_l2253_l2263_l2256_DUPLICATE_b094 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2260_l2253_l2263_l2256_DUPLICATE_b094_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l2260_c11_b2dd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2260_c11_b2dd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c11_b2dd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2260_c11_b2dd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c11_b2dd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c11_b2dd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2260_c11_b2dd_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2260_l2256_l2253_l2247_l2269_DUPLICATE_3f99 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2260_l2256_l2253_l2247_l2269_DUPLICATE_3f99_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2263_c11_f87d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2263_c11_f87d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2263_c11_f87d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2263_c11_f87d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2263_c11_f87d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2263_c11_f87d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2263_c11_f87d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2256_c11_2df3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2256_c11_2df3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2256_c11_2df3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2256_c11_2df3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2256_c11_2df3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2256_c11_2df3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2256_c11_2df3_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2273_c24_06c4] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2273_c24_06c4_left <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2273_c24_06c4_left;
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2273_c24_06c4_right <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2273_c24_06c4_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2273_c24_06c4_return_output := BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2273_c24_06c4_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2267_c32_c37f_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2267_c32_a917_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2247_c1_2b79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c6_4ad3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2247_c2_c496_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c6_4ad3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c2_c496_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c6_4ad3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c2_c496_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c6_4ad3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2247_c2_c496_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c6_4ad3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2247_c2_c496_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c6_4ad3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c2_c496_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c6_4ad3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c2_c496_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c6_4ad3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2247_c2_c496_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c6_4ad3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2247_c2_c496_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c6_4ad3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2253_c11_3016_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2253_c11_3016_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2253_c11_3016_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2253_c11_3016_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2253_c11_3016_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2253_c11_3016_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2253_c11_3016_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2253_c11_3016_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2253_c11_3016_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2256_c7_2177_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2256_c11_2df3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2177_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2256_c11_2df3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2177_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2256_c11_2df3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2256_c7_2177_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2256_c11_2df3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2177_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2256_c11_2df3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2256_c7_2177_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2256_c11_2df3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2177_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2256_c11_2df3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2177_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2256_c11_2df3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2256_c7_2177_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2256_c11_2df3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2260_c7_e35d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c11_b2dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_e35d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c11_b2dd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_e35d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c11_b2dd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_e35d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c11_b2dd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_e35d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c11_b2dd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_e35d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c11_b2dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_e35d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c11_b2dd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2260_c7_e35d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c11_b2dd_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2263_c7_2634_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2263_c11_f87d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_2634_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2263_c11_f87d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_2634_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2263_c11_f87d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_2634_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2263_c11_f87d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_2634_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2263_c11_f87d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_2634_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2263_c11_f87d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_2634_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2263_c11_f87d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2263_c7_2634_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2263_c11_f87d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_431c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c11_a54d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_431c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c11_a54d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_431c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c11_a54d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_431c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c11_a54d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2269_c7_431c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2269_c11_a54d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_10c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_d4f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_10c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_d4f2_return_output;
     VAR_result_stack_value_uxn_opcodes_h_l2273_c3_6766 := resize(VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2273_c24_06c4_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2260_l2256_l2253_l2247_l2263_DUPLICATE_0ded_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2260_l2256_l2253_l2247_l2263_DUPLICATE_0ded_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2260_l2256_l2253_l2247_l2263_DUPLICATE_0ded_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_e35d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2260_l2256_l2253_l2247_l2263_DUPLICATE_0ded_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_2634_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2260_l2256_l2253_l2247_l2263_DUPLICATE_0ded_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2260_l2256_l2253_l2275_l2269_l2263_DUPLICATE_a74d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2260_l2256_l2253_l2275_l2269_l2263_DUPLICATE_a74d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_e35d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2260_l2256_l2253_l2275_l2269_l2263_DUPLICATE_a74d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_2634_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2260_l2256_l2253_l2275_l2269_l2263_DUPLICATE_a74d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_431c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2260_l2256_l2253_l2275_l2269_l2263_DUPLICATE_a74d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_10c9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2260_l2256_l2253_l2275_l2269_l2263_DUPLICATE_a74d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2260_l2256_l2253_l2247_l2269_DUPLICATE_3f99_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2260_l2256_l2253_l2247_l2269_DUPLICATE_3f99_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2260_l2256_l2253_l2247_l2269_DUPLICATE_3f99_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_e35d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2260_l2256_l2253_l2247_l2269_DUPLICATE_3f99_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_431c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2260_l2256_l2253_l2247_l2269_DUPLICATE_3f99_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2260_l2253_l2263_l2256_DUPLICATE_b094_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2260_l2253_l2263_l2256_DUPLICATE_b094_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_e35d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2260_l2253_l2263_l2256_DUPLICATE_b094_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_2634_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2260_l2253_l2263_l2256_DUPLICATE_b094_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2260_l2256_l2253_l2247_l2275_l2263_DUPLICATE_7374_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2260_l2256_l2253_l2247_l2275_l2263_DUPLICATE_7374_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2260_l2256_l2253_l2247_l2275_l2263_DUPLICATE_7374_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_e35d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2260_l2256_l2253_l2247_l2275_l2263_DUPLICATE_7374_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_2634_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2260_l2256_l2253_l2247_l2275_l2263_DUPLICATE_7374_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_10c9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2260_l2256_l2253_l2247_l2275_l2263_DUPLICATE_7374_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_2634_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2263_l2269_DUPLICATE_b208_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_431c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2263_l2269_DUPLICATE_b208_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2260_l2256_l2253_l2247_l2269_l2263_DUPLICATE_b1cd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2260_l2256_l2253_l2247_l2269_l2263_DUPLICATE_b1cd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2260_l2256_l2253_l2247_l2269_l2263_DUPLICATE_b1cd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2260_c7_e35d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2260_l2256_l2253_l2247_l2269_l2263_DUPLICATE_b1cd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2263_c7_2634_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2260_l2256_l2253_l2247_l2269_l2263_DUPLICATE_b1cd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2269_c7_431c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2260_l2256_l2253_l2247_l2269_l2263_DUPLICATE_b1cd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2269_c7_431c_iftrue := VAR_result_stack_value_uxn_opcodes_h_l2273_c3_6766;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2275_c7_10c9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_10c9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_10c9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_10c9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_10c9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_10c9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_10c9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_10c9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_10c9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2275_c7_10c9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_10c9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_10c9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_10c9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_10c9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_10c9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_10c9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_10c9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_10c9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2269_c7_431c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_431c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_431c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_431c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_431c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_431c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_431c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_431c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_431c_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2267_c32_c37f] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2267_c32_c37f_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2267_c32_c37f_left;
     BIN_OP_GT_uxn_opcodes_h_l2267_c32_c37f_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2267_c32_c37f_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2267_c32_c37f_return_output := BIN_OP_GT_uxn_opcodes_h_l2267_c32_c37f_return_output;

     -- n8_MUX[uxn_opcodes_h_l2263_c7_2634] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2263_c7_2634_cond <= VAR_n8_MUX_uxn_opcodes_h_l2263_c7_2634_cond;
     n8_MUX_uxn_opcodes_h_l2263_c7_2634_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2263_c7_2634_iftrue;
     n8_MUX_uxn_opcodes_h_l2263_c7_2634_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2263_c7_2634_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2263_c7_2634_return_output := n8_MUX_uxn_opcodes_h_l2263_c7_2634_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2247_c1_2b79] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2247_c1_2b79_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2247_c1_2b79_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2247_c1_2b79_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2247_c1_2b79_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2247_c1_2b79_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2247_c1_2b79_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2247_c1_2b79_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2247_c1_2b79_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2263_c7_2634] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_2634_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_2634_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_2634_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_2634_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_2634_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_2634_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_2634_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_2634_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2269_c7_431c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2269_c7_431c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2269_c7_431c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2269_c7_431c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2269_c7_431c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2269_c7_431c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2269_c7_431c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2269_c7_431c_return_output := result_stack_value_MUX_uxn_opcodes_h_l2269_c7_431c_return_output;

     -- t8_MUX[uxn_opcodes_h_l2256_c7_2177] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2256_c7_2177_cond <= VAR_t8_MUX_uxn_opcodes_h_l2256_c7_2177_cond;
     t8_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue;
     t8_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2256_c7_2177_return_output := t8_MUX_uxn_opcodes_h_l2256_c7_2177_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2269_c7_431c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_431c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_431c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_431c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_431c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_431c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_431c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_431c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_431c_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2267_c32_765b_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2267_c32_c37f_return_output;
     VAR_printf_uxn_opcodes_h_l2248_c3_e70b_uxn_opcodes_h_l2248_c3_e70b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2247_c1_2b79_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2260_c7_e35d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2263_c7_2634_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_431c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_10c9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_2634_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2269_c7_431c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_e35d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_2634_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_431c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_10c9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_2634_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2269_c7_431c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2263_c7_2634_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2269_c7_431c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2256_c7_2177_return_output;
     -- MUX[uxn_opcodes_h_l2267_c32_765b] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2267_c32_765b_cond <= VAR_MUX_uxn_opcodes_h_l2267_c32_765b_cond;
     MUX_uxn_opcodes_h_l2267_c32_765b_iftrue <= VAR_MUX_uxn_opcodes_h_l2267_c32_765b_iftrue;
     MUX_uxn_opcodes_h_l2267_c32_765b_iffalse <= VAR_MUX_uxn_opcodes_h_l2267_c32_765b_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2267_c32_765b_return_output := MUX_uxn_opcodes_h_l2267_c32_765b_return_output;

     -- t8_MUX[uxn_opcodes_h_l2253_c7_a0ef] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond <= VAR_t8_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond;
     t8_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue;
     t8_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output := t8_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2269_c7_431c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_431c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_431c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_431c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_431c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_431c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_431c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_431c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_431c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2269_c7_431c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_431c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_431c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_431c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_431c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_431c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_431c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_431c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_431c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2260_c7_e35d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_e35d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_e35d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_e35d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_e35d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_e35d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_e35d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output;

     -- printf_uxn_opcodes_h_l2248_c3_e70b[uxn_opcodes_h_l2248_c3_e70b] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2248_c3_e70b_uxn_opcodes_h_l2248_c3_e70b_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2248_c3_e70b_uxn_opcodes_h_l2248_c3_e70b_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2263_c7_2634] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_2634_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_2634_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_2634_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_2634_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_2634_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_2634_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_2634_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_2634_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2263_c7_2634] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2263_c7_2634_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2263_c7_2634_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2263_c7_2634_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2263_c7_2634_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2263_c7_2634_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2263_c7_2634_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2263_c7_2634_return_output := result_stack_value_MUX_uxn_opcodes_h_l2263_c7_2634_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2263_c7_2634] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_2634_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_2634_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_2634_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_2634_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_2634_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_2634_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_2634_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_2634_return_output;

     -- n8_MUX[uxn_opcodes_h_l2260_c7_e35d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2260_c7_e35d_cond <= VAR_n8_MUX_uxn_opcodes_h_l2260_c7_e35d_cond;
     n8_MUX_uxn_opcodes_h_l2260_c7_e35d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2260_c7_e35d_iftrue;
     n8_MUX_uxn_opcodes_h_l2260_c7_e35d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2260_c7_e35d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output := n8_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_2634_iftrue := VAR_MUX_uxn_opcodes_h_l2267_c32_765b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_2634_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2269_c7_431c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_e35d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_2634_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_2634_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2269_c7_431c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_e35d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_2634_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2260_c7_e35d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2263_c7_2634_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2260_c7_e35d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_e35d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_e35d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_e35d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_e35d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_e35d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_e35d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2260_c7_e35d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2260_c7_e35d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2260_c7_e35d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2260_c7_e35d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2260_c7_e35d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2260_c7_e35d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2260_c7_e35d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output := result_stack_value_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2263_c7_2634] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_2634_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_2634_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_2634_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_2634_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_2634_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_2634_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_2634_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_2634_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2260_c7_e35d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_e35d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_e35d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_e35d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_e35d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_e35d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_e35d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2256_c7_2177] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2256_c7_2177_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2256_c7_2177_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2256_c7_2177_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2256_c7_2177_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2263_c7_2634] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_2634_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_2634_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_2634_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_2634_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_2634_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_2634_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_2634_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_2634_return_output;

     -- n8_MUX[uxn_opcodes_h_l2256_c7_2177] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2256_c7_2177_cond <= VAR_n8_MUX_uxn_opcodes_h_l2256_c7_2177_cond;
     n8_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue;
     n8_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2256_c7_2177_return_output := n8_MUX_uxn_opcodes_h_l2256_c7_2177_return_output;

     -- t8_MUX[uxn_opcodes_h_l2247_c2_c496] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2247_c2_c496_cond <= VAR_t8_MUX_uxn_opcodes_h_l2247_c2_c496_cond;
     t8_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue;
     t8_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2247_c2_c496_return_output := t8_MUX_uxn_opcodes_h_l2247_c2_c496_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2263_c7_2634] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_2634_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_2634_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_2634_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_2634_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_2634_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_2634_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_2634_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_2634_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2256_c7_2177_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_e35d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_2634_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2256_c7_2177_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_e35d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_2634_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_e35d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_2634_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2247_c2_c496_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2260_c7_e35d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_e35d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_e35d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_e35d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_e35d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_e35d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_e35d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2256_c7_2177] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2177_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2177_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2177_return_output := result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2177_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2260_c7_e35d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_e35d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_e35d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_e35d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_e35d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_e35d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_e35d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2256_c7_2177] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2177_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2177_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2177_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2177_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2256_c7_2177] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2177_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2177_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2177_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2177_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2253_c7_a0ef] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2260_c7_e35d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_e35d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_e35d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_e35d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_e35d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_e35d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_e35d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output;

     -- n8_MUX[uxn_opcodes_h_l2253_c7_a0ef] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond <= VAR_n8_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond;
     n8_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue;
     n8_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output := n8_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2177_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_e35d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2177_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2177_return_output;
     -- n8_MUX[uxn_opcodes_h_l2247_c2_c496] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2247_c2_c496_cond <= VAR_n8_MUX_uxn_opcodes_h_l2247_c2_c496_cond;
     n8_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue;
     n8_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2247_c2_c496_return_output := n8_MUX_uxn_opcodes_h_l2247_c2_c496_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2256_c7_2177] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2256_c7_2177_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2256_c7_2177_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2256_c7_2177_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2256_c7_2177_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2253_c7_a0ef] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2256_c7_2177] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2177_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2177_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2177_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2177_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2247_c2_c496] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2247_c2_c496_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2247_c2_c496_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2247_c2_c496_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2247_c2_c496_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2256_c7_2177] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2177_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2177_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2177_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2177_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2177_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2177_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2253_c7_a0ef] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2253_c7_a0ef] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output := result_stack_value_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2247_c2_c496_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2177_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2177_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2256_c7_2177_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2247_c2_c496] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c2_c496_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c2_c496_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c2_c496_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c2_c496_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2247_c2_c496] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c2_c496_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c2_c496_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c2_c496_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c2_c496_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2253_c7_a0ef] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2253_c7_a0ef] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2253_c7_a0ef] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_a0ef_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_a0ef_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_a0ef_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2247_c2_c496] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2247_c2_c496_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2247_c2_c496_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2247_c2_c496_return_output := result_stack_value_MUX_uxn_opcodes_h_l2247_c2_c496_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2253_c7_a0ef_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2247_c2_c496] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2247_c2_c496_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c2_c496_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c2_c496_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2247_c2_c496_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2247_c2_c496] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c2_c496_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c2_c496_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c2_c496_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c2_c496_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2247_c2_c496] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2247_c2_c496_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2247_c2_c496_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2247_c2_c496_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2247_c2_c496_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2247_c2_c496_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2247_c2_c496_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2280_l2243_DUPLICATE_a226 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2280_l2243_DUPLICATE_a226_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2247_c2_c496_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c2_c496_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2247_c2_c496_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c2_c496_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2247_c2_c496_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c2_c496_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c2_c496_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2280_l2243_DUPLICATE_a226_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2280_l2243_DUPLICATE_a226_return_output;
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
