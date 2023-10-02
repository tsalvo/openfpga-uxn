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
-- BIN_OP_EQ[uxn_opcodes_h_l1736_c6_71fe]
signal BIN_OP_EQ_uxn_opcodes_h_l1736_c6_71fe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1736_c6_71fe_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1736_c6_71fe_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1736_c1_4a9c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_4a9c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_4a9c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_4a9c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_4a9c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1736_c2_bb61]
signal t16_MUX_uxn_opcodes_h_l1736_c2_bb61_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1736_c2_bb61]
signal n16_MUX_uxn_opcodes_h_l1736_c2_bb61_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1736_c2_bb61]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_bb61_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1736_c2_bb61]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_bb61_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1736_c2_bb61]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_bb61_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1736_c2_bb61]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_bb61_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1736_c2_bb61]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_bb61_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1736_c2_bb61]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_bb61_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1736_c2_bb61]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_bb61_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1736_c2_bb61]
signal result_stack_value_MUX_uxn_opcodes_h_l1736_c2_bb61_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1737_c3_79e5[uxn_opcodes_h_l1737_c3_79e5]
signal printf_uxn_opcodes_h_l1737_c3_79e5_uxn_opcodes_h_l1737_c3_79e5_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1744_c11_8708]
signal BIN_OP_EQ_uxn_opcodes_h_l1744_c11_8708_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1744_c11_8708_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1744_c11_8708_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1744_c7_434a]
signal t16_MUX_uxn_opcodes_h_l1744_c7_434a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1744_c7_434a_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1744_c7_434a]
signal n16_MUX_uxn_opcodes_h_l1744_c7_434a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1744_c7_434a_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1744_c7_434a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_434a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_434a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1744_c7_434a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_434a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_434a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1744_c7_434a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_434a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_434a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1744_c7_434a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_434a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_434a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1744_c7_434a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_434a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_434a_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1744_c7_434a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_434a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_434a_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1744_c7_434a]
signal result_stack_value_MUX_uxn_opcodes_h_l1744_c7_434a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1744_c7_434a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1748_c11_0781]
signal BIN_OP_EQ_uxn_opcodes_h_l1748_c11_0781_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1748_c11_0781_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1748_c11_0781_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1748_c7_988f]
signal t16_MUX_uxn_opcodes_h_l1748_c7_988f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1748_c7_988f_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1748_c7_988f]
signal n16_MUX_uxn_opcodes_h_l1748_c7_988f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1748_c7_988f_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1748_c7_988f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_988f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_988f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1748_c7_988f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_988f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_988f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1748_c7_988f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_988f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_988f_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1748_c7_988f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_988f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_988f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1748_c7_988f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_988f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_988f_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1748_c7_988f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_988f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_988f_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1748_c7_988f]
signal result_stack_value_MUX_uxn_opcodes_h_l1748_c7_988f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1748_c7_988f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1754_c11_5cd0]
signal BIN_OP_EQ_uxn_opcodes_h_l1754_c11_5cd0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1754_c11_5cd0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1754_c11_5cd0_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1754_c7_6f4b]
signal t16_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1754_c7_6f4b]
signal n16_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1754_c7_6f4b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1754_c7_6f4b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1754_c7_6f4b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1754_c7_6f4b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1754_c7_6f4b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1754_c7_6f4b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1754_c7_6f4b]
signal result_stack_value_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1758_c11_f31f]
signal BIN_OP_EQ_uxn_opcodes_h_l1758_c11_f31f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1758_c11_f31f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1758_c11_f31f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1758_c7_0ba5]
signal t16_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1758_c7_0ba5]
signal n16_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1758_c7_0ba5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1758_c7_0ba5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1758_c7_0ba5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1758_c7_0ba5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1758_c7_0ba5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1758_c7_0ba5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1758_c7_0ba5]
signal result_stack_value_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1759_c3_b833]
signal BIN_OP_OR_uxn_opcodes_h_l1759_c3_b833_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1759_c3_b833_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1759_c3_b833_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1763_c11_83fe]
signal BIN_OP_EQ_uxn_opcodes_h_l1763_c11_83fe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1763_c11_83fe_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1763_c11_83fe_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1763_c7_4ffb]
signal n16_MUX_uxn_opcodes_h_l1763_c7_4ffb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1763_c7_4ffb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1763_c7_4ffb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1763_c7_4ffb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1763_c7_4ffb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4ffb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4ffb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4ffb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1763_c7_4ffb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4ffb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4ffb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4ffb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1763_c7_4ffb]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_4ffb_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_4ffb_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_4ffb_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1763_c7_4ffb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1763_c7_4ffb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4ffb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4ffb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4ffb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1763_c7_4ffb]
signal result_stack_value_MUX_uxn_opcodes_h_l1763_c7_4ffb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1763_c7_4ffb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1763_c7_4ffb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1767_c11_abda]
signal BIN_OP_EQ_uxn_opcodes_h_l1767_c11_abda_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1767_c11_abda_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1767_c11_abda_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1767_c7_608b]
signal n16_MUX_uxn_opcodes_h_l1767_c7_608b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1767_c7_608b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1767_c7_608b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1767_c7_608b_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1767_c7_608b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_608b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_608b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_608b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_608b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1767_c7_608b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_608b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_608b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_608b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_608b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1767_c7_608b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_608b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_608b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_608b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_608b_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1767_c7_608b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_608b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_608b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_608b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_608b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1767_c7_608b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_608b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_608b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_608b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_608b_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1767_c7_608b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_608b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_608b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_608b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_608b_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1767_c7_608b]
signal result_stack_value_MUX_uxn_opcodes_h_l1767_c7_608b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1767_c7_608b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1767_c7_608b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1767_c7_608b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1773_c11_95ee]
signal BIN_OP_EQ_uxn_opcodes_h_l1773_c11_95ee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1773_c11_95ee_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1773_c11_95ee_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1773_c7_d707]
signal n16_MUX_uxn_opcodes_h_l1773_c7_d707_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1773_c7_d707_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1773_c7_d707_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1773_c7_d707_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1773_c7_d707]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_d707_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_d707_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_d707_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_d707_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1773_c7_d707]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_d707_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_d707_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_d707_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_d707_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1773_c7_d707]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_d707_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_d707_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_d707_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_d707_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1773_c7_d707]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_d707_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_d707_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_d707_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_d707_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1773_c7_d707]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_d707_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_d707_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_d707_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_d707_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1773_c7_d707]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_d707_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_d707_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_d707_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_d707_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1773_c7_d707]
signal result_stack_value_MUX_uxn_opcodes_h_l1773_c7_d707_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1773_c7_d707_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1773_c7_d707_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1773_c7_d707_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1777_c11_f339]
signal BIN_OP_EQ_uxn_opcodes_h_l1777_c11_f339_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1777_c11_f339_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1777_c11_f339_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1777_c7_3792]
signal n16_MUX_uxn_opcodes_h_l1777_c7_3792_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1777_c7_3792_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1777_c7_3792_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1777_c7_3792_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1777_c7_3792]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3792_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3792_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3792_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3792_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1777_c7_3792]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3792_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3792_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3792_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3792_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1777_c7_3792]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3792_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3792_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3792_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3792_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1777_c7_3792]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3792_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3792_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3792_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3792_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1777_c7_3792]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3792_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3792_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3792_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3792_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1777_c7_3792]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3792_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3792_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3792_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3792_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1777_c7_3792]
signal result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3792_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3792_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3792_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3792_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1778_c3_09e7]
signal BIN_OP_OR_uxn_opcodes_h_l1778_c3_09e7_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1778_c3_09e7_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1778_c3_09e7_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1781_c32_42c4]
signal BIN_OP_AND_uxn_opcodes_h_l1781_c32_42c4_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1781_c32_42c4_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1781_c32_42c4_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1781_c32_f30d]
signal BIN_OP_GT_uxn_opcodes_h_l1781_c32_f30d_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1781_c32_f30d_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1781_c32_f30d_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1781_c32_441c]
signal MUX_uxn_opcodes_h_l1781_c32_441c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1781_c32_441c_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1781_c32_441c_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1781_c32_441c_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1783_c11_64bc]
signal BIN_OP_EQ_uxn_opcodes_h_l1783_c11_64bc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1783_c11_64bc_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1783_c11_64bc_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1783_c7_3ef3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_3ef3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_3ef3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_3ef3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_3ef3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1783_c7_3ef3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_3ef3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_3ef3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_3ef3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_3ef3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1783_c7_3ef3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_3ef3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_3ef3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_3ef3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_3ef3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1783_c7_3ef3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_3ef3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_3ef3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_3ef3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_3ef3_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1783_c7_3ef3]
signal result_stack_value_MUX_uxn_opcodes_h_l1783_c7_3ef3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1783_c7_3ef3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1783_c7_3ef3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1783_c7_3ef3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1789_c11_2219]
signal BIN_OP_EQ_uxn_opcodes_h_l1789_c11_2219_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1789_c11_2219_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1789_c11_2219_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1789_c7_e058]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_e058_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_e058_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_e058_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_e058_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1789_c7_e058]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_e058_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_e058_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_e058_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_e058_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1789_c7_e058]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_e058_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_e058_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_e058_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_e058_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1789_c7_e058]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_e058_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_e058_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_e058_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_e058_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1789_c7_e058]
signal result_stack_value_MUX_uxn_opcodes_h_l1789_c7_e058_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1789_c7_e058_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1789_c7_e058_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1789_c7_e058_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1792_c34_cbb9]
signal CONST_SR_8_uxn_opcodes_h_l1792_c34_cbb9_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1792_c34_cbb9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1794_c11_698b]
signal BIN_OP_EQ_uxn_opcodes_h_l1794_c11_698b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1794_c11_698b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1794_c11_698b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1794_c7_5efc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_5efc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_5efc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_5efc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_5efc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1794_c7_5efc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_5efc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_5efc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_5efc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_5efc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1794_c7_5efc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_5efc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_5efc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_5efc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_5efc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1794_c7_5efc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_5efc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_5efc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_5efc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_5efc_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1794_c7_5efc]
signal result_stack_value_MUX_uxn_opcodes_h_l1794_c7_5efc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1794_c7_5efc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1794_c7_5efc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1794_c7_5efc_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1800_c11_920f]
signal BIN_OP_EQ_uxn_opcodes_h_l1800_c11_920f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1800_c11_920f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1800_c11_920f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1800_c7_0a19]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_0a19_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_0a19_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_0a19_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_0a19_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1800_c7_0a19]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_0a19_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_0a19_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_0a19_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_0a19_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1800_c7_0a19]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_0a19_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_0a19_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_0a19_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_0a19_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1800_c7_0a19]
signal result_stack_value_MUX_uxn_opcodes_h_l1800_c7_0a19_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1800_c7_0a19_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1800_c7_0a19_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1800_c7_0a19_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1803_c34_f412]
signal CONST_SR_8_uxn_opcodes_h_l1803_c34_f412_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1803_c34_f412_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1805_c11_2f6c]
signal BIN_OP_EQ_uxn_opcodes_h_l1805_c11_2f6c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1805_c11_2f6c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1805_c11_2f6c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1805_c7_f9b7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_f9b7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_f9b7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_f9b7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_f9b7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1805_c7_f9b7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_f9b7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_f9b7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_f9b7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_f9b7_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_d188
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_d188_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_d188_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.is_stack_read := ref_toks_7;
      base.stack_value := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1736_c6_71fe
BIN_OP_EQ_uxn_opcodes_h_l1736_c6_71fe : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1736_c6_71fe_left,
BIN_OP_EQ_uxn_opcodes_h_l1736_c6_71fe_right,
BIN_OP_EQ_uxn_opcodes_h_l1736_c6_71fe_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_4a9c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_4a9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_4a9c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_4a9c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_4a9c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_4a9c_return_output);

-- t16_MUX_uxn_opcodes_h_l1736_c2_bb61
t16_MUX_uxn_opcodes_h_l1736_c2_bb61 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1736_c2_bb61_cond,
t16_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue,
t16_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse,
t16_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output);

-- n16_MUX_uxn_opcodes_h_l1736_c2_bb61
n16_MUX_uxn_opcodes_h_l1736_c2_bb61 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1736_c2_bb61_cond,
n16_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue,
n16_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse,
n16_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_bb61
result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_bb61 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_bb61_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_bb61
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_bb61 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_bb61_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_bb61
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_bb61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_bb61_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_bb61
result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_bb61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_bb61_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_bb61
result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_bb61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_bb61_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_bb61
result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_bb61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_bb61_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_bb61
result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_bb61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_bb61_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1736_c2_bb61
result_stack_value_MUX_uxn_opcodes_h_l1736_c2_bb61 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1736_c2_bb61_cond,
result_stack_value_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output);

-- printf_uxn_opcodes_h_l1737_c3_79e5_uxn_opcodes_h_l1737_c3_79e5
printf_uxn_opcodes_h_l1737_c3_79e5_uxn_opcodes_h_l1737_c3_79e5 : entity work.printf_uxn_opcodes_h_l1737_c3_79e5_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1737_c3_79e5_uxn_opcodes_h_l1737_c3_79e5_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1744_c11_8708
BIN_OP_EQ_uxn_opcodes_h_l1744_c11_8708 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1744_c11_8708_left,
BIN_OP_EQ_uxn_opcodes_h_l1744_c11_8708_right,
BIN_OP_EQ_uxn_opcodes_h_l1744_c11_8708_return_output);

-- t16_MUX_uxn_opcodes_h_l1744_c7_434a
t16_MUX_uxn_opcodes_h_l1744_c7_434a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1744_c7_434a_cond,
t16_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue,
t16_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse,
t16_MUX_uxn_opcodes_h_l1744_c7_434a_return_output);

-- n16_MUX_uxn_opcodes_h_l1744_c7_434a
n16_MUX_uxn_opcodes_h_l1744_c7_434a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1744_c7_434a_cond,
n16_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue,
n16_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse,
n16_MUX_uxn_opcodes_h_l1744_c7_434a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_434a
result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_434a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_434a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_434a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_434a
result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_434a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_434a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_434a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_434a
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_434a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_434a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_434a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_434a
result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_434a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_434a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_434a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_434a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_434a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_434a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_434a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_434a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_434a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_434a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_434a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1744_c7_434a
result_stack_value_MUX_uxn_opcodes_h_l1744_c7_434a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1744_c7_434a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1744_c7_434a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1748_c11_0781
BIN_OP_EQ_uxn_opcodes_h_l1748_c11_0781 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1748_c11_0781_left,
BIN_OP_EQ_uxn_opcodes_h_l1748_c11_0781_right,
BIN_OP_EQ_uxn_opcodes_h_l1748_c11_0781_return_output);

-- t16_MUX_uxn_opcodes_h_l1748_c7_988f
t16_MUX_uxn_opcodes_h_l1748_c7_988f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1748_c7_988f_cond,
t16_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue,
t16_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse,
t16_MUX_uxn_opcodes_h_l1748_c7_988f_return_output);

-- n16_MUX_uxn_opcodes_h_l1748_c7_988f
n16_MUX_uxn_opcodes_h_l1748_c7_988f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1748_c7_988f_cond,
n16_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue,
n16_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse,
n16_MUX_uxn_opcodes_h_l1748_c7_988f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_988f
result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_988f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_988f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_988f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_988f
result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_988f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_988f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_988f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_988f
result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_988f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_988f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_988f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_988f
result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_988f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_988f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_988f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_988f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_988f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_988f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_988f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_988f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_988f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_988f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_988f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1748_c7_988f
result_stack_value_MUX_uxn_opcodes_h_l1748_c7_988f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1748_c7_988f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1748_c7_988f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1754_c11_5cd0
BIN_OP_EQ_uxn_opcodes_h_l1754_c11_5cd0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1754_c11_5cd0_left,
BIN_OP_EQ_uxn_opcodes_h_l1754_c11_5cd0_right,
BIN_OP_EQ_uxn_opcodes_h_l1754_c11_5cd0_return_output);

-- t16_MUX_uxn_opcodes_h_l1754_c7_6f4b
t16_MUX_uxn_opcodes_h_l1754_c7_6f4b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond,
t16_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue,
t16_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse,
t16_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output);

-- n16_MUX_uxn_opcodes_h_l1754_c7_6f4b
n16_MUX_uxn_opcodes_h_l1754_c7_6f4b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond,
n16_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue,
n16_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse,
n16_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b
result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_6f4b
result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_6f4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_6f4b
result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_6f4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_6f4b
result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_6f4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_6f4b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_6f4b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1754_c7_6f4b
result_stack_value_MUX_uxn_opcodes_h_l1754_c7_6f4b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1758_c11_f31f
BIN_OP_EQ_uxn_opcodes_h_l1758_c11_f31f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1758_c11_f31f_left,
BIN_OP_EQ_uxn_opcodes_h_l1758_c11_f31f_right,
BIN_OP_EQ_uxn_opcodes_h_l1758_c11_f31f_return_output);

-- t16_MUX_uxn_opcodes_h_l1758_c7_0ba5
t16_MUX_uxn_opcodes_h_l1758_c7_0ba5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond,
t16_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue,
t16_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse,
t16_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output);

-- n16_MUX_uxn_opcodes_h_l1758_c7_0ba5
n16_MUX_uxn_opcodes_h_l1758_c7_0ba5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond,
n16_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue,
n16_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse,
n16_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5
result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_0ba5
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_0ba5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_0ba5
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_0ba5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_0ba5
result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_0ba5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_0ba5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_0ba5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1758_c7_0ba5
result_stack_value_MUX_uxn_opcodes_h_l1758_c7_0ba5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond,
result_stack_value_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1759_c3_b833
BIN_OP_OR_uxn_opcodes_h_l1759_c3_b833 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1759_c3_b833_left,
BIN_OP_OR_uxn_opcodes_h_l1759_c3_b833_right,
BIN_OP_OR_uxn_opcodes_h_l1759_c3_b833_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1763_c11_83fe
BIN_OP_EQ_uxn_opcodes_h_l1763_c11_83fe : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1763_c11_83fe_left,
BIN_OP_EQ_uxn_opcodes_h_l1763_c11_83fe_right,
BIN_OP_EQ_uxn_opcodes_h_l1763_c11_83fe_return_output);

-- n16_MUX_uxn_opcodes_h_l1763_c7_4ffb
n16_MUX_uxn_opcodes_h_l1763_c7_4ffb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1763_c7_4ffb_cond,
n16_MUX_uxn_opcodes_h_l1763_c7_4ffb_iftrue,
n16_MUX_uxn_opcodes_h_l1763_c7_4ffb_iffalse,
n16_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4ffb
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4ffb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4ffb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4ffb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4ffb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4ffb
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4ffb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4ffb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4ffb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4ffb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_4ffb
result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_4ffb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_4ffb_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_4ffb_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_4ffb_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4ffb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4ffb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4ffb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4ffb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4ffb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1763_c7_4ffb
result_stack_value_MUX_uxn_opcodes_h_l1763_c7_4ffb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1763_c7_4ffb_cond,
result_stack_value_MUX_uxn_opcodes_h_l1763_c7_4ffb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1763_c7_4ffb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1767_c11_abda
BIN_OP_EQ_uxn_opcodes_h_l1767_c11_abda : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1767_c11_abda_left,
BIN_OP_EQ_uxn_opcodes_h_l1767_c11_abda_right,
BIN_OP_EQ_uxn_opcodes_h_l1767_c11_abda_return_output);

-- n16_MUX_uxn_opcodes_h_l1767_c7_608b
n16_MUX_uxn_opcodes_h_l1767_c7_608b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1767_c7_608b_cond,
n16_MUX_uxn_opcodes_h_l1767_c7_608b_iftrue,
n16_MUX_uxn_opcodes_h_l1767_c7_608b_iffalse,
n16_MUX_uxn_opcodes_h_l1767_c7_608b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_608b
result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_608b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_608b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_608b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_608b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_608b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_608b
result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_608b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_608b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_608b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_608b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_608b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_608b
result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_608b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_608b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_608b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_608b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_608b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_608b
result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_608b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_608b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_608b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_608b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_608b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_608b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_608b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_608b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_608b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_608b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_608b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_608b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_608b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_608b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_608b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_608b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_608b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1767_c7_608b
result_stack_value_MUX_uxn_opcodes_h_l1767_c7_608b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1767_c7_608b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1767_c7_608b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1767_c7_608b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1767_c7_608b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1773_c11_95ee
BIN_OP_EQ_uxn_opcodes_h_l1773_c11_95ee : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1773_c11_95ee_left,
BIN_OP_EQ_uxn_opcodes_h_l1773_c11_95ee_right,
BIN_OP_EQ_uxn_opcodes_h_l1773_c11_95ee_return_output);

-- n16_MUX_uxn_opcodes_h_l1773_c7_d707
n16_MUX_uxn_opcodes_h_l1773_c7_d707 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1773_c7_d707_cond,
n16_MUX_uxn_opcodes_h_l1773_c7_d707_iftrue,
n16_MUX_uxn_opcodes_h_l1773_c7_d707_iffalse,
n16_MUX_uxn_opcodes_h_l1773_c7_d707_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_d707
result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_d707 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_d707_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_d707_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_d707_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_d707_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_d707
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_d707 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_d707_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_d707_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_d707_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_d707_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_d707
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_d707 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_d707_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_d707_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_d707_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_d707_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_d707
result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_d707 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_d707_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_d707_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_d707_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_d707_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_d707
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_d707 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_d707_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_d707_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_d707_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_d707_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_d707
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_d707 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_d707_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_d707_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_d707_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_d707_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1773_c7_d707
result_stack_value_MUX_uxn_opcodes_h_l1773_c7_d707 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1773_c7_d707_cond,
result_stack_value_MUX_uxn_opcodes_h_l1773_c7_d707_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1773_c7_d707_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1773_c7_d707_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1777_c11_f339
BIN_OP_EQ_uxn_opcodes_h_l1777_c11_f339 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1777_c11_f339_left,
BIN_OP_EQ_uxn_opcodes_h_l1777_c11_f339_right,
BIN_OP_EQ_uxn_opcodes_h_l1777_c11_f339_return_output);

-- n16_MUX_uxn_opcodes_h_l1777_c7_3792
n16_MUX_uxn_opcodes_h_l1777_c7_3792 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1777_c7_3792_cond,
n16_MUX_uxn_opcodes_h_l1777_c7_3792_iftrue,
n16_MUX_uxn_opcodes_h_l1777_c7_3792_iffalse,
n16_MUX_uxn_opcodes_h_l1777_c7_3792_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3792
result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3792 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3792_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3792_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3792_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3792_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3792
result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3792 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3792_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3792_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3792_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3792_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3792
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3792 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3792_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3792_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3792_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3792_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3792
result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3792 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3792_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3792_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3792_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3792_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3792
result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3792 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3792_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3792_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3792_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3792_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3792
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3792 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3792_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3792_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3792_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3792_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3792
result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3792 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3792_cond,
result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3792_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3792_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3792_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1778_c3_09e7
BIN_OP_OR_uxn_opcodes_h_l1778_c3_09e7 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1778_c3_09e7_left,
BIN_OP_OR_uxn_opcodes_h_l1778_c3_09e7_right,
BIN_OP_OR_uxn_opcodes_h_l1778_c3_09e7_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1781_c32_42c4
BIN_OP_AND_uxn_opcodes_h_l1781_c32_42c4 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1781_c32_42c4_left,
BIN_OP_AND_uxn_opcodes_h_l1781_c32_42c4_right,
BIN_OP_AND_uxn_opcodes_h_l1781_c32_42c4_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1781_c32_f30d
BIN_OP_GT_uxn_opcodes_h_l1781_c32_f30d : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1781_c32_f30d_left,
BIN_OP_GT_uxn_opcodes_h_l1781_c32_f30d_right,
BIN_OP_GT_uxn_opcodes_h_l1781_c32_f30d_return_output);

-- MUX_uxn_opcodes_h_l1781_c32_441c
MUX_uxn_opcodes_h_l1781_c32_441c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1781_c32_441c_cond,
MUX_uxn_opcodes_h_l1781_c32_441c_iftrue,
MUX_uxn_opcodes_h_l1781_c32_441c_iffalse,
MUX_uxn_opcodes_h_l1781_c32_441c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1783_c11_64bc
BIN_OP_EQ_uxn_opcodes_h_l1783_c11_64bc : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1783_c11_64bc_left,
BIN_OP_EQ_uxn_opcodes_h_l1783_c11_64bc_right,
BIN_OP_EQ_uxn_opcodes_h_l1783_c11_64bc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_3ef3
result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_3ef3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_3ef3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_3ef3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_3ef3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_3ef3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_3ef3
result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_3ef3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_3ef3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_3ef3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_3ef3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_3ef3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_3ef3
result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_3ef3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_3ef3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_3ef3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_3ef3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_3ef3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_3ef3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_3ef3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_3ef3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_3ef3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_3ef3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_3ef3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1783_c7_3ef3
result_stack_value_MUX_uxn_opcodes_h_l1783_c7_3ef3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1783_c7_3ef3_cond,
result_stack_value_MUX_uxn_opcodes_h_l1783_c7_3ef3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1783_c7_3ef3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1783_c7_3ef3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1789_c11_2219
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_2219 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_2219_left,
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_2219_right,
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_2219_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_e058
result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_e058 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_e058_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_e058_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_e058_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_e058_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_e058
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_e058 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_e058_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_e058_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_e058_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_e058_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_e058
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_e058 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_e058_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_e058_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_e058_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_e058_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_e058
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_e058 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_e058_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_e058_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_e058_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_e058_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1789_c7_e058
result_stack_value_MUX_uxn_opcodes_h_l1789_c7_e058 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1789_c7_e058_cond,
result_stack_value_MUX_uxn_opcodes_h_l1789_c7_e058_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1789_c7_e058_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1789_c7_e058_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1792_c34_cbb9
CONST_SR_8_uxn_opcodes_h_l1792_c34_cbb9 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1792_c34_cbb9_x,
CONST_SR_8_uxn_opcodes_h_l1792_c34_cbb9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1794_c11_698b
BIN_OP_EQ_uxn_opcodes_h_l1794_c11_698b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1794_c11_698b_left,
BIN_OP_EQ_uxn_opcodes_h_l1794_c11_698b_right,
BIN_OP_EQ_uxn_opcodes_h_l1794_c11_698b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_5efc
result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_5efc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_5efc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_5efc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_5efc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_5efc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_5efc
result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_5efc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_5efc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_5efc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_5efc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_5efc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_5efc
result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_5efc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_5efc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_5efc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_5efc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_5efc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_5efc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_5efc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_5efc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_5efc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_5efc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_5efc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1794_c7_5efc
result_stack_value_MUX_uxn_opcodes_h_l1794_c7_5efc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1794_c7_5efc_cond,
result_stack_value_MUX_uxn_opcodes_h_l1794_c7_5efc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1794_c7_5efc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1794_c7_5efc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1800_c11_920f
BIN_OP_EQ_uxn_opcodes_h_l1800_c11_920f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1800_c11_920f_left,
BIN_OP_EQ_uxn_opcodes_h_l1800_c11_920f_right,
BIN_OP_EQ_uxn_opcodes_h_l1800_c11_920f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_0a19
result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_0a19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_0a19_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_0a19_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_0a19_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_0a19_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_0a19
result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_0a19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_0a19_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_0a19_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_0a19_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_0a19_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_0a19
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_0a19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_0a19_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_0a19_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_0a19_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_0a19_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1800_c7_0a19
result_stack_value_MUX_uxn_opcodes_h_l1800_c7_0a19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1800_c7_0a19_cond,
result_stack_value_MUX_uxn_opcodes_h_l1800_c7_0a19_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1800_c7_0a19_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1800_c7_0a19_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1803_c34_f412
CONST_SR_8_uxn_opcodes_h_l1803_c34_f412 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1803_c34_f412_x,
CONST_SR_8_uxn_opcodes_h_l1803_c34_f412_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1805_c11_2f6c
BIN_OP_EQ_uxn_opcodes_h_l1805_c11_2f6c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1805_c11_2f6c_left,
BIN_OP_EQ_uxn_opcodes_h_l1805_c11_2f6c_right,
BIN_OP_EQ_uxn_opcodes_h_l1805_c11_2f6c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_f9b7
result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_f9b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_f9b7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_f9b7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_f9b7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_f9b7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_f9b7
result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_f9b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_f9b7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_f9b7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_f9b7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_f9b7_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_d188
CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_d188 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_d188_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_d188_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1736_c6_71fe_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_4a9c_return_output,
 t16_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output,
 n16_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1744_c11_8708_return_output,
 t16_MUX_uxn_opcodes_h_l1744_c7_434a_return_output,
 n16_MUX_uxn_opcodes_h_l1744_c7_434a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_434a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_434a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_434a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_434a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_434a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_434a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1744_c7_434a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1748_c11_0781_return_output,
 t16_MUX_uxn_opcodes_h_l1748_c7_988f_return_output,
 n16_MUX_uxn_opcodes_h_l1748_c7_988f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_988f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_988f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_988f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_988f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_988f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_988f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1748_c7_988f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1754_c11_5cd0_return_output,
 t16_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output,
 n16_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1758_c11_f31f_return_output,
 t16_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output,
 n16_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1759_c3_b833_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1763_c11_83fe_return_output,
 n16_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1767_c11_abda_return_output,
 n16_MUX_uxn_opcodes_h_l1767_c7_608b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_608b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_608b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_608b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_608b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_608b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_608b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1767_c7_608b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1773_c11_95ee_return_output,
 n16_MUX_uxn_opcodes_h_l1773_c7_d707_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_d707_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_d707_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_d707_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_d707_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_d707_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_d707_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1773_c7_d707_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1777_c11_f339_return_output,
 n16_MUX_uxn_opcodes_h_l1777_c7_3792_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3792_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3792_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3792_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3792_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3792_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3792_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3792_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1778_c3_09e7_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1781_c32_42c4_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1781_c32_f30d_return_output,
 MUX_uxn_opcodes_h_l1781_c32_441c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1783_c11_64bc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_3ef3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_3ef3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_3ef3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_3ef3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1783_c7_3ef3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1789_c11_2219_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_e058_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_e058_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_e058_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_e058_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1789_c7_e058_return_output,
 CONST_SR_8_uxn_opcodes_h_l1792_c34_cbb9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1794_c11_698b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_5efc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_5efc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_5efc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_5efc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1794_c7_5efc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1800_c11_920f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_0a19_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_0a19_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_0a19_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1800_c7_0a19_return_output,
 CONST_SR_8_uxn_opcodes_h_l1803_c34_f412_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1805_c11_2f6c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_f9b7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_f9b7_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_d188_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_71fe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_71fe_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_71fe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_4a9c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_4a9c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_4a9c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_4a9c_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1744_c7_434a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1736_c2_bb61_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1744_c7_434a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1736_c2_bb61_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_434a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_bb61_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1740_c3_a9f1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_434a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_bb61_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1736_c2_bb61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_bb61_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_434a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_bb61_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_434a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_bb61_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_434a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_bb61_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_434a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_bb61_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1744_c7_434a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c2_bb61_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1737_c3_79e5_uxn_opcodes_h_l1737_c3_79e5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_8708_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_8708_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_8708_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1748_c7_988f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1744_c7_434a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1748_c7_988f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1744_c7_434a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_988f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_434a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_988f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_434a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_988f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_434a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_988f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_434a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_988f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_434a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1746_c3_c6f5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_988f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_434a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1748_c7_988f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1744_c7_434a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_0781_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_0781_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_0781_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1748_c7_988f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1748_c7_988f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_988f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_988f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_988f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_988f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_988f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1752_c3_8745 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_988f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1748_c7_988f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_5cd0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_5cd0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_5cd0_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1756_c3_cc06 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_f31f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_f31f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_f31f_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1761_c3_d96b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1759_c3_b833_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1759_c3_b833_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1759_c3_b833_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_83fe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_83fe_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_83fe_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1763_c7_4ffb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1763_c7_4ffb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1767_c7_608b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1763_c7_4ffb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_608b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4ffb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4ffb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_608b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4ffb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4ffb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4ffb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_608b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4ffb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_4ffb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_4ffb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_608b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_4ffb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_608b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4ffb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1765_c3_7cc4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4ffb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_608b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4ffb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_4ffb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_4ffb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1767_c7_608b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_4ffb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_abda_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_abda_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_abda_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1767_c7_608b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1767_c7_608b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1773_c7_d707_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1767_c7_608b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_608b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_608b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_d707_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_608b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_608b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_608b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_d707_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_608b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_608b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_608b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_d707_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_608b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_608b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_608b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_d707_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_608b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_608b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_608b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_d707_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_608b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_608b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1771_c3_b148 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_608b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_d707_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_608b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1767_c7_608b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1767_c7_608b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_d707_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1767_c7_608b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_95ee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_95ee_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_95ee_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1773_c7_d707_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1773_c7_d707_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1777_c7_3792_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1773_c7_d707_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_d707_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_d707_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3792_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_d707_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_d707_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_d707_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3792_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_d707_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_d707_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_d707_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3792_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_d707_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_d707_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_d707_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3792_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_d707_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_d707_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_d707_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3792_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_d707_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_d707_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1775_c3_ead1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_d707_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3792_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_d707_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_d707_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_d707_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3792_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_d707_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_f339_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_f339_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_f339_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1777_c7_3792_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1777_c7_3792_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1777_c7_3792_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3792_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3792_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_3ef3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3792_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3792_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3792_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_3ef3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3792_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3792_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3792_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_3ef3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3792_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3792_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3792_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1777_c7_3792_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3792_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3792_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3792_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3792_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3792_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3792_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_3ef3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3792_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3792_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3792_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_3ef3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3792_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1778_c3_09e7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1778_c3_09e7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1778_c3_09e7_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1781_c32_441c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1781_c32_441c_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1781_c32_441c_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1781_c32_42c4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1781_c32_42c4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1781_c32_42c4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1781_c32_f30d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1781_c32_f30d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1781_c32_f30d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1781_c32_441c_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_64bc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_64bc_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_64bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_3ef3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_3ef3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_e058_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_3ef3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_3ef3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_3ef3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_e058_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_3ef3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_3ef3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_3ef3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_e058_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_3ef3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_3ef3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1786_c3_ce60 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_3ef3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_e058_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_3ef3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_3ef3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_3ef3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1789_c7_e058_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_3ef3_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1787_c24_6774_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_2219_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_2219_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_2219_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_e058_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_e058_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_5efc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_e058_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_e058_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_e058_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_5efc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_e058_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_e058_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_e058_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_5efc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_e058_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_e058_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1791_c3_1f99 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_e058_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_5efc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_e058_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1789_c7_e058_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1789_c7_e058_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1794_c7_5efc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1789_c7_e058_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1792_c34_cbb9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1792_c34_cbb9_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1792_c24_caec_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_698b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_698b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_698b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_5efc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_5efc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_5efc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_5efc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_5efc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_0a19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_5efc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_5efc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_5efc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_0a19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_5efc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_5efc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1797_c3_3f43 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_5efc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_0a19_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_5efc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1794_c7_5efc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1794_c7_5efc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1800_c7_0a19_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1794_c7_5efc_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1798_c24_c809_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_920f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_920f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_920f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_0a19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_0a19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_f9b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_0a19_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_0a19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_0a19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_f9b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_0a19_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_0a19_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1802_c3_fc1d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_0a19_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_0a19_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1800_c7_0a19_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1800_c7_0a19_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1800_c7_0a19_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1803_c34_f412_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1803_c34_f412_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1803_c24_42c9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1805_c11_2f6c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1805_c11_2f6c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1805_c11_2f6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_f9b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_f9b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_f9b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_f9b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_f9b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_f9b7_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1763_DUPLICATE_9f7f_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1748_l1744_l1773_l1736_l1767_l1763_l1794_DUPLICATE_e2e5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1800_l1763_DUPLICATE_aa16_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1805_l1767_l1763_DUPLICATE_2211_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1783_l1748_l1777_l1744_l1773_l1805_l1767_l1800_l1763_l1794_DUPLICATE_a300_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1749_l1759_l1768_l1778_DUPLICATE_b35b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_d188_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_d188_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1800_l1777_DUPLICATE_e0f0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1732_l1810_DUPLICATE_cec1_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_698b_right := to_unsigned(11, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1775_c3_ead1 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_d707_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1775_c3_ead1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1805_c11_2f6c_right := to_unsigned(13, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1802_c3_fc1d := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_0a19_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1802_c3_fc1d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_abda_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_64bc_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1765_c3_7cc4 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4ffb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1765_c3_7cc4;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1752_c3_8745 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1752_c3_8745;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_5cd0_right := to_unsigned(3, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_5efc_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_f31f_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_0a19_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1781_c32_441c_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1740_c3_a9f1 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1740_c3_a9f1;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_3ef3_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_f9b7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_71fe_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_2219_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1786_c3_ce60 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_3ef3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1786_c3_ce60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_f339_right := to_unsigned(8, 4);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1781_c32_f30d_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_95ee_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1761_c3_d96b := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1761_c3_d96b;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_4ffb_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_e058_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_83fe_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_f9b7_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_608b_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1746_c3_c6f5 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1746_c3_c6f5;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_0781_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_4a9c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1781_c32_42c4_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_8708_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3792_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1756_c3_cc06 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1756_c3_cc06;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1791_c3_1f99 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_e058_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1791_c3_1f99;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_d707_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1771_c3_b148 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_608b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1771_c3_b148;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_920f_right := to_unsigned(12, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1797_c3_3f43 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_5efc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1797_c3_3f43;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_3ef3_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_5efc_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3792_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1781_c32_441c_iftrue := signed(std_logic_vector(resize(to_unsigned(4, 3), 8)));

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_4a9c_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1781_c32_42c4_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1778_c3_09e7_left := n16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1792_c34_cbb9_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1763_c7_4ffb_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1773_c7_d707_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1777_c7_3792_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_71fe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_8708_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_0781_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_5cd0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_f31f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_83fe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_abda_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_95ee_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_f339_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_64bc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_2219_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_698b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_920f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1805_c11_2f6c_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1759_c3_b833_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1803_c34_f412_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse := t16;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l1787_c24_6774] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1787_c24_6774_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1794_c11_698b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1794_c11_698b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_698b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1794_c11_698b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_698b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_698b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1794_c11_698b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1789_c11_2219] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1789_c11_2219_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_2219_left;
     BIN_OP_EQ_uxn_opcodes_h_l1789_c11_2219_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_2219_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_2219_return_output := BIN_OP_EQ_uxn_opcodes_h_l1789_c11_2219_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1736_c2_bb61] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1736_c2_bb61_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1800_l1777_DUPLICATE_e0f0 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1800_l1777_DUPLICATE_e0f0_return_output := result.stack_address_sp_offset;

     -- CONST_SR_8[uxn_opcodes_h_l1803_c34_f412] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1803_c34_f412_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1803_c34_f412_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1803_c34_f412_return_output := CONST_SR_8_uxn_opcodes_h_l1803_c34_f412_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1800_c11_920f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1800_c11_920f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_920f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1800_c11_920f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_920f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_920f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1800_c11_920f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1767_c11_abda] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1767_c11_abda_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_abda_left;
     BIN_OP_EQ_uxn_opcodes_h_l1767_c11_abda_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_abda_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_abda_return_output := BIN_OP_EQ_uxn_opcodes_h_l1767_c11_abda_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1744_c11_8708] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1744_c11_8708_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_8708_left;
     BIN_OP_EQ_uxn_opcodes_h_l1744_c11_8708_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_8708_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_8708_return_output := BIN_OP_EQ_uxn_opcodes_h_l1744_c11_8708_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1749_l1759_l1768_l1778_DUPLICATE_b35b LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1749_l1759_l1768_l1778_DUPLICATE_b35b_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1748_c11_0781] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1748_c11_0781_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_0781_left;
     BIN_OP_EQ_uxn_opcodes_h_l1748_c11_0781_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_0781_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_0781_return_output := BIN_OP_EQ_uxn_opcodes_h_l1748_c11_0781_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1773_c11_95ee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1773_c11_95ee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_95ee_left;
     BIN_OP_EQ_uxn_opcodes_h_l1773_c11_95ee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_95ee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_95ee_return_output := BIN_OP_EQ_uxn_opcodes_h_l1773_c11_95ee_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1763_c11_83fe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1763_c11_83fe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_83fe_left;
     BIN_OP_EQ_uxn_opcodes_h_l1763_c11_83fe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_83fe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_83fe_return_output := BIN_OP_EQ_uxn_opcodes_h_l1763_c11_83fe_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1792_c34_cbb9] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1792_c34_cbb9_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1792_c34_cbb9_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1792_c34_cbb9_return_output := CONST_SR_8_uxn_opcodes_h_l1792_c34_cbb9_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1800_l1763_DUPLICATE_aa16 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1800_l1763_DUPLICATE_aa16_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1736_c6_71fe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1736_c6_71fe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_71fe_left;
     BIN_OP_EQ_uxn_opcodes_h_l1736_c6_71fe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_71fe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_71fe_return_output := BIN_OP_EQ_uxn_opcodes_h_l1736_c6_71fe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1777_c11_f339] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1777_c11_f339_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_f339_left;
     BIN_OP_EQ_uxn_opcodes_h_l1777_c11_f339_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_f339_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_f339_return_output := BIN_OP_EQ_uxn_opcodes_h_l1777_c11_f339_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1805_l1767_l1763_DUPLICATE_2211 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1805_l1767_l1763_DUPLICATE_2211_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1748_l1744_l1773_l1736_l1767_l1763_l1794_DUPLICATE_e2e5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1748_l1744_l1773_l1736_l1767_l1763_l1794_DUPLICATE_e2e5_return_output := result.is_sp_shift;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l1777_c7_3792] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1777_c7_3792_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1754_c11_5cd0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1754_c11_5cd0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_5cd0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1754_c11_5cd0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_5cd0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_5cd0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1754_c11_5cd0_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1781_c32_42c4] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1781_c32_42c4_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1781_c32_42c4_left;
     BIN_OP_AND_uxn_opcodes_h_l1781_c32_42c4_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1781_c32_42c4_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1781_c32_42c4_return_output := BIN_OP_AND_uxn_opcodes_h_l1781_c32_42c4_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1798_c24_c809] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1798_c24_c809_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1783_c11_64bc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1783_c11_64bc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_64bc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1783_c11_64bc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_64bc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_64bc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1783_c11_64bc_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1763_DUPLICATE_9f7f LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1763_DUPLICATE_9f7f_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1758_c11_f31f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1758_c11_f31f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_f31f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1758_c11_f31f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_f31f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_f31f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1758_c11_f31f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1805_c11_2f6c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1805_c11_2f6c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1805_c11_2f6c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1805_c11_2f6c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1805_c11_2f6c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1805_c11_2f6c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1805_c11_2f6c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1783_l1748_l1777_l1744_l1773_l1805_l1767_l1800_l1763_l1794_DUPLICATE_a300 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1783_l1748_l1777_l1744_l1773_l1805_l1767_l1800_l1763_l1794_DUPLICATE_a300_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1781_c32_f30d_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1781_c32_42c4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_4a9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_71fe_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1736_c2_bb61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_71fe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_bb61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_71fe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_bb61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_71fe_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_bb61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_71fe_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_bb61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_71fe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_bb61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_71fe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_bb61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_71fe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_bb61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_71fe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c2_bb61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_71fe_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1736_c2_bb61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_71fe_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1744_c7_434a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_8708_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_434a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_8708_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_434a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_8708_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_434a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_8708_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_434a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_8708_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_434a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_8708_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_434a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_8708_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1744_c7_434a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_8708_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1744_c7_434a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_8708_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1748_c7_988f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_0781_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_988f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_0781_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_988f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_0781_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_988f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_0781_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_988f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_0781_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_988f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_0781_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_988f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_0781_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1748_c7_988f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_0781_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1748_c7_988f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_0781_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_5cd0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_5cd0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_5cd0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_5cd0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_5cd0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_5cd0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_5cd0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_5cd0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_5cd0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_f31f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_f31f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_f31f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_f31f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_f31f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_f31f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_f31f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_f31f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_f31f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1763_c7_4ffb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_83fe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4ffb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_83fe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_83fe_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_4ffb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_83fe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4ffb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_83fe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_83fe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4ffb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_83fe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_4ffb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_83fe_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1767_c7_608b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_abda_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_608b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_abda_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_608b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_abda_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_608b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_abda_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_608b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_abda_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_608b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_abda_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_608b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_abda_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1767_c7_608b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_abda_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1773_c7_d707_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_95ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_d707_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_95ee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_d707_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_95ee_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_d707_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_95ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_d707_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_95ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_d707_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_95ee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_d707_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_95ee_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_d707_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_95ee_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1777_c7_3792_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_f339_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3792_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_f339_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3792_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_f339_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3792_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_f339_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3792_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_f339_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3792_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_f339_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3792_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_f339_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3792_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_f339_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_3ef3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_64bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_3ef3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_64bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_3ef3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_64bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_3ef3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_64bc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_3ef3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_64bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_e058_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_2219_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_e058_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_2219_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_e058_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_2219_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_e058_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_2219_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1789_c7_e058_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_2219_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_5efc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_698b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_5efc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_698b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_5efc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_698b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_5efc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_698b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1794_c7_5efc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_698b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_0a19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_920f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_0a19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_920f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_0a19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_920f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1800_c7_0a19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_920f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_f9b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1805_c11_2f6c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_f9b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1805_c11_2f6c_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1759_c3_b833_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1749_l1759_l1768_l1778_DUPLICATE_b35b_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1778_c3_09e7_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1749_l1759_l1768_l1778_DUPLICATE_b35b_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_d188_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1749_l1759_l1768_l1778_DUPLICATE_b35b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_3ef3_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1787_c24_6774_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1794_c7_5efc_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1798_c24_c809_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1763_DUPLICATE_9f7f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1763_DUPLICATE_9f7f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1763_DUPLICATE_9f7f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1763_DUPLICATE_9f7f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1763_DUPLICATE_9f7f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1763_DUPLICATE_9f7f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_608b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1763_DUPLICATE_9f7f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_d707_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1763_DUPLICATE_9f7f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3792_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1763_DUPLICATE_9f7f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1783_l1748_l1777_l1744_l1773_l1805_l1767_l1800_l1763_l1794_DUPLICATE_a300_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1783_l1748_l1777_l1744_l1773_l1805_l1767_l1800_l1763_l1794_DUPLICATE_a300_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1783_l1748_l1777_l1744_l1773_l1805_l1767_l1800_l1763_l1794_DUPLICATE_a300_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1783_l1748_l1777_l1744_l1773_l1805_l1767_l1800_l1763_l1794_DUPLICATE_a300_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4ffb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1783_l1748_l1777_l1744_l1773_l1805_l1767_l1800_l1763_l1794_DUPLICATE_a300_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_608b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1783_l1748_l1777_l1744_l1773_l1805_l1767_l1800_l1763_l1794_DUPLICATE_a300_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_d707_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1783_l1748_l1777_l1744_l1773_l1805_l1767_l1800_l1763_l1794_DUPLICATE_a300_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3792_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1783_l1748_l1777_l1744_l1773_l1805_l1767_l1800_l1763_l1794_DUPLICATE_a300_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_3ef3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1783_l1748_l1777_l1744_l1773_l1805_l1767_l1800_l1763_l1794_DUPLICATE_a300_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_e058_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1783_l1748_l1777_l1744_l1773_l1805_l1767_l1800_l1763_l1794_DUPLICATE_a300_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_5efc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1783_l1748_l1777_l1744_l1773_l1805_l1767_l1800_l1763_l1794_DUPLICATE_a300_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_0a19_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1783_l1748_l1777_l1744_l1773_l1805_l1767_l1800_l1763_l1794_DUPLICATE_a300_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_f9b7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1783_l1748_l1777_l1744_l1773_l1805_l1767_l1800_l1763_l1794_DUPLICATE_a300_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1748_l1744_l1773_l1736_l1767_l1763_l1794_DUPLICATE_e2e5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1748_l1744_l1773_l1736_l1767_l1763_l1794_DUPLICATE_e2e5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1748_l1744_l1773_l1736_l1767_l1763_l1794_DUPLICATE_e2e5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1748_l1744_l1773_l1736_l1767_l1763_l1794_DUPLICATE_e2e5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1748_l1744_l1773_l1736_l1767_l1763_l1794_DUPLICATE_e2e5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1748_l1744_l1773_l1736_l1767_l1763_l1794_DUPLICATE_e2e5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_608b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1748_l1744_l1773_l1736_l1767_l1763_l1794_DUPLICATE_e2e5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_d707_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1748_l1744_l1773_l1736_l1767_l1763_l1794_DUPLICATE_e2e5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_e058_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1748_l1744_l1773_l1736_l1767_l1763_l1794_DUPLICATE_e2e5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_5efc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1748_l1744_l1773_l1736_l1767_l1763_l1794_DUPLICATE_e2e5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1805_l1767_l1763_DUPLICATE_2211_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1805_l1767_l1763_DUPLICATE_2211_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1805_l1767_l1763_DUPLICATE_2211_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1805_l1767_l1763_DUPLICATE_2211_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4ffb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1805_l1767_l1763_DUPLICATE_2211_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_608b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1805_l1767_l1763_DUPLICATE_2211_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_d707_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1805_l1767_l1763_DUPLICATE_2211_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3792_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1805_l1767_l1763_DUPLICATE_2211_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_f9b7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1805_l1767_l1763_DUPLICATE_2211_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3792_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1800_l1777_DUPLICATE_e0f0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_0a19_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1800_l1777_DUPLICATE_e0f0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1800_l1763_DUPLICATE_aa16_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1800_l1763_DUPLICATE_aa16_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1800_l1763_DUPLICATE_aa16_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1800_l1763_DUPLICATE_aa16_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1800_l1763_DUPLICATE_aa16_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_4ffb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1800_l1763_DUPLICATE_aa16_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1767_c7_608b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1800_l1763_DUPLICATE_aa16_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_d707_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1800_l1763_DUPLICATE_aa16_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3792_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1800_l1763_DUPLICATE_aa16_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1800_c7_0a19_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1800_l1763_DUPLICATE_aa16_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1736_c2_bb61_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3792_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1777_c7_3792_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1759_c3_b833] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1759_c3_b833_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1759_c3_b833_left;
     BIN_OP_OR_uxn_opcodes_h_l1759_c3_b833_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1759_c3_b833_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1759_c3_b833_return_output := BIN_OP_OR_uxn_opcodes_h_l1759_c3_b833_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1792_c24_caec] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1792_c24_caec_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1792_c34_cbb9_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1794_c7_5efc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_5efc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_5efc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_5efc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_5efc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_5efc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_5efc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_5efc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_5efc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1800_c7_0a19] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_0a19_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_0a19_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_0a19_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_0a19_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_0a19_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_0a19_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_0a19_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_0a19_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1805_c7_f9b7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_f9b7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_f9b7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_f9b7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_f9b7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_f9b7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_f9b7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_f9b7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_f9b7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1805_c7_f9b7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_f9b7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_f9b7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_f9b7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_f9b7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_f9b7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_f9b7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_f9b7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_f9b7_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1777_c7_3792] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3792_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3792_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3792_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3792_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3792_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3792_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3792_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3792_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1803_c24_42c9] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1803_c24_42c9_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1803_c34_f412_return_output);

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_d188 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_d188_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_d188_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_d188_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_d188_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1736_c2_bb61] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_bb61_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_bb61_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1778_c3_09e7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1778_c3_09e7_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1778_c3_09e7_left;
     BIN_OP_OR_uxn_opcodes_h_l1778_c3_09e7_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1778_c3_09e7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1778_c3_09e7_return_output := BIN_OP_OR_uxn_opcodes_h_l1778_c3_09e7_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1781_c32_f30d] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1781_c32_f30d_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1781_c32_f30d_left;
     BIN_OP_GT_uxn_opcodes_h_l1781_c32_f30d_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1781_c32_f30d_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1781_c32_f30d_return_output := BIN_OP_GT_uxn_opcodes_h_l1781_c32_f30d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1736_c1_4a9c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_4a9c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_4a9c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_4a9c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_4a9c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_4a9c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_4a9c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_4a9c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_4a9c_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1781_c32_441c_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1781_c32_f30d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1759_c3_b833_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1777_c7_3792_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1778_c3_09e7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1789_c7_e058_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1792_c24_caec_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1800_c7_0a19_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1803_c24_42c9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1767_c7_608b_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_d188_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_d188_return_output;
     VAR_printf_uxn_opcodes_h_l1737_c3_79e5_uxn_opcodes_h_l1737_c3_79e5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_4a9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_0a19_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_f9b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_e058_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_5efc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_d707_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3792_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_0a19_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_f9b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_5efc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_0a19_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1800_c7_0a19] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_0a19_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_0a19_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_0a19_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_0a19_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_0a19_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_0a19_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_0a19_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_0a19_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1800_c7_0a19] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_0a19_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_0a19_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_0a19_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_0a19_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_0a19_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_0a19_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_0a19_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_0a19_return_output;

     -- t16_MUX[uxn_opcodes_h_l1758_c7_0ba5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond <= VAR_t16_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond;
     t16_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue;
     t16_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output := t16_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1789_c7_e058] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_e058_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_e058_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_e058_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_e058_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_e058_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_e058_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_e058_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_e058_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1773_c7_d707] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_d707_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_d707_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_d707_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_d707_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_d707_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_d707_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_d707_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_d707_return_output;

     -- printf_uxn_opcodes_h_l1737_c3_79e5[uxn_opcodes_h_l1737_c3_79e5] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1737_c3_79e5_uxn_opcodes_h_l1737_c3_79e5_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1737_c3_79e5_uxn_opcodes_h_l1737_c3_79e5_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1794_c7_5efc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_5efc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_5efc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_5efc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_5efc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_5efc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_5efc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_5efc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_5efc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1800_c7_0a19] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1800_c7_0a19_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1800_c7_0a19_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1800_c7_0a19_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1800_c7_0a19_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1800_c7_0a19_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1800_c7_0a19_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1800_c7_0a19_return_output := result_stack_value_MUX_uxn_opcodes_h_l1800_c7_0a19_return_output;

     -- MUX[uxn_opcodes_h_l1781_c32_441c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1781_c32_441c_cond <= VAR_MUX_uxn_opcodes_h_l1781_c32_441c_cond;
     MUX_uxn_opcodes_h_l1781_c32_441c_iftrue <= VAR_MUX_uxn_opcodes_h_l1781_c32_441c_iftrue;
     MUX_uxn_opcodes_h_l1781_c32_441c_iffalse <= VAR_MUX_uxn_opcodes_h_l1781_c32_441c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1781_c32_441c_return_output := MUX_uxn_opcodes_h_l1781_c32_441c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1777_c7_3792] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1777_c7_3792_cond <= VAR_n16_MUX_uxn_opcodes_h_l1777_c7_3792_cond;
     n16_MUX_uxn_opcodes_h_l1777_c7_3792_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1777_c7_3792_iftrue;
     n16_MUX_uxn_opcodes_h_l1777_c7_3792_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1777_c7_3792_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1777_c7_3792_return_output := n16_MUX_uxn_opcodes_h_l1777_c7_3792_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3792_iftrue := VAR_MUX_uxn_opcodes_h_l1781_c32_441c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1773_c7_d707_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1777_c7_3792_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_5efc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_0a19_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_3ef3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_e058_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_608b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_d707_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_5efc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_0a19_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_e058_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_5efc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1794_c7_5efc_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1800_c7_0a19_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output;
     -- n16_MUX[uxn_opcodes_h_l1773_c7_d707] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1773_c7_d707_cond <= VAR_n16_MUX_uxn_opcodes_h_l1773_c7_d707_cond;
     n16_MUX_uxn_opcodes_h_l1773_c7_d707_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1773_c7_d707_iftrue;
     n16_MUX_uxn_opcodes_h_l1773_c7_d707_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1773_c7_d707_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1773_c7_d707_return_output := n16_MUX_uxn_opcodes_h_l1773_c7_d707_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1767_c7_608b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_608b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_608b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_608b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_608b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_608b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_608b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_608b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_608b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1794_c7_5efc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_5efc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_5efc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_5efc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_5efc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_5efc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_5efc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_5efc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_5efc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1777_c7_3792] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3792_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3792_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3792_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3792_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3792_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3792_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3792_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3792_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1789_c7_e058] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_e058_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_e058_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_e058_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_e058_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_e058_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_e058_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_e058_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_e058_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1794_c7_5efc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_5efc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_5efc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_5efc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_5efc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_5efc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_5efc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_5efc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_5efc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1794_c7_5efc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1794_c7_5efc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1794_c7_5efc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1794_c7_5efc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1794_c7_5efc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1794_c7_5efc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1794_c7_5efc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1794_c7_5efc_return_output := result_stack_value_MUX_uxn_opcodes_h_l1794_c7_5efc_return_output;

     -- t16_MUX[uxn_opcodes_h_l1754_c7_6f4b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond;
     t16_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue;
     t16_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output := t16_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1783_c7_3ef3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_3ef3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_3ef3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_3ef3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_3ef3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_3ef3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_3ef3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_3ef3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_3ef3_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1767_c7_608b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1773_c7_d707_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_e058_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_5efc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3792_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_3ef3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_4ffb_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_608b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_e058_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_5efc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_d707_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3792_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_3ef3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_e058_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1789_c7_e058_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1794_c7_5efc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1789_c7_e058] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1789_c7_e058_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1789_c7_e058_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1789_c7_e058_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1789_c7_e058_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1789_c7_e058_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1789_c7_e058_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1789_c7_e058_return_output := result_stack_value_MUX_uxn_opcodes_h_l1789_c7_e058_return_output;

     -- n16_MUX[uxn_opcodes_h_l1767_c7_608b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1767_c7_608b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1767_c7_608b_cond;
     n16_MUX_uxn_opcodes_h_l1767_c7_608b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1767_c7_608b_iftrue;
     n16_MUX_uxn_opcodes_h_l1767_c7_608b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1767_c7_608b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1767_c7_608b_return_output := n16_MUX_uxn_opcodes_h_l1767_c7_608b_return_output;

     -- t16_MUX[uxn_opcodes_h_l1748_c7_988f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1748_c7_988f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1748_c7_988f_cond;
     t16_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue;
     t16_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1748_c7_988f_return_output := t16_MUX_uxn_opcodes_h_l1748_c7_988f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1783_c7_3ef3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_3ef3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_3ef3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_3ef3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_3ef3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_3ef3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_3ef3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_3ef3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_3ef3_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1763_c7_4ffb] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_4ffb_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_4ffb_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_4ffb_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_4ffb_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_4ffb_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_4ffb_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1773_c7_d707] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_d707_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_d707_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_d707_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_d707_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_d707_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_d707_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_d707_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_d707_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1789_c7_e058] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_e058_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_e058_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_e058_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_e058_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_e058_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_e058_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_e058_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_e058_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1777_c7_3792] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3792_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3792_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3792_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3792_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3792_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3792_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3792_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3792_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1789_c7_e058] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_e058_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_e058_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_e058_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_e058_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_e058_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_e058_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_e058_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_e058_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1763_c7_4ffb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1767_c7_608b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_3ef3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_e058_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_d707_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3792_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_3ef3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_e058_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_608b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_d707_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3792_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_3ef3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_3ef3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1789_c7_e058_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1748_c7_988f_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1783_c7_3ef3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_3ef3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_3ef3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_3ef3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_3ef3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_3ef3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_3ef3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_3ef3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_3ef3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1777_c7_3792] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3792_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3792_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3792_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3792_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3792_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3792_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3792_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3792_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1758_c7_0ba5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1767_c7_608b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_608b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_608b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_608b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_608b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_608b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_608b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_608b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_608b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1763_c7_4ffb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1763_c7_4ffb_cond <= VAR_n16_MUX_uxn_opcodes_h_l1763_c7_4ffb_cond;
     n16_MUX_uxn_opcodes_h_l1763_c7_4ffb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1763_c7_4ffb_iftrue;
     n16_MUX_uxn_opcodes_h_l1763_c7_4ffb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1763_c7_4ffb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output := n16_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1783_c7_3ef3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_3ef3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_3ef3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_3ef3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_3ef3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_3ef3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_3ef3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_3ef3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_3ef3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1783_c7_3ef3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1783_c7_3ef3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_3ef3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1783_c7_3ef3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_3ef3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1783_c7_3ef3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_3ef3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_3ef3_return_output := result_stack_value_MUX_uxn_opcodes_h_l1783_c7_3ef3_return_output;

     -- t16_MUX[uxn_opcodes_h_l1744_c7_434a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1744_c7_434a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1744_c7_434a_cond;
     t16_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue;
     t16_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1744_c7_434a_return_output := t16_MUX_uxn_opcodes_h_l1744_c7_434a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1773_c7_d707] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_d707_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_d707_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_d707_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_d707_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_d707_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_d707_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_d707_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_d707_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3792_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_3ef3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_608b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_d707_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3792_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_3ef3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_608b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_d707_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3792_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3792_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_3ef3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1744_c7_434a_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1754_c7_6f4b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1763_c7_4ffb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1767_c7_608b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_608b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_608b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_608b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_608b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_608b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_608b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_608b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_608b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1773_c7_d707] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_d707_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_d707_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_d707_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_d707_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_d707_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_d707_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_d707_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_d707_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1777_c7_3792] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3792_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3792_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3792_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3792_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3792_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3792_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3792_return_output := result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3792_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1777_c7_3792] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3792_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3792_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3792_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3792_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3792_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3792_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3792_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3792_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1777_c7_3792] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3792_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3792_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3792_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3792_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3792_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3792_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3792_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3792_return_output;

     -- t16_MUX[uxn_opcodes_h_l1736_c2_bb61] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1736_c2_bb61_cond <= VAR_t16_MUX_uxn_opcodes_h_l1736_c2_bb61_cond;
     t16_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue;
     t16_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output := t16_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output;

     -- n16_MUX[uxn_opcodes_h_l1758_c7_0ba5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond <= VAR_n16_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond;
     n16_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue;
     n16_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output := n16_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_d707_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3792_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_608b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_d707_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3792_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_608b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_d707_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_d707_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3792_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1773_c7_d707] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1773_c7_d707_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_d707_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1773_c7_d707_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_d707_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1773_c7_d707_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_d707_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_d707_return_output := result_stack_value_MUX_uxn_opcodes_h_l1773_c7_d707_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1763_c7_4ffb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1767_c7_608b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_608b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_608b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_608b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_608b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_608b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_608b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_608b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_608b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1754_c7_6f4b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond;
     n16_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue;
     n16_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output := n16_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1758_c7_0ba5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1773_c7_d707] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_d707_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_d707_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_d707_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_d707_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_d707_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_d707_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_d707_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_d707_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1748_c7_988f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_988f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_988f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_988f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_988f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1773_c7_d707] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_d707_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_d707_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_d707_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_d707_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_d707_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_d707_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_d707_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_d707_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_608b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_d707_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_988f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_608b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_d707_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4ffb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_608b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1767_c7_608b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_d707_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1767_c7_608b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_608b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_608b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_608b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_608b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_608b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_608b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_608b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_608b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1767_c7_608b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_608b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_608b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_608b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_608b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_608b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_608b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_608b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_608b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1758_c7_0ba5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1744_c7_434a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_434a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_434a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_434a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_434a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1748_c7_988f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1748_c7_988f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1748_c7_988f_cond;
     n16_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue;
     n16_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1748_c7_988f_return_output := n16_MUX_uxn_opcodes_h_l1748_c7_988f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1754_c7_6f4b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1763_c7_4ffb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4ffb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4ffb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4ffb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4ffb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4ffb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4ffb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1767_c7_608b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1767_c7_608b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1767_c7_608b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1767_c7_608b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1767_c7_608b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1767_c7_608b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1767_c7_608b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1767_c7_608b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1767_c7_608b_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1748_c7_988f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4ffb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_608b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_434a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4ffb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_608b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_4ffb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1767_c7_608b_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1754_c7_6f4b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1744_c7_434a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1744_c7_434a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1744_c7_434a_cond;
     n16_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue;
     n16_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1744_c7_434a_return_output := n16_MUX_uxn_opcodes_h_l1744_c7_434a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1758_c7_0ba5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1748_c7_988f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_988f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_988f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_988f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_988f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1763_c7_4ffb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4ffb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4ffb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4ffb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4ffb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4ffb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4ffb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1763_c7_4ffb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4ffb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4ffb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4ffb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4ffb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4ffb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4ffb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1736_c2_bb61] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_bb61_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_bb61_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1763_c7_4ffb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1763_c7_4ffb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_4ffb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1763_c7_4ffb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_4ffb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1763_c7_4ffb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_4ffb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output := result_stack_value_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1744_c7_434a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_988f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_4ffb_return_output;
     -- n16_MUX[uxn_opcodes_h_l1736_c2_bb61] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1736_c2_bb61_cond <= VAR_n16_MUX_uxn_opcodes_h_l1736_c2_bb61_cond;
     n16_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue;
     n16_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output := n16_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1754_c7_6f4b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1748_c7_988f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_988f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_988f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_988f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_988f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1758_c7_0ba5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1744_c7_434a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_434a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_434a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_434a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_434a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1758_c7_0ba5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1758_c7_0ba5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1758_c7_0ba5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1758_c7_0ba5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1758_c7_0ba5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output := result_stack_value_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_988f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_434a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1758_c7_0ba5_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1754_c7_6f4b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1748_c7_988f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_988f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_988f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_988f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_988f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1736_c2_bb61] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_bb61_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_bb61_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1754_c7_6f4b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1744_c7_434a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_434a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_434a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_434a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_434a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1754_c7_6f4b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_6f4b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_6f4b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_6f4b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_434a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_988f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1754_c7_6f4b_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1748_c7_988f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_988f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_988f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_988f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_988f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1748_c7_988f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_988f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_988f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_988f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_988f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1748_c7_988f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1748_c7_988f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1748_c7_988f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1748_c7_988f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1748_c7_988f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1748_c7_988f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1748_c7_988f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1736_c2_bb61] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_bb61_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_bb61_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1744_c7_434a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_434a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_434a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_434a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_434a_return_output;

     -- Submodule level 13
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_988f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_988f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_434a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1748_c7_988f_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1744_c7_434a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_434a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_434a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_434a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_434a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1744_c7_434a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_434a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_434a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_434a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_434a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1736_c2_bb61] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_bb61_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_bb61_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1744_c7_434a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1744_c7_434a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1744_c7_434a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1744_c7_434a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1744_c7_434a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1744_c7_434a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1744_c7_434a_return_output;

     -- Submodule level 14
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_434a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_434a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1744_c7_434a_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1736_c2_bb61] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1736_c2_bb61_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c2_bb61_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output := result_stack_value_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1736_c2_bb61] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_bb61_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_bb61_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1736_c2_bb61] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_bb61_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_bb61_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_bb61_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_bb61_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output;

     -- Submodule level 15
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1732_l1810_DUPLICATE_cec1 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1732_l1810_DUPLICATE_cec1_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c2_bb61_return_output);

     -- Submodule level 16
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1732_l1810_DUPLICATE_cec1_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1732_l1810_DUPLICATE_cec1_return_output;
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
