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
-- Submodules: 129
entity swp2_0CLK_6f1dc0f8 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end swp2_0CLK_6f1dc0f8;
architecture arch of swp2_0CLK_6f1dc0f8 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1736_c6_6ec7]
signal BIN_OP_EQ_uxn_opcodes_h_l1736_c6_6ec7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1736_c6_6ec7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1736_c6_6ec7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1736_c1_316b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_316b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_316b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_316b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_316b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1736_c2_1506]
signal n16_MUX_uxn_opcodes_h_l1736_c2_1506_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1736_c2_1506_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1736_c2_1506]
signal t16_MUX_uxn_opcodes_h_l1736_c2_1506_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1736_c2_1506_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1736_c2_1506]
signal result_stack_value_MUX_uxn_opcodes_h_l1736_c2_1506_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1736_c2_1506_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1736_c2_1506]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_1506_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_1506_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1736_c2_1506]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_1506_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_1506_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1736_c2_1506]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_1506_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_1506_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1736_c2_1506]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_1506_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_1506_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1736_c2_1506]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_1506_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_1506_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1736_c2_1506]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_1506_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_1506_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1736_c2_1506]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_1506_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_1506_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1737_c3_1d15[uxn_opcodes_h_l1737_c3_1d15]
signal printf_uxn_opcodes_h_l1737_c3_1d15_uxn_opcodes_h_l1737_c3_1d15_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1744_c11_031c]
signal BIN_OP_EQ_uxn_opcodes_h_l1744_c11_031c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1744_c11_031c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1744_c11_031c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1744_c7_046f]
signal n16_MUX_uxn_opcodes_h_l1744_c7_046f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1744_c7_046f_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1744_c7_046f]
signal t16_MUX_uxn_opcodes_h_l1744_c7_046f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1744_c7_046f_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1744_c7_046f]
signal result_stack_value_MUX_uxn_opcodes_h_l1744_c7_046f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1744_c7_046f_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1744_c7_046f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_046f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_046f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1744_c7_046f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_046f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_046f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1744_c7_046f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_046f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_046f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1744_c7_046f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_046f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_046f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1744_c7_046f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_046f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_046f_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1744_c7_046f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_046f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_046f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1748_c11_a19c]
signal BIN_OP_EQ_uxn_opcodes_h_l1748_c11_a19c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1748_c11_a19c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1748_c11_a19c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1748_c7_d068]
signal n16_MUX_uxn_opcodes_h_l1748_c7_d068_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1748_c7_d068_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1748_c7_d068]
signal t16_MUX_uxn_opcodes_h_l1748_c7_d068_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1748_c7_d068_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1748_c7_d068]
signal result_stack_value_MUX_uxn_opcodes_h_l1748_c7_d068_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1748_c7_d068_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1748_c7_d068]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_d068_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_d068_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1748_c7_d068]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_d068_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_d068_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1748_c7_d068]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_d068_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_d068_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1748_c7_d068]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_d068_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_d068_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1748_c7_d068]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_d068_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_d068_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1748_c7_d068]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_d068_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_d068_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1754_c11_398b]
signal BIN_OP_EQ_uxn_opcodes_h_l1754_c11_398b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1754_c11_398b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1754_c11_398b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1754_c7_5d19]
signal n16_MUX_uxn_opcodes_h_l1754_c7_5d19_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1754_c7_5d19]
signal t16_MUX_uxn_opcodes_h_l1754_c7_5d19_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1754_c7_5d19]
signal result_stack_value_MUX_uxn_opcodes_h_l1754_c7_5d19_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1754_c7_5d19]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_5d19_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1754_c7_5d19]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5d19_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1754_c7_5d19]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_5d19_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1754_c7_5d19]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5d19_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1754_c7_5d19]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_5d19_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1754_c7_5d19]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5d19_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1758_c11_4a48]
signal BIN_OP_EQ_uxn_opcodes_h_l1758_c11_4a48_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1758_c11_4a48_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1758_c11_4a48_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1758_c7_cf47]
signal n16_MUX_uxn_opcodes_h_l1758_c7_cf47_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1758_c7_cf47]
signal t16_MUX_uxn_opcodes_h_l1758_c7_cf47_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1758_c7_cf47]
signal result_stack_value_MUX_uxn_opcodes_h_l1758_c7_cf47_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1758_c7_cf47]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_cf47_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1758_c7_cf47]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_cf47_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1758_c7_cf47]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_cf47_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1758_c7_cf47]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_cf47_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1758_c7_cf47]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_cf47_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1758_c7_cf47]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_cf47_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1759_c3_e9f3]
signal BIN_OP_OR_uxn_opcodes_h_l1759_c3_e9f3_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1759_c3_e9f3_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1759_c3_e9f3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1763_c11_eb24]
signal BIN_OP_EQ_uxn_opcodes_h_l1763_c11_eb24_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1763_c11_eb24_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1763_c11_eb24_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1763_c7_f827]
signal n16_MUX_uxn_opcodes_h_l1763_c7_f827_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1763_c7_f827_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1763_c7_f827_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1763_c7_f827_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1763_c7_f827]
signal result_stack_value_MUX_uxn_opcodes_h_l1763_c7_f827_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1763_c7_f827_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1763_c7_f827_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1763_c7_f827_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1763_c7_f827]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_f827_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_f827_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_f827_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_f827_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1763_c7_f827]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f827_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f827_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f827_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f827_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1763_c7_f827]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_f827_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_f827_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_f827_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_f827_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1763_c7_f827]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f827_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f827_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f827_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f827_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1763_c7_f827]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_f827_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_f827_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_f827_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_f827_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1763_c7_f827]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f827_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f827_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f827_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f827_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1767_c11_f686]
signal BIN_OP_EQ_uxn_opcodes_h_l1767_c11_f686_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1767_c11_f686_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1767_c11_f686_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1767_c7_9c27]
signal n16_MUX_uxn_opcodes_h_l1767_c7_9c27_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1767_c7_9c27_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1767_c7_9c27_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1767_c7_9c27]
signal result_stack_value_MUX_uxn_opcodes_h_l1767_c7_9c27_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1767_c7_9c27_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1767_c7_9c27_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1767_c7_9c27]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_9c27_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_9c27_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_9c27_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1767_c7_9c27]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_9c27_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_9c27_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_9c27_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1767_c7_9c27]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_9c27_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_9c27_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_9c27_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1767_c7_9c27]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_9c27_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_9c27_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_9c27_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1767_c7_9c27]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_9c27_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_9c27_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_9c27_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1767_c7_9c27]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_9c27_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_9c27_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_9c27_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1773_c11_254d]
signal BIN_OP_EQ_uxn_opcodes_h_l1773_c11_254d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1773_c11_254d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1773_c11_254d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1773_c7_e0b0]
signal n16_MUX_uxn_opcodes_h_l1773_c7_e0b0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1773_c7_e0b0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1773_c7_e0b0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1773_c7_e0b0]
signal result_stack_value_MUX_uxn_opcodes_h_l1773_c7_e0b0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1773_c7_e0b0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1773_c7_e0b0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1773_c7_e0b0]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_e0b0_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_e0b0_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_e0b0_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1773_c7_e0b0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_e0b0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_e0b0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_e0b0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1773_c7_e0b0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1773_c7_e0b0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_e0b0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_e0b0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_e0b0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1773_c7_e0b0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1773_c7_e0b0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_e0b0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_e0b0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_e0b0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1777_c11_b325]
signal BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b325_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b325_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b325_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1777_c7_be64]
signal n16_MUX_uxn_opcodes_h_l1777_c7_be64_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1777_c7_be64_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1777_c7_be64_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1777_c7_be64_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1777_c7_be64]
signal result_stack_value_MUX_uxn_opcodes_h_l1777_c7_be64_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1777_c7_be64_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1777_c7_be64_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1777_c7_be64_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1777_c7_be64]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_be64_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_be64_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_be64_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_be64_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1777_c7_be64]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_be64_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_be64_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_be64_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_be64_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1777_c7_be64]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_be64_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_be64_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_be64_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_be64_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1777_c7_be64]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_be64_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_be64_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_be64_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_be64_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1777_c7_be64]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_be64_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_be64_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_be64_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_be64_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1777_c7_be64]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_be64_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_be64_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_be64_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_be64_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1778_c3_bee5]
signal BIN_OP_OR_uxn_opcodes_h_l1778_c3_bee5_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1778_c3_bee5_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1778_c3_bee5_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1781_c32_d061]
signal BIN_OP_AND_uxn_opcodes_h_l1781_c32_d061_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1781_c32_d061_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1781_c32_d061_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1781_c32_f21e]
signal BIN_OP_GT_uxn_opcodes_h_l1781_c32_f21e_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1781_c32_f21e_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1781_c32_f21e_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1781_c32_9e26]
signal MUX_uxn_opcodes_h_l1781_c32_9e26_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1781_c32_9e26_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1781_c32_9e26_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1781_c32_9e26_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1783_c11_4ede]
signal BIN_OP_EQ_uxn_opcodes_h_l1783_c11_4ede_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1783_c11_4ede_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1783_c11_4ede_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1783_c7_5c16]
signal result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5c16_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5c16_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5c16_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5c16_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1783_c7_5c16]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5c16_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5c16_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5c16_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5c16_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1783_c7_5c16]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5c16_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5c16_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5c16_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5c16_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1783_c7_5c16]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5c16_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5c16_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5c16_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5c16_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1783_c7_5c16]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5c16_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5c16_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5c16_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5c16_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1789_c11_0ad5]
signal BIN_OP_EQ_uxn_opcodes_h_l1789_c11_0ad5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1789_c11_0ad5_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1789_c11_0ad5_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1789_c7_aecc]
signal result_stack_value_MUX_uxn_opcodes_h_l1789_c7_aecc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1789_c7_aecc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1789_c7_aecc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1789_c7_aecc_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1789_c7_aecc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_aecc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_aecc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_aecc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_aecc_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1789_c7_aecc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_aecc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_aecc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_aecc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_aecc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1789_c7_aecc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_aecc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_aecc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_aecc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_aecc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1789_c7_aecc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_aecc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_aecc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_aecc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_aecc_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1792_c34_beda]
signal CONST_SR_8_uxn_opcodes_h_l1792_c34_beda_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1792_c34_beda_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1794_c11_6b43]
signal BIN_OP_EQ_uxn_opcodes_h_l1794_c11_6b43_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1794_c11_6b43_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1794_c11_6b43_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1794_c7_8565]
signal result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8565_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8565_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8565_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8565_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1794_c7_8565]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8565_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8565_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8565_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8565_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1794_c7_8565]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8565_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8565_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8565_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8565_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1794_c7_8565]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8565_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8565_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8565_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8565_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1794_c7_8565]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8565_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8565_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8565_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8565_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1800_c11_e764]
signal BIN_OP_EQ_uxn_opcodes_h_l1800_c11_e764_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1800_c11_e764_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1800_c11_e764_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1800_c7_4129]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_4129_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_4129_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_4129_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_4129_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1800_c7_4129]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_4129_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_4129_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_4129_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_4129_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1800_c7_4129]
signal result_stack_value_MUX_uxn_opcodes_h_l1800_c7_4129_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1800_c7_4129_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1800_c7_4129_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1800_c7_4129_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1800_c7_4129]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_4129_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_4129_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_4129_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_4129_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1803_c34_933f]
signal CONST_SR_8_uxn_opcodes_h_l1803_c34_933f_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1803_c34_933f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1805_c11_11a5]
signal BIN_OP_EQ_uxn_opcodes_h_l1805_c11_11a5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1805_c11_11a5_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1805_c11_11a5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1805_c7_e7bf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_e7bf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_e7bf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_e7bf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_e7bf_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1805_c7_e7bf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_e7bf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_e7bf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_e7bf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_e7bf_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_9cb0
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_9cb0_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_9cb0_return_output : unsigned(15 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_81ab( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_value := ref_toks_1;
      base.is_stack_read := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1736_c6_6ec7
BIN_OP_EQ_uxn_opcodes_h_l1736_c6_6ec7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1736_c6_6ec7_left,
BIN_OP_EQ_uxn_opcodes_h_l1736_c6_6ec7_right,
BIN_OP_EQ_uxn_opcodes_h_l1736_c6_6ec7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_316b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_316b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_316b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_316b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_316b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_316b_return_output);

-- n16_MUX_uxn_opcodes_h_l1736_c2_1506
n16_MUX_uxn_opcodes_h_l1736_c2_1506 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1736_c2_1506_cond,
n16_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue,
n16_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse,
n16_MUX_uxn_opcodes_h_l1736_c2_1506_return_output);

-- t16_MUX_uxn_opcodes_h_l1736_c2_1506
t16_MUX_uxn_opcodes_h_l1736_c2_1506 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1736_c2_1506_cond,
t16_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue,
t16_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse,
t16_MUX_uxn_opcodes_h_l1736_c2_1506_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1736_c2_1506
result_stack_value_MUX_uxn_opcodes_h_l1736_c2_1506 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1736_c2_1506_cond,
result_stack_value_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1736_c2_1506_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_1506
result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_1506 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_1506_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_1506_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_1506
result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_1506 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_1506_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_1506_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_1506
result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_1506 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_1506_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_1506_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_1506
result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_1506 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_1506_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_1506_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_1506
result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_1506 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_1506_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_1506_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_1506
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_1506 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_1506_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_1506_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_1506
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_1506 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_1506_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_1506_return_output);

-- printf_uxn_opcodes_h_l1737_c3_1d15_uxn_opcodes_h_l1737_c3_1d15
printf_uxn_opcodes_h_l1737_c3_1d15_uxn_opcodes_h_l1737_c3_1d15 : entity work.printf_uxn_opcodes_h_l1737_c3_1d15_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1737_c3_1d15_uxn_opcodes_h_l1737_c3_1d15_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1744_c11_031c
BIN_OP_EQ_uxn_opcodes_h_l1744_c11_031c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1744_c11_031c_left,
BIN_OP_EQ_uxn_opcodes_h_l1744_c11_031c_right,
BIN_OP_EQ_uxn_opcodes_h_l1744_c11_031c_return_output);

-- n16_MUX_uxn_opcodes_h_l1744_c7_046f
n16_MUX_uxn_opcodes_h_l1744_c7_046f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1744_c7_046f_cond,
n16_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue,
n16_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse,
n16_MUX_uxn_opcodes_h_l1744_c7_046f_return_output);

-- t16_MUX_uxn_opcodes_h_l1744_c7_046f
t16_MUX_uxn_opcodes_h_l1744_c7_046f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1744_c7_046f_cond,
t16_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue,
t16_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse,
t16_MUX_uxn_opcodes_h_l1744_c7_046f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1744_c7_046f
result_stack_value_MUX_uxn_opcodes_h_l1744_c7_046f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1744_c7_046f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1744_c7_046f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_046f
result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_046f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_046f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_046f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_046f
result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_046f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_046f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_046f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_046f
result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_046f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_046f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_046f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_046f
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_046f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_046f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_046f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_046f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_046f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_046f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_046f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_046f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_046f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_046f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_046f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1748_c11_a19c
BIN_OP_EQ_uxn_opcodes_h_l1748_c11_a19c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1748_c11_a19c_left,
BIN_OP_EQ_uxn_opcodes_h_l1748_c11_a19c_right,
BIN_OP_EQ_uxn_opcodes_h_l1748_c11_a19c_return_output);

-- n16_MUX_uxn_opcodes_h_l1748_c7_d068
n16_MUX_uxn_opcodes_h_l1748_c7_d068 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1748_c7_d068_cond,
n16_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue,
n16_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse,
n16_MUX_uxn_opcodes_h_l1748_c7_d068_return_output);

-- t16_MUX_uxn_opcodes_h_l1748_c7_d068
t16_MUX_uxn_opcodes_h_l1748_c7_d068 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1748_c7_d068_cond,
t16_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue,
t16_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse,
t16_MUX_uxn_opcodes_h_l1748_c7_d068_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1748_c7_d068
result_stack_value_MUX_uxn_opcodes_h_l1748_c7_d068 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1748_c7_d068_cond,
result_stack_value_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1748_c7_d068_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_d068
result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_d068 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_d068_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_d068_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_d068
result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_d068 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_d068_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_d068_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_d068
result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_d068 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_d068_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_d068_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_d068
result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_d068 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_d068_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_d068_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_d068
result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_d068 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_d068_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_d068_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_d068
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_d068 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_d068_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_d068_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1754_c11_398b
BIN_OP_EQ_uxn_opcodes_h_l1754_c11_398b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1754_c11_398b_left,
BIN_OP_EQ_uxn_opcodes_h_l1754_c11_398b_right,
BIN_OP_EQ_uxn_opcodes_h_l1754_c11_398b_return_output);

-- n16_MUX_uxn_opcodes_h_l1754_c7_5d19
n16_MUX_uxn_opcodes_h_l1754_c7_5d19 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1754_c7_5d19_cond,
n16_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue,
n16_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse,
n16_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output);

-- t16_MUX_uxn_opcodes_h_l1754_c7_5d19
t16_MUX_uxn_opcodes_h_l1754_c7_5d19 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1754_c7_5d19_cond,
t16_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue,
t16_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse,
t16_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1754_c7_5d19
result_stack_value_MUX_uxn_opcodes_h_l1754_c7_5d19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1754_c7_5d19_cond,
result_stack_value_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_5d19
result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_5d19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_5d19_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5d19
result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5d19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5d19_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_5d19
result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_5d19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_5d19_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5d19
result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5d19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5d19_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_5d19
result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_5d19 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_5d19_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5d19
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5d19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5d19_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1758_c11_4a48
BIN_OP_EQ_uxn_opcodes_h_l1758_c11_4a48 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1758_c11_4a48_left,
BIN_OP_EQ_uxn_opcodes_h_l1758_c11_4a48_right,
BIN_OP_EQ_uxn_opcodes_h_l1758_c11_4a48_return_output);

-- n16_MUX_uxn_opcodes_h_l1758_c7_cf47
n16_MUX_uxn_opcodes_h_l1758_c7_cf47 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1758_c7_cf47_cond,
n16_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue,
n16_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse,
n16_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output);

-- t16_MUX_uxn_opcodes_h_l1758_c7_cf47
t16_MUX_uxn_opcodes_h_l1758_c7_cf47 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1758_c7_cf47_cond,
t16_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue,
t16_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse,
t16_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1758_c7_cf47
result_stack_value_MUX_uxn_opcodes_h_l1758_c7_cf47 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1758_c7_cf47_cond,
result_stack_value_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_cf47
result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_cf47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_cf47_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_cf47
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_cf47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_cf47_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_cf47
result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_cf47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_cf47_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_cf47
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_cf47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_cf47_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_cf47
result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_cf47 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_cf47_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_cf47
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_cf47 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_cf47_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1759_c3_e9f3
BIN_OP_OR_uxn_opcodes_h_l1759_c3_e9f3 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1759_c3_e9f3_left,
BIN_OP_OR_uxn_opcodes_h_l1759_c3_e9f3_right,
BIN_OP_OR_uxn_opcodes_h_l1759_c3_e9f3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1763_c11_eb24
BIN_OP_EQ_uxn_opcodes_h_l1763_c11_eb24 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1763_c11_eb24_left,
BIN_OP_EQ_uxn_opcodes_h_l1763_c11_eb24_right,
BIN_OP_EQ_uxn_opcodes_h_l1763_c11_eb24_return_output);

-- n16_MUX_uxn_opcodes_h_l1763_c7_f827
n16_MUX_uxn_opcodes_h_l1763_c7_f827 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1763_c7_f827_cond,
n16_MUX_uxn_opcodes_h_l1763_c7_f827_iftrue,
n16_MUX_uxn_opcodes_h_l1763_c7_f827_iffalse,
n16_MUX_uxn_opcodes_h_l1763_c7_f827_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1763_c7_f827
result_stack_value_MUX_uxn_opcodes_h_l1763_c7_f827 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1763_c7_f827_cond,
result_stack_value_MUX_uxn_opcodes_h_l1763_c7_f827_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1763_c7_f827_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1763_c7_f827_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_f827
result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_f827 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_f827_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_f827_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_f827_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_f827_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f827
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f827 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f827_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f827_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f827_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f827_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_f827
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_f827 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_f827_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_f827_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_f827_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_f827_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f827
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f827 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f827_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f827_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f827_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f827_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_f827
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_f827 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_f827_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_f827_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_f827_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_f827_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f827
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f827 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f827_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f827_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f827_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f827_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1767_c11_f686
BIN_OP_EQ_uxn_opcodes_h_l1767_c11_f686 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1767_c11_f686_left,
BIN_OP_EQ_uxn_opcodes_h_l1767_c11_f686_right,
BIN_OP_EQ_uxn_opcodes_h_l1767_c11_f686_return_output);

-- n16_MUX_uxn_opcodes_h_l1767_c7_9c27
n16_MUX_uxn_opcodes_h_l1767_c7_9c27 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1767_c7_9c27_cond,
n16_MUX_uxn_opcodes_h_l1767_c7_9c27_iftrue,
n16_MUX_uxn_opcodes_h_l1767_c7_9c27_iffalse,
n16_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1767_c7_9c27
result_stack_value_MUX_uxn_opcodes_h_l1767_c7_9c27 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1767_c7_9c27_cond,
result_stack_value_MUX_uxn_opcodes_h_l1767_c7_9c27_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1767_c7_9c27_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_9c27
result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_9c27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_9c27_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_9c27_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_9c27_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_9c27
result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_9c27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_9c27_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_9c27_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_9c27_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_9c27
result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_9c27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_9c27_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_9c27_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_9c27_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_9c27
result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_9c27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_9c27_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_9c27_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_9c27_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_9c27
result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_9c27 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_9c27_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_9c27_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_9c27_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_9c27
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_9c27 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_9c27_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_9c27_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_9c27_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1773_c11_254d
BIN_OP_EQ_uxn_opcodes_h_l1773_c11_254d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1773_c11_254d_left,
BIN_OP_EQ_uxn_opcodes_h_l1773_c11_254d_right,
BIN_OP_EQ_uxn_opcodes_h_l1773_c11_254d_return_output);

-- n16_MUX_uxn_opcodes_h_l1773_c7_e0b0
n16_MUX_uxn_opcodes_h_l1773_c7_e0b0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1773_c7_e0b0_cond,
n16_MUX_uxn_opcodes_h_l1773_c7_e0b0_iftrue,
n16_MUX_uxn_opcodes_h_l1773_c7_e0b0_iffalse,
n16_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1773_c7_e0b0
result_stack_value_MUX_uxn_opcodes_h_l1773_c7_e0b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1773_c7_e0b0_cond,
result_stack_value_MUX_uxn_opcodes_h_l1773_c7_e0b0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1773_c7_e0b0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_e0b0
result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_e0b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_e0b0_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_e0b0_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_e0b0_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_e0b0
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_e0b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_e0b0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_e0b0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_e0b0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0
result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_e0b0
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_e0b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_e0b0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_e0b0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_e0b0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_e0b0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_e0b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_e0b0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_e0b0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_e0b0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b325
BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b325 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b325_left,
BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b325_right,
BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b325_return_output);

-- n16_MUX_uxn_opcodes_h_l1777_c7_be64
n16_MUX_uxn_opcodes_h_l1777_c7_be64 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1777_c7_be64_cond,
n16_MUX_uxn_opcodes_h_l1777_c7_be64_iftrue,
n16_MUX_uxn_opcodes_h_l1777_c7_be64_iffalse,
n16_MUX_uxn_opcodes_h_l1777_c7_be64_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1777_c7_be64
result_stack_value_MUX_uxn_opcodes_h_l1777_c7_be64 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1777_c7_be64_cond,
result_stack_value_MUX_uxn_opcodes_h_l1777_c7_be64_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1777_c7_be64_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1777_c7_be64_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_be64
result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_be64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_be64_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_be64_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_be64_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_be64_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_be64
result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_be64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_be64_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_be64_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_be64_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_be64_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_be64
result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_be64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_be64_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_be64_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_be64_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_be64_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_be64
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_be64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_be64_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_be64_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_be64_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_be64_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_be64
result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_be64 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_be64_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_be64_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_be64_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_be64_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_be64
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_be64 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_be64_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_be64_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_be64_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_be64_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1778_c3_bee5
BIN_OP_OR_uxn_opcodes_h_l1778_c3_bee5 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1778_c3_bee5_left,
BIN_OP_OR_uxn_opcodes_h_l1778_c3_bee5_right,
BIN_OP_OR_uxn_opcodes_h_l1778_c3_bee5_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1781_c32_d061
BIN_OP_AND_uxn_opcodes_h_l1781_c32_d061 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1781_c32_d061_left,
BIN_OP_AND_uxn_opcodes_h_l1781_c32_d061_right,
BIN_OP_AND_uxn_opcodes_h_l1781_c32_d061_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1781_c32_f21e
BIN_OP_GT_uxn_opcodes_h_l1781_c32_f21e : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1781_c32_f21e_left,
BIN_OP_GT_uxn_opcodes_h_l1781_c32_f21e_right,
BIN_OP_GT_uxn_opcodes_h_l1781_c32_f21e_return_output);

-- MUX_uxn_opcodes_h_l1781_c32_9e26
MUX_uxn_opcodes_h_l1781_c32_9e26 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1781_c32_9e26_cond,
MUX_uxn_opcodes_h_l1781_c32_9e26_iftrue,
MUX_uxn_opcodes_h_l1781_c32_9e26_iffalse,
MUX_uxn_opcodes_h_l1781_c32_9e26_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1783_c11_4ede
BIN_OP_EQ_uxn_opcodes_h_l1783_c11_4ede : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1783_c11_4ede_left,
BIN_OP_EQ_uxn_opcodes_h_l1783_c11_4ede_right,
BIN_OP_EQ_uxn_opcodes_h_l1783_c11_4ede_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5c16
result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5c16 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5c16_cond,
result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5c16_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5c16_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5c16_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5c16
result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5c16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5c16_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5c16_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5c16_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5c16_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5c16
result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5c16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5c16_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5c16_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5c16_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5c16_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5c16
result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5c16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5c16_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5c16_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5c16_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5c16_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5c16
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5c16 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5c16_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5c16_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5c16_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5c16_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1789_c11_0ad5
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_0ad5 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_0ad5_left,
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_0ad5_right,
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_0ad5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1789_c7_aecc
result_stack_value_MUX_uxn_opcodes_h_l1789_c7_aecc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1789_c7_aecc_cond,
result_stack_value_MUX_uxn_opcodes_h_l1789_c7_aecc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1789_c7_aecc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1789_c7_aecc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_aecc
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_aecc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_aecc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_aecc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_aecc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_aecc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_aecc
result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_aecc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_aecc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_aecc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_aecc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_aecc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_aecc
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_aecc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_aecc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_aecc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_aecc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_aecc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_aecc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_aecc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_aecc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_aecc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_aecc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_aecc_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1792_c34_beda
CONST_SR_8_uxn_opcodes_h_l1792_c34_beda : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1792_c34_beda_x,
CONST_SR_8_uxn_opcodes_h_l1792_c34_beda_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1794_c11_6b43
BIN_OP_EQ_uxn_opcodes_h_l1794_c11_6b43 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1794_c11_6b43_left,
BIN_OP_EQ_uxn_opcodes_h_l1794_c11_6b43_right,
BIN_OP_EQ_uxn_opcodes_h_l1794_c11_6b43_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8565
result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8565 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8565_cond,
result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8565_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8565_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8565_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8565
result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8565 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8565_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8565_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8565_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8565_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8565
result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8565 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8565_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8565_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8565_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8565_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8565
result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8565 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8565_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8565_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8565_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8565_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8565
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8565 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8565_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8565_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8565_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8565_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1800_c11_e764
BIN_OP_EQ_uxn_opcodes_h_l1800_c11_e764 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1800_c11_e764_left,
BIN_OP_EQ_uxn_opcodes_h_l1800_c11_e764_right,
BIN_OP_EQ_uxn_opcodes_h_l1800_c11_e764_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_4129
result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_4129 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_4129_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_4129_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_4129_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_4129_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_4129
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_4129 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_4129_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_4129_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_4129_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_4129_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1800_c7_4129
result_stack_value_MUX_uxn_opcodes_h_l1800_c7_4129 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1800_c7_4129_cond,
result_stack_value_MUX_uxn_opcodes_h_l1800_c7_4129_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1800_c7_4129_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1800_c7_4129_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_4129
result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_4129 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_4129_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_4129_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_4129_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_4129_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1803_c34_933f
CONST_SR_8_uxn_opcodes_h_l1803_c34_933f : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1803_c34_933f_x,
CONST_SR_8_uxn_opcodes_h_l1803_c34_933f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1805_c11_11a5
BIN_OP_EQ_uxn_opcodes_h_l1805_c11_11a5 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1805_c11_11a5_left,
BIN_OP_EQ_uxn_opcodes_h_l1805_c11_11a5_right,
BIN_OP_EQ_uxn_opcodes_h_l1805_c11_11a5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_e7bf
result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_e7bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_e7bf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_e7bf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_e7bf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_e7bf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_e7bf
result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_e7bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_e7bf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_e7bf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_e7bf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_e7bf_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_9cb0
CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_9cb0 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_9cb0_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_9cb0_return_output);



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
 n16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1736_c6_6ec7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_316b_return_output,
 n16_MUX_uxn_opcodes_h_l1736_c2_1506_return_output,
 t16_MUX_uxn_opcodes_h_l1736_c2_1506_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1736_c2_1506_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_1506_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_1506_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_1506_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_1506_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_1506_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_1506_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_1506_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1744_c11_031c_return_output,
 n16_MUX_uxn_opcodes_h_l1744_c7_046f_return_output,
 t16_MUX_uxn_opcodes_h_l1744_c7_046f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1744_c7_046f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_046f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_046f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_046f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_046f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_046f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_046f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1748_c11_a19c_return_output,
 n16_MUX_uxn_opcodes_h_l1748_c7_d068_return_output,
 t16_MUX_uxn_opcodes_h_l1748_c7_d068_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1748_c7_d068_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_d068_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_d068_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_d068_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_d068_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_d068_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_d068_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1754_c11_398b_return_output,
 n16_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output,
 t16_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1758_c11_4a48_return_output,
 n16_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output,
 t16_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1759_c3_e9f3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1763_c11_eb24_return_output,
 n16_MUX_uxn_opcodes_h_l1763_c7_f827_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1763_c7_f827_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_f827_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f827_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_f827_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f827_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_f827_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f827_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1767_c11_f686_return_output,
 n16_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1773_c11_254d_return_output,
 n16_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b325_return_output,
 n16_MUX_uxn_opcodes_h_l1777_c7_be64_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1777_c7_be64_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_be64_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_be64_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_be64_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_be64_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_be64_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_be64_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1778_c3_bee5_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1781_c32_d061_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1781_c32_f21e_return_output,
 MUX_uxn_opcodes_h_l1781_c32_9e26_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1783_c11_4ede_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5c16_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5c16_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5c16_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5c16_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5c16_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1789_c11_0ad5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1789_c7_aecc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_aecc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_aecc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_aecc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_aecc_return_output,
 CONST_SR_8_uxn_opcodes_h_l1792_c34_beda_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1794_c11_6b43_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8565_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8565_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8565_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8565_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8565_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1800_c11_e764_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_4129_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_4129_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1800_c7_4129_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_4129_return_output,
 CONST_SR_8_uxn_opcodes_h_l1803_c34_933f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1805_c11_11a5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_e7bf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_e7bf_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_9cb0_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_6ec7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_6ec7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_6ec7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_316b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_316b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_316b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_316b_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1744_c7_046f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1736_c2_1506_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1736_c2_1506_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1744_c7_046f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1736_c2_1506_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1736_c2_1506_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1744_c7_046f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c2_1506_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c2_1506_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_046f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_1506_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_1506_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_046f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_1506_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_1506_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_046f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_1506_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_1506_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_046f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_1506_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_1506_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_046f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_1506_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_1506_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1740_c3_e1c0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_046f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_1506_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_1506_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1736_c2_1506_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_1506_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_1506_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1737_c3_1d15_uxn_opcodes_h_l1737_c3_1d15_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_031c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_031c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_031c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1748_c7_d068_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1744_c7_046f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1748_c7_d068_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1744_c7_046f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1748_c7_d068_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1744_c7_046f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_d068_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_046f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_d068_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_046f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_d068_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_046f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_d068_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_046f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_d068_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_046f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1746_c3_7eed : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_d068_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_046f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_a19c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_a19c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_a19c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1748_c7_d068_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1748_c7_d068_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1748_c7_d068_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_d068_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_d068_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_d068_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_d068_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_d068_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1752_c3_9379 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_d068_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_398b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_398b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_398b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1754_c7_5d19_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1754_c7_5d19_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1754_c7_5d19_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_5d19_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5d19_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_5d19_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5d19_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_5d19_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1756_c3_f2ad : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5d19_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_4a48_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_4a48_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_4a48_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1763_c7_f827_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1758_c7_cf47_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1758_c7_cf47_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_f827_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1758_c7_cf47_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_f827_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_cf47_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f827_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_cf47_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_f827_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_cf47_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f827_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_cf47_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_f827_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_cf47_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1761_c3_6e61 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f827_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_cf47_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1759_c3_e9f3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1759_c3_e9f3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1759_c3_e9f3_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_eb24_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_eb24_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_eb24_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1763_c7_f827_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1763_c7_f827_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1763_c7_f827_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_f827_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_f827_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_f827_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_f827_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_f827_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_f827_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f827_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f827_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f827_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_f827_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_f827_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_f827_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f827_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f827_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f827_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_f827_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_f827_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_f827_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f827_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1765_c3_361c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f827_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f827_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_f686_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_f686_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_f686_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1767_c7_9c27_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1767_c7_9c27_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1767_c7_9c27_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1767_c7_9c27_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1767_c7_9c27_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1767_c7_9c27_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_9c27_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_9c27_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_9c27_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_9c27_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_9c27_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_9c27_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_9c27_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_9c27_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_9c27_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_9c27_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_9c27_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_9c27_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_9c27_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_9c27_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_9c27_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_9c27_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1771_c3_6d02 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_9c27_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_9c27_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_254d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_254d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_254d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1773_c7_e0b0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1773_c7_e0b0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1777_c7_be64_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1773_c7_e0b0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_e0b0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_e0b0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1777_c7_be64_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_e0b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_e0b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_e0b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_be64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_e0b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_e0b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_e0b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_be64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_e0b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_be64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_e0b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_e0b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_be64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_e0b0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_be64_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_e0b0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1775_c3_1059 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_e0b0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_be64_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_e0b0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b325_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b325_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b325_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1777_c7_be64_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1777_c7_be64_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1777_c7_be64_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1777_c7_be64_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1777_c7_be64_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5c16_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1777_c7_be64_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_be64_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_be64_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1777_c7_be64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_be64_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_be64_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_be64_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5c16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_be64_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_be64_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_be64_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5c16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_be64_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_be64_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_be64_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5c16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_be64_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_be64_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_be64_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_be64_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_be64_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_be64_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5c16_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_be64_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1778_c3_bee5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1778_c3_bee5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1778_c3_bee5_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1781_c32_9e26_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1781_c32_9e26_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1781_c32_9e26_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1781_c32_d061_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1781_c32_d061_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1781_c32_d061_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1781_c32_f21e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1781_c32_f21e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1781_c32_f21e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1781_c32_9e26_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_4ede_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_4ede_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_4ede_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5c16_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5c16_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1789_c7_aecc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5c16_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5c16_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5c16_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_aecc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5c16_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5c16_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5c16_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_aecc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5c16_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5c16_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5c16_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_aecc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5c16_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5c16_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1786_c3_c0f8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5c16_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_aecc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5c16_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1787_c24_b93b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_0ad5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_0ad5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_0ad5_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1789_c7_aecc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1789_c7_aecc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8565_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1789_c7_aecc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_aecc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_aecc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8565_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_aecc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_aecc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_aecc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8565_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_aecc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_aecc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_aecc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8565_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_aecc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_aecc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1791_c3_f4a7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_aecc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8565_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_aecc_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1792_c34_beda_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1792_c34_beda_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1792_c24_0914_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_6b43_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_6b43_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_6b43_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8565_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8565_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1800_c7_4129_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8565_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8565_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8565_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_4129_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8565_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8565_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8565_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8565_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8565_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8565_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_4129_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8565_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8565_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1797_c3_cf0c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8565_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_4129_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8565_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1798_c24_409a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_e764_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_e764_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_e764_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_4129_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_4129_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_e7bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_4129_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_4129_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1802_c3_695d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_4129_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_4129_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1800_c7_4129_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1800_c7_4129_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1800_c7_4129_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_4129_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_4129_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_e7bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_4129_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1803_c34_933f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1803_c34_933f_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1803_c24_1300_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1805_c11_11a5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1805_c11_11a5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1805_c11_11a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_e7bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_e7bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_e7bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_e7bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_e7bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_e7bf_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1800_l1763_DUPLICATE_aa9d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1748_l1744_l1773_l1736_l1767_l1763_l1794_DUPLICATE_74f7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1763_DUPLICATE_b4ff_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1805_l1767_l1763_DUPLICATE_2bb4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1783_l1748_l1777_l1744_l1773_l1805_l1767_l1800_l1763_l1794_DUPLICATE_d1a3_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1778_l1759_l1749_l1768_DUPLICATE_fbc3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_9cb0_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_9cb0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1800_l1777_DUPLICATE_b9b7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l1810_l1732_DUPLICATE_4c14_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_e0b0_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1781_c32_9e26_iftrue := signed(std_logic_vector(resize(to_unsigned(4, 3), 8)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5c16_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1775_c3_1059 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_e0b0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1775_c3_1059;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_6b43_right := to_unsigned(11, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8565_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_4129_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_be64_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1765_c3_361c := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f827_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1765_c3_361c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1797_c3_cf0c := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8565_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1797_c3_cf0c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_4ede_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1771_c3_6d02 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_9c27_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1771_c3_6d02;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1740_c3_e1c0 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1740_c3_e1c0;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_316b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_6ec7_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_254d_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1761_c3_6e61 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1761_c3_6e61;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_4a48_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_aecc_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_0ad5_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1752_c3_9379 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1752_c3_9379;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_e7bf_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1805_c11_11a5_right := to_unsigned(13, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1786_c3_c0f8 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5c16_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1786_c3_c0f8;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_9c27_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_be64_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b325_right := to_unsigned(8, 4);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_f827_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8565_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_e764_right := to_unsigned(12, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1802_c3_695d := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_4129_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1802_c3_695d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_a19c_right := to_unsigned(2, 2);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1781_c32_d061_right := to_unsigned(128, 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_e7bf_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1791_c3_f4a7 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_aecc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1791_c3_f4a7;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1756_c3_f2ad := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1756_c3_f2ad;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_031c_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_eb24_right := to_unsigned(5, 3);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1781_c32_f21e_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_f686_right := to_unsigned(6, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1781_c32_9e26_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5c16_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1746_c3_7eed := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1746_c3_7eed;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_398b_right := to_unsigned(3, 2);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_316b_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1781_c32_d061_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1778_c3_bee5_left := n16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1792_c34_beda_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1763_c7_f827_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1773_c7_e0b0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1777_c7_be64_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_6ec7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_031c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_a19c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_398b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_4a48_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_eb24_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_f686_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_254d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b325_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_4ede_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_0ad5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_6b43_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_e764_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1805_c11_11a5_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1759_c3_e9f3_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1803_c34_933f_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1758_c11_4a48] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1758_c11_4a48_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_4a48_left;
     BIN_OP_EQ_uxn_opcodes_h_l1758_c11_4a48_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_4a48_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_4a48_return_output := BIN_OP_EQ_uxn_opcodes_h_l1758_c11_4a48_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1800_c11_e764] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1800_c11_e764_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_e764_left;
     BIN_OP_EQ_uxn_opcodes_h_l1800_c11_e764_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_e764_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_e764_return_output := BIN_OP_EQ_uxn_opcodes_h_l1800_c11_e764_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1778_l1759_l1749_l1768_DUPLICATE_fbc3 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1778_l1759_l1749_l1768_DUPLICATE_fbc3_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1744_c11_031c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1744_c11_031c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_031c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1744_c11_031c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_031c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_031c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1744_c11_031c_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1803_c34_933f] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1803_c34_933f_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1803_c34_933f_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1803_c34_933f_return_output := CONST_SR_8_uxn_opcodes_h_l1803_c34_933f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1783_c11_4ede] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1783_c11_4ede_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_4ede_left;
     BIN_OP_EQ_uxn_opcodes_h_l1783_c11_4ede_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_4ede_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_4ede_return_output := BIN_OP_EQ_uxn_opcodes_h_l1783_c11_4ede_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1805_c11_11a5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1805_c11_11a5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1805_c11_11a5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1805_c11_11a5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1805_c11_11a5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1805_c11_11a5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1805_c11_11a5_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1736_c2_1506] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1736_c2_1506_return_output := result.is_stack_index_flipped;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l1777_c7_be64] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1777_c7_be64_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1754_c11_398b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1754_c11_398b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_398b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1754_c11_398b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_398b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_398b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1754_c11_398b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1787_c24_b93b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1787_c24_b93b_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1736_c6_6ec7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1736_c6_6ec7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_6ec7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1736_c6_6ec7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_6ec7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_6ec7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1736_c6_6ec7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1794_c11_6b43] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1794_c11_6b43_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_6b43_left;
     BIN_OP_EQ_uxn_opcodes_h_l1794_c11_6b43_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_6b43_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_6b43_return_output := BIN_OP_EQ_uxn_opcodes_h_l1794_c11_6b43_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1800_l1763_DUPLICATE_aa9d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1800_l1763_DUPLICATE_aa9d_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1805_l1767_l1763_DUPLICATE_2bb4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1805_l1767_l1763_DUPLICATE_2bb4_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1777_c11_b325] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b325_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b325_left;
     BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b325_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b325_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b325_return_output := BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b325_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1748_c11_a19c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1748_c11_a19c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_a19c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1748_c11_a19c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_a19c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_a19c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1748_c11_a19c_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1792_c34_beda] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1792_c34_beda_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1792_c34_beda_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1792_c34_beda_return_output := CONST_SR_8_uxn_opcodes_h_l1792_c34_beda_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1783_l1748_l1777_l1744_l1773_l1805_l1767_l1800_l1763_l1794_DUPLICATE_d1a3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1783_l1748_l1777_l1744_l1773_l1805_l1767_l1800_l1763_l1794_DUPLICATE_d1a3_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1800_l1777_DUPLICATE_b9b7 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1800_l1777_DUPLICATE_b9b7_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1763_DUPLICATE_b4ff LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1763_DUPLICATE_b4ff_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1763_c11_eb24] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1763_c11_eb24_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_eb24_left;
     BIN_OP_EQ_uxn_opcodes_h_l1763_c11_eb24_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_eb24_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_eb24_return_output := BIN_OP_EQ_uxn_opcodes_h_l1763_c11_eb24_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1773_c11_254d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1773_c11_254d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_254d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1773_c11_254d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_254d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_254d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1773_c11_254d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1767_c11_f686] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1767_c11_f686_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_f686_left;
     BIN_OP_EQ_uxn_opcodes_h_l1767_c11_f686_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_f686_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_f686_return_output := BIN_OP_EQ_uxn_opcodes_h_l1767_c11_f686_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1798_c24_409a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1798_c24_409a_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1789_c11_0ad5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1789_c11_0ad5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_0ad5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1789_c11_0ad5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_0ad5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_0ad5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1789_c11_0ad5_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1781_c32_d061] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1781_c32_d061_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1781_c32_d061_left;
     BIN_OP_AND_uxn_opcodes_h_l1781_c32_d061_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1781_c32_d061_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1781_c32_d061_return_output := BIN_OP_AND_uxn_opcodes_h_l1781_c32_d061_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1748_l1744_l1773_l1736_l1767_l1763_l1794_DUPLICATE_74f7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1748_l1744_l1773_l1736_l1767_l1763_l1794_DUPLICATE_74f7_return_output := result.is_sp_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1781_c32_f21e_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1781_c32_d061_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_316b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_6ec7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1736_c2_1506_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_6ec7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_1506_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_6ec7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_1506_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_6ec7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_1506_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_6ec7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_1506_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_6ec7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_1506_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_6ec7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_1506_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_6ec7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_1506_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_6ec7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c2_1506_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_6ec7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1736_c2_1506_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_6ec7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1744_c7_046f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_031c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_046f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_031c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_046f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_031c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_046f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_031c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_046f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_031c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_046f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_031c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_046f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_031c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1744_c7_046f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_031c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1744_c7_046f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_031c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1748_c7_d068_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_a19c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_d068_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_a19c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_d068_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_a19c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_d068_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_a19c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_d068_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_a19c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_d068_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_a19c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_d068_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_a19c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1748_c7_d068_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_a19c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1748_c7_d068_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_a19c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1754_c7_5d19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_398b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5d19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_398b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_5d19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_398b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_5d19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_398b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5d19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_398b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_5d19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_398b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5d19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_398b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1754_c7_5d19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_398b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1754_c7_5d19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_398b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1758_c7_cf47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_4a48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_cf47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_4a48_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_cf47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_4a48_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_cf47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_4a48_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_cf47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_4a48_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_cf47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_4a48_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_cf47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_4a48_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1758_c7_cf47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_4a48_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1758_c7_cf47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_4a48_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1763_c7_f827_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_eb24_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f827_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_eb24_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_f827_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_eb24_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_f827_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_eb24_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f827_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_eb24_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_f827_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_eb24_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f827_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_eb24_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_f827_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_eb24_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1767_c7_9c27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_f686_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_9c27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_f686_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_9c27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_f686_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_9c27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_f686_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_9c27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_f686_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_9c27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_f686_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_9c27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_f686_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1767_c7_9c27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_f686_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1773_c7_e0b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_254d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_e0b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_254d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_254d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_e0b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_254d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_e0b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_254d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_254d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_e0b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_254d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_e0b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_254d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1777_c7_be64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b325_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_be64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b325_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_be64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b325_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_be64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b325_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_be64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b325_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_be64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b325_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_be64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b325_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1777_c7_be64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b325_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5c16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_4ede_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5c16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_4ede_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5c16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_4ede_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5c16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_4ede_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5c16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_4ede_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_aecc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_0ad5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_aecc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_0ad5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_aecc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_0ad5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_aecc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_0ad5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1789_c7_aecc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_0ad5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8565_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_6b43_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8565_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_6b43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8565_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_6b43_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8565_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_6b43_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8565_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_6b43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_4129_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_e764_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_4129_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_e764_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_4129_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_e764_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1800_c7_4129_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_e764_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_e7bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1805_c11_11a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_e7bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1805_c11_11a5_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1759_c3_e9f3_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1778_l1759_l1749_l1768_DUPLICATE_fbc3_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1778_c3_bee5_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1778_l1759_l1749_l1768_DUPLICATE_fbc3_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_9cb0_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1778_l1759_l1749_l1768_DUPLICATE_fbc3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5c16_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1787_c24_b93b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8565_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1798_c24_409a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1763_DUPLICATE_b4ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1763_DUPLICATE_b4ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1763_DUPLICATE_b4ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1763_DUPLICATE_b4ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1763_DUPLICATE_b4ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_f827_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1763_DUPLICATE_b4ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_9c27_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1763_DUPLICATE_b4ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1763_DUPLICATE_b4ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_be64_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1763_DUPLICATE_b4ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1783_l1748_l1777_l1744_l1773_l1805_l1767_l1800_l1763_l1794_DUPLICATE_d1a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1783_l1748_l1777_l1744_l1773_l1805_l1767_l1800_l1763_l1794_DUPLICATE_d1a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1783_l1748_l1777_l1744_l1773_l1805_l1767_l1800_l1763_l1794_DUPLICATE_d1a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1783_l1748_l1777_l1744_l1773_l1805_l1767_l1800_l1763_l1794_DUPLICATE_d1a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f827_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1783_l1748_l1777_l1744_l1773_l1805_l1767_l1800_l1763_l1794_DUPLICATE_d1a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_9c27_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1783_l1748_l1777_l1744_l1773_l1805_l1767_l1800_l1763_l1794_DUPLICATE_d1a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_e0b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1783_l1748_l1777_l1744_l1773_l1805_l1767_l1800_l1763_l1794_DUPLICATE_d1a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_be64_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1783_l1748_l1777_l1744_l1773_l1805_l1767_l1800_l1763_l1794_DUPLICATE_d1a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5c16_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1783_l1748_l1777_l1744_l1773_l1805_l1767_l1800_l1763_l1794_DUPLICATE_d1a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_aecc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1783_l1748_l1777_l1744_l1773_l1805_l1767_l1800_l1763_l1794_DUPLICATE_d1a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8565_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1783_l1748_l1777_l1744_l1773_l1805_l1767_l1800_l1763_l1794_DUPLICATE_d1a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_4129_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1783_l1748_l1777_l1744_l1773_l1805_l1767_l1800_l1763_l1794_DUPLICATE_d1a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_e7bf_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1783_l1748_l1777_l1744_l1773_l1805_l1767_l1800_l1763_l1794_DUPLICATE_d1a3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1748_l1744_l1773_l1736_l1767_l1763_l1794_DUPLICATE_74f7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1748_l1744_l1773_l1736_l1767_l1763_l1794_DUPLICATE_74f7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1748_l1744_l1773_l1736_l1767_l1763_l1794_DUPLICATE_74f7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1748_l1744_l1773_l1736_l1767_l1763_l1794_DUPLICATE_74f7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1748_l1744_l1773_l1736_l1767_l1763_l1794_DUPLICATE_74f7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_f827_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1748_l1744_l1773_l1736_l1767_l1763_l1794_DUPLICATE_74f7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_9c27_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1748_l1744_l1773_l1736_l1767_l1763_l1794_DUPLICATE_74f7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1748_l1744_l1773_l1736_l1767_l1763_l1794_DUPLICATE_74f7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_aecc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1748_l1744_l1773_l1736_l1767_l1763_l1794_DUPLICATE_74f7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8565_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1748_l1744_l1773_l1736_l1767_l1763_l1794_DUPLICATE_74f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1805_l1767_l1763_DUPLICATE_2bb4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1805_l1767_l1763_DUPLICATE_2bb4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1805_l1767_l1763_DUPLICATE_2bb4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1805_l1767_l1763_DUPLICATE_2bb4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f827_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1805_l1767_l1763_DUPLICATE_2bb4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_9c27_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1805_l1767_l1763_DUPLICATE_2bb4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_e0b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1805_l1767_l1763_DUPLICATE_2bb4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_be64_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1805_l1767_l1763_DUPLICATE_2bb4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_e7bf_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1805_l1767_l1763_DUPLICATE_2bb4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_be64_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1800_l1777_DUPLICATE_b9b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_4129_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1800_l1777_DUPLICATE_b9b7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1800_l1763_DUPLICATE_aa9d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1800_l1763_DUPLICATE_aa9d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1800_l1763_DUPLICATE_aa9d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1800_l1763_DUPLICATE_aa9d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1800_l1763_DUPLICATE_aa9d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_f827_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1800_l1763_DUPLICATE_aa9d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1767_c7_9c27_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1800_l1763_DUPLICATE_aa9d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_e0b0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1800_l1763_DUPLICATE_aa9d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1777_c7_be64_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1800_l1763_DUPLICATE_aa9d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1800_c7_4129_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1800_l1763_DUPLICATE_aa9d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1736_c2_1506_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_be64_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1777_c7_be64_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1777_c7_be64] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_be64_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_be64_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_be64_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_be64_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_be64_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_be64_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_be64_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_be64_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1781_c32_f21e] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1781_c32_f21e_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1781_c32_f21e_left;
     BIN_OP_GT_uxn_opcodes_h_l1781_c32_f21e_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1781_c32_f21e_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1781_c32_f21e_return_output := BIN_OP_GT_uxn_opcodes_h_l1781_c32_f21e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1736_c1_316b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_316b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_316b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_316b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_316b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_316b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_316b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_316b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_316b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1800_c7_4129] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_4129_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_4129_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_4129_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_4129_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_4129_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_4129_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_4129_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_4129_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1759_c3_e9f3] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1759_c3_e9f3_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1759_c3_e9f3_left;
     BIN_OP_OR_uxn_opcodes_h_l1759_c3_e9f3_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1759_c3_e9f3_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1759_c3_e9f3_return_output := BIN_OP_OR_uxn_opcodes_h_l1759_c3_e9f3_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1778_c3_bee5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1778_c3_bee5_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1778_c3_bee5_left;
     BIN_OP_OR_uxn_opcodes_h_l1778_c3_bee5_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1778_c3_bee5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1778_c3_bee5_return_output := BIN_OP_OR_uxn_opcodes_h_l1778_c3_bee5_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1792_c24_0914] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1792_c24_0914_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1792_c34_beda_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1805_c7_e7bf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_e7bf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_e7bf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_e7bf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_e7bf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_e7bf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_e7bf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_e7bf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_e7bf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1805_c7_e7bf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_e7bf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_e7bf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_e7bf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_e7bf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_e7bf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_e7bf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_e7bf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_e7bf_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1736_c2_1506] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_1506_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_1506_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_1506_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_1506_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_9cb0 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_9cb0_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_9cb0_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_9cb0_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_9cb0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1794_c7_8565] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8565_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8565_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8565_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8565_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8565_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8565_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8565_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8565_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1803_c24_1300] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1803_c24_1300_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1803_c34_933f_return_output);

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1781_c32_9e26_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1781_c32_f21e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1759_c3_e9f3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1777_c7_be64_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1778_c3_bee5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1789_c7_aecc_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1792_c24_0914_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1800_c7_4129_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1803_c24_1300_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1767_c7_9c27_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_9cb0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_9cb0_return_output;
     VAR_printf_uxn_opcodes_h_l1737_c3_1d15_uxn_opcodes_h_l1737_c3_1d15_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_316b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_4129_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_e7bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_aecc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8565_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_e0b0_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_be64_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_4129_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_e7bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8565_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_4129_return_output;
     -- n16_MUX[uxn_opcodes_h_l1777_c7_be64] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1777_c7_be64_cond <= VAR_n16_MUX_uxn_opcodes_h_l1777_c7_be64_cond;
     n16_MUX_uxn_opcodes_h_l1777_c7_be64_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1777_c7_be64_iftrue;
     n16_MUX_uxn_opcodes_h_l1777_c7_be64_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1777_c7_be64_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1777_c7_be64_return_output := n16_MUX_uxn_opcodes_h_l1777_c7_be64_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1773_c7_e0b0] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_e0b0_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_e0b0_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_e0b0_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_e0b0_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_e0b0_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_e0b0_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1800_c7_4129] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_4129_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_4129_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_4129_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_4129_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_4129_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_4129_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_4129_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_4129_return_output;

     -- t16_MUX[uxn_opcodes_h_l1758_c7_cf47] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1758_c7_cf47_cond <= VAR_t16_MUX_uxn_opcodes_h_l1758_c7_cf47_cond;
     t16_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue;
     t16_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output := t16_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output;

     -- MUX[uxn_opcodes_h_l1781_c32_9e26] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1781_c32_9e26_cond <= VAR_MUX_uxn_opcodes_h_l1781_c32_9e26_cond;
     MUX_uxn_opcodes_h_l1781_c32_9e26_iftrue <= VAR_MUX_uxn_opcodes_h_l1781_c32_9e26_iftrue;
     MUX_uxn_opcodes_h_l1781_c32_9e26_iffalse <= VAR_MUX_uxn_opcodes_h_l1781_c32_9e26_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1781_c32_9e26_return_output := MUX_uxn_opcodes_h_l1781_c32_9e26_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1800_c7_4129] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1800_c7_4129_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1800_c7_4129_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1800_c7_4129_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1800_c7_4129_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1800_c7_4129_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1800_c7_4129_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1800_c7_4129_return_output := result_stack_value_MUX_uxn_opcodes_h_l1800_c7_4129_return_output;

     -- printf_uxn_opcodes_h_l1737_c3_1d15[uxn_opcodes_h_l1737_c3_1d15] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1737_c3_1d15_uxn_opcodes_h_l1737_c3_1d15_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1737_c3_1d15_uxn_opcodes_h_l1737_c3_1d15_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1794_c7_8565] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8565_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8565_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8565_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8565_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8565_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8565_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8565_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8565_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1789_c7_aecc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_aecc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_aecc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_aecc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_aecc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_aecc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_aecc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_aecc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_aecc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1800_c7_4129] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_4129_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_4129_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_4129_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_4129_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_4129_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_4129_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_4129_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_4129_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_be64_iftrue := VAR_MUX_uxn_opcodes_h_l1781_c32_9e26_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1773_c7_e0b0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1777_c7_be64_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8565_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_4129_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5c16_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_aecc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_9c27_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8565_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_4129_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_aecc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8565_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8565_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1800_c7_4129_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1767_c7_9c27] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_9c27_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_9c27_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_9c27_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_9c27_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_9c27_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_9c27_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1794_c7_8565] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8565_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8565_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8565_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8565_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8565_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8565_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8565_return_output := result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8565_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1783_c7_5c16] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5c16_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5c16_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5c16_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5c16_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5c16_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5c16_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5c16_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5c16_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1794_c7_8565] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8565_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8565_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8565_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8565_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8565_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8565_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8565_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8565_return_output;

     -- t16_MUX[uxn_opcodes_h_l1754_c7_5d19] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1754_c7_5d19_cond <= VAR_t16_MUX_uxn_opcodes_h_l1754_c7_5d19_cond;
     t16_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue;
     t16_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output := t16_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1794_c7_8565] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8565_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8565_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8565_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8565_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8565_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8565_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8565_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8565_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1777_c7_be64] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_be64_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_be64_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_be64_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_be64_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_be64_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_be64_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_be64_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_be64_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1789_c7_aecc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_aecc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_aecc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_aecc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_aecc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_aecc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_aecc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_aecc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_aecc_return_output;

     -- n16_MUX[uxn_opcodes_h_l1773_c7_e0b0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1773_c7_e0b0_cond <= VAR_n16_MUX_uxn_opcodes_h_l1773_c7_e0b0_cond;
     n16_MUX_uxn_opcodes_h_l1773_c7_e0b0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1773_c7_e0b0_iftrue;
     n16_MUX_uxn_opcodes_h_l1773_c7_e0b0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1773_c7_e0b0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output := n16_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1767_c7_9c27_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_aecc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8565_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_be64_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5c16_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_f827_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_aecc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8565_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_be64_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5c16_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_aecc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1789_c7_aecc_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8565_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1789_c7_aecc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_aecc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_aecc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_aecc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_aecc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_aecc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_aecc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_aecc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_aecc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1789_c7_aecc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_aecc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_aecc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_aecc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_aecc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_aecc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_aecc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_aecc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_aecc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1789_c7_aecc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1789_c7_aecc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1789_c7_aecc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1789_c7_aecc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1789_c7_aecc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1789_c7_aecc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1789_c7_aecc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1789_c7_aecc_return_output := result_stack_value_MUX_uxn_opcodes_h_l1789_c7_aecc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1783_c7_5c16] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5c16_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5c16_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5c16_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5c16_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5c16_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5c16_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5c16_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5c16_return_output;

     -- t16_MUX[uxn_opcodes_h_l1748_c7_d068] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1748_c7_d068_cond <= VAR_t16_MUX_uxn_opcodes_h_l1748_c7_d068_cond;
     t16_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue;
     t16_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1748_c7_d068_return_output := t16_MUX_uxn_opcodes_h_l1748_c7_d068_return_output;

     -- n16_MUX[uxn_opcodes_h_l1767_c7_9c27] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1767_c7_9c27_cond <= VAR_n16_MUX_uxn_opcodes_h_l1767_c7_9c27_cond;
     n16_MUX_uxn_opcodes_h_l1767_c7_9c27_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1767_c7_9c27_iftrue;
     n16_MUX_uxn_opcodes_h_l1767_c7_9c27_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1767_c7_9c27_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output := n16_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1777_c7_be64] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_be64_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_be64_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_be64_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_be64_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_be64_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_be64_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_be64_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_be64_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1773_c7_e0b0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1763_c7_f827] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_f827_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_f827_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_f827_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_f827_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_f827_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_f827_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_f827_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_f827_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1763_c7_f827_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5c16_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_aecc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_be64_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_f827_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5c16_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_aecc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_9c27_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_be64_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5c16_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5c16_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1789_c7_aecc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1748_c7_d068_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1758_c7_cf47] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_cf47_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_cf47_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output;

     -- t16_MUX[uxn_opcodes_h_l1744_c7_046f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1744_c7_046f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1744_c7_046f_cond;
     t16_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue;
     t16_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1744_c7_046f_return_output := t16_MUX_uxn_opcodes_h_l1744_c7_046f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1777_c7_be64] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_be64_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_be64_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_be64_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_be64_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_be64_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_be64_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_be64_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_be64_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1773_c7_e0b0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1767_c7_9c27] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_9c27_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_9c27_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_9c27_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_9c27_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_9c27_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_9c27_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1783_c7_5c16] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5c16_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5c16_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5c16_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5c16_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5c16_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5c16_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5c16_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5c16_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1783_c7_5c16] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5c16_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5c16_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5c16_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5c16_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5c16_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5c16_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5c16_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5c16_return_output;

     -- n16_MUX[uxn_opcodes_h_l1763_c7_f827] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1763_c7_f827_cond <= VAR_n16_MUX_uxn_opcodes_h_l1763_c7_f827_cond;
     n16_MUX_uxn_opcodes_h_l1763_c7_f827_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1763_c7_f827_iftrue;
     n16_MUX_uxn_opcodes_h_l1763_c7_f827_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1763_c7_f827_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1763_c7_f827_return_output := n16_MUX_uxn_opcodes_h_l1763_c7_f827_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1783_c7_5c16] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5c16_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5c16_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5c16_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5c16_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5c16_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5c16_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5c16_return_output := result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5c16_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1763_c7_f827_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_be64_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5c16_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_9c27_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_be64_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5c16_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_f827_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_e0b0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_be64_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1777_c7_be64_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5c16_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1744_c7_046f_return_output;
     -- t16_MUX[uxn_opcodes_h_l1736_c2_1506] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1736_c2_1506_cond <= VAR_t16_MUX_uxn_opcodes_h_l1736_c2_1506_cond;
     t16_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue;
     t16_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1736_c2_1506_return_output := t16_MUX_uxn_opcodes_h_l1736_c2_1506_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1767_c7_9c27] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_9c27_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_9c27_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_9c27_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_9c27_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_9c27_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_9c27_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1773_c7_e0b0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_e0b0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_e0b0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_e0b0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_e0b0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_e0b0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_e0b0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output;

     -- n16_MUX[uxn_opcodes_h_l1758_c7_cf47] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1758_c7_cf47_cond <= VAR_n16_MUX_uxn_opcodes_h_l1758_c7_cf47_cond;
     n16_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue;
     n16_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output := n16_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1754_c7_5d19] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_5d19_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_5d19_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1763_c7_f827] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_f827_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_f827_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_f827_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_f827_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_f827_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_f827_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_f827_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_f827_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1777_c7_be64] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_be64_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_be64_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_be64_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_be64_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_be64_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_be64_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_be64_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_be64_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1777_c7_be64] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1777_c7_be64_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1777_c7_be64_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1777_c7_be64_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1777_c7_be64_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1777_c7_be64_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1777_c7_be64_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1777_c7_be64_return_output := result_stack_value_MUX_uxn_opcodes_h_l1777_c7_be64_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1777_c7_be64] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_be64_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_be64_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_be64_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_be64_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_be64_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_be64_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_be64_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_be64_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_e0b0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_be64_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_f827_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_e0b0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_be64_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_f827_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_9c27_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_e0b0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1777_c7_be64_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1736_c2_1506_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1758_c7_cf47] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_cf47_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_cf47_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1763_c7_f827] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_f827_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_f827_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_f827_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_f827_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_f827_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_f827_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_f827_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_f827_return_output;

     -- n16_MUX[uxn_opcodes_h_l1754_c7_5d19] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1754_c7_5d19_cond <= VAR_n16_MUX_uxn_opcodes_h_l1754_c7_5d19_cond;
     n16_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue;
     n16_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output := n16_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1773_c7_e0b0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_e0b0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_e0b0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_e0b0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_e0b0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_e0b0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_e0b0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1767_c7_9c27] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_9c27_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_9c27_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_9c27_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_9c27_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_9c27_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_9c27_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1773_c7_e0b0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_e0b0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_e0b0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_e0b0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_e0b0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_e0b0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_e0b0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1748_c7_d068] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_d068_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_d068_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_d068_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_d068_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1773_c7_e0b0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1773_c7_e0b0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_e0b0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1773_c7_e0b0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_e0b0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1773_c7_e0b0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_e0b0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output := result_stack_value_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_9c27_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_f827_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_d068_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_9c27_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f827_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1767_c7_9c27_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_e0b0_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1767_c7_9c27] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_9c27_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_9c27_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_9c27_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_9c27_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_9c27_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_9c27_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output;

     -- n16_MUX[uxn_opcodes_h_l1748_c7_d068] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1748_c7_d068_cond <= VAR_n16_MUX_uxn_opcodes_h_l1748_c7_d068_cond;
     n16_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue;
     n16_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1748_c7_d068_return_output := n16_MUX_uxn_opcodes_h_l1748_c7_d068_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1763_c7_f827] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f827_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f827_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f827_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f827_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f827_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f827_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f827_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f827_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1754_c7_5d19] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_5d19_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_5d19_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1767_c7_9c27] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_9c27_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_9c27_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_9c27_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_9c27_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_9c27_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_9c27_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1758_c7_cf47] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_cf47_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_cf47_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1767_c7_9c27] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1767_c7_9c27_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1767_c7_9c27_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1767_c7_9c27_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1767_c7_9c27_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1767_c7_9c27_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1767_c7_9c27_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output := result_stack_value_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1744_c7_046f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_046f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_046f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_046f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_046f_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1748_c7_d068_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f827_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_046f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f827_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f827_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_f827_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1767_c7_9c27_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1736_c2_1506] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_1506_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_1506_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_1506_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_1506_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1758_c7_cf47] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_cf47_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_cf47_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1748_c7_d068] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_d068_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_d068_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_d068_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_d068_return_output;

     -- n16_MUX[uxn_opcodes_h_l1744_c7_046f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1744_c7_046f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1744_c7_046f_cond;
     n16_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue;
     n16_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1744_c7_046f_return_output := n16_MUX_uxn_opcodes_h_l1744_c7_046f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1763_c7_f827] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f827_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f827_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f827_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f827_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f827_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f827_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f827_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f827_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1763_c7_f827] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1763_c7_f827_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_f827_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1763_c7_f827_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_f827_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1763_c7_f827_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_f827_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_f827_return_output := result_stack_value_MUX_uxn_opcodes_h_l1763_c7_f827_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1754_c7_5d19] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_5d19_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_5d19_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1763_c7_f827] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f827_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f827_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f827_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f827_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f827_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f827_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f827_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f827_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1744_c7_046f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f827_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f827_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_d068_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_f827_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1754_c7_5d19] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5d19_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5d19_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1748_c7_d068] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_d068_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_d068_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_d068_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_d068_return_output;

     -- n16_MUX[uxn_opcodes_h_l1736_c2_1506] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1736_c2_1506_cond <= VAR_n16_MUX_uxn_opcodes_h_l1736_c2_1506_cond;
     n16_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue;
     n16_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1736_c2_1506_return_output := n16_MUX_uxn_opcodes_h_l1736_c2_1506_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1758_c7_cf47] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1758_c7_cf47_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1758_c7_cf47_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output := result_stack_value_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1744_c7_046f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_046f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_046f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_046f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_046f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1758_c7_cf47] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_cf47_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_cf47_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1758_c7_cf47] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_cf47_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_cf47_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_cf47_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_cf47_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1736_c2_1506_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_d068_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_046f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1758_c7_cf47_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1754_c7_5d19] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1754_c7_5d19_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1754_c7_5d19_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output := result_stack_value_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1744_c7_046f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_046f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_046f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_046f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_046f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1754_c7_5d19] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5d19_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5d19_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1736_c2_1506] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_1506_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_1506_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_1506_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_1506_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1754_c7_5d19] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5d19_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5d19_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5d19_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5d19_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1748_c7_d068] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_d068_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_d068_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_d068_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_d068_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_046f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_d068_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1754_c7_5d19_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1748_c7_d068] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_d068_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_d068_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_d068_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_d068_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1744_c7_046f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_046f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_046f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_046f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_046f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1748_c7_d068] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1748_c7_d068_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1748_c7_d068_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1748_c7_d068_return_output := result_stack_value_MUX_uxn_opcodes_h_l1748_c7_d068_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1748_c7_d068] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_d068_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_d068_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_d068_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_d068_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_d068_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_d068_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1736_c2_1506] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_1506_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_1506_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_1506_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_1506_return_output;

     -- Submodule level 13
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_d068_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_d068_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_046f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1748_c7_d068_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1736_c2_1506] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_1506_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_1506_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_1506_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_1506_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1744_c7_046f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_046f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_046f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_046f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_046f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1744_c7_046f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1744_c7_046f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1744_c7_046f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1744_c7_046f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1744_c7_046f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1744_c7_046f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_046f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_046f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_046f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_046f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_046f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_046f_return_output;

     -- Submodule level 14
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_046f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_046f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1744_c7_046f_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1736_c2_1506] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1736_c2_1506_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c2_1506_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c2_1506_return_output := result_stack_value_MUX_uxn_opcodes_h_l1736_c2_1506_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1736_c2_1506] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_1506_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_1506_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_1506_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_1506_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1736_c2_1506] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_1506_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_1506_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_1506_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_1506_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_1506_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_1506_return_output;

     -- Submodule level 15
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l1810_l1732_DUPLICATE_4c14 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l1810_l1732_DUPLICATE_4c14_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_81ab(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c2_1506_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_1506_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_1506_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_1506_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_1506_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_1506_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_1506_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_1506_return_output);

     -- Submodule level 16
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l1810_l1732_DUPLICATE_4c14_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l1810_l1732_DUPLICATE_4c14_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
