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
-- BIN_OP_EQ[uxn_opcodes_h_l1736_c6_55fe]
signal BIN_OP_EQ_uxn_opcodes_h_l1736_c6_55fe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1736_c6_55fe_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1736_c6_55fe_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1736_c1_093e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_093e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_093e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_093e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_093e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1736_c2_9416]
signal n16_MUX_uxn_opcodes_h_l1736_c2_9416_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1736_c2_9416_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1736_c2_9416]
signal t16_MUX_uxn_opcodes_h_l1736_c2_9416_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1736_c2_9416_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1736_c2_9416]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_9416_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_9416_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1736_c2_9416]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_9416_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_9416_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1736_c2_9416]
signal result_stack_value_MUX_uxn_opcodes_h_l1736_c2_9416_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1736_c2_9416_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1736_c2_9416]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_9416_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_9416_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1736_c2_9416]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_9416_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_9416_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1736_c2_9416]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_9416_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_9416_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1736_c2_9416]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_9416_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_9416_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1736_c2_9416]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_9416_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_9416_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1737_c3_c510[uxn_opcodes_h_l1737_c3_c510]
signal printf_uxn_opcodes_h_l1737_c3_c510_uxn_opcodes_h_l1737_c3_c510_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1744_c11_3124]
signal BIN_OP_EQ_uxn_opcodes_h_l1744_c11_3124_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1744_c11_3124_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1744_c11_3124_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1744_c7_8f62]
signal n16_MUX_uxn_opcodes_h_l1744_c7_8f62_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1744_c7_8f62]
signal t16_MUX_uxn_opcodes_h_l1744_c7_8f62_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1744_c7_8f62]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_8f62_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1744_c7_8f62]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_8f62_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1744_c7_8f62]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_8f62_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1744_c7_8f62]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_8f62_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1744_c7_8f62]
signal result_stack_value_MUX_uxn_opcodes_h_l1744_c7_8f62_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1744_c7_8f62]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_8f62_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1744_c7_8f62]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_8f62_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1748_c11_5268]
signal BIN_OP_EQ_uxn_opcodes_h_l1748_c11_5268_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1748_c11_5268_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1748_c11_5268_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1748_c7_c11a]
signal n16_MUX_uxn_opcodes_h_l1748_c7_c11a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1748_c7_c11a]
signal t16_MUX_uxn_opcodes_h_l1748_c7_c11a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1748_c7_c11a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_c11a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1748_c7_c11a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_c11a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1748_c7_c11a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_c11a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1748_c7_c11a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_c11a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1748_c7_c11a]
signal result_stack_value_MUX_uxn_opcodes_h_l1748_c7_c11a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1748_c7_c11a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_c11a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1748_c7_c11a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_c11a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1754_c11_ac33]
signal BIN_OP_EQ_uxn_opcodes_h_l1754_c11_ac33_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1754_c11_ac33_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1754_c11_ac33_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1754_c7_3b08]
signal n16_MUX_uxn_opcodes_h_l1754_c7_3b08_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1754_c7_3b08]
signal t16_MUX_uxn_opcodes_h_l1754_c7_3b08_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1754_c7_3b08]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_3b08_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1754_c7_3b08]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_3b08_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1754_c7_3b08]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_3b08_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1754_c7_3b08]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_3b08_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1754_c7_3b08]
signal result_stack_value_MUX_uxn_opcodes_h_l1754_c7_3b08_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1754_c7_3b08]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_3b08_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1754_c7_3b08]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_3b08_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1758_c11_9764]
signal BIN_OP_EQ_uxn_opcodes_h_l1758_c11_9764_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1758_c11_9764_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1758_c11_9764_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1758_c7_4f08]
signal n16_MUX_uxn_opcodes_h_l1758_c7_4f08_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1758_c7_4f08]
signal t16_MUX_uxn_opcodes_h_l1758_c7_4f08_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1758_c7_4f08]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_4f08_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1758_c7_4f08]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_4f08_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1758_c7_4f08]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_4f08_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1758_c7_4f08]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_4f08_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1758_c7_4f08]
signal result_stack_value_MUX_uxn_opcodes_h_l1758_c7_4f08_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1758_c7_4f08]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_4f08_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1758_c7_4f08]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_4f08_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1759_c3_4fe4]
signal BIN_OP_OR_uxn_opcodes_h_l1759_c3_4fe4_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1759_c3_4fe4_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1759_c3_4fe4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1763_c11_fbe7]
signal BIN_OP_EQ_uxn_opcodes_h_l1763_c11_fbe7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1763_c11_fbe7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1763_c11_fbe7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1763_c7_d7e7]
signal n16_MUX_uxn_opcodes_h_l1763_c7_d7e7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1763_c7_d7e7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1763_c7_d7e7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1763_c7_d7e7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_d7e7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_d7e7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_d7e7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1763_c7_d7e7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_d7e7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_d7e7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_d7e7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1763_c7_d7e7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_d7e7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_d7e7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_d7e7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1763_c7_d7e7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1763_c7_d7e7]
signal result_stack_value_MUX_uxn_opcodes_h_l1763_c7_d7e7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1763_c7_d7e7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1763_c7_d7e7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1763_c7_d7e7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1763_c7_d7e7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_d7e7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_d7e7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_d7e7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1767_c11_0ff3]
signal BIN_OP_EQ_uxn_opcodes_h_l1767_c11_0ff3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1767_c11_0ff3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1767_c11_0ff3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1767_c7_baa7]
signal n16_MUX_uxn_opcodes_h_l1767_c7_baa7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1767_c7_baa7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1767_c7_baa7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1767_c7_baa7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_baa7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_baa7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_baa7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1767_c7_baa7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_baa7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_baa7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_baa7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1767_c7_baa7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_baa7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_baa7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_baa7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1767_c7_baa7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_baa7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_baa7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_baa7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1767_c7_baa7]
signal result_stack_value_MUX_uxn_opcodes_h_l1767_c7_baa7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1767_c7_baa7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1767_c7_baa7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1767_c7_baa7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_baa7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_baa7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_baa7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1767_c7_baa7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_baa7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_baa7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_baa7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1773_c11_ebfd]
signal BIN_OP_EQ_uxn_opcodes_h_l1773_c11_ebfd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1773_c11_ebfd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1773_c11_ebfd_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1773_c7_2e10]
signal n16_MUX_uxn_opcodes_h_l1773_c7_2e10_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1773_c7_2e10_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1773_c7_2e10_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1773_c7_2e10]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_2e10_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_2e10_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_2e10_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1773_c7_2e10]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_2e10_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_2e10_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_2e10_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1773_c7_2e10]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_2e10_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_2e10_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_2e10_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1773_c7_2e10]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_2e10_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_2e10_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_2e10_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1773_c7_2e10]
signal result_stack_value_MUX_uxn_opcodes_h_l1773_c7_2e10_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1773_c7_2e10_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1773_c7_2e10_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1773_c7_2e10]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_2e10_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_2e10_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_2e10_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1773_c7_2e10]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_2e10_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_2e10_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_2e10_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1777_c11_e942]
signal BIN_OP_EQ_uxn_opcodes_h_l1777_c11_e942_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1777_c11_e942_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1777_c11_e942_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1777_c7_3474]
signal n16_MUX_uxn_opcodes_h_l1777_c7_3474_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1777_c7_3474_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1777_c7_3474_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1777_c7_3474_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1777_c7_3474]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3474_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3474_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3474_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3474_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1777_c7_3474]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3474_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3474_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3474_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3474_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1777_c7_3474]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3474_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3474_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3474_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3474_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1777_c7_3474]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3474_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3474_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3474_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3474_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1777_c7_3474]
signal result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3474_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3474_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3474_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3474_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1777_c7_3474]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3474_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3474_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3474_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3474_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1777_c7_3474]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3474_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3474_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3474_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3474_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1778_c3_92fa]
signal BIN_OP_OR_uxn_opcodes_h_l1778_c3_92fa_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1778_c3_92fa_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1778_c3_92fa_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1781_c32_e04c]
signal BIN_OP_AND_uxn_opcodes_h_l1781_c32_e04c_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1781_c32_e04c_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1781_c32_e04c_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1781_c32_c66c]
signal BIN_OP_GT_uxn_opcodes_h_l1781_c32_c66c_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1781_c32_c66c_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1781_c32_c66c_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1781_c32_284d]
signal MUX_uxn_opcodes_h_l1781_c32_284d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1781_c32_284d_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1781_c32_284d_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1781_c32_284d_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1783_c11_7d83]
signal BIN_OP_EQ_uxn_opcodes_h_l1783_c11_7d83_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1783_c11_7d83_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1783_c11_7d83_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1783_c7_5ace]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5ace_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5ace_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5ace_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5ace_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1783_c7_5ace]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5ace_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5ace_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5ace_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5ace_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1783_c7_5ace]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5ace_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5ace_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5ace_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5ace_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1783_c7_5ace]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5ace_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5ace_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5ace_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5ace_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1783_c7_5ace]
signal result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5ace_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5ace_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5ace_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5ace_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1789_c11_fa08]
signal BIN_OP_EQ_uxn_opcodes_h_l1789_c11_fa08_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1789_c11_fa08_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1789_c11_fa08_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1789_c7_5bcc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_5bcc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_5bcc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_5bcc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_5bcc_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1789_c7_5bcc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_5bcc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_5bcc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_5bcc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_5bcc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1789_c7_5bcc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_5bcc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_5bcc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_5bcc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_5bcc_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1789_c7_5bcc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_5bcc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_5bcc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_5bcc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_5bcc_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1789_c7_5bcc]
signal result_stack_value_MUX_uxn_opcodes_h_l1789_c7_5bcc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1789_c7_5bcc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1789_c7_5bcc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1789_c7_5bcc_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1792_c34_f6a0]
signal CONST_SR_8_uxn_opcodes_h_l1792_c34_f6a0_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1792_c34_f6a0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1794_c11_8555]
signal BIN_OP_EQ_uxn_opcodes_h_l1794_c11_8555_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1794_c11_8555_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1794_c11_8555_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1794_c7_8389]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8389_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8389_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8389_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8389_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1794_c7_8389]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8389_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8389_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8389_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8389_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1794_c7_8389]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8389_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8389_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8389_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8389_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1794_c7_8389]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8389_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8389_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8389_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8389_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1794_c7_8389]
signal result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8389_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8389_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8389_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8389_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1800_c11_c62e]
signal BIN_OP_EQ_uxn_opcodes_h_l1800_c11_c62e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1800_c11_c62e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1800_c11_c62e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1800_c7_9a7a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_9a7a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_9a7a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_9a7a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_9a7a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1800_c7_9a7a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_9a7a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_9a7a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_9a7a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_9a7a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1800_c7_9a7a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_9a7a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_9a7a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_9a7a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_9a7a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1800_c7_9a7a]
signal result_stack_value_MUX_uxn_opcodes_h_l1800_c7_9a7a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1800_c7_9a7a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1800_c7_9a7a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1800_c7_9a7a_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1803_c34_803f]
signal CONST_SR_8_uxn_opcodes_h_l1803_c34_803f_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1803_c34_803f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1805_c11_6c12]
signal BIN_OP_EQ_uxn_opcodes_h_l1805_c11_6c12_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1805_c11_6c12_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1805_c11_6c12_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1805_c7_3023]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_3023_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_3023_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_3023_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_3023_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1805_c7_3023]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_3023_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_3023_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_3023_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_3023_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_2647
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_2647_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_2647_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1736_c6_55fe
BIN_OP_EQ_uxn_opcodes_h_l1736_c6_55fe : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1736_c6_55fe_left,
BIN_OP_EQ_uxn_opcodes_h_l1736_c6_55fe_right,
BIN_OP_EQ_uxn_opcodes_h_l1736_c6_55fe_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_093e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_093e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_093e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_093e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_093e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_093e_return_output);

-- n16_MUX_uxn_opcodes_h_l1736_c2_9416
n16_MUX_uxn_opcodes_h_l1736_c2_9416 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1736_c2_9416_cond,
n16_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue,
n16_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse,
n16_MUX_uxn_opcodes_h_l1736_c2_9416_return_output);

-- t16_MUX_uxn_opcodes_h_l1736_c2_9416
t16_MUX_uxn_opcodes_h_l1736_c2_9416 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1736_c2_9416_cond,
t16_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue,
t16_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse,
t16_MUX_uxn_opcodes_h_l1736_c2_9416_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_9416
result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_9416 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_9416_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_9416_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_9416
result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_9416 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_9416_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_9416_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1736_c2_9416
result_stack_value_MUX_uxn_opcodes_h_l1736_c2_9416 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1736_c2_9416_cond,
result_stack_value_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1736_c2_9416_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_9416
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_9416 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_9416_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_9416_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_9416
result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_9416 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_9416_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_9416_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_9416
result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_9416 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_9416_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_9416_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_9416
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_9416 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_9416_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_9416_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_9416
result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_9416 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_9416_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_9416_return_output);

-- printf_uxn_opcodes_h_l1737_c3_c510_uxn_opcodes_h_l1737_c3_c510
printf_uxn_opcodes_h_l1737_c3_c510_uxn_opcodes_h_l1737_c3_c510 : entity work.printf_uxn_opcodes_h_l1737_c3_c510_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1737_c3_c510_uxn_opcodes_h_l1737_c3_c510_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1744_c11_3124
BIN_OP_EQ_uxn_opcodes_h_l1744_c11_3124 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1744_c11_3124_left,
BIN_OP_EQ_uxn_opcodes_h_l1744_c11_3124_right,
BIN_OP_EQ_uxn_opcodes_h_l1744_c11_3124_return_output);

-- n16_MUX_uxn_opcodes_h_l1744_c7_8f62
n16_MUX_uxn_opcodes_h_l1744_c7_8f62 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1744_c7_8f62_cond,
n16_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue,
n16_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse,
n16_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output);

-- t16_MUX_uxn_opcodes_h_l1744_c7_8f62
t16_MUX_uxn_opcodes_h_l1744_c7_8f62 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1744_c7_8f62_cond,
t16_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue,
t16_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse,
t16_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_8f62
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_8f62 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_8f62_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_8f62
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_8f62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_8f62_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_8f62
result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_8f62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_8f62_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_8f62
result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_8f62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_8f62_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1744_c7_8f62
result_stack_value_MUX_uxn_opcodes_h_l1744_c7_8f62 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1744_c7_8f62_cond,
result_stack_value_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_8f62
result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_8f62 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_8f62_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_8f62
result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_8f62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_8f62_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1748_c11_5268
BIN_OP_EQ_uxn_opcodes_h_l1748_c11_5268 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1748_c11_5268_left,
BIN_OP_EQ_uxn_opcodes_h_l1748_c11_5268_right,
BIN_OP_EQ_uxn_opcodes_h_l1748_c11_5268_return_output);

-- n16_MUX_uxn_opcodes_h_l1748_c7_c11a
n16_MUX_uxn_opcodes_h_l1748_c7_c11a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1748_c7_c11a_cond,
n16_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue,
n16_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse,
n16_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output);

-- t16_MUX_uxn_opcodes_h_l1748_c7_c11a
t16_MUX_uxn_opcodes_h_l1748_c7_c11a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1748_c7_c11a_cond,
t16_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue,
t16_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse,
t16_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_c11a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_c11a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_c11a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_c11a
result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_c11a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_c11a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_c11a
result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_c11a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_c11a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_c11a
result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_c11a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_c11a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1748_c7_c11a
result_stack_value_MUX_uxn_opcodes_h_l1748_c7_c11a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1748_c7_c11a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_c11a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_c11a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_c11a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_c11a
result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_c11a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_c11a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1754_c11_ac33
BIN_OP_EQ_uxn_opcodes_h_l1754_c11_ac33 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1754_c11_ac33_left,
BIN_OP_EQ_uxn_opcodes_h_l1754_c11_ac33_right,
BIN_OP_EQ_uxn_opcodes_h_l1754_c11_ac33_return_output);

-- n16_MUX_uxn_opcodes_h_l1754_c7_3b08
n16_MUX_uxn_opcodes_h_l1754_c7_3b08 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1754_c7_3b08_cond,
n16_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue,
n16_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse,
n16_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output);

-- t16_MUX_uxn_opcodes_h_l1754_c7_3b08
t16_MUX_uxn_opcodes_h_l1754_c7_3b08 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1754_c7_3b08_cond,
t16_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue,
t16_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse,
t16_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_3b08
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_3b08 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_3b08_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_3b08
result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_3b08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_3b08_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_3b08
result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_3b08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_3b08_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_3b08
result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_3b08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_3b08_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1754_c7_3b08
result_stack_value_MUX_uxn_opcodes_h_l1754_c7_3b08 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1754_c7_3b08_cond,
result_stack_value_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_3b08
result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_3b08 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_3b08_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_3b08
result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_3b08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_3b08_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1758_c11_9764
BIN_OP_EQ_uxn_opcodes_h_l1758_c11_9764 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1758_c11_9764_left,
BIN_OP_EQ_uxn_opcodes_h_l1758_c11_9764_right,
BIN_OP_EQ_uxn_opcodes_h_l1758_c11_9764_return_output);

-- n16_MUX_uxn_opcodes_h_l1758_c7_4f08
n16_MUX_uxn_opcodes_h_l1758_c7_4f08 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1758_c7_4f08_cond,
n16_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue,
n16_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse,
n16_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output);

-- t16_MUX_uxn_opcodes_h_l1758_c7_4f08
t16_MUX_uxn_opcodes_h_l1758_c7_4f08 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1758_c7_4f08_cond,
t16_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue,
t16_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse,
t16_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_4f08
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_4f08 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_4f08_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_4f08
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_4f08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_4f08_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_4f08
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_4f08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_4f08_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_4f08
result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_4f08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_4f08_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1758_c7_4f08
result_stack_value_MUX_uxn_opcodes_h_l1758_c7_4f08 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1758_c7_4f08_cond,
result_stack_value_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_4f08
result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_4f08 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_4f08_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_4f08
result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_4f08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_4f08_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1759_c3_4fe4
BIN_OP_OR_uxn_opcodes_h_l1759_c3_4fe4 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1759_c3_4fe4_left,
BIN_OP_OR_uxn_opcodes_h_l1759_c3_4fe4_right,
BIN_OP_OR_uxn_opcodes_h_l1759_c3_4fe4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1763_c11_fbe7
BIN_OP_EQ_uxn_opcodes_h_l1763_c11_fbe7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1763_c11_fbe7_left,
BIN_OP_EQ_uxn_opcodes_h_l1763_c11_fbe7_right,
BIN_OP_EQ_uxn_opcodes_h_l1763_c11_fbe7_return_output);

-- n16_MUX_uxn_opcodes_h_l1763_c7_d7e7
n16_MUX_uxn_opcodes_h_l1763_c7_d7e7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1763_c7_d7e7_cond,
n16_MUX_uxn_opcodes_h_l1763_c7_d7e7_iftrue,
n16_MUX_uxn_opcodes_h_l1763_c7_d7e7_iffalse,
n16_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_d7e7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_d7e7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_d7e7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_d7e7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_d7e7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_d7e7
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_d7e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_d7e7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_d7e7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_d7e7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_d7e7
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_d7e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_d7e7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_d7e7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_d7e7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1763_c7_d7e7
result_stack_value_MUX_uxn_opcodes_h_l1763_c7_d7e7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1763_c7_d7e7_cond,
result_stack_value_MUX_uxn_opcodes_h_l1763_c7_d7e7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1763_c7_d7e7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_d7e7
result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_d7e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_d7e7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_d7e7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_d7e7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1767_c11_0ff3
BIN_OP_EQ_uxn_opcodes_h_l1767_c11_0ff3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1767_c11_0ff3_left,
BIN_OP_EQ_uxn_opcodes_h_l1767_c11_0ff3_right,
BIN_OP_EQ_uxn_opcodes_h_l1767_c11_0ff3_return_output);

-- n16_MUX_uxn_opcodes_h_l1767_c7_baa7
n16_MUX_uxn_opcodes_h_l1767_c7_baa7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1767_c7_baa7_cond,
n16_MUX_uxn_opcodes_h_l1767_c7_baa7_iftrue,
n16_MUX_uxn_opcodes_h_l1767_c7_baa7_iffalse,
n16_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_baa7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_baa7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_baa7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_baa7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_baa7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_baa7
result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_baa7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_baa7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_baa7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_baa7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_baa7
result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_baa7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_baa7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_baa7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_baa7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_baa7
result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_baa7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_baa7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_baa7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_baa7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1767_c7_baa7
result_stack_value_MUX_uxn_opcodes_h_l1767_c7_baa7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1767_c7_baa7_cond,
result_stack_value_MUX_uxn_opcodes_h_l1767_c7_baa7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1767_c7_baa7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_baa7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_baa7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_baa7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_baa7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_baa7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_baa7
result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_baa7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_baa7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_baa7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_baa7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1773_c11_ebfd
BIN_OP_EQ_uxn_opcodes_h_l1773_c11_ebfd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1773_c11_ebfd_left,
BIN_OP_EQ_uxn_opcodes_h_l1773_c11_ebfd_right,
BIN_OP_EQ_uxn_opcodes_h_l1773_c11_ebfd_return_output);

-- n16_MUX_uxn_opcodes_h_l1773_c7_2e10
n16_MUX_uxn_opcodes_h_l1773_c7_2e10 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1773_c7_2e10_cond,
n16_MUX_uxn_opcodes_h_l1773_c7_2e10_iftrue,
n16_MUX_uxn_opcodes_h_l1773_c7_2e10_iffalse,
n16_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_2e10
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_2e10 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_2e10_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_2e10_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_2e10_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_2e10
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_2e10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_2e10_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_2e10_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_2e10_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_2e10
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_2e10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_2e10_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_2e10_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_2e10_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_2e10
result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_2e10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_2e10_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_2e10_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_2e10_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1773_c7_2e10
result_stack_value_MUX_uxn_opcodes_h_l1773_c7_2e10 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1773_c7_2e10_cond,
result_stack_value_MUX_uxn_opcodes_h_l1773_c7_2e10_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1773_c7_2e10_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_2e10
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_2e10 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_2e10_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_2e10_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_2e10_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_2e10
result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_2e10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_2e10_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_2e10_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_2e10_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1777_c11_e942
BIN_OP_EQ_uxn_opcodes_h_l1777_c11_e942 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1777_c11_e942_left,
BIN_OP_EQ_uxn_opcodes_h_l1777_c11_e942_right,
BIN_OP_EQ_uxn_opcodes_h_l1777_c11_e942_return_output);

-- n16_MUX_uxn_opcodes_h_l1777_c7_3474
n16_MUX_uxn_opcodes_h_l1777_c7_3474 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1777_c7_3474_cond,
n16_MUX_uxn_opcodes_h_l1777_c7_3474_iftrue,
n16_MUX_uxn_opcodes_h_l1777_c7_3474_iffalse,
n16_MUX_uxn_opcodes_h_l1777_c7_3474_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3474
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3474 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3474_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3474_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3474_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3474_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3474
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3474 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3474_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3474_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3474_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3474_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3474
result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3474 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3474_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3474_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3474_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3474_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3474
result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3474 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3474_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3474_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3474_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3474_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3474
result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3474 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3474_cond,
result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3474_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3474_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3474_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3474
result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3474 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3474_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3474_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3474_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3474_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3474
result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3474 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3474_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3474_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3474_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3474_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1778_c3_92fa
BIN_OP_OR_uxn_opcodes_h_l1778_c3_92fa : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1778_c3_92fa_left,
BIN_OP_OR_uxn_opcodes_h_l1778_c3_92fa_right,
BIN_OP_OR_uxn_opcodes_h_l1778_c3_92fa_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1781_c32_e04c
BIN_OP_AND_uxn_opcodes_h_l1781_c32_e04c : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1781_c32_e04c_left,
BIN_OP_AND_uxn_opcodes_h_l1781_c32_e04c_right,
BIN_OP_AND_uxn_opcodes_h_l1781_c32_e04c_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1781_c32_c66c
BIN_OP_GT_uxn_opcodes_h_l1781_c32_c66c : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1781_c32_c66c_left,
BIN_OP_GT_uxn_opcodes_h_l1781_c32_c66c_right,
BIN_OP_GT_uxn_opcodes_h_l1781_c32_c66c_return_output);

-- MUX_uxn_opcodes_h_l1781_c32_284d
MUX_uxn_opcodes_h_l1781_c32_284d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1781_c32_284d_cond,
MUX_uxn_opcodes_h_l1781_c32_284d_iftrue,
MUX_uxn_opcodes_h_l1781_c32_284d_iffalse,
MUX_uxn_opcodes_h_l1781_c32_284d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1783_c11_7d83
BIN_OP_EQ_uxn_opcodes_h_l1783_c11_7d83 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1783_c11_7d83_left,
BIN_OP_EQ_uxn_opcodes_h_l1783_c11_7d83_right,
BIN_OP_EQ_uxn_opcodes_h_l1783_c11_7d83_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5ace
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5ace : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5ace_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5ace_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5ace_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5ace_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5ace
result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5ace : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5ace_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5ace_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5ace_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5ace_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5ace
result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5ace : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5ace_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5ace_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5ace_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5ace_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5ace
result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5ace : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5ace_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5ace_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5ace_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5ace_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5ace
result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5ace : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5ace_cond,
result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5ace_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5ace_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5ace_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1789_c11_fa08
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_fa08 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_fa08_left,
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_fa08_right,
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_fa08_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_5bcc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_5bcc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_5bcc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_5bcc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_5bcc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_5bcc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_5bcc
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_5bcc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_5bcc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_5bcc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_5bcc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_5bcc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_5bcc
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_5bcc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_5bcc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_5bcc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_5bcc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_5bcc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_5bcc
result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_5bcc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_5bcc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_5bcc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_5bcc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_5bcc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1789_c7_5bcc
result_stack_value_MUX_uxn_opcodes_h_l1789_c7_5bcc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1789_c7_5bcc_cond,
result_stack_value_MUX_uxn_opcodes_h_l1789_c7_5bcc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1789_c7_5bcc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1789_c7_5bcc_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1792_c34_f6a0
CONST_SR_8_uxn_opcodes_h_l1792_c34_f6a0 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1792_c34_f6a0_x,
CONST_SR_8_uxn_opcodes_h_l1792_c34_f6a0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1794_c11_8555
BIN_OP_EQ_uxn_opcodes_h_l1794_c11_8555 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1794_c11_8555_left,
BIN_OP_EQ_uxn_opcodes_h_l1794_c11_8555_right,
BIN_OP_EQ_uxn_opcodes_h_l1794_c11_8555_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8389
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8389 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8389_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8389_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8389_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8389_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8389
result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8389 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8389_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8389_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8389_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8389_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8389
result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8389 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8389_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8389_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8389_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8389_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8389
result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8389 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8389_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8389_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8389_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8389_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8389
result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8389 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8389_cond,
result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8389_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8389_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8389_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1800_c11_c62e
BIN_OP_EQ_uxn_opcodes_h_l1800_c11_c62e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1800_c11_c62e_left,
BIN_OP_EQ_uxn_opcodes_h_l1800_c11_c62e_right,
BIN_OP_EQ_uxn_opcodes_h_l1800_c11_c62e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_9a7a
result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_9a7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_9a7a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_9a7a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_9a7a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_9a7a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_9a7a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_9a7a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_9a7a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_9a7a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_9a7a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_9a7a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_9a7a
result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_9a7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_9a7a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_9a7a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_9a7a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_9a7a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1800_c7_9a7a
result_stack_value_MUX_uxn_opcodes_h_l1800_c7_9a7a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1800_c7_9a7a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1800_c7_9a7a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1800_c7_9a7a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1800_c7_9a7a_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1803_c34_803f
CONST_SR_8_uxn_opcodes_h_l1803_c34_803f : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1803_c34_803f_x,
CONST_SR_8_uxn_opcodes_h_l1803_c34_803f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1805_c11_6c12
BIN_OP_EQ_uxn_opcodes_h_l1805_c11_6c12 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1805_c11_6c12_left,
BIN_OP_EQ_uxn_opcodes_h_l1805_c11_6c12_right,
BIN_OP_EQ_uxn_opcodes_h_l1805_c11_6c12_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_3023
result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_3023 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_3023_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_3023_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_3023_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_3023_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_3023
result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_3023 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_3023_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_3023_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_3023_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_3023_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_2647
CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_2647 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_2647_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_2647_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1736_c6_55fe_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_093e_return_output,
 n16_MUX_uxn_opcodes_h_l1736_c2_9416_return_output,
 t16_MUX_uxn_opcodes_h_l1736_c2_9416_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_9416_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_9416_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1736_c2_9416_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_9416_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_9416_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_9416_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_9416_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_9416_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1744_c11_3124_return_output,
 n16_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output,
 t16_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1748_c11_5268_return_output,
 n16_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output,
 t16_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1754_c11_ac33_return_output,
 n16_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output,
 t16_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1758_c11_9764_return_output,
 n16_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output,
 t16_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1759_c3_4fe4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1763_c11_fbe7_return_output,
 n16_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1767_c11_0ff3_return_output,
 n16_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1773_c11_ebfd_return_output,
 n16_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1777_c11_e942_return_output,
 n16_MUX_uxn_opcodes_h_l1777_c7_3474_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3474_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3474_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3474_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3474_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3474_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3474_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3474_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1778_c3_92fa_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1781_c32_e04c_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1781_c32_c66c_return_output,
 MUX_uxn_opcodes_h_l1781_c32_284d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1783_c11_7d83_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5ace_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5ace_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5ace_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5ace_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5ace_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1789_c11_fa08_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_5bcc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_5bcc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_5bcc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_5bcc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1789_c7_5bcc_return_output,
 CONST_SR_8_uxn_opcodes_h_l1792_c34_f6a0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1794_c11_8555_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8389_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8389_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8389_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8389_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8389_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1800_c11_c62e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_9a7a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_9a7a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_9a7a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1800_c7_9a7a_return_output,
 CONST_SR_8_uxn_opcodes_h_l1803_c34_803f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1805_c11_6c12_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_3023_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_3023_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_2647_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_55fe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_55fe_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_55fe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_093e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_093e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_093e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_093e_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1736_c2_9416_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1736_c2_9416_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1736_c2_9416_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1736_c2_9416_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_9416_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_9416_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_9416_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_9416_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c2_9416_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c2_9416_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1736_c2_9416_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_9416_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_9416_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_9416_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_9416_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_9416_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_9416_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1740_c3_e767 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_9416_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_9416_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_9416_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_9416_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1737_c3_c510_uxn_opcodes_h_l1737_c3_c510_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_3124_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_3124_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_3124_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1744_c7_8f62_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1744_c7_8f62_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1746_c3_9869 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_8f62_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_8f62_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_8f62_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_8f62_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1744_c7_8f62_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_8f62_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_8f62_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_5268_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_5268_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_5268_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1748_c7_c11a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1748_c7_c11a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1752_c3_ab59 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_c11a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_c11a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_c11a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_c11a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1748_c7_c11a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_c11a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_c11a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_ac33_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_ac33_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_ac33_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1754_c7_3b08_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1754_c7_3b08_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1756_c3_3da4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_3b08_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_3b08_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_3b08_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_3b08_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1754_c7_3b08_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_3b08_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_3b08_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_9764_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_9764_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_9764_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1758_c7_4f08_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1758_c7_4f08_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1761_c3_bad1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_4f08_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_4f08_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_4f08_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_4f08_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1758_c7_4f08_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_4f08_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_4f08_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1759_c3_4fe4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1759_c3_4fe4_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1759_c3_4fe4_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_fbe7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_fbe7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_fbe7_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1763_c7_d7e7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1763_c7_d7e7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1763_c7_d7e7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_d7e7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1765_c3_447d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_d7e7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_d7e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_d7e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_d7e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_d7e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_d7e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_d7e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_d7e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_d7e7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_d7e7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_d7e7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_d7e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_d7e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_d7e7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_0ff3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_0ff3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_0ff3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1767_c7_baa7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1767_c7_baa7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1767_c7_baa7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_baa7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1771_c3_6ba3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_baa7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_baa7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_baa7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_baa7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_baa7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_baa7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_baa7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_baa7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_baa7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_baa7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_baa7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1767_c7_baa7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1767_c7_baa7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1767_c7_baa7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_baa7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_baa7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_baa7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_baa7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_baa7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_baa7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_ebfd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_ebfd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_ebfd_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1773_c7_2e10_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1773_c7_2e10_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1777_c7_3474_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1773_c7_2e10_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_2e10_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1775_c3_9918 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_2e10_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3474_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_2e10_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_2e10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_2e10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3474_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_2e10_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_2e10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_2e10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3474_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_2e10_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_2e10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_2e10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3474_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_2e10_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_2e10_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_2e10_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3474_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_2e10_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_2e10_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_2e10_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3474_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_2e10_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_2e10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_2e10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3474_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_2e10_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_e942_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_e942_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_e942_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1777_c7_3474_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1777_c7_3474_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1777_c7_3474_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3474_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3474_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5ace_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3474_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3474_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3474_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5ace_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3474_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3474_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3474_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5ace_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3474_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3474_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3474_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5ace_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3474_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3474_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3474_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5ace_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3474_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3474_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3474_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3474_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3474_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3474_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1777_c7_3474_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3474_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1778_c3_92fa_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1778_c3_92fa_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1778_c3_92fa_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1781_c32_284d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1781_c32_284d_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1781_c32_284d_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1781_c32_e04c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1781_c32_e04c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1781_c32_e04c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1781_c32_c66c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1781_c32_c66c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1781_c32_c66c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1781_c32_284d_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_7d83_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_7d83_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_7d83_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5ace_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1786_c3_a938 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5ace_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_5bcc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5ace_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5ace_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5ace_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_5bcc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5ace_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5ace_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5ace_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_5bcc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5ace_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5ace_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5ace_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_5bcc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5ace_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5ace_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5ace_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1789_c7_5bcc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5ace_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1787_c24_7298_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_fa08_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_fa08_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_fa08_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_5bcc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1791_c3_d94b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_5bcc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8389_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_5bcc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_5bcc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_5bcc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8389_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_5bcc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_5bcc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_5bcc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8389_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_5bcc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_5bcc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_5bcc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8389_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_5bcc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1789_c7_5bcc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1789_c7_5bcc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8389_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1789_c7_5bcc_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1792_c34_f6a0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1792_c34_f6a0_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1792_c24_c9ab_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_8555_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_8555_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_8555_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8389_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1797_c3_f7f8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8389_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_9a7a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8389_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8389_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8389_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_9a7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8389_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8389_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8389_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_9a7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8389_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8389_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8389_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8389_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8389_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8389_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1800_c7_9a7a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8389_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1798_c24_7f43_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_c62e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_c62e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_c62e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_9a7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_9a7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_3023_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_9a7a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_9a7a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1802_c3_711a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_9a7a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_9a7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_9a7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_9a7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_3023_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_9a7a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1800_c7_9a7a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1800_c7_9a7a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1800_c7_9a7a_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1803_c34_803f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1803_c34_803f_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1803_c24_08a0_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1805_c11_6c12_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1805_c11_6c12_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1805_c11_6c12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_3023_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_3023_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_3023_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_3023_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_3023_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_3023_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1800_l1763_DUPLICATE_2199_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1763_DUPLICATE_f0f1_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1748_l1744_l1773_l1736_l1767_l1763_l1794_DUPLICATE_e405_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1783_l1748_l1777_l1744_l1773_l1805_l1767_l1800_l1763_l1794_DUPLICATE_d404_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1805_l1767_l1763_DUPLICATE_bc17_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1749_l1759_l1768_l1778_DUPLICATE_63e5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_2647_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_2647_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1800_l1777_DUPLICATE_9e90_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1732_l1810_DUPLICATE_f3ce_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1797_c3_f7f8 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8389_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1797_c3_f7f8;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_d7e7_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_3124_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_55fe_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1805_c11_6c12_right := to_unsigned(13, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1765_c3_447d := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_d7e7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1765_c3_447d;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_2e10_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_baa7_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5ace_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1740_c3_e767 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1740_c3_e767;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_9a7a_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8389_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_3023_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_c62e_right := to_unsigned(12, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1802_c3_711a := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_9a7a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1802_c3_711a;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3474_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_093e_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1781_c32_e04c_right := to_unsigned(128, 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_3023_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8389_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_fa08_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_5268_right := to_unsigned(2, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_8555_right := to_unsigned(11, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1791_c3_d94b := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_5bcc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1791_c3_d94b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_e942_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1752_c3_ab59 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1752_c3_ab59;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_9764_right := to_unsigned(4, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3474_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1775_c3_9918 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_2e10_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1775_c3_9918;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_fbe7_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_0ff3_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1746_c3_9869 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1746_c3_9869;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_ebfd_right := to_unsigned(7, 3);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1781_c32_c66c_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5ace_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1786_c3_a938 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5ace_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1786_c3_a938;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1761_c3_bad1 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1761_c3_bad1;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1756_c3_3da4 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1756_c3_3da4;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_5bcc_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_7d83_right := to_unsigned(9, 4);
     VAR_MUX_uxn_opcodes_h_l1781_c32_284d_iftrue := signed(std_logic_vector(resize(to_unsigned(4, 3), 8)));
     VAR_MUX_uxn_opcodes_h_l1781_c32_284d_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_ac33_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1771_c3_6ba3 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_baa7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1771_c3_6ba3;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_093e_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1781_c32_e04c_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1778_c3_92fa_left := n16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1792_c34_f6a0_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1763_c7_d7e7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1773_c7_2e10_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1777_c7_3474_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_55fe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_3124_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_5268_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_ac33_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_9764_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_fbe7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_0ff3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_ebfd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_e942_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_7d83_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_fa08_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_8555_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_c62e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1805_c11_6c12_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1759_c3_4fe4_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1803_c34_803f_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse := t16;
     -- BIN_OP_AND[uxn_opcodes_h_l1781_c32_e04c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1781_c32_e04c_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1781_c32_e04c_left;
     BIN_OP_AND_uxn_opcodes_h_l1781_c32_e04c_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1781_c32_e04c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1781_c32_e04c_return_output := BIN_OP_AND_uxn_opcodes_h_l1781_c32_e04c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1763_c11_fbe7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1763_c11_fbe7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_fbe7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1763_c11_fbe7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_fbe7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_fbe7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1763_c11_fbe7_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1749_l1759_l1768_l1778_DUPLICATE_63e5 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1749_l1759_l1768_l1778_DUPLICATE_63e5_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1783_c11_7d83] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1783_c11_7d83_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_7d83_left;
     BIN_OP_EQ_uxn_opcodes_h_l1783_c11_7d83_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_7d83_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_7d83_return_output := BIN_OP_EQ_uxn_opcodes_h_l1783_c11_7d83_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1800_l1777_DUPLICATE_9e90 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1800_l1777_DUPLICATE_9e90_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1800_c11_c62e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1800_c11_c62e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_c62e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1800_c11_c62e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_c62e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_c62e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1800_c11_c62e_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1736_c2_9416] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1736_c2_9416_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1748_c11_5268] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1748_c11_5268_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_5268_left;
     BIN_OP_EQ_uxn_opcodes_h_l1748_c11_5268_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_5268_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_5268_return_output := BIN_OP_EQ_uxn_opcodes_h_l1748_c11_5268_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1803_c34_803f] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1803_c34_803f_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1803_c34_803f_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1803_c34_803f_return_output := CONST_SR_8_uxn_opcodes_h_l1803_c34_803f_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1787_c24_7298] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1787_c24_7298_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1767_c11_0ff3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1767_c11_0ff3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_0ff3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1767_c11_0ff3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_0ff3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_0ff3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1767_c11_0ff3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1744_c11_3124] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1744_c11_3124_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_3124_left;
     BIN_OP_EQ_uxn_opcodes_h_l1744_c11_3124_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_3124_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_3124_return_output := BIN_OP_EQ_uxn_opcodes_h_l1744_c11_3124_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1792_c34_f6a0] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1792_c34_f6a0_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1792_c34_f6a0_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1792_c34_f6a0_return_output := CONST_SR_8_uxn_opcodes_h_l1792_c34_f6a0_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1798_c24_7f43] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1798_c24_7f43_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l1777_c7_3474] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1777_c7_3474_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1748_l1744_l1773_l1736_l1767_l1763_l1794_DUPLICATE_e405 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1748_l1744_l1773_l1736_l1767_l1763_l1794_DUPLICATE_e405_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1777_c11_e942] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1777_c11_e942_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_e942_left;
     BIN_OP_EQ_uxn_opcodes_h_l1777_c11_e942_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_e942_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_e942_return_output := BIN_OP_EQ_uxn_opcodes_h_l1777_c11_e942_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1754_c11_ac33] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1754_c11_ac33_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_ac33_left;
     BIN_OP_EQ_uxn_opcodes_h_l1754_c11_ac33_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_ac33_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_ac33_return_output := BIN_OP_EQ_uxn_opcodes_h_l1754_c11_ac33_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1789_c11_fa08] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1789_c11_fa08_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_fa08_left;
     BIN_OP_EQ_uxn_opcodes_h_l1789_c11_fa08_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_fa08_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_fa08_return_output := BIN_OP_EQ_uxn_opcodes_h_l1789_c11_fa08_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1736_c6_55fe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1736_c6_55fe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_55fe_left;
     BIN_OP_EQ_uxn_opcodes_h_l1736_c6_55fe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_55fe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_55fe_return_output := BIN_OP_EQ_uxn_opcodes_h_l1736_c6_55fe_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1763_DUPLICATE_f0f1 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1763_DUPLICATE_f0f1_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1805_l1767_l1763_DUPLICATE_bc17 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1805_l1767_l1763_DUPLICATE_bc17_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1794_c11_8555] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1794_c11_8555_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_8555_left;
     BIN_OP_EQ_uxn_opcodes_h_l1794_c11_8555_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_8555_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_8555_return_output := BIN_OP_EQ_uxn_opcodes_h_l1794_c11_8555_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1783_l1748_l1777_l1744_l1773_l1805_l1767_l1800_l1763_l1794_DUPLICATE_d404 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1783_l1748_l1777_l1744_l1773_l1805_l1767_l1800_l1763_l1794_DUPLICATE_d404_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1805_c11_6c12] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1805_c11_6c12_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1805_c11_6c12_left;
     BIN_OP_EQ_uxn_opcodes_h_l1805_c11_6c12_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1805_c11_6c12_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1805_c11_6c12_return_output := BIN_OP_EQ_uxn_opcodes_h_l1805_c11_6c12_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1758_c11_9764] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1758_c11_9764_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_9764_left;
     BIN_OP_EQ_uxn_opcodes_h_l1758_c11_9764_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_9764_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_9764_return_output := BIN_OP_EQ_uxn_opcodes_h_l1758_c11_9764_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1800_l1763_DUPLICATE_2199 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1800_l1763_DUPLICATE_2199_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1773_c11_ebfd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1773_c11_ebfd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_ebfd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1773_c11_ebfd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_ebfd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_ebfd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1773_c11_ebfd_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1781_c32_c66c_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1781_c32_e04c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_093e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_55fe_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1736_c2_9416_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_55fe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_9416_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_55fe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_9416_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_55fe_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_9416_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_55fe_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_9416_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_55fe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_9416_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_55fe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_9416_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_55fe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_9416_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_55fe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c2_9416_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_55fe_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1736_c2_9416_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c6_55fe_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1744_c7_8f62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_3124_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_8f62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_3124_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_8f62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_3124_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_8f62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_3124_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_8f62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_3124_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_8f62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_3124_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_8f62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_3124_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1744_c7_8f62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_3124_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1744_c7_8f62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_3124_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1748_c7_c11a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_5268_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_c11a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_5268_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_c11a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_5268_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_c11a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_5268_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_c11a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_5268_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_c11a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_5268_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_c11a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_5268_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1748_c7_c11a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_5268_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1748_c7_c11a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_5268_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1754_c7_3b08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_ac33_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_3b08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_ac33_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_3b08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_ac33_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_3b08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_ac33_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_3b08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_ac33_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_3b08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_ac33_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_3b08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_ac33_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1754_c7_3b08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_ac33_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1754_c7_3b08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_ac33_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1758_c7_4f08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_9764_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_4f08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_9764_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_4f08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_9764_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_4f08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_9764_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_4f08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_9764_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_4f08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_9764_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_4f08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_9764_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1758_c7_4f08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_9764_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1758_c7_4f08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_9764_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1763_c7_d7e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_fbe7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_d7e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_fbe7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_fbe7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_d7e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_fbe7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_d7e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_fbe7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_fbe7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_d7e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_fbe7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_d7e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_fbe7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1767_c7_baa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_0ff3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_baa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_0ff3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_baa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_0ff3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_baa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_0ff3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_baa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_0ff3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_baa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_0ff3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_baa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_0ff3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1767_c7_baa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_0ff3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1773_c7_2e10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_ebfd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_2e10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_ebfd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_2e10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_ebfd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_2e10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_ebfd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_2e10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_ebfd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_2e10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_ebfd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_2e10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_ebfd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_2e10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_ebfd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1777_c7_3474_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_e942_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3474_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_e942_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3474_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_e942_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3474_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_e942_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3474_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_e942_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3474_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_e942_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3474_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_e942_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3474_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_e942_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5ace_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_7d83_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5ace_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_7d83_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5ace_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_7d83_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5ace_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_7d83_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5ace_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c11_7d83_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_5bcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_fa08_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_5bcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_fa08_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_5bcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_fa08_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_5bcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_fa08_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1789_c7_5bcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_fa08_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8389_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_8555_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8389_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_8555_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8389_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_8555_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8389_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_8555_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8389_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_8555_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_9a7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_c62e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_9a7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_c62e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_9a7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_c62e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1800_c7_9a7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_c62e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_3023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1805_c11_6c12_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_3023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1805_c11_6c12_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1759_c3_4fe4_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1749_l1759_l1768_l1778_DUPLICATE_63e5_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1778_c3_92fa_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1749_l1759_l1768_l1778_DUPLICATE_63e5_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_2647_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1749_l1759_l1768_l1778_DUPLICATE_63e5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5ace_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1787_c24_7298_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8389_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1798_c24_7f43_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1763_DUPLICATE_f0f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1763_DUPLICATE_f0f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1763_DUPLICATE_f0f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1763_DUPLICATE_f0f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1763_DUPLICATE_f0f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1763_DUPLICATE_f0f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_baa7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1763_DUPLICATE_f0f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_2e10_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1763_DUPLICATE_f0f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3474_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1763_DUPLICATE_f0f1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1783_l1748_l1777_l1744_l1773_l1805_l1767_l1800_l1763_l1794_DUPLICATE_d404_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1783_l1748_l1777_l1744_l1773_l1805_l1767_l1800_l1763_l1794_DUPLICATE_d404_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1783_l1748_l1777_l1744_l1773_l1805_l1767_l1800_l1763_l1794_DUPLICATE_d404_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1783_l1748_l1777_l1744_l1773_l1805_l1767_l1800_l1763_l1794_DUPLICATE_d404_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_d7e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1783_l1748_l1777_l1744_l1773_l1805_l1767_l1800_l1763_l1794_DUPLICATE_d404_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_baa7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1783_l1748_l1777_l1744_l1773_l1805_l1767_l1800_l1763_l1794_DUPLICATE_d404_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_2e10_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1783_l1748_l1777_l1744_l1773_l1805_l1767_l1800_l1763_l1794_DUPLICATE_d404_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3474_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1783_l1748_l1777_l1744_l1773_l1805_l1767_l1800_l1763_l1794_DUPLICATE_d404_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5ace_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1783_l1748_l1777_l1744_l1773_l1805_l1767_l1800_l1763_l1794_DUPLICATE_d404_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_5bcc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1783_l1748_l1777_l1744_l1773_l1805_l1767_l1800_l1763_l1794_DUPLICATE_d404_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8389_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1783_l1748_l1777_l1744_l1773_l1805_l1767_l1800_l1763_l1794_DUPLICATE_d404_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_9a7a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1783_l1748_l1777_l1744_l1773_l1805_l1767_l1800_l1763_l1794_DUPLICATE_d404_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_3023_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1783_l1748_l1777_l1744_l1773_l1805_l1767_l1800_l1763_l1794_DUPLICATE_d404_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1748_l1744_l1773_l1736_l1767_l1763_l1794_DUPLICATE_e405_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1748_l1744_l1773_l1736_l1767_l1763_l1794_DUPLICATE_e405_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1748_l1744_l1773_l1736_l1767_l1763_l1794_DUPLICATE_e405_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1748_l1744_l1773_l1736_l1767_l1763_l1794_DUPLICATE_e405_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1748_l1744_l1773_l1736_l1767_l1763_l1794_DUPLICATE_e405_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1748_l1744_l1773_l1736_l1767_l1763_l1794_DUPLICATE_e405_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_baa7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1748_l1744_l1773_l1736_l1767_l1763_l1794_DUPLICATE_e405_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_2e10_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1748_l1744_l1773_l1736_l1767_l1763_l1794_DUPLICATE_e405_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_5bcc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1748_l1744_l1773_l1736_l1767_l1763_l1794_DUPLICATE_e405_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8389_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1758_l1789_l1754_l1748_l1744_l1773_l1736_l1767_l1763_l1794_DUPLICATE_e405_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1805_l1767_l1763_DUPLICATE_bc17_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1805_l1767_l1763_DUPLICATE_bc17_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1805_l1767_l1763_DUPLICATE_bc17_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1805_l1767_l1763_DUPLICATE_bc17_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_d7e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1805_l1767_l1763_DUPLICATE_bc17_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_baa7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1805_l1767_l1763_DUPLICATE_bc17_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_2e10_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1805_l1767_l1763_DUPLICATE_bc17_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3474_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1805_l1767_l1763_DUPLICATE_bc17_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_3023_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1805_l1767_l1763_DUPLICATE_bc17_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3474_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1800_l1777_DUPLICATE_9e90_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_9a7a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1800_l1777_DUPLICATE_9e90_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1800_l1763_DUPLICATE_2199_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1800_l1763_DUPLICATE_2199_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1800_l1763_DUPLICATE_2199_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1800_l1763_DUPLICATE_2199_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1800_l1763_DUPLICATE_2199_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_d7e7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1800_l1763_DUPLICATE_2199_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1767_c7_baa7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1800_l1763_DUPLICATE_2199_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_2e10_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1800_l1763_DUPLICATE_2199_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3474_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1800_l1763_DUPLICATE_2199_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1800_c7_9a7a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1777_l1744_l1773_l1736_l1767_l1800_l1763_DUPLICATE_2199_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1736_c2_9416_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3474_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1777_c7_3474_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1800_c7_9a7a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_9a7a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_9a7a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_9a7a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_9a7a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_9a7a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_9a7a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_9a7a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_9a7a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1805_c7_3023] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_3023_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_3023_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_3023_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_3023_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_3023_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_3023_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_3023_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_3023_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1736_c2_9416] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_9416_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_9416_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_9416_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_9416_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_2647 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_2647_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_2647_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_2647_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_2647_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1759_c3_4fe4] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1759_c3_4fe4_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1759_c3_4fe4_left;
     BIN_OP_OR_uxn_opcodes_h_l1759_c3_4fe4_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1759_c3_4fe4_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1759_c3_4fe4_return_output := BIN_OP_OR_uxn_opcodes_h_l1759_c3_4fe4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1736_c1_093e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_093e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_093e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_093e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_093e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_093e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_093e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_093e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_093e_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1803_c24_08a0] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1803_c24_08a0_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1803_c34_803f_return_output);

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1777_c7_3474] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3474_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3474_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3474_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3474_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3474_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3474_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3474_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3474_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1778_c3_92fa] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1778_c3_92fa_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1778_c3_92fa_left;
     BIN_OP_OR_uxn_opcodes_h_l1778_c3_92fa_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1778_c3_92fa_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1778_c3_92fa_return_output := BIN_OP_OR_uxn_opcodes_h_l1778_c3_92fa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1805_c7_3023] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_3023_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_3023_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_3023_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_3023_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_3023_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_3023_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_3023_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_3023_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1781_c32_c66c] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1781_c32_c66c_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1781_c32_c66c_left;
     BIN_OP_GT_uxn_opcodes_h_l1781_c32_c66c_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1781_c32_c66c_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1781_c32_c66c_return_output := BIN_OP_GT_uxn_opcodes_h_l1781_c32_c66c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1794_c7_8389] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8389_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8389_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8389_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8389_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8389_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8389_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8389_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8389_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1792_c24_c9ab] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1792_c24_c9ab_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1792_c34_f6a0_return_output);

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1781_c32_284d_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1781_c32_c66c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1759_c3_4fe4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1777_c7_3474_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1778_c3_92fa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1789_c7_5bcc_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1792_c24_c9ab_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1800_c7_9a7a_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1803_c24_08a0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1767_c7_baa7_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_2647_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1769_l1750_DUPLICATE_2647_return_output;
     VAR_printf_uxn_opcodes_h_l1737_c3_c510_uxn_opcodes_h_l1737_c3_c510_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1736_c1_093e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_9a7a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_3023_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_5bcc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c7_8389_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_2e10_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1777_c7_3474_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_9a7a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1805_c7_3023_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8389_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_9a7a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1800_c7_9a7a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_9a7a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_9a7a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_9a7a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_9a7a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_9a7a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_9a7a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_9a7a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_9a7a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1800_c7_9a7a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_9a7a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_9a7a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_9a7a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_9a7a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_9a7a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_9a7a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_9a7a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_9a7a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1789_c7_5bcc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_5bcc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_5bcc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_5bcc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_5bcc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_5bcc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_5bcc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_5bcc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_5bcc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1800_c7_9a7a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1800_c7_9a7a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1800_c7_9a7a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1800_c7_9a7a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1800_c7_9a7a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1800_c7_9a7a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1800_c7_9a7a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1800_c7_9a7a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1800_c7_9a7a_return_output;

     -- MUX[uxn_opcodes_h_l1781_c32_284d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1781_c32_284d_cond <= VAR_MUX_uxn_opcodes_h_l1781_c32_284d_cond;
     MUX_uxn_opcodes_h_l1781_c32_284d_iftrue <= VAR_MUX_uxn_opcodes_h_l1781_c32_284d_iftrue;
     MUX_uxn_opcodes_h_l1781_c32_284d_iffalse <= VAR_MUX_uxn_opcodes_h_l1781_c32_284d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1781_c32_284d_return_output := MUX_uxn_opcodes_h_l1781_c32_284d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1773_c7_2e10] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_2e10_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_2e10_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_2e10_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_2e10_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_2e10_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_2e10_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output;

     -- printf_uxn_opcodes_h_l1737_c3_c510[uxn_opcodes_h_l1737_c3_c510] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1737_c3_c510_uxn_opcodes_h_l1737_c3_c510_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1737_c3_c510_uxn_opcodes_h_l1737_c3_c510_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n16_MUX[uxn_opcodes_h_l1777_c7_3474] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1777_c7_3474_cond <= VAR_n16_MUX_uxn_opcodes_h_l1777_c7_3474_cond;
     n16_MUX_uxn_opcodes_h_l1777_c7_3474_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1777_c7_3474_iftrue;
     n16_MUX_uxn_opcodes_h_l1777_c7_3474_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1777_c7_3474_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1777_c7_3474_return_output := n16_MUX_uxn_opcodes_h_l1777_c7_3474_return_output;

     -- t16_MUX[uxn_opcodes_h_l1758_c7_4f08] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1758_c7_4f08_cond <= VAR_t16_MUX_uxn_opcodes_h_l1758_c7_4f08_cond;
     t16_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue;
     t16_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output := t16_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1794_c7_8389] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8389_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8389_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8389_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8389_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8389_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8389_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8389_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8389_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3474_iftrue := VAR_MUX_uxn_opcodes_h_l1781_c32_284d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1773_c7_2e10_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1777_c7_3474_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8389_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_9a7a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5ace_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1789_c7_5bcc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_baa7_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8389_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_9a7a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_5bcc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_8389_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8389_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1800_c7_9a7a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output;
     -- t16_MUX[uxn_opcodes_h_l1754_c7_3b08] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1754_c7_3b08_cond <= VAR_t16_MUX_uxn_opcodes_h_l1754_c7_3b08_cond;
     t16_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue;
     t16_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output := t16_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1794_c7_8389] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8389_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8389_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8389_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8389_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8389_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8389_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8389_return_output := result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8389_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1794_c7_8389] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8389_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8389_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8389_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8389_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8389_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8389_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8389_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8389_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1777_c7_3474] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3474_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3474_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3474_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3474_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3474_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3474_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3474_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3474_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1783_c7_5ace] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5ace_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5ace_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5ace_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5ace_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5ace_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5ace_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5ace_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5ace_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1794_c7_8389] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8389_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8389_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8389_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8389_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8389_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8389_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8389_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8389_return_output;

     -- n16_MUX[uxn_opcodes_h_l1773_c7_2e10] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1773_c7_2e10_cond <= VAR_n16_MUX_uxn_opcodes_h_l1773_c7_2e10_cond;
     n16_MUX_uxn_opcodes_h_l1773_c7_2e10_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1773_c7_2e10_iftrue;
     n16_MUX_uxn_opcodes_h_l1773_c7_2e10_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1773_c7_2e10_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output := n16_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1789_c7_5bcc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_5bcc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_5bcc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_5bcc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_5bcc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_5bcc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_5bcc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_5bcc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_5bcc_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1767_c7_baa7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_baa7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_baa7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_baa7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_baa7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_baa7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_baa7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1767_c7_baa7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_5bcc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_8389_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3474_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1783_c7_5ace_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_d7e7_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_5bcc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_8389_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_2e10_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_3474_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5ace_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_5bcc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1789_c7_5bcc_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1794_c7_8389_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1789_c7_5bcc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_5bcc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_5bcc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_5bcc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_5bcc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_5bcc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_5bcc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_5bcc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_5bcc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1789_c7_5bcc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1789_c7_5bcc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1789_c7_5bcc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1789_c7_5bcc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1789_c7_5bcc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1789_c7_5bcc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1789_c7_5bcc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1789_c7_5bcc_return_output := result_stack_value_MUX_uxn_opcodes_h_l1789_c7_5bcc_return_output;

     -- t16_MUX[uxn_opcodes_h_l1748_c7_c11a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1748_c7_c11a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1748_c7_c11a_cond;
     t16_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue;
     t16_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output := t16_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1777_c7_3474] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3474_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3474_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3474_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3474_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3474_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3474_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3474_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3474_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1789_c7_5bcc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_5bcc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_5bcc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_5bcc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_5bcc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_5bcc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_5bcc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_5bcc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_5bcc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1783_c7_5ace] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5ace_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5ace_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5ace_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5ace_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5ace_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5ace_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5ace_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5ace_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1773_c7_2e10] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_2e10_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_2e10_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_2e10_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_2e10_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_2e10_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_2e10_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output;

     -- n16_MUX[uxn_opcodes_h_l1767_c7_baa7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1767_c7_baa7_cond <= VAR_n16_MUX_uxn_opcodes_h_l1767_c7_baa7_cond;
     n16_MUX_uxn_opcodes_h_l1767_c7_baa7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1767_c7_baa7_iftrue;
     n16_MUX_uxn_opcodes_h_l1767_c7_baa7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1767_c7_baa7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output := n16_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1763_c7_d7e7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_d7e7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_d7e7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_d7e7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_d7e7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_d7e7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_d7e7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1763_c7_d7e7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5ace_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_5bcc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_2e10_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_3474_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5ace_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_5bcc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_baa7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3474_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c7_5ace_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5ace_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1789_c7_5bcc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1783_c7_5ace] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5ace_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5ace_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5ace_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5ace_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5ace_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5ace_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5ace_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5ace_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1783_c7_5ace] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5ace_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5ace_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5ace_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5ace_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5ace_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5ace_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5ace_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5ace_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1758_c7_4f08] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_4f08_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_4f08_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1767_c7_baa7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_baa7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_baa7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_baa7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_baa7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_baa7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_baa7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output;

     -- n16_MUX[uxn_opcodes_h_l1763_c7_d7e7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1763_c7_d7e7_cond <= VAR_n16_MUX_uxn_opcodes_h_l1763_c7_d7e7_cond;
     n16_MUX_uxn_opcodes_h_l1763_c7_d7e7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1763_c7_d7e7_iftrue;
     n16_MUX_uxn_opcodes_h_l1763_c7_d7e7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1763_c7_d7e7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output := n16_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1783_c7_5ace] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5ace_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5ace_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5ace_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5ace_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5ace_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5ace_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5ace_return_output := result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5ace_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1773_c7_2e10] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_2e10_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_2e10_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_2e10_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_2e10_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_2e10_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_2e10_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output;

     -- t16_MUX[uxn_opcodes_h_l1744_c7_8f62] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1744_c7_8f62_cond <= VAR_t16_MUX_uxn_opcodes_h_l1744_c7_8f62_cond;
     t16_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue;
     t16_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output := t16_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1777_c7_3474] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3474_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3474_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3474_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3474_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3474_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3474_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3474_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3474_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3474_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c7_5ace_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_baa7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3474_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c7_5ace_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_2e10_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_3474_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3474_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1783_c7_5ace_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1777_c7_3474] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3474_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3474_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3474_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3474_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3474_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3474_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3474_return_output := result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3474_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1773_c7_2e10] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_2e10_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_2e10_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_2e10_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_2e10_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_2e10_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_2e10_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1777_c7_3474] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3474_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3474_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3474_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3474_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3474_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3474_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3474_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3474_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1763_c7_d7e7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output;

     -- n16_MUX[uxn_opcodes_h_l1758_c7_4f08] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1758_c7_4f08_cond <= VAR_n16_MUX_uxn_opcodes_h_l1758_c7_4f08_cond;
     n16_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue;
     n16_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output := n16_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1767_c7_baa7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_baa7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_baa7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_baa7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_baa7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_baa7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_baa7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1754_c7_3b08] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_3b08_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_3b08_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output;

     -- t16_MUX[uxn_opcodes_h_l1736_c2_9416] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1736_c2_9416_cond <= VAR_t16_MUX_uxn_opcodes_h_l1736_c2_9416_cond;
     t16_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue;
     t16_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1736_c2_9416_return_output := t16_MUX_uxn_opcodes_h_l1736_c2_9416_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1777_c7_3474] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3474_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3474_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3474_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3474_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3474_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3474_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3474_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3474_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_2e10_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_3474_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_2e10_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_3474_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_baa7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_2e10_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1777_c7_3474_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1736_c2_9416_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1773_c7_2e10] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_2e10_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_2e10_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_2e10_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_2e10_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_2e10_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_2e10_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1773_c7_2e10] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1773_c7_2e10_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_2e10_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1773_c7_2e10_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_2e10_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1773_c7_2e10_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_2e10_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output := result_stack_value_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1763_c7_d7e7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1758_c7_4f08] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_4f08_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_4f08_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output;

     -- n16_MUX[uxn_opcodes_h_l1754_c7_3b08] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1754_c7_3b08_cond <= VAR_n16_MUX_uxn_opcodes_h_l1754_c7_3b08_cond;
     n16_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue;
     n16_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output := n16_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1748_c7_c11a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_c11a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_c11a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1773_c7_2e10] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_2e10_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_2e10_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_2e10_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_2e10_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_2e10_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_2e10_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1767_c7_baa7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_baa7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_baa7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_baa7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_baa7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_baa7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_baa7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_baa7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_baa7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_d7e7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1767_c7_baa7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1773_c7_2e10_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1758_c7_4f08] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_4f08_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_4f08_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1767_c7_baa7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_baa7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_baa7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_baa7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_baa7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_baa7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_baa7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1754_c7_3b08] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_3b08_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_3b08_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1767_c7_baa7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_baa7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_baa7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_baa7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_baa7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_baa7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_baa7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1744_c7_8f62] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_8f62_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_8f62_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1767_c7_baa7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1767_c7_baa7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1767_c7_baa7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1767_c7_baa7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1767_c7_baa7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1767_c7_baa7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1767_c7_baa7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output := result_stack_value_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1763_c7_d7e7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_d7e7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_d7e7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_d7e7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_d7e7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_d7e7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_d7e7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output;

     -- n16_MUX[uxn_opcodes_h_l1748_c7_c11a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1748_c7_c11a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1748_c7_c11a_cond;
     n16_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue;
     n16_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output := n16_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_d7e7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_d7e7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_d7e7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1767_c7_baa7_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1763_c7_d7e7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_d7e7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_d7e7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_d7e7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_d7e7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_d7e7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_d7e7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1748_c7_c11a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_c11a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_c11a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1736_c2_9416] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_9416_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_9416_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_9416_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_9416_return_output;

     -- n16_MUX[uxn_opcodes_h_l1744_c7_8f62] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1744_c7_8f62_cond <= VAR_n16_MUX_uxn_opcodes_h_l1744_c7_8f62_cond;
     n16_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue;
     n16_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output := n16_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1754_c7_3b08] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_3b08_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_3b08_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1763_c7_d7e7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_d7e7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_d7e7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_d7e7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_d7e7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_d7e7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_d7e7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1758_c7_4f08] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_4f08_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_4f08_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1763_c7_d7e7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1763_c7_d7e7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_d7e7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1763_c7_d7e7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_d7e7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1763_c7_d7e7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_d7e7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output := result_stack_value_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_d7e7_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1758_c7_4f08] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_4f08_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_4f08_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1748_c7_c11a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_c11a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_c11a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1754_c7_3b08] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_3b08_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_3b08_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1744_c7_8f62] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_8f62_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_8f62_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output;

     -- n16_MUX[uxn_opcodes_h_l1736_c2_9416] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1736_c2_9416_cond <= VAR_n16_MUX_uxn_opcodes_h_l1736_c2_9416_cond;
     n16_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue;
     n16_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1736_c2_9416_return_output := n16_MUX_uxn_opcodes_h_l1736_c2_9416_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1758_c7_4f08] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1758_c7_4f08_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1758_c7_4f08_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output := result_stack_value_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1758_c7_4f08] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_4f08_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_4f08_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_4f08_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_4f08_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1736_c2_9416_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1758_c7_4f08_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1754_c7_3b08] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_3b08_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_3b08_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1744_c7_8f62] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_8f62_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_8f62_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1754_c7_3b08] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_3b08_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_3b08_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1754_c7_3b08] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1754_c7_3b08_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1754_c7_3b08_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1754_c7_3b08_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1754_c7_3b08_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output := result_stack_value_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1748_c7_c11a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_c11a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_c11a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1736_c2_9416] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_9416_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_9416_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_9416_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_9416_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1754_c7_3b08_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1748_c7_c11a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_c11a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_c11a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1748_c7_c11a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_c11a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_c11a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1744_c7_8f62] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_8f62_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_8f62_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1748_c7_c11a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1748_c7_c11a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1748_c7_c11a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1748_c7_c11a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1748_c7_c11a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1736_c2_9416] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_9416_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_9416_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_9416_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_9416_return_output;

     -- Submodule level 13
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1748_c7_c11a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1744_c7_8f62] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_8f62_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_8f62_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1736_c2_9416] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_9416_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_9416_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_9416_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_9416_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1744_c7_8f62] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_8f62_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_8f62_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1744_c7_8f62] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1744_c7_8f62_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1744_c7_8f62_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1744_c7_8f62_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1744_c7_8f62_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output := result_stack_value_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output;

     -- Submodule level 14
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1744_c7_8f62_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1736_c2_9416] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1736_c2_9416_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c2_9416_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c2_9416_return_output := result_stack_value_MUX_uxn_opcodes_h_l1736_c2_9416_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1736_c2_9416] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_9416_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_9416_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_9416_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_9416_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1736_c2_9416] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_9416_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_9416_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_9416_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_9416_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_9416_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_9416_return_output;

     -- Submodule level 15
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1732_l1810_DUPLICATE_f3ce LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1732_l1810_DUPLICATE_f3ce_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_49dd(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c2_9416_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c2_9416_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1736_c2_9416_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1736_c2_9416_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c2_9416_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1736_c2_9416_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c2_9416_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c2_9416_return_output);

     -- Submodule level 16
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1732_l1810_DUPLICATE_f3ce_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1732_l1810_DUPLICATE_f3ce_return_output;
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
