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
-- Submodules: 84
entity dup2_0CLK_a05d6369 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end dup2_0CLK_a05d6369;
architecture arch of dup2_0CLK_a05d6369 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1926_c6_0d4e]
signal BIN_OP_EQ_uxn_opcodes_h_l1926_c6_0d4e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1926_c6_0d4e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1926_c6_0d4e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1926_c1_168e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_168e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_168e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_168e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_168e_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1926_c2_27fd]
signal t16_MUX_uxn_opcodes_h_l1926_c2_27fd_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1926_c2_27fd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_27fd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1926_c2_27fd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_27fd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1926_c2_27fd]
signal result_stack_value_MUX_uxn_opcodes_h_l1926_c2_27fd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1926_c2_27fd]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_27fd_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1926_c2_27fd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_27fd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1926_c2_27fd]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_27fd_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1926_c2_27fd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_27fd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1926_c2_27fd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_27fd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1927_c3_da06[uxn_opcodes_h_l1927_c3_da06]
signal printf_uxn_opcodes_h_l1927_c3_da06_uxn_opcodes_h_l1927_c3_da06_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1934_c11_a751]
signal BIN_OP_EQ_uxn_opcodes_h_l1934_c11_a751_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1934_c11_a751_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1934_c11_a751_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1934_c7_d759]
signal t16_MUX_uxn_opcodes_h_l1934_c7_d759_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1934_c7_d759_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1934_c7_d759_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1934_c7_d759_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1934_c7_d759]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_d759_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_d759_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_d759_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_d759_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1934_c7_d759]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_d759_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_d759_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_d759_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_d759_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1934_c7_d759]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_d759_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_d759_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_d759_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_d759_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1934_c7_d759]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_d759_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_d759_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_d759_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_d759_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1934_c7_d759]
signal result_stack_value_MUX_uxn_opcodes_h_l1934_c7_d759_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1934_c7_d759_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1934_c7_d759_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1934_c7_d759_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1934_c7_d759]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_d759_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_d759_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_d759_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_d759_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1934_c7_d759]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_d759_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_d759_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_d759_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_d759_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1938_c11_c977]
signal BIN_OP_EQ_uxn_opcodes_h_l1938_c11_c977_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1938_c11_c977_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1938_c11_c977_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1938_c7_9265]
signal t16_MUX_uxn_opcodes_h_l1938_c7_9265_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1938_c7_9265_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1938_c7_9265_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1938_c7_9265_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1938_c7_9265]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_9265_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_9265_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_9265_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_9265_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1938_c7_9265]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_9265_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_9265_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_9265_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_9265_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1938_c7_9265]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_9265_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_9265_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_9265_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_9265_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1938_c7_9265]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_9265_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_9265_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_9265_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_9265_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1938_c7_9265]
signal result_stack_value_MUX_uxn_opcodes_h_l1938_c7_9265_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1938_c7_9265_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1938_c7_9265_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1938_c7_9265_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1938_c7_9265]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_9265_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_9265_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_9265_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_9265_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1938_c7_9265]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_9265_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_9265_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_9265_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_9265_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1940_c3_2bba]
signal CONST_SL_8_uxn_opcodes_h_l1940_c3_2bba_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1940_c3_2bba_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1944_c11_3afe]
signal BIN_OP_EQ_uxn_opcodes_h_l1944_c11_3afe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1944_c11_3afe_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1944_c11_3afe_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1944_c7_9031]
signal t16_MUX_uxn_opcodes_h_l1944_c7_9031_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1944_c7_9031_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1944_c7_9031_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1944_c7_9031_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1944_c7_9031]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_9031_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_9031_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_9031_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_9031_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1944_c7_9031]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_9031_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_9031_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_9031_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_9031_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1944_c7_9031]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_9031_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_9031_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_9031_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_9031_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1944_c7_9031]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_9031_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_9031_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_9031_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_9031_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1944_c7_9031]
signal result_stack_value_MUX_uxn_opcodes_h_l1944_c7_9031_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1944_c7_9031_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1944_c7_9031_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1944_c7_9031_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1944_c7_9031]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_9031_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_9031_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_9031_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_9031_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1944_c7_9031]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_9031_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_9031_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_9031_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_9031_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1948_c11_9997]
signal BIN_OP_EQ_uxn_opcodes_h_l1948_c11_9997_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1948_c11_9997_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1948_c11_9997_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1948_c7_e09e]
signal t16_MUX_uxn_opcodes_h_l1948_c7_e09e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1948_c7_e09e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1948_c7_e09e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1948_c7_e09e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_e09e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_e09e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_e09e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1948_c7_e09e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_e09e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_e09e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_e09e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1948_c7_e09e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_e09e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_e09e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_e09e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1948_c7_e09e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_e09e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_e09e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_e09e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1948_c7_e09e]
signal result_stack_value_MUX_uxn_opcodes_h_l1948_c7_e09e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1948_c7_e09e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1948_c7_e09e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1948_c7_e09e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_e09e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_e09e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_e09e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1948_c7_e09e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_e09e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_e09e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_e09e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1949_c3_2c79]
signal BIN_OP_OR_uxn_opcodes_h_l1949_c3_2c79_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1949_c3_2c79_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1949_c3_2c79_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1952_c32_fb6c]
signal BIN_OP_AND_uxn_opcodes_h_l1952_c32_fb6c_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1952_c32_fb6c_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1952_c32_fb6c_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1952_c32_5dcb]
signal BIN_OP_GT_uxn_opcodes_h_l1952_c32_5dcb_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1952_c32_5dcb_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1952_c32_5dcb_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1952_c32_a2fd]
signal MUX_uxn_opcodes_h_l1952_c32_a2fd_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1952_c32_a2fd_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1952_c32_a2fd_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1952_c32_a2fd_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1954_c11_3372]
signal BIN_OP_EQ_uxn_opcodes_h_l1954_c11_3372_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1954_c11_3372_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1954_c11_3372_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1954_c7_5fc7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_5fc7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_5fc7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_5fc7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_5fc7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1954_c7_5fc7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_5fc7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_5fc7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_5fc7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_5fc7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1954_c7_5fc7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_5fc7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_5fc7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_5fc7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_5fc7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1954_c7_5fc7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_5fc7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_5fc7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_5fc7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_5fc7_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1954_c7_5fc7]
signal result_stack_value_MUX_uxn_opcodes_h_l1954_c7_5fc7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1954_c7_5fc7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1954_c7_5fc7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1954_c7_5fc7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1961_c11_d27c]
signal BIN_OP_EQ_uxn_opcodes_h_l1961_c11_d27c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1961_c11_d27c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1961_c11_d27c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1961_c7_f718]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_f718_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_f718_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_f718_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_f718_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1961_c7_f718]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_f718_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_f718_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_f718_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_f718_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1961_c7_f718]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_f718_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_f718_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_f718_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_f718_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1961_c7_f718]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_f718_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_f718_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_f718_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_f718_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1961_c7_f718]
signal result_stack_value_MUX_uxn_opcodes_h_l1961_c7_f718_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1961_c7_f718_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1961_c7_f718_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1961_c7_f718_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1966_c11_a4d2]
signal BIN_OP_EQ_uxn_opcodes_h_l1966_c11_a4d2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1966_c11_a4d2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1966_c11_a4d2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1966_c7_4755]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4755_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4755_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4755_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4755_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1966_c7_4755]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4755_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4755_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4755_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4755_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1966_c7_4755]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4755_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4755_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4755_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4755_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1966_c7_4755]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4755_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4755_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4755_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4755_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1966_c7_4755]
signal result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4755_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4755_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4755_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4755_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1972_c11_b522]
signal BIN_OP_EQ_uxn_opcodes_h_l1972_c11_b522_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1972_c11_b522_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1972_c11_b522_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1972_c7_be0c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_be0c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_be0c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_be0c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_be0c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1972_c7_be0c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_be0c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_be0c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_be0c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_be0c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1972_c7_be0c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_be0c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_be0c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_be0c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_be0c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1972_c7_be0c]
signal result_stack_value_MUX_uxn_opcodes_h_l1972_c7_be0c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1972_c7_be0c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1972_c7_be0c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1972_c7_be0c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1977_c11_11dd]
signal BIN_OP_EQ_uxn_opcodes_h_l1977_c11_11dd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1977_c11_11dd_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1977_c11_11dd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1977_c7_38a5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_38a5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_38a5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_38a5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_38a5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1977_c7_38a5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_38a5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_38a5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_38a5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_38a5_return_output : unsigned(0 downto 0);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l1975_l1964_DUPLICATE_05ae
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l1975_l1964_DUPLICATE_05ae_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l1975_l1964_DUPLICATE_05ae_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_49dd( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.stack_value := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_read := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_sp_shift := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1926_c6_0d4e
BIN_OP_EQ_uxn_opcodes_h_l1926_c6_0d4e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1926_c6_0d4e_left,
BIN_OP_EQ_uxn_opcodes_h_l1926_c6_0d4e_right,
BIN_OP_EQ_uxn_opcodes_h_l1926_c6_0d4e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_168e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_168e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_168e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_168e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_168e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_168e_return_output);

-- t16_MUX_uxn_opcodes_h_l1926_c2_27fd
t16_MUX_uxn_opcodes_h_l1926_c2_27fd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1926_c2_27fd_cond,
t16_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue,
t16_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse,
t16_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_27fd
result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_27fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_27fd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_27fd
result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_27fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_27fd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1926_c2_27fd
result_stack_value_MUX_uxn_opcodes_h_l1926_c2_27fd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1926_c2_27fd_cond,
result_stack_value_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_27fd
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_27fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_27fd_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_27fd
result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_27fd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_27fd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_27fd
result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_27fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_27fd_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_27fd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_27fd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_27fd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_27fd
result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_27fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_27fd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output);

-- printf_uxn_opcodes_h_l1927_c3_da06_uxn_opcodes_h_l1927_c3_da06
printf_uxn_opcodes_h_l1927_c3_da06_uxn_opcodes_h_l1927_c3_da06 : entity work.printf_uxn_opcodes_h_l1927_c3_da06_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1927_c3_da06_uxn_opcodes_h_l1927_c3_da06_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1934_c11_a751
BIN_OP_EQ_uxn_opcodes_h_l1934_c11_a751 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1934_c11_a751_left,
BIN_OP_EQ_uxn_opcodes_h_l1934_c11_a751_right,
BIN_OP_EQ_uxn_opcodes_h_l1934_c11_a751_return_output);

-- t16_MUX_uxn_opcodes_h_l1934_c7_d759
t16_MUX_uxn_opcodes_h_l1934_c7_d759 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1934_c7_d759_cond,
t16_MUX_uxn_opcodes_h_l1934_c7_d759_iftrue,
t16_MUX_uxn_opcodes_h_l1934_c7_d759_iffalse,
t16_MUX_uxn_opcodes_h_l1934_c7_d759_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_d759
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_d759 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_d759_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_d759_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_d759_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_d759_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_d759
result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_d759 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_d759_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_d759_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_d759_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_d759_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_d759
result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_d759 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_d759_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_d759_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_d759_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_d759_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_d759
result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_d759 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_d759_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_d759_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_d759_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_d759_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1934_c7_d759
result_stack_value_MUX_uxn_opcodes_h_l1934_c7_d759 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1934_c7_d759_cond,
result_stack_value_MUX_uxn_opcodes_h_l1934_c7_d759_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1934_c7_d759_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1934_c7_d759_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_d759
result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_d759 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_d759_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_d759_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_d759_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_d759_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_d759
result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_d759 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_d759_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_d759_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_d759_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_d759_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1938_c11_c977
BIN_OP_EQ_uxn_opcodes_h_l1938_c11_c977 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1938_c11_c977_left,
BIN_OP_EQ_uxn_opcodes_h_l1938_c11_c977_right,
BIN_OP_EQ_uxn_opcodes_h_l1938_c11_c977_return_output);

-- t16_MUX_uxn_opcodes_h_l1938_c7_9265
t16_MUX_uxn_opcodes_h_l1938_c7_9265 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1938_c7_9265_cond,
t16_MUX_uxn_opcodes_h_l1938_c7_9265_iftrue,
t16_MUX_uxn_opcodes_h_l1938_c7_9265_iffalse,
t16_MUX_uxn_opcodes_h_l1938_c7_9265_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_9265
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_9265 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_9265_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_9265_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_9265_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_9265_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_9265
result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_9265 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_9265_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_9265_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_9265_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_9265_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_9265
result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_9265 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_9265_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_9265_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_9265_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_9265_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_9265
result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_9265 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_9265_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_9265_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_9265_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_9265_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1938_c7_9265
result_stack_value_MUX_uxn_opcodes_h_l1938_c7_9265 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1938_c7_9265_cond,
result_stack_value_MUX_uxn_opcodes_h_l1938_c7_9265_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1938_c7_9265_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1938_c7_9265_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_9265
result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_9265 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_9265_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_9265_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_9265_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_9265_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_9265
result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_9265 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_9265_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_9265_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_9265_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_9265_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1940_c3_2bba
CONST_SL_8_uxn_opcodes_h_l1940_c3_2bba : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1940_c3_2bba_x,
CONST_SL_8_uxn_opcodes_h_l1940_c3_2bba_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1944_c11_3afe
BIN_OP_EQ_uxn_opcodes_h_l1944_c11_3afe : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1944_c11_3afe_left,
BIN_OP_EQ_uxn_opcodes_h_l1944_c11_3afe_right,
BIN_OP_EQ_uxn_opcodes_h_l1944_c11_3afe_return_output);

-- t16_MUX_uxn_opcodes_h_l1944_c7_9031
t16_MUX_uxn_opcodes_h_l1944_c7_9031 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1944_c7_9031_cond,
t16_MUX_uxn_opcodes_h_l1944_c7_9031_iftrue,
t16_MUX_uxn_opcodes_h_l1944_c7_9031_iffalse,
t16_MUX_uxn_opcodes_h_l1944_c7_9031_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_9031
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_9031 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_9031_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_9031_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_9031_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_9031_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_9031
result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_9031 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_9031_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_9031_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_9031_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_9031_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_9031
result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_9031 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_9031_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_9031_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_9031_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_9031_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_9031
result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_9031 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_9031_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_9031_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_9031_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_9031_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1944_c7_9031
result_stack_value_MUX_uxn_opcodes_h_l1944_c7_9031 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1944_c7_9031_cond,
result_stack_value_MUX_uxn_opcodes_h_l1944_c7_9031_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1944_c7_9031_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1944_c7_9031_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_9031
result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_9031 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_9031_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_9031_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_9031_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_9031_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_9031
result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_9031 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_9031_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_9031_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_9031_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_9031_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1948_c11_9997
BIN_OP_EQ_uxn_opcodes_h_l1948_c11_9997 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1948_c11_9997_left,
BIN_OP_EQ_uxn_opcodes_h_l1948_c11_9997_right,
BIN_OP_EQ_uxn_opcodes_h_l1948_c11_9997_return_output);

-- t16_MUX_uxn_opcodes_h_l1948_c7_e09e
t16_MUX_uxn_opcodes_h_l1948_c7_e09e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1948_c7_e09e_cond,
t16_MUX_uxn_opcodes_h_l1948_c7_e09e_iftrue,
t16_MUX_uxn_opcodes_h_l1948_c7_e09e_iffalse,
t16_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_e09e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_e09e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_e09e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_e09e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_e09e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_e09e
result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_e09e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_e09e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_e09e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_e09e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_e09e
result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_e09e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_e09e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_e09e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_e09e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_e09e
result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_e09e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_e09e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_e09e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_e09e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1948_c7_e09e
result_stack_value_MUX_uxn_opcodes_h_l1948_c7_e09e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1948_c7_e09e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1948_c7_e09e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1948_c7_e09e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_e09e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_e09e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_e09e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_e09e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_e09e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_e09e
result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_e09e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_e09e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_e09e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_e09e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1949_c3_2c79
BIN_OP_OR_uxn_opcodes_h_l1949_c3_2c79 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1949_c3_2c79_left,
BIN_OP_OR_uxn_opcodes_h_l1949_c3_2c79_right,
BIN_OP_OR_uxn_opcodes_h_l1949_c3_2c79_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1952_c32_fb6c
BIN_OP_AND_uxn_opcodes_h_l1952_c32_fb6c : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1952_c32_fb6c_left,
BIN_OP_AND_uxn_opcodes_h_l1952_c32_fb6c_right,
BIN_OP_AND_uxn_opcodes_h_l1952_c32_fb6c_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1952_c32_5dcb
BIN_OP_GT_uxn_opcodes_h_l1952_c32_5dcb : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1952_c32_5dcb_left,
BIN_OP_GT_uxn_opcodes_h_l1952_c32_5dcb_right,
BIN_OP_GT_uxn_opcodes_h_l1952_c32_5dcb_return_output);

-- MUX_uxn_opcodes_h_l1952_c32_a2fd
MUX_uxn_opcodes_h_l1952_c32_a2fd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1952_c32_a2fd_cond,
MUX_uxn_opcodes_h_l1952_c32_a2fd_iftrue,
MUX_uxn_opcodes_h_l1952_c32_a2fd_iffalse,
MUX_uxn_opcodes_h_l1952_c32_a2fd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1954_c11_3372
BIN_OP_EQ_uxn_opcodes_h_l1954_c11_3372 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1954_c11_3372_left,
BIN_OP_EQ_uxn_opcodes_h_l1954_c11_3372_right,
BIN_OP_EQ_uxn_opcodes_h_l1954_c11_3372_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_5fc7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_5fc7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_5fc7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_5fc7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_5fc7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_5fc7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_5fc7
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_5fc7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_5fc7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_5fc7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_5fc7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_5fc7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_5fc7
result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_5fc7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_5fc7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_5fc7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_5fc7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_5fc7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_5fc7
result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_5fc7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_5fc7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_5fc7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_5fc7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_5fc7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1954_c7_5fc7
result_stack_value_MUX_uxn_opcodes_h_l1954_c7_5fc7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1954_c7_5fc7_cond,
result_stack_value_MUX_uxn_opcodes_h_l1954_c7_5fc7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1954_c7_5fc7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1954_c7_5fc7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1961_c11_d27c
BIN_OP_EQ_uxn_opcodes_h_l1961_c11_d27c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1961_c11_d27c_left,
BIN_OP_EQ_uxn_opcodes_h_l1961_c11_d27c_right,
BIN_OP_EQ_uxn_opcodes_h_l1961_c11_d27c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_f718
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_f718 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_f718_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_f718_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_f718_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_f718_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_f718
result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_f718 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_f718_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_f718_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_f718_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_f718_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_f718
result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_f718 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_f718_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_f718_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_f718_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_f718_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_f718
result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_f718 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_f718_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_f718_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_f718_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_f718_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1961_c7_f718
result_stack_value_MUX_uxn_opcodes_h_l1961_c7_f718 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1961_c7_f718_cond,
result_stack_value_MUX_uxn_opcodes_h_l1961_c7_f718_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1961_c7_f718_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1961_c7_f718_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1966_c11_a4d2
BIN_OP_EQ_uxn_opcodes_h_l1966_c11_a4d2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1966_c11_a4d2_left,
BIN_OP_EQ_uxn_opcodes_h_l1966_c11_a4d2_right,
BIN_OP_EQ_uxn_opcodes_h_l1966_c11_a4d2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4755
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4755 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4755_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4755_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4755_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4755_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4755
result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4755 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4755_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4755_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4755_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4755_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4755
result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4755 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4755_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4755_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4755_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4755_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4755
result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4755 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4755_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4755_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4755_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4755_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4755
result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4755 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4755_cond,
result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4755_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4755_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4755_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1972_c11_b522
BIN_OP_EQ_uxn_opcodes_h_l1972_c11_b522 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1972_c11_b522_left,
BIN_OP_EQ_uxn_opcodes_h_l1972_c11_b522_right,
BIN_OP_EQ_uxn_opcodes_h_l1972_c11_b522_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_be0c
result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_be0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_be0c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_be0c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_be0c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_be0c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_be0c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_be0c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_be0c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_be0c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_be0c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_be0c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_be0c
result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_be0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_be0c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_be0c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_be0c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_be0c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1972_c7_be0c
result_stack_value_MUX_uxn_opcodes_h_l1972_c7_be0c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1972_c7_be0c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1972_c7_be0c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1972_c7_be0c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1972_c7_be0c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1977_c11_11dd
BIN_OP_EQ_uxn_opcodes_h_l1977_c11_11dd : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1977_c11_11dd_left,
BIN_OP_EQ_uxn_opcodes_h_l1977_c11_11dd_right,
BIN_OP_EQ_uxn_opcodes_h_l1977_c11_11dd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_38a5
result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_38a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_38a5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_38a5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_38a5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_38a5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_38a5
result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_38a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_38a5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_38a5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_38a5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_38a5_return_output);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l1975_l1964_DUPLICATE_05ae
CONST_SR_8_uint16_t_uxn_opcodes_h_l1975_l1964_DUPLICATE_05ae : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_opcodes_h_l1975_l1964_DUPLICATE_05ae_x,
CONST_SR_8_uint16_t_uxn_opcodes_h_l1975_l1964_DUPLICATE_05ae_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1926_c6_0d4e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_168e_return_output,
 t16_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1934_c11_a751_return_output,
 t16_MUX_uxn_opcodes_h_l1934_c7_d759_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_d759_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_d759_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_d759_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_d759_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1934_c7_d759_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_d759_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_d759_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1938_c11_c977_return_output,
 t16_MUX_uxn_opcodes_h_l1938_c7_9265_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_9265_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_9265_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_9265_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_9265_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1938_c7_9265_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_9265_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_9265_return_output,
 CONST_SL_8_uxn_opcodes_h_l1940_c3_2bba_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1944_c11_3afe_return_output,
 t16_MUX_uxn_opcodes_h_l1944_c7_9031_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_9031_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_9031_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_9031_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_9031_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1944_c7_9031_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_9031_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_9031_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1948_c11_9997_return_output,
 t16_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1949_c3_2c79_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1952_c32_fb6c_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1952_c32_5dcb_return_output,
 MUX_uxn_opcodes_h_l1952_c32_a2fd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1954_c11_3372_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_5fc7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_5fc7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_5fc7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_5fc7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1954_c7_5fc7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1961_c11_d27c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_f718_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_f718_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_f718_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_f718_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1961_c7_f718_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1966_c11_a4d2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4755_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4755_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4755_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4755_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4755_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1972_c11_b522_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_be0c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_be0c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_be0c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1972_c7_be0c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1977_c11_11dd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_38a5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_38a5_return_output,
 CONST_SR_8_uint16_t_uxn_opcodes_h_l1975_l1964_DUPLICATE_05ae_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c6_0d4e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c6_0d4e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c6_0d4e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_168e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_168e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_168e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_168e_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1934_c7_d759_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1926_c2_27fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_d759_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_27fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_d759_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_27fd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1934_c7_d759_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c2_27fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1926_c2_27fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_27fd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_d759_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_27fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_d759_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_27fd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1930_c3_0eaf : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_d759_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_27fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_d759_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_27fd_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1927_c3_da06_uxn_opcodes_h_l1927_c3_da06_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1934_c11_a751_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1934_c11_a751_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1934_c11_a751_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1934_c7_d759_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1934_c7_d759_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1938_c7_9265_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1934_c7_d759_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_d759_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1936_c3_cf60 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_d759_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_9265_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_d759_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_d759_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_d759_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_9265_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_d759_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_d759_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_d759_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_9265_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_d759_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_d759_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_d759_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_9265_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_d759_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1934_c7_d759_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1934_c7_d759_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1938_c7_9265_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1934_c7_d759_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_d759_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_d759_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_9265_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_d759_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_d759_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_d759_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_9265_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_d759_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_c977_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_c977_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_c977_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1938_c7_9265_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1938_c7_9265_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1944_c7_9031_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1938_c7_9265_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_9265_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1942_c3_39f0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_9265_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_9031_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_9265_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_9265_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_9265_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_9031_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_9265_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_9265_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_9265_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_9031_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_9265_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_9265_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_9265_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_9031_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_9265_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1938_c7_9265_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1938_c7_9265_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1944_c7_9031_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1938_c7_9265_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_9265_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_9265_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_9031_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_9265_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_9265_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_9265_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_9031_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_9265_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1940_c3_2bba_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1940_c3_2bba_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1944_c11_3afe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1944_c11_3afe_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1944_c11_3afe_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1944_c7_9031_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1944_c7_9031_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1944_c7_9031_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_9031_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1946_c3_d6e6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_9031_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_9031_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_9031_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_9031_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_9031_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_9031_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_9031_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_9031_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_9031_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_9031_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_9031_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1944_c7_9031_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1944_c7_9031_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1944_c7_9031_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_9031_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_9031_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_9031_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_9031_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_9031_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_9031_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1948_c11_9997_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1948_c11_9997_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1948_c11_9997_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1948_c7_e09e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1948_c7_e09e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1948_c7_e09e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_e09e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_e09e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_5fc7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_e09e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_e09e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_e09e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_5fc7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_e09e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_e09e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_e09e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_5fc7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_e09e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_e09e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_e09e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_5fc7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_e09e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1948_c7_e09e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1948_c7_e09e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1954_c7_5fc7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1948_c7_e09e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_e09e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_e09e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_e09e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_e09e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_e09e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1948_c7_e09e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_e09e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1949_c3_2c79_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1949_c3_2c79_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1949_c3_2c79_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1952_c32_a2fd_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1952_c32_a2fd_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1952_c32_a2fd_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1952_c32_fb6c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1952_c32_fb6c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1952_c32_fb6c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1952_c32_5dcb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1952_c32_5dcb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1952_c32_5dcb_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1952_c32_a2fd_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_3372_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_3372_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_3372_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_5fc7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1958_c3_d501 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_5fc7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_f718_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_5fc7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_5fc7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_5fc7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_f718_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_5fc7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_5fc7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_5fc7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_f718_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_5fc7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_5fc7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_5fc7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_f718_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_5fc7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1954_c7_5fc7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1954_c7_5fc7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1961_c7_f718_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1954_c7_5fc7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_d27c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_d27c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_d27c_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_f718_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1963_c3_4cd6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_f718_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4755_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_f718_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_f718_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_f718_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4755_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_f718_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_f718_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_f718_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4755_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_f718_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_f718_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_f718_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4755_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_f718_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1961_c7_f718_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1961_c7_f718_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4755_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1961_c7_f718_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_a4d2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_a4d2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_a4d2_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4755_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1969_c3_8c85 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4755_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_be0c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4755_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4755_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4755_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_be0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4755_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4755_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4755_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_be0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4755_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4755_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4755_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4755_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4755_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4755_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1972_c7_be0c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4755_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_b522_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_b522_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_b522_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_be0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_be0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_38a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_be0c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_be0c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1974_c3_6e44 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_be0c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_be0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_be0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_be0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_38a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_be0c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1972_c7_be0c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1972_c7_be0c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1972_c7_be0c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c11_11dd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c11_11dd_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c11_11dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_38a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_38a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_38a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_38a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_38a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_38a5_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1948_l1944_l1938_l1972_l1934_l1926_DUPLICATE_4b54_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1948_l1944_l1938_l1934_l1926_DUPLICATE_f447_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1944_l1938_l1934_l1966_l1926_l1961_DUPLICATE_ece2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1954_l1948_l1944_l1977_l1938_l1972_l1934_l1966_l1961_DUPLICATE_3188_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1948_l1944_l1977_l1938_l1934_DUPLICATE_2b41_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1949_l1939_DUPLICATE_bfad_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1972_l1948_DUPLICATE_d96d_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l1970_l1959_DUPLICATE_c649_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l1975_l1964_DUPLICATE_05ae_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l1975_l1964_DUPLICATE_05ae_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l1975_l1964_DUPLICATE_12cc_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1982_l1922_DUPLICATE_49cb_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_9265_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1942_c3_39f0 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_9265_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1942_c3_39f0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1934_c11_a751_right := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1952_c32_5dcb_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_d27c_right := to_unsigned(6, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1974_c3_6e44 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_be0c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1974_c3_6e44;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1969_c3_8c85 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4755_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1969_c3_8c85;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1946_c3_d6e6 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_9031_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1946_c3_d6e6;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_e09e_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_d759_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_c977_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_38a5_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1936_c3_cf60 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_d759_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1936_c3_cf60;
     VAR_MUX_uxn_opcodes_h_l1952_c32_a2fd_iftrue := signed(std_logic_vector(resize(to_unsigned(4, 3), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c6_0d4e_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_f718_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1930_c3_0eaf := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1930_c3_0eaf;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1944_c11_3afe_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_b522_right := to_unsigned(8, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_38a5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1948_c11_9997_right := to_unsigned(4, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_9031_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_5fc7_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4755_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_168e_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_5fc7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_a4d2_right := to_unsigned(7, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4755_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1963_c3_4cd6 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_f718_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1963_c3_4cd6;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1952_c32_fb6c_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_3372_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c11_11dd_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1958_c3_d501 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_5fc7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1958_c3_d501;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_e09e_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1952_c32_a2fd_iffalse := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_be0c_iftrue := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_168e_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1952_c32_fb6c_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c6_0d4e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1934_c11_a751_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_c977_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1944_c11_3afe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1948_c11_9997_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_3372_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_d27c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_a4d2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_b522_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c11_11dd_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1949_c3_2c79_left := t16;
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l1975_l1964_DUPLICATE_05ae_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1934_c7_d759_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1944_c7_9031_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1948_c7_e09e_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1972_c11_b522] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1972_c11_b522_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_b522_left;
     BIN_OP_EQ_uxn_opcodes_h_l1972_c11_b522_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_b522_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_b522_return_output := BIN_OP_EQ_uxn_opcodes_h_l1972_c11_b522_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1938_c11_c977] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1938_c11_c977_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_c977_left;
     BIN_OP_EQ_uxn_opcodes_h_l1938_c11_c977_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_c977_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_c977_return_output := BIN_OP_EQ_uxn_opcodes_h_l1938_c11_c977_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1948_l1944_l1977_l1938_l1934_DUPLICATE_2b41 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1948_l1944_l1977_l1938_l1934_DUPLICATE_2b41_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1977_c11_11dd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1977_c11_11dd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c11_11dd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1977_c11_11dd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c11_11dd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c11_11dd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1977_c11_11dd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1966_c11_a4d2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1966_c11_a4d2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_a4d2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1966_c11_a4d2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_a4d2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_a4d2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1966_c11_a4d2_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1952_c32_fb6c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1952_c32_fb6c_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1952_c32_fb6c_left;
     BIN_OP_AND_uxn_opcodes_h_l1952_c32_fb6c_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1952_c32_fb6c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1952_c32_fb6c_return_output := BIN_OP_AND_uxn_opcodes_h_l1952_c32_fb6c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1944_l1938_l1934_l1966_l1926_l1961_DUPLICATE_ece2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1944_l1938_l1934_l1966_l1926_l1961_DUPLICATE_ece2_return_output := result.is_sp_shift;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1926_c2_27fd] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1926_c2_27fd_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1948_c11_9997] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1948_c11_9997_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1948_c11_9997_left;
     BIN_OP_EQ_uxn_opcodes_h_l1948_c11_9997_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1948_c11_9997_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1948_c11_9997_return_output := BIN_OP_EQ_uxn_opcodes_h_l1948_c11_9997_return_output;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l1970_l1959_DUPLICATE_c649 LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l1970_l1959_DUPLICATE_c649_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1934_c11_a751] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1934_c11_a751_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1934_c11_a751_left;
     BIN_OP_EQ_uxn_opcodes_h_l1934_c11_a751_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1934_c11_a751_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1934_c11_a751_return_output := BIN_OP_EQ_uxn_opcodes_h_l1934_c11_a751_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1926_c6_0d4e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1926_c6_0d4e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c6_0d4e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1926_c6_0d4e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c6_0d4e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c6_0d4e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1926_c6_0d4e_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1972_l1948_DUPLICATE_d96d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1972_l1948_DUPLICATE_d96d_return_output := result.stack_address_sp_offset;

     -- CONST_SR_8_uint16_t_uxn_opcodes_h_l1975_l1964_DUPLICATE_05ae LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_opcodes_h_l1975_l1964_DUPLICATE_05ae_x <= VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l1975_l1964_DUPLICATE_05ae_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l1975_l1964_DUPLICATE_05ae_return_output := CONST_SR_8_uint16_t_uxn_opcodes_h_l1975_l1964_DUPLICATE_05ae_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1948_l1944_l1938_l1934_l1926_DUPLICATE_f447 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1948_l1944_l1938_l1934_l1926_DUPLICATE_f447_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1944_c11_3afe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1944_c11_3afe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1944_c11_3afe_left;
     BIN_OP_EQ_uxn_opcodes_h_l1944_c11_3afe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1944_c11_3afe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1944_c11_3afe_return_output := BIN_OP_EQ_uxn_opcodes_h_l1944_c11_3afe_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1954_l1948_l1944_l1977_l1938_l1972_l1934_l1966_l1961_DUPLICATE_3188 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1954_l1948_l1944_l1977_l1938_l1972_l1934_l1966_l1961_DUPLICATE_3188_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1948_l1944_l1938_l1972_l1934_l1926_DUPLICATE_4b54 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1948_l1944_l1938_l1972_l1934_l1926_DUPLICATE_4b54_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1954_c11_3372] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1954_c11_3372_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_3372_left;
     BIN_OP_EQ_uxn_opcodes_h_l1954_c11_3372_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_3372_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_3372_return_output := BIN_OP_EQ_uxn_opcodes_h_l1954_c11_3372_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1961_c11_d27c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1961_c11_d27c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_d27c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1961_c11_d27c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_d27c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_d27c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1961_c11_d27c_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1949_l1939_DUPLICATE_bfad LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1949_l1939_DUPLICATE_bfad_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l1948_c7_e09e] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1948_c7_e09e_return_output := result.is_stack_read;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1952_c32_5dcb_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1952_c32_fb6c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_168e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c6_0d4e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_27fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c6_0d4e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_27fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c6_0d4e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_27fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c6_0d4e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_27fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c6_0d4e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_27fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c6_0d4e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_27fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c6_0d4e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_27fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c6_0d4e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c2_27fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c6_0d4e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1926_c2_27fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c6_0d4e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_d759_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1934_c11_a751_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_d759_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1934_c11_a751_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_d759_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1934_c11_a751_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_d759_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1934_c11_a751_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_d759_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1934_c11_a751_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_d759_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1934_c11_a751_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1934_c7_d759_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1934_c11_a751_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1934_c7_d759_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1934_c11_a751_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_9265_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_c977_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_9265_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_c977_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_9265_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_c977_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_9265_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_c977_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_9265_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_c977_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_9265_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_c977_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1938_c7_9265_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_c977_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1938_c7_9265_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_c977_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_9031_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1944_c11_3afe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_9031_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1944_c11_3afe_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_9031_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1944_c11_3afe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_9031_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1944_c11_3afe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_9031_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1944_c11_3afe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_9031_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1944_c11_3afe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1944_c7_9031_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1944_c11_3afe_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1944_c7_9031_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1944_c11_3afe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_e09e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1948_c11_9997_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_e09e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1948_c11_9997_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_e09e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1948_c11_9997_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_e09e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1948_c11_9997_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_e09e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1948_c11_9997_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_e09e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1948_c11_9997_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1948_c7_e09e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1948_c11_9997_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1948_c7_e09e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1948_c11_9997_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_5fc7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_3372_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_5fc7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_3372_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_5fc7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_3372_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_5fc7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_3372_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1954_c7_5fc7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_3372_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_f718_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_d27c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_f718_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_d27c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_f718_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_d27c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_f718_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_d27c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1961_c7_f718_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_d27c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4755_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_a4d2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4755_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_a4d2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4755_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_a4d2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4755_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_a4d2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4755_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_a4d2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_be0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_b522_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_be0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_b522_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_be0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_b522_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1972_c7_be0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_b522_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_38a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c11_11dd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_38a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1977_c11_11dd_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1949_c3_2c79_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1949_l1939_DUPLICATE_bfad_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1940_c3_2bba_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1949_l1939_DUPLICATE_bfad_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1954_c7_5fc7_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l1970_l1959_DUPLICATE_c649_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4755_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l1970_l1959_DUPLICATE_c649_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1948_l1944_l1938_l1934_l1926_DUPLICATE_f447_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_d759_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1948_l1944_l1938_l1934_l1926_DUPLICATE_f447_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_9265_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1948_l1944_l1938_l1934_l1926_DUPLICATE_f447_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_9031_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1948_l1944_l1938_l1934_l1926_DUPLICATE_f447_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_e09e_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1948_l1944_l1938_l1934_l1926_DUPLICATE_f447_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_d759_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1954_l1948_l1944_l1977_l1938_l1972_l1934_l1966_l1961_DUPLICATE_3188_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_9265_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1954_l1948_l1944_l1977_l1938_l1972_l1934_l1966_l1961_DUPLICATE_3188_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_9031_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1954_l1948_l1944_l1977_l1938_l1972_l1934_l1966_l1961_DUPLICATE_3188_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_e09e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1954_l1948_l1944_l1977_l1938_l1972_l1934_l1966_l1961_DUPLICATE_3188_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_5fc7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1954_l1948_l1944_l1977_l1938_l1972_l1934_l1966_l1961_DUPLICATE_3188_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_f718_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1954_l1948_l1944_l1977_l1938_l1972_l1934_l1966_l1961_DUPLICATE_3188_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4755_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1954_l1948_l1944_l1977_l1938_l1972_l1934_l1966_l1961_DUPLICATE_3188_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_be0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1954_l1948_l1944_l1977_l1938_l1972_l1934_l1966_l1961_DUPLICATE_3188_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_38a5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1954_l1948_l1944_l1977_l1938_l1972_l1934_l1966_l1961_DUPLICATE_3188_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1944_l1938_l1934_l1966_l1926_l1961_DUPLICATE_ece2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_d759_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1944_l1938_l1934_l1966_l1926_l1961_DUPLICATE_ece2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_9265_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1944_l1938_l1934_l1966_l1926_l1961_DUPLICATE_ece2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_9031_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1944_l1938_l1934_l1966_l1926_l1961_DUPLICATE_ece2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_f718_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1944_l1938_l1934_l1966_l1926_l1961_DUPLICATE_ece2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4755_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1944_l1938_l1934_l1966_l1926_l1961_DUPLICATE_ece2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_d759_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1948_l1944_l1977_l1938_l1934_DUPLICATE_2b41_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_9265_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1948_l1944_l1977_l1938_l1934_DUPLICATE_2b41_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_9031_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1948_l1944_l1977_l1938_l1934_DUPLICATE_2b41_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_e09e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1948_l1944_l1977_l1938_l1934_DUPLICATE_2b41_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_38a5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1948_l1944_l1977_l1938_l1934_DUPLICATE_2b41_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_e09e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1972_l1948_DUPLICATE_d96d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_be0c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1972_l1948_DUPLICATE_d96d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1948_l1944_l1938_l1972_l1934_l1926_DUPLICATE_4b54_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1934_c7_d759_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1948_l1944_l1938_l1972_l1934_l1926_DUPLICATE_4b54_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1938_c7_9265_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1948_l1944_l1938_l1972_l1934_l1926_DUPLICATE_4b54_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1944_c7_9031_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1948_l1944_l1938_l1972_l1934_l1926_DUPLICATE_4b54_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1948_c7_e09e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1948_l1944_l1938_l1972_l1934_l1926_DUPLICATE_4b54_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1972_c7_be0c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1948_l1944_l1938_l1972_l1934_l1926_DUPLICATE_4b54_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1926_c2_27fd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_e09e_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1948_c7_e09e_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1977_c7_38a5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_38a5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_38a5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_38a5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_38a5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_38a5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_38a5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_38a5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_38a5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1966_c7_4755] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4755_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4755_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4755_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4755_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4755_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4755_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4755_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4755_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1948_c7_e09e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_e09e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_e09e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_e09e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_e09e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_e09e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_e09e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1952_c32_5dcb] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1952_c32_5dcb_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1952_c32_5dcb_left;
     BIN_OP_GT_uxn_opcodes_h_l1952_c32_5dcb_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1952_c32_5dcb_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1952_c32_5dcb_return_output := BIN_OP_GT_uxn_opcodes_h_l1952_c32_5dcb_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1940_c3_2bba] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1940_c3_2bba_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1940_c3_2bba_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1940_c3_2bba_return_output := CONST_SL_8_uxn_opcodes_h_l1940_c3_2bba_return_output;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l1975_l1964_DUPLICATE_12cc LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l1975_l1964_DUPLICATE_12cc_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l1975_l1964_DUPLICATE_05ae_return_output);

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1926_c2_27fd] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_27fd_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_27fd_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1949_c3_2c79] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1949_c3_2c79_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1949_c3_2c79_left;
     BIN_OP_OR_uxn_opcodes_h_l1949_c3_2c79_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1949_c3_2c79_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1949_c3_2c79_return_output := BIN_OP_OR_uxn_opcodes_h_l1949_c3_2c79_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1977_c7_38a5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_38a5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_38a5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_38a5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_38a5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_38a5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_38a5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_38a5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_38a5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1926_c1_168e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_168e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_168e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_168e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_168e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_168e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_168e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_168e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_168e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1972_c7_be0c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_be0c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_be0c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_be0c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_be0c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_be0c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_be0c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_be0c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_be0c_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1952_c32_a2fd_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1952_c32_5dcb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1948_c7_e09e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1949_c3_2c79_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1961_c7_f718_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l1975_l1964_DUPLICATE_12cc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1972_c7_be0c_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l1975_l1964_DUPLICATE_12cc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1938_c7_9265_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1940_c3_2bba_return_output;
     VAR_printf_uxn_opcodes_h_l1927_c3_da06_uxn_opcodes_h_l1927_c3_da06_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1926_c1_168e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_be0c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1977_c7_38a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_f718_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_4755_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_9031_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_be0c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1977_c7_38a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4755_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_be0c_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1972_c7_be0c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_be0c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_be0c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_be0c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_be0c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_be0c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_be0c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_be0c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_be0c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1966_c7_4755] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4755_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4755_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4755_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4755_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4755_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4755_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4755_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4755_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1944_c7_9031] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_9031_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_9031_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_9031_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_9031_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_9031_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_9031_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_9031_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_9031_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1972_c7_be0c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_be0c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_be0c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_be0c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_be0c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_be0c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_be0c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_be0c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_be0c_return_output;

     -- MUX[uxn_opcodes_h_l1952_c32_a2fd] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1952_c32_a2fd_cond <= VAR_MUX_uxn_opcodes_h_l1952_c32_a2fd_cond;
     MUX_uxn_opcodes_h_l1952_c32_a2fd_iftrue <= VAR_MUX_uxn_opcodes_h_l1952_c32_a2fd_iftrue;
     MUX_uxn_opcodes_h_l1952_c32_a2fd_iffalse <= VAR_MUX_uxn_opcodes_h_l1952_c32_a2fd_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1952_c32_a2fd_return_output := MUX_uxn_opcodes_h_l1952_c32_a2fd_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1972_c7_be0c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1972_c7_be0c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1972_c7_be0c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1972_c7_be0c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1972_c7_be0c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1972_c7_be0c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1972_c7_be0c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1972_c7_be0c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1972_c7_be0c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1961_c7_f718] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_f718_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_f718_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_f718_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_f718_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_f718_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_f718_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_f718_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_f718_return_output;

     -- t16_MUX[uxn_opcodes_h_l1948_c7_e09e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1948_c7_e09e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1948_c7_e09e_cond;
     t16_MUX_uxn_opcodes_h_l1948_c7_e09e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1948_c7_e09e_iftrue;
     t16_MUX_uxn_opcodes_h_l1948_c7_e09e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1948_c7_e09e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output := t16_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output;

     -- printf_uxn_opcodes_h_l1927_c3_da06[uxn_opcodes_h_l1927_c3_da06] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1927_c3_da06_uxn_opcodes_h_l1927_c3_da06_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1927_c3_da06_uxn_opcodes_h_l1927_c3_da06_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_e09e_iftrue := VAR_MUX_uxn_opcodes_h_l1952_c32_a2fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4755_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_be0c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_5fc7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_f718_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_9265_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_9031_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4755_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_be0c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_f718_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_4755_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4755_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1972_c7_be0c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1944_c7_9031_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output;
     -- t16_MUX[uxn_opcodes_h_l1944_c7_9031] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1944_c7_9031_cond <= VAR_t16_MUX_uxn_opcodes_h_l1944_c7_9031_cond;
     t16_MUX_uxn_opcodes_h_l1944_c7_9031_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1944_c7_9031_iftrue;
     t16_MUX_uxn_opcodes_h_l1944_c7_9031_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1944_c7_9031_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1944_c7_9031_return_output := t16_MUX_uxn_opcodes_h_l1944_c7_9031_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1961_c7_f718] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_f718_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_f718_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_f718_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_f718_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_f718_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_f718_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_f718_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_f718_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1954_c7_5fc7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_5fc7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_5fc7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_5fc7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_5fc7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_5fc7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_5fc7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_5fc7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_5fc7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1966_c7_4755] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4755_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4755_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4755_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4755_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4755_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4755_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4755_return_output := result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4755_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1966_c7_4755] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4755_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4755_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4755_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4755_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4755_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4755_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4755_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4755_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1966_c7_4755] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4755_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4755_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4755_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4755_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4755_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4755_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4755_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4755_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1938_c7_9265] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_9265_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_9265_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_9265_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_9265_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_9265_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_9265_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_9265_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_9265_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1948_c7_e09e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_e09e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_e09e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_e09e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_e09e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_e09e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_e09e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_f718_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_4755_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_e09e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_5fc7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_d759_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1938_c7_9265_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_f718_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_4755_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_9031_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_5fc7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_f718_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1961_c7_f718_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1966_c7_4755_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1938_c7_9265_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1944_c7_9031_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1961_c7_f718] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_f718_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_f718_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_f718_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_f718_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_f718_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_f718_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_f718_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_f718_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1944_c7_9031] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_9031_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_9031_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_9031_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_9031_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_9031_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_9031_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_9031_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_9031_return_output;

     -- t16_MUX[uxn_opcodes_h_l1938_c7_9265] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1938_c7_9265_cond <= VAR_t16_MUX_uxn_opcodes_h_l1938_c7_9265_cond;
     t16_MUX_uxn_opcodes_h_l1938_c7_9265_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1938_c7_9265_iftrue;
     t16_MUX_uxn_opcodes_h_l1938_c7_9265_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1938_c7_9265_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1938_c7_9265_return_output := t16_MUX_uxn_opcodes_h_l1938_c7_9265_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1961_c7_f718] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_f718_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_f718_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_f718_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_f718_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_f718_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_f718_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_f718_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_f718_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1961_c7_f718] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1961_c7_f718_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1961_c7_f718_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1961_c7_f718_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1961_c7_f718_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1961_c7_f718_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1961_c7_f718_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1961_c7_f718_return_output := result_stack_value_MUX_uxn_opcodes_h_l1961_c7_f718_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1954_c7_5fc7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_5fc7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_5fc7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_5fc7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_5fc7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_5fc7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_5fc7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_5fc7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_5fc7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1948_c7_e09e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_e09e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_e09e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_e09e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_e09e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_e09e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_e09e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1934_c7_d759] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_d759_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_d759_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_d759_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_d759_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_d759_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_d759_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_d759_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_d759_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_5fc7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_f718_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_9031_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1934_c7_d759_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_5fc7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1961_c7_f718_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_9265_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_9031_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_e09e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_5fc7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1954_c7_5fc7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1961_c7_f718_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1934_c7_d759_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1938_c7_9265_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1926_c2_27fd] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_27fd_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_27fd_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1954_c7_5fc7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1954_c7_5fc7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1954_c7_5fc7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1954_c7_5fc7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1954_c7_5fc7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1954_c7_5fc7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1954_c7_5fc7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1954_c7_5fc7_return_output := result_stack_value_MUX_uxn_opcodes_h_l1954_c7_5fc7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1948_c7_e09e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_e09e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_e09e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_e09e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_e09e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_e09e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_e09e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1938_c7_9265] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_9265_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_9265_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_9265_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_9265_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_9265_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_9265_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_9265_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_9265_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1954_c7_5fc7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_5fc7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_5fc7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_5fc7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_5fc7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_5fc7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_5fc7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_5fc7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_5fc7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1944_c7_9031] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_9031_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_9031_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_9031_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_9031_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_9031_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_9031_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_9031_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_9031_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1954_c7_5fc7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_5fc7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_5fc7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_5fc7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_5fc7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_5fc7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_5fc7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_5fc7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_5fc7_return_output;

     -- t16_MUX[uxn_opcodes_h_l1934_c7_d759] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1934_c7_d759_cond <= VAR_t16_MUX_uxn_opcodes_h_l1934_c7_d759_cond;
     t16_MUX_uxn_opcodes_h_l1934_c7_d759_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1934_c7_d759_iftrue;
     t16_MUX_uxn_opcodes_h_l1934_c7_d759_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1934_c7_d759_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1934_c7_d759_return_output := t16_MUX_uxn_opcodes_h_l1934_c7_d759_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_e09e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_5fc7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_9265_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_9031_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_e09e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_5fc7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_d759_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_9265_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_9031_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1948_c7_e09e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1954_c7_5fc7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1934_c7_d759_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1934_c7_d759] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_d759_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_d759_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_d759_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_d759_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_d759_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_d759_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_d759_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_d759_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1938_c7_9265] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_9265_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_9265_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_9265_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_9265_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_9265_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_9265_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_9265_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_9265_return_output;

     -- t16_MUX[uxn_opcodes_h_l1926_c2_27fd] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1926_c2_27fd_cond <= VAR_t16_MUX_uxn_opcodes_h_l1926_c2_27fd_cond;
     t16_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue;
     t16_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output := t16_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1944_c7_9031] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_9031_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_9031_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_9031_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_9031_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_9031_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_9031_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_9031_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_9031_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1948_c7_e09e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_e09e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_e09e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_e09e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_e09e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_e09e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_e09e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1948_c7_e09e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_e09e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_e09e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_e09e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_e09e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_e09e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_e09e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1948_c7_e09e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1948_c7_e09e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1948_c7_e09e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1948_c7_e09e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1948_c7_e09e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1948_c7_e09e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1948_c7_e09e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_9031_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_d759_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1938_c7_9265_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_9031_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1934_c7_d759_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_9265_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_9031_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1944_c7_9031_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1948_c7_e09e_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1944_c7_9031] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_9031_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_9031_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_9031_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_9031_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_9031_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_9031_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_9031_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_9031_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1938_c7_9265] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_9265_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_9265_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_9265_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_9265_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_9265_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_9265_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_9265_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_9265_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1944_c7_9031] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_9031_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_9031_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_9031_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_9031_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_9031_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_9031_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_9031_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_9031_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1944_c7_9031] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1944_c7_9031_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1944_c7_9031_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1944_c7_9031_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1944_c7_9031_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1944_c7_9031_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1944_c7_9031_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1944_c7_9031_return_output := result_stack_value_MUX_uxn_opcodes_h_l1944_c7_9031_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1934_c7_d759] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_d759_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_d759_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_d759_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_d759_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_d759_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_d759_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_d759_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_d759_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1926_c2_27fd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_27fd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_27fd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_9265_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_9031_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1934_c7_d759_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_9265_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1944_c7_9031_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_d759_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_9265_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1938_c7_9265_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1944_c7_9031_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1938_c7_9265] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1938_c7_9265_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1938_c7_9265_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1938_c7_9265_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1938_c7_9265_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1938_c7_9265_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1938_c7_9265_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1938_c7_9265_return_output := result_stack_value_MUX_uxn_opcodes_h_l1938_c7_9265_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1926_c2_27fd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_27fd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_27fd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1938_c7_9265] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_9265_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_9265_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_9265_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_9265_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_9265_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_9265_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_9265_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_9265_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1938_c7_9265] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_9265_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_9265_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_9265_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_9265_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_9265_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_9265_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_9265_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_9265_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1934_c7_d759] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_d759_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_d759_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_d759_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_d759_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_d759_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_d759_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_d759_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_d759_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_d759_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_9265_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_d759_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_9265_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_d759_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1934_c7_d759_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1938_c7_9265_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1934_c7_d759] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1934_c7_d759_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1934_c7_d759_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1934_c7_d759_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1934_c7_d759_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1934_c7_d759_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1934_c7_d759_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1934_c7_d759_return_output := result_stack_value_MUX_uxn_opcodes_h_l1934_c7_d759_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1934_c7_d759] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_d759_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_d759_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_d759_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_d759_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_d759_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_d759_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_d759_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_d759_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1934_c7_d759] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_d759_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_d759_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_d759_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_d759_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_d759_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_d759_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_d759_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_d759_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1926_c2_27fd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_27fd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_27fd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_d759_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_d759_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1934_c7_d759_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1926_c2_27fd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_27fd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_27fd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1926_c2_27fd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1926_c2_27fd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c2_27fd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output := result_stack_value_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1926_c2_27fd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_27fd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_27fd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_27fd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_27fd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1982_l1922_DUPLICATE_49cb LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1982_l1922_DUPLICATE_49cb_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_49dd(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1926_c2_27fd_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1982_l1922_DUPLICATE_49cb_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1982_l1922_DUPLICATE_49cb_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
