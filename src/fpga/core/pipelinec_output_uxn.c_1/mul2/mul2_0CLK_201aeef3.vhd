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
-- Submodules: 123
entity mul2_0CLK_201aeef3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end mul2_0CLK_201aeef3;
architecture arch of mul2_0CLK_201aeef3 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1853_c6_c623]
signal BIN_OP_EQ_uxn_opcodes_h_l1853_c6_c623_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1853_c6_c623_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1853_c6_c623_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1853_c1_b2a2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_b2a2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_b2a2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_b2a2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_b2a2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1853_c2_3d7b]
signal n16_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1853_c2_3d7b]
signal result_stack_value_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1853_c2_3d7b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1853_c2_3d7b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1853_c2_3d7b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1853_c2_3d7b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1853_c2_3d7b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1853_c2_3d7b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1853_c2_3d7b]
signal tmp16_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1853_c2_3d7b]
signal t16_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1854_c3_80ca[uxn_opcodes_h_l1854_c3_80ca]
signal printf_uxn_opcodes_h_l1854_c3_80ca_uxn_opcodes_h_l1854_c3_80ca_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1859_c11_abff]
signal BIN_OP_EQ_uxn_opcodes_h_l1859_c11_abff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1859_c11_abff_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1859_c11_abff_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1859_c7_c3c7]
signal n16_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1859_c7_c3c7]
signal result_stack_value_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1859_c7_c3c7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1859_c7_c3c7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1859_c7_c3c7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1859_c7_c3c7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1859_c7_c3c7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1859_c7_c3c7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1859_c7_c3c7]
signal tmp16_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1859_c7_c3c7]
signal t16_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1862_c11_7db6]
signal BIN_OP_EQ_uxn_opcodes_h_l1862_c11_7db6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1862_c11_7db6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1862_c11_7db6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1862_c7_229e]
signal n16_MUX_uxn_opcodes_h_l1862_c7_229e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1862_c7_229e_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1862_c7_229e]
signal result_stack_value_MUX_uxn_opcodes_h_l1862_c7_229e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1862_c7_229e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1862_c7_229e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_229e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_229e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1862_c7_229e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_229e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_229e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1862_c7_229e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_229e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_229e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1862_c7_229e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_229e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_229e_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1862_c7_229e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_229e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_229e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1862_c7_229e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_229e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_229e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1862_c7_229e]
signal tmp16_MUX_uxn_opcodes_h_l1862_c7_229e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1862_c7_229e_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1862_c7_229e]
signal t16_MUX_uxn_opcodes_h_l1862_c7_229e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1862_c7_229e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1867_c11_561d]
signal BIN_OP_EQ_uxn_opcodes_h_l1867_c11_561d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1867_c11_561d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1867_c11_561d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1867_c7_f18a]
signal n16_MUX_uxn_opcodes_h_l1867_c7_f18a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1867_c7_f18a]
signal result_stack_value_MUX_uxn_opcodes_h_l1867_c7_f18a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1867_c7_f18a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_f18a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1867_c7_f18a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_f18a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1867_c7_f18a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_f18a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1867_c7_f18a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_f18a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1867_c7_f18a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_f18a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1867_c7_f18a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_f18a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1867_c7_f18a]
signal tmp16_MUX_uxn_opcodes_h_l1867_c7_f18a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1867_c7_f18a]
signal t16_MUX_uxn_opcodes_h_l1867_c7_f18a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1870_c11_8c28]
signal BIN_OP_EQ_uxn_opcodes_h_l1870_c11_8c28_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1870_c11_8c28_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1870_c11_8c28_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1870_c7_212f]
signal n16_MUX_uxn_opcodes_h_l1870_c7_212f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1870_c7_212f_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1870_c7_212f]
signal result_stack_value_MUX_uxn_opcodes_h_l1870_c7_212f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1870_c7_212f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1870_c7_212f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_212f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_212f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1870_c7_212f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_212f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_212f_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1870_c7_212f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1870_c7_212f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1870_c7_212f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1870_c7_212f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_212f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_212f_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1870_c7_212f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_212f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_212f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1870_c7_212f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_212f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_212f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1870_c7_212f]
signal tmp16_MUX_uxn_opcodes_h_l1870_c7_212f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1870_c7_212f_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1870_c7_212f]
signal t16_MUX_uxn_opcodes_h_l1870_c7_212f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1870_c7_212f_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1871_c3_cbf9]
signal BIN_OP_OR_uxn_opcodes_h_l1871_c3_cbf9_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1871_c3_cbf9_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1871_c3_cbf9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1874_c11_3e7e]
signal BIN_OP_EQ_uxn_opcodes_h_l1874_c11_3e7e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1874_c11_3e7e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1874_c11_3e7e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1874_c7_7ad7]
signal n16_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1874_c7_7ad7]
signal result_stack_value_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1874_c7_7ad7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1874_c7_7ad7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1874_c7_7ad7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1874_c7_7ad7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1874_c7_7ad7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1874_c7_7ad7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1874_c7_7ad7]
signal tmp16_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1877_c11_4a79]
signal BIN_OP_EQ_uxn_opcodes_h_l1877_c11_4a79_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1877_c11_4a79_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1877_c11_4a79_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1877_c7_f081]
signal n16_MUX_uxn_opcodes_h_l1877_c7_f081_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1877_c7_f081_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1877_c7_f081]
signal result_stack_value_MUX_uxn_opcodes_h_l1877_c7_f081_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1877_c7_f081_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1877_c7_f081]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_f081_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_f081_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1877_c7_f081]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_f081_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_f081_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1877_c7_f081]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_f081_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_f081_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1877_c7_f081]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_f081_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_f081_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1877_c7_f081]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_f081_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_f081_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1877_c7_f081]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_f081_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_f081_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1877_c7_f081]
signal tmp16_MUX_uxn_opcodes_h_l1877_c7_f081_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1877_c7_f081_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1882_c11_3f3f]
signal BIN_OP_EQ_uxn_opcodes_h_l1882_c11_3f3f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1882_c11_3f3f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1882_c11_3f3f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1882_c7_70bd]
signal n16_MUX_uxn_opcodes_h_l1882_c7_70bd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1882_c7_70bd]
signal result_stack_value_MUX_uxn_opcodes_h_l1882_c7_70bd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1882_c7_70bd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_70bd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1882_c7_70bd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_70bd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1882_c7_70bd]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1882_c7_70bd_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1882_c7_70bd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_70bd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1882_c7_70bd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_70bd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1882_c7_70bd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_70bd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1882_c7_70bd]
signal tmp16_MUX_uxn_opcodes_h_l1882_c7_70bd_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1885_c11_b0a6]
signal BIN_OP_EQ_uxn_opcodes_h_l1885_c11_b0a6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1885_c11_b0a6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1885_c11_b0a6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1885_c7_2c46]
signal n16_MUX_uxn_opcodes_h_l1885_c7_2c46_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1885_c7_2c46]
signal result_stack_value_MUX_uxn_opcodes_h_l1885_c7_2c46_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1885_c7_2c46]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_2c46_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1885_c7_2c46]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_2c46_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1885_c7_2c46]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1885_c7_2c46_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1885_c7_2c46]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1885_c7_2c46_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1885_c7_2c46]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_2c46_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1885_c7_2c46]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_2c46_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1885_c7_2c46]
signal tmp16_MUX_uxn_opcodes_h_l1885_c7_2c46_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1886_c3_548c]
signal BIN_OP_OR_uxn_opcodes_h_l1886_c3_548c_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1886_c3_548c_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1886_c3_548c_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l1887_c11_596f]
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1887_c11_596f_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1887_c11_596f_right : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1887_c11_596f_return_output : unsigned(31 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1890_c32_bff1]
signal BIN_OP_AND_uxn_opcodes_h_l1890_c32_bff1_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1890_c32_bff1_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1890_c32_bff1_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1890_c32_5b89]
signal BIN_OP_GT_uxn_opcodes_h_l1890_c32_5b89_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1890_c32_5b89_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1890_c32_5b89_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1890_c32_cd7d]
signal MUX_uxn_opcodes_h_l1890_c32_cd7d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1890_c32_cd7d_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1890_c32_cd7d_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1890_c32_cd7d_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1892_c11_7902]
signal BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7902_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7902_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7902_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1892_c7_5d8f]
signal result_stack_value_MUX_uxn_opcodes_h_l1892_c7_5d8f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1892_c7_5d8f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1892_c7_5d8f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1892_c7_5d8f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1892_c7_5d8f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_5d8f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_5d8f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_5d8f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_5d8f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1892_c7_5d8f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_5d8f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_5d8f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_5d8f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_5d8f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1892_c7_5d8f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_5d8f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_5d8f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_5d8f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_5d8f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1892_c7_5d8f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_5d8f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_5d8f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_5d8f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_5d8f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1898_c11_ce3b]
signal BIN_OP_EQ_uxn_opcodes_h_l1898_c11_ce3b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1898_c11_ce3b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1898_c11_ce3b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1898_c7_6d87]
signal result_stack_value_MUX_uxn_opcodes_h_l1898_c7_6d87_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1898_c7_6d87_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1898_c7_6d87_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1898_c7_6d87_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1898_c7_6d87]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1898_c7_6d87_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1898_c7_6d87_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1898_c7_6d87_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1898_c7_6d87_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1898_c7_6d87]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c7_6d87_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c7_6d87_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c7_6d87_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c7_6d87_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1898_c7_6d87]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1898_c7_6d87_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1898_c7_6d87_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1898_c7_6d87_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1898_c7_6d87_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1900_c34_23b6]
signal CONST_SR_8_uxn_opcodes_h_l1900_c34_23b6_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1900_c34_23b6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1902_c11_6997]
signal BIN_OP_EQ_uxn_opcodes_h_l1902_c11_6997_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1902_c11_6997_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1902_c11_6997_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1902_c7_5474]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1902_c7_5474_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1902_c7_5474_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1902_c7_5474_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1902_c7_5474_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1902_c7_5474]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1902_c7_5474_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1902_c7_5474_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1902_c7_5474_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1902_c7_5474_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1864_DUPLICATE_8a61
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1864_DUPLICATE_8a61_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1864_DUPLICATE_8a61_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_df93( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_value := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_stack_read := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_opc_done := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1853_c6_c623
BIN_OP_EQ_uxn_opcodes_h_l1853_c6_c623 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1853_c6_c623_left,
BIN_OP_EQ_uxn_opcodes_h_l1853_c6_c623_right,
BIN_OP_EQ_uxn_opcodes_h_l1853_c6_c623_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_b2a2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_b2a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_b2a2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_b2a2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_b2a2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_b2a2_return_output);

-- n16_MUX_uxn_opcodes_h_l1853_c2_3d7b
n16_MUX_uxn_opcodes_h_l1853_c2_3d7b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond,
n16_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue,
n16_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse,
n16_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1853_c2_3d7b
result_stack_value_MUX_uxn_opcodes_h_l1853_c2_3d7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_3d7b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_3d7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b
result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_3d7b
result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_3d7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_3d7b
result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_3d7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_3d7b
result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_3d7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1853_c2_3d7b
tmp16_MUX_uxn_opcodes_h_l1853_c2_3d7b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond,
tmp16_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue,
tmp16_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse,
tmp16_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output);

-- t16_MUX_uxn_opcodes_h_l1853_c2_3d7b
t16_MUX_uxn_opcodes_h_l1853_c2_3d7b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond,
t16_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue,
t16_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse,
t16_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output);

-- printf_uxn_opcodes_h_l1854_c3_80ca_uxn_opcodes_h_l1854_c3_80ca
printf_uxn_opcodes_h_l1854_c3_80ca_uxn_opcodes_h_l1854_c3_80ca : entity work.printf_uxn_opcodes_h_l1854_c3_80ca_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1854_c3_80ca_uxn_opcodes_h_l1854_c3_80ca_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1859_c11_abff
BIN_OP_EQ_uxn_opcodes_h_l1859_c11_abff : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1859_c11_abff_left,
BIN_OP_EQ_uxn_opcodes_h_l1859_c11_abff_right,
BIN_OP_EQ_uxn_opcodes_h_l1859_c11_abff_return_output);

-- n16_MUX_uxn_opcodes_h_l1859_c7_c3c7
n16_MUX_uxn_opcodes_h_l1859_c7_c3c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond,
n16_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue,
n16_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse,
n16_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1859_c7_c3c7
result_stack_value_MUX_uxn_opcodes_h_l1859_c7_c3c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond,
result_stack_value_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c3c7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c3c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7
result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_c3c7
result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_c3c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_c3c7
result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_c3c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c3c7
result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c3c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1859_c7_c3c7
tmp16_MUX_uxn_opcodes_h_l1859_c7_c3c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond,
tmp16_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue,
tmp16_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse,
tmp16_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output);

-- t16_MUX_uxn_opcodes_h_l1859_c7_c3c7
t16_MUX_uxn_opcodes_h_l1859_c7_c3c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond,
t16_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue,
t16_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse,
t16_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1862_c11_7db6
BIN_OP_EQ_uxn_opcodes_h_l1862_c11_7db6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1862_c11_7db6_left,
BIN_OP_EQ_uxn_opcodes_h_l1862_c11_7db6_right,
BIN_OP_EQ_uxn_opcodes_h_l1862_c11_7db6_return_output);

-- n16_MUX_uxn_opcodes_h_l1862_c7_229e
n16_MUX_uxn_opcodes_h_l1862_c7_229e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1862_c7_229e_cond,
n16_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue,
n16_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse,
n16_MUX_uxn_opcodes_h_l1862_c7_229e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1862_c7_229e
result_stack_value_MUX_uxn_opcodes_h_l1862_c7_229e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1862_c7_229e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1862_c7_229e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_229e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_229e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_229e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_229e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_229e
result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_229e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_229e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_229e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_229e
result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_229e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_229e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_229e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_229e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_229e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_229e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_229e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_229e
result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_229e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_229e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_229e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_229e
result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_229e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_229e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_229e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1862_c7_229e
tmp16_MUX_uxn_opcodes_h_l1862_c7_229e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1862_c7_229e_cond,
tmp16_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1862_c7_229e_return_output);

-- t16_MUX_uxn_opcodes_h_l1862_c7_229e
t16_MUX_uxn_opcodes_h_l1862_c7_229e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1862_c7_229e_cond,
t16_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue,
t16_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse,
t16_MUX_uxn_opcodes_h_l1862_c7_229e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1867_c11_561d
BIN_OP_EQ_uxn_opcodes_h_l1867_c11_561d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1867_c11_561d_left,
BIN_OP_EQ_uxn_opcodes_h_l1867_c11_561d_right,
BIN_OP_EQ_uxn_opcodes_h_l1867_c11_561d_return_output);

-- n16_MUX_uxn_opcodes_h_l1867_c7_f18a
n16_MUX_uxn_opcodes_h_l1867_c7_f18a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1867_c7_f18a_cond,
n16_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue,
n16_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse,
n16_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1867_c7_f18a
result_stack_value_MUX_uxn_opcodes_h_l1867_c7_f18a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1867_c7_f18a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_f18a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_f18a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_f18a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_f18a
result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_f18a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_f18a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_f18a
result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_f18a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_f18a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_f18a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_f18a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_f18a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_f18a
result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_f18a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_f18a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_f18a
result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_f18a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_f18a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1867_c7_f18a
tmp16_MUX_uxn_opcodes_h_l1867_c7_f18a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1867_c7_f18a_cond,
tmp16_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output);

-- t16_MUX_uxn_opcodes_h_l1867_c7_f18a
t16_MUX_uxn_opcodes_h_l1867_c7_f18a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1867_c7_f18a_cond,
t16_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue,
t16_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse,
t16_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1870_c11_8c28
BIN_OP_EQ_uxn_opcodes_h_l1870_c11_8c28 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1870_c11_8c28_left,
BIN_OP_EQ_uxn_opcodes_h_l1870_c11_8c28_right,
BIN_OP_EQ_uxn_opcodes_h_l1870_c11_8c28_return_output);

-- n16_MUX_uxn_opcodes_h_l1870_c7_212f
n16_MUX_uxn_opcodes_h_l1870_c7_212f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1870_c7_212f_cond,
n16_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue,
n16_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse,
n16_MUX_uxn_opcodes_h_l1870_c7_212f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1870_c7_212f
result_stack_value_MUX_uxn_opcodes_h_l1870_c7_212f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1870_c7_212f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1870_c7_212f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_212f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_212f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_212f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_212f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_212f
result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_212f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_212f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_212f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1870_c7_212f
result_is_stack_read_MUX_uxn_opcodes_h_l1870_c7_212f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1870_c7_212f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1870_c7_212f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_212f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_212f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_212f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_212f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_212f
result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_212f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_212f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_212f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_212f
result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_212f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_212f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_212f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1870_c7_212f
tmp16_MUX_uxn_opcodes_h_l1870_c7_212f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1870_c7_212f_cond,
tmp16_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1870_c7_212f_return_output);

-- t16_MUX_uxn_opcodes_h_l1870_c7_212f
t16_MUX_uxn_opcodes_h_l1870_c7_212f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1870_c7_212f_cond,
t16_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue,
t16_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse,
t16_MUX_uxn_opcodes_h_l1870_c7_212f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1871_c3_cbf9
BIN_OP_OR_uxn_opcodes_h_l1871_c3_cbf9 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1871_c3_cbf9_left,
BIN_OP_OR_uxn_opcodes_h_l1871_c3_cbf9_right,
BIN_OP_OR_uxn_opcodes_h_l1871_c3_cbf9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1874_c11_3e7e
BIN_OP_EQ_uxn_opcodes_h_l1874_c11_3e7e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1874_c11_3e7e_left,
BIN_OP_EQ_uxn_opcodes_h_l1874_c11_3e7e_right,
BIN_OP_EQ_uxn_opcodes_h_l1874_c11_3e7e_return_output);

-- n16_MUX_uxn_opcodes_h_l1874_c7_7ad7
n16_MUX_uxn_opcodes_h_l1874_c7_7ad7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond,
n16_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue,
n16_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse,
n16_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1874_c7_7ad7
result_stack_value_MUX_uxn_opcodes_h_l1874_c7_7ad7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond,
result_stack_value_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7ad7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7ad7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7
result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1874_c7_7ad7
result_is_stack_read_MUX_uxn_opcodes_h_l1874_c7_7ad7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7ad7
result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7ad7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7ad7
result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7ad7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1874_c7_7ad7
tmp16_MUX_uxn_opcodes_h_l1874_c7_7ad7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond,
tmp16_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue,
tmp16_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse,
tmp16_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1877_c11_4a79
BIN_OP_EQ_uxn_opcodes_h_l1877_c11_4a79 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1877_c11_4a79_left,
BIN_OP_EQ_uxn_opcodes_h_l1877_c11_4a79_right,
BIN_OP_EQ_uxn_opcodes_h_l1877_c11_4a79_return_output);

-- n16_MUX_uxn_opcodes_h_l1877_c7_f081
n16_MUX_uxn_opcodes_h_l1877_c7_f081 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1877_c7_f081_cond,
n16_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue,
n16_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse,
n16_MUX_uxn_opcodes_h_l1877_c7_f081_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1877_c7_f081
result_stack_value_MUX_uxn_opcodes_h_l1877_c7_f081 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1877_c7_f081_cond,
result_stack_value_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1877_c7_f081_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_f081
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_f081 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_f081_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_f081_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_f081
result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_f081 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_f081_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_f081_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_f081
result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_f081 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_f081_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_f081_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_f081
result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_f081 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_f081_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_f081_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_f081
result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_f081 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_f081_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_f081_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_f081
result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_f081 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_f081_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_f081_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1877_c7_f081
tmp16_MUX_uxn_opcodes_h_l1877_c7_f081 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1877_c7_f081_cond,
tmp16_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue,
tmp16_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse,
tmp16_MUX_uxn_opcodes_h_l1877_c7_f081_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1882_c11_3f3f
BIN_OP_EQ_uxn_opcodes_h_l1882_c11_3f3f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1882_c11_3f3f_left,
BIN_OP_EQ_uxn_opcodes_h_l1882_c11_3f3f_right,
BIN_OP_EQ_uxn_opcodes_h_l1882_c11_3f3f_return_output);

-- n16_MUX_uxn_opcodes_h_l1882_c7_70bd
n16_MUX_uxn_opcodes_h_l1882_c7_70bd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1882_c7_70bd_cond,
n16_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue,
n16_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse,
n16_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1882_c7_70bd
result_stack_value_MUX_uxn_opcodes_h_l1882_c7_70bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1882_c7_70bd_cond,
result_stack_value_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_70bd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_70bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_70bd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_70bd
result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_70bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_70bd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1882_c7_70bd
result_is_stack_read_MUX_uxn_opcodes_h_l1882_c7_70bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1882_c7_70bd_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_70bd
result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_70bd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_70bd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_70bd
result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_70bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_70bd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_70bd
result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_70bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_70bd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1882_c7_70bd
tmp16_MUX_uxn_opcodes_h_l1882_c7_70bd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1882_c7_70bd_cond,
tmp16_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue,
tmp16_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse,
tmp16_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1885_c11_b0a6
BIN_OP_EQ_uxn_opcodes_h_l1885_c11_b0a6 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1885_c11_b0a6_left,
BIN_OP_EQ_uxn_opcodes_h_l1885_c11_b0a6_right,
BIN_OP_EQ_uxn_opcodes_h_l1885_c11_b0a6_return_output);

-- n16_MUX_uxn_opcodes_h_l1885_c7_2c46
n16_MUX_uxn_opcodes_h_l1885_c7_2c46 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1885_c7_2c46_cond,
n16_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue,
n16_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse,
n16_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1885_c7_2c46
result_stack_value_MUX_uxn_opcodes_h_l1885_c7_2c46 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1885_c7_2c46_cond,
result_stack_value_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_2c46
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_2c46 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_2c46_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_2c46
result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_2c46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_2c46_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1885_c7_2c46
result_is_stack_read_MUX_uxn_opcodes_h_l1885_c7_2c46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1885_c7_2c46_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1885_c7_2c46
result_sp_relative_shift_MUX_uxn_opcodes_h_l1885_c7_2c46 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1885_c7_2c46_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_2c46
result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_2c46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_2c46_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_2c46
result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_2c46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_2c46_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1885_c7_2c46
tmp16_MUX_uxn_opcodes_h_l1885_c7_2c46 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1885_c7_2c46_cond,
tmp16_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue,
tmp16_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse,
tmp16_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1886_c3_548c
BIN_OP_OR_uxn_opcodes_h_l1886_c3_548c : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1886_c3_548c_left,
BIN_OP_OR_uxn_opcodes_h_l1886_c3_548c_right,
BIN_OP_OR_uxn_opcodes_h_l1886_c3_548c_return_output);

-- BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1887_c11_596f
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1887_c11_596f : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1887_c11_596f_left,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1887_c11_596f_right,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1887_c11_596f_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1890_c32_bff1
BIN_OP_AND_uxn_opcodes_h_l1890_c32_bff1 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1890_c32_bff1_left,
BIN_OP_AND_uxn_opcodes_h_l1890_c32_bff1_right,
BIN_OP_AND_uxn_opcodes_h_l1890_c32_bff1_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1890_c32_5b89
BIN_OP_GT_uxn_opcodes_h_l1890_c32_5b89 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1890_c32_5b89_left,
BIN_OP_GT_uxn_opcodes_h_l1890_c32_5b89_right,
BIN_OP_GT_uxn_opcodes_h_l1890_c32_5b89_return_output);

-- MUX_uxn_opcodes_h_l1890_c32_cd7d
MUX_uxn_opcodes_h_l1890_c32_cd7d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1890_c32_cd7d_cond,
MUX_uxn_opcodes_h_l1890_c32_cd7d_iftrue,
MUX_uxn_opcodes_h_l1890_c32_cd7d_iffalse,
MUX_uxn_opcodes_h_l1890_c32_cd7d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7902
BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7902 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7902_left,
BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7902_right,
BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7902_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1892_c7_5d8f
result_stack_value_MUX_uxn_opcodes_h_l1892_c7_5d8f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1892_c7_5d8f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1892_c7_5d8f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1892_c7_5d8f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1892_c7_5d8f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_5d8f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_5d8f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_5d8f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_5d8f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_5d8f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_5d8f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_5d8f
result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_5d8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_5d8f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_5d8f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_5d8f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_5d8f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_5d8f
result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_5d8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_5d8f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_5d8f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_5d8f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_5d8f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_5d8f
result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_5d8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_5d8f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_5d8f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_5d8f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_5d8f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1898_c11_ce3b
BIN_OP_EQ_uxn_opcodes_h_l1898_c11_ce3b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1898_c11_ce3b_left,
BIN_OP_EQ_uxn_opcodes_h_l1898_c11_ce3b_right,
BIN_OP_EQ_uxn_opcodes_h_l1898_c11_ce3b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1898_c7_6d87
result_stack_value_MUX_uxn_opcodes_h_l1898_c7_6d87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1898_c7_6d87_cond,
result_stack_value_MUX_uxn_opcodes_h_l1898_c7_6d87_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1898_c7_6d87_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1898_c7_6d87_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1898_c7_6d87
result_is_stack_write_MUX_uxn_opcodes_h_l1898_c7_6d87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1898_c7_6d87_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1898_c7_6d87_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1898_c7_6d87_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1898_c7_6d87_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c7_6d87
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c7_6d87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c7_6d87_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c7_6d87_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c7_6d87_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c7_6d87_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1898_c7_6d87
result_is_opc_done_MUX_uxn_opcodes_h_l1898_c7_6d87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1898_c7_6d87_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1898_c7_6d87_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1898_c7_6d87_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1898_c7_6d87_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1900_c34_23b6
CONST_SR_8_uxn_opcodes_h_l1900_c34_23b6 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1900_c34_23b6_x,
CONST_SR_8_uxn_opcodes_h_l1900_c34_23b6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1902_c11_6997
BIN_OP_EQ_uxn_opcodes_h_l1902_c11_6997 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1902_c11_6997_left,
BIN_OP_EQ_uxn_opcodes_h_l1902_c11_6997_right,
BIN_OP_EQ_uxn_opcodes_h_l1902_c11_6997_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1902_c7_5474
result_is_stack_write_MUX_uxn_opcodes_h_l1902_c7_5474 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1902_c7_5474_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1902_c7_5474_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1902_c7_5474_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1902_c7_5474_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1902_c7_5474
result_is_opc_done_MUX_uxn_opcodes_h_l1902_c7_5474 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1902_c7_5474_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1902_c7_5474_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1902_c7_5474_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1902_c7_5474_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1864_DUPLICATE_8a61
CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1864_DUPLICATE_8a61 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1864_DUPLICATE_8a61_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1864_DUPLICATE_8a61_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1853_c6_c623_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_b2a2_return_output,
 n16_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output,
 tmp16_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output,
 t16_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1859_c11_abff_return_output,
 n16_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output,
 tmp16_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output,
 t16_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1862_c11_7db6_return_output,
 n16_MUX_uxn_opcodes_h_l1862_c7_229e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1862_c7_229e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_229e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_229e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_229e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_229e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_229e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_229e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1862_c7_229e_return_output,
 t16_MUX_uxn_opcodes_h_l1862_c7_229e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1867_c11_561d_return_output,
 n16_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output,
 t16_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1870_c11_8c28_return_output,
 n16_MUX_uxn_opcodes_h_l1870_c7_212f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1870_c7_212f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_212f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_212f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1870_c7_212f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_212f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_212f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_212f_return_output,
 tmp16_MUX_uxn_opcodes_h_l1870_c7_212f_return_output,
 t16_MUX_uxn_opcodes_h_l1870_c7_212f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1871_c3_cbf9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1874_c11_3e7e_return_output,
 n16_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output,
 tmp16_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1877_c11_4a79_return_output,
 n16_MUX_uxn_opcodes_h_l1877_c7_f081_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1877_c7_f081_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_f081_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_f081_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_f081_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_f081_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_f081_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_f081_return_output,
 tmp16_MUX_uxn_opcodes_h_l1877_c7_f081_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1882_c11_3f3f_return_output,
 n16_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output,
 tmp16_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1885_c11_b0a6_return_output,
 n16_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output,
 tmp16_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1886_c3_548c_return_output,
 BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1887_c11_596f_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1890_c32_bff1_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1890_c32_5b89_return_output,
 MUX_uxn_opcodes_h_l1890_c32_cd7d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7902_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1892_c7_5d8f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_5d8f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_5d8f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_5d8f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_5d8f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1898_c11_ce3b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1898_c7_6d87_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1898_c7_6d87_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c7_6d87_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1898_c7_6d87_return_output,
 CONST_SR_8_uxn_opcodes_h_l1900_c34_23b6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1902_c11_6997_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1902_c7_5474_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1902_c7_5474_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1864_DUPLICATE_8a61_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c6_c623_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c6_c623_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c6_c623_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_b2a2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_b2a2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_b2a2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_b2a2_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1856_c3_c3ae : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1854_c3_80ca_uxn_opcodes_h_l1854_c3_80ca_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_abff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_abff_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_abff_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1862_c7_229e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1862_c7_229e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1860_c3_77d9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_229e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_229e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_229e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_229e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_229e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_229e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1862_c7_229e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1862_c7_229e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_7db6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_7db6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_7db6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1862_c7_229e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1862_c7_229e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1865_c3_893e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_229e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_229e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_229e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_229e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_229e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_229e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1862_c7_229e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1862_c7_229e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_561d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_561d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_561d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1870_c7_212f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1867_c7_f18a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1870_c7_212f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c7_f18a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1868_c3_f1e8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_212f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_f18a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_212f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_f18a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1870_c7_212f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_f18a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_212f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_f18a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_212f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_f18a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_212f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_f18a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1870_c7_212f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1867_c7_f18a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1870_c7_212f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1867_c7_f18a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_8c28_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_8c28_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_8c28_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1870_c7_212f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1870_c7_212f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1872_c3_4dad : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_212f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_212f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1870_c7_212f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_212f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_212f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_212f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1870_c7_212f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1870_c7_212f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1871_c3_cbf9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1871_c3_cbf9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1871_c3_cbf9_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_3e7e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_3e7e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_3e7e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1877_c7_f081_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1877_c7_f081_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1875_c3_a3d1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_f081_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_f081_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_f081_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_f081_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_f081_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_f081_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1877_c7_f081_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_4a79_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_4a79_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_4a79_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1877_c7_f081_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1877_c7_f081_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1880_c3_301f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_f081_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_f081_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_f081_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_f081_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_f081_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_f081_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1877_c7_f081_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_3f3f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_3f3f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_3f3f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1882_c7_70bd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1882_c7_70bd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1883_c3_1890 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_70bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_70bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1882_c7_70bd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_70bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_70bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_70bd_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1882_c7_70bd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1885_c11_b0a6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1885_c11_b0a6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1885_c11_b0a6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1885_c7_2c46_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1892_c7_5d8f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1885_c7_2c46_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_5d8f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_2c46_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_5d8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_2c46_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1885_c7_2c46_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1885_c7_2c46_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_5d8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_2c46_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_5d8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_2c46_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l1887_c3_7041 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1885_c7_2c46_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1886_c3_548c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1886_c3_548c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1886_c3_548c_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1887_c11_596f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1887_c11_596f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1887_c11_596f_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1890_c32_cd7d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1890_c32_cd7d_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1890_c32_cd7d_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1890_c32_bff1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1890_c32_bff1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1890_c32_bff1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1890_c32_5b89_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1890_c32_5b89_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1890_c32_5b89_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1890_c32_cd7d_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7902_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7902_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7902_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1892_c7_5d8f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1892_c7_5d8f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1898_c7_6d87_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1892_c7_5d8f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_5d8f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1895_c3_b33b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_5d8f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c7_6d87_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_5d8f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_5d8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_5d8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_5d8f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_5d8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_5d8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1898_c7_6d87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_5d8f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_5d8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_5d8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1898_c7_6d87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_5d8f_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1896_c24_fdba_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1898_c11_ce3b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1898_c11_ce3b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1898_c11_ce3b_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1898_c7_6d87_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1898_c7_6d87_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1898_c7_6d87_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1898_c7_6d87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1898_c7_6d87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1902_c7_5474_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1898_c7_6d87_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c7_6d87_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1899_c3_3823 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c7_6d87_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c7_6d87_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1898_c7_6d87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1898_c7_6d87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1902_c7_5474_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1898_c7_6d87_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1900_c34_23b6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1900_c34_23b6_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1900_c24_8479_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1902_c11_6997_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1902_c11_6997_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1902_c11_6997_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1902_c7_5474_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1902_c7_5474_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1902_c7_5474_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1902_c7_5474_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1902_c7_5474_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1902_c7_5474_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1859_l1882_l1853_l1877_l1874_l1870_l1898_l1867_l1862_l1885_DUPLICATE_1325_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1859_l1882_l1853_l1877_l1874_l1870_l1867_l1892_l1862_DUPLICATE_fd3c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1859_l1882_l1853_l1877_l1874_l1870_l1867_l1862_l1885_DUPLICATE_30d5_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1859_l1882_l1853_l1877_l1874_l1902_l1870_l1898_l1867_l1862_l1885_DUPLICATE_f520_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1859_l1882_l1877_l1874_l1870_l1867_l1862_l1885_DUPLICATE_165d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1859_l1882_l1877_l1874_l1902_l1870_l1898_l1867_l1892_l1862_l1885_DUPLICATE_d3f4_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1863_l1871_l1878_l1886_DUPLICATE_5750_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1864_DUPLICATE_8a61_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1864_DUPLICATE_8a61_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1898_l1885_DUPLICATE_3b24_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1849_l1907_DUPLICATE_4655_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1898_c11_ce3b_right := to_unsigned(10, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_5d8f_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1902_c7_5474_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_5d8f_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1902_c7_5474_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1868_c3_f1e8 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1868_c3_f1e8;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7902_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_4a79_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1872_c3_4dad := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1872_c3_4dad;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1902_c11_6997_right := to_unsigned(11, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1880_c3_301f := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1880_c3_301f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_3f3f_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1860_c3_77d9 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1860_c3_77d9;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c6_c623_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_8c28_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1895_c3_b33b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_5d8f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1895_c3_b33b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_abff_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1885_c11_b0a6_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1856_c3_c3ae := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1856_c3_c3ae;
     VAR_MUX_uxn_opcodes_h_l1890_c32_cd7d_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_3e7e_right := to_unsigned(5, 3);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1890_c32_5b89_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1875_c3_a3d1 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1875_c3_a3d1;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1865_c3_893e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1865_c3_893e;
     VAR_MUX_uxn_opcodes_h_l1890_c32_cd7d_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1899_c3_3823 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c7_6d87_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1899_c3_3823;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_7db6_right := to_unsigned(2, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1883_c3_1890 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1883_c3_1890;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_561d_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_b2a2_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1890_c32_bff1_right := to_unsigned(128, 8);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_b2a2_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1890_c32_bff1_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1886_c3_548c_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c6_c623_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_abff_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_7db6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_561d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_8c28_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_3e7e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_4a79_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_3f3f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1885_c11_b0a6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7902_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1898_c11_ce3b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1902_c11_6997_left := VAR_phase;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1887_c11_596f_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1871_c3_cbf9_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1900_c34_23b6_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1898_c11_ce3b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1898_c11_ce3b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1898_c11_ce3b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1898_c11_ce3b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1898_c11_ce3b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1898_c11_ce3b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1898_c11_ce3b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1870_c11_8c28] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1870_c11_8c28_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_8c28_left;
     BIN_OP_EQ_uxn_opcodes_h_l1870_c11_8c28_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_8c28_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_8c28_return_output := BIN_OP_EQ_uxn_opcodes_h_l1870_c11_8c28_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1902_c11_6997] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1902_c11_6997_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1902_c11_6997_left;
     BIN_OP_EQ_uxn_opcodes_h_l1902_c11_6997_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1902_c11_6997_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1902_c11_6997_return_output := BIN_OP_EQ_uxn_opcodes_h_l1902_c11_6997_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1859_l1882_l1853_l1877_l1874_l1870_l1867_l1892_l1862_DUPLICATE_fd3c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1859_l1882_l1853_l1877_l1874_l1870_l1867_l1892_l1862_DUPLICATE_fd3c_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1853_c6_c623] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1853_c6_c623_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c6_c623_left;
     BIN_OP_EQ_uxn_opcodes_h_l1853_c6_c623_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c6_c623_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c6_c623_return_output := BIN_OP_EQ_uxn_opcodes_h_l1853_c6_c623_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1863_l1871_l1878_l1886_DUPLICATE_5750 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1863_l1871_l1878_l1886_DUPLICATE_5750_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1859_l1882_l1877_l1874_l1870_l1867_l1862_l1885_DUPLICATE_165d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1859_l1882_l1877_l1874_l1870_l1867_l1862_l1885_DUPLICATE_165d_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1859_l1882_l1853_l1877_l1874_l1902_l1870_l1898_l1867_l1862_l1885_DUPLICATE_f520 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1859_l1882_l1853_l1877_l1874_l1902_l1870_l1898_l1867_l1862_l1885_DUPLICATE_f520_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1859_c11_abff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1859_c11_abff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_abff_left;
     BIN_OP_EQ_uxn_opcodes_h_l1859_c11_abff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_abff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_abff_return_output := BIN_OP_EQ_uxn_opcodes_h_l1859_c11_abff_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1867_c11_561d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1867_c11_561d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_561d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1867_c11_561d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_561d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_561d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1867_c11_561d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1885_c11_b0a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1885_c11_b0a6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1885_c11_b0a6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1885_c11_b0a6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1885_c11_b0a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1885_c11_b0a6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1885_c11_b0a6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1859_l1882_l1877_l1874_l1902_l1870_l1898_l1867_l1892_l1862_l1885_DUPLICATE_d3f4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1859_l1882_l1877_l1874_l1902_l1870_l1898_l1867_l1892_l1862_l1885_DUPLICATE_d3f4_return_output := result.is_opc_done;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1859_l1882_l1853_l1877_l1874_l1870_l1867_l1862_l1885_DUPLICATE_30d5 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1859_l1882_l1853_l1877_l1874_l1870_l1867_l1862_l1885_DUPLICATE_30d5_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1859_l1882_l1853_l1877_l1874_l1870_l1898_l1867_l1862_l1885_DUPLICATE_1325 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1859_l1882_l1853_l1877_l1874_l1870_l1898_l1867_l1862_l1885_DUPLICATE_1325_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1892_c11_7902] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7902_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7902_left;
     BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7902_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7902_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7902_return_output := BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7902_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1874_c11_3e7e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1874_c11_3e7e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_3e7e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1874_c11_3e7e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_3e7e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_3e7e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1874_c11_3e7e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1877_c11_4a79] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1877_c11_4a79_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_4a79_left;
     BIN_OP_EQ_uxn_opcodes_h_l1877_c11_4a79_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_4a79_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_4a79_return_output := BIN_OP_EQ_uxn_opcodes_h_l1877_c11_4a79_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1890_c32_bff1] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1890_c32_bff1_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1890_c32_bff1_left;
     BIN_OP_AND_uxn_opcodes_h_l1890_c32_bff1_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1890_c32_bff1_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1890_c32_bff1_return_output := BIN_OP_AND_uxn_opcodes_h_l1890_c32_bff1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1862_c11_7db6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1862_c11_7db6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_7db6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1862_c11_7db6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_7db6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_7db6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1862_c11_7db6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1882_c11_3f3f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1882_c11_3f3f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_3f3f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1882_c11_3f3f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_3f3f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_3f3f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1882_c11_3f3f_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1896_c24_fdba] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1896_c24_fdba_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1898_l1885_DUPLICATE_3b24 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1898_l1885_DUPLICATE_3b24_return_output := result.stack_address_sp_offset;

     -- CONST_SR_8[uxn_opcodes_h_l1900_c34_23b6] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1900_c34_23b6_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1900_c34_23b6_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1900_c34_23b6_return_output := CONST_SR_8_uxn_opcodes_h_l1900_c34_23b6_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1890_c32_5b89_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1890_c32_bff1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_b2a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c6_c623_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c6_c623_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c6_c623_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c6_c623_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c6_c623_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c6_c623_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c6_c623_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c6_c623_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c6_c623_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c6_c623_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c6_c623_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_abff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_abff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_abff_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_abff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_abff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_abff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_abff_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_abff_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_abff_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_abff_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1862_c7_229e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_7db6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_229e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_7db6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_229e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_7db6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_229e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_7db6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_229e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_7db6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_229e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_7db6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_229e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_7db6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1862_c7_229e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_7db6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1862_c7_229e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_7db6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1862_c7_229e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_7db6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1867_c7_f18a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_561d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_f18a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_561d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_f18a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_561d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_f18a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_561d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_f18a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_561d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_f18a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_561d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_f18a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_561d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c7_f18a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_561d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1867_c7_f18a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_561d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1867_c7_f18a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_561d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1870_c7_212f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_8c28_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_212f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_8c28_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_212f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_8c28_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1870_c7_212f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_8c28_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_212f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_8c28_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_212f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_8c28_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_212f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_8c28_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1870_c7_212f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_8c28_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1870_c7_212f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_8c28_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1870_c7_212f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_8c28_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_3e7e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_3e7e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_3e7e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_3e7e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_3e7e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_3e7e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_3e7e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_3e7e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_3e7e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1877_c7_f081_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_4a79_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_f081_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_4a79_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_f081_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_4a79_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_f081_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_4a79_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_f081_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_4a79_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_f081_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_4a79_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_f081_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_4a79_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1877_c7_f081_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_4a79_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1877_c7_f081_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_4a79_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1882_c7_70bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_3f3f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_70bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_3f3f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_70bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_3f3f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1882_c7_70bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_3f3f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_70bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_3f3f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_70bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_3f3f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_70bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_3f3f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1882_c7_70bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_3f3f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1882_c7_70bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_3f3f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1885_c7_2c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1885_c11_b0a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_2c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1885_c11_b0a6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_2c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1885_c11_b0a6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1885_c7_2c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1885_c11_b0a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_2c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1885_c11_b0a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1885_c7_2c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1885_c11_b0a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_2c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1885_c11_b0a6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1885_c7_2c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1885_c11_b0a6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1885_c7_2c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1885_c11_b0a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_5d8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7902_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_5d8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7902_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_5d8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7902_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_5d8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7902_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1892_c7_5d8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_7902_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1898_c7_6d87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1898_c11_ce3b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1898_c7_6d87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1898_c11_ce3b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c7_6d87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1898_c11_ce3b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1898_c7_6d87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1898_c11_ce3b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1902_c7_5474_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1902_c11_6997_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1902_c7_5474_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1902_c11_6997_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1871_c3_cbf9_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1863_l1871_l1878_l1886_DUPLICATE_5750_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1886_c3_548c_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1863_l1871_l1878_l1886_DUPLICATE_5750_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1864_DUPLICATE_8a61_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1863_l1871_l1878_l1886_DUPLICATE_5750_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1892_c7_5d8f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1896_c24_fdba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1859_l1882_l1853_l1877_l1874_l1870_l1867_l1862_l1885_DUPLICATE_30d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1859_l1882_l1853_l1877_l1874_l1870_l1867_l1862_l1885_DUPLICATE_30d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1859_l1882_l1853_l1877_l1874_l1870_l1867_l1862_l1885_DUPLICATE_30d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1859_l1882_l1853_l1877_l1874_l1870_l1867_l1862_l1885_DUPLICATE_30d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1859_l1882_l1853_l1877_l1874_l1870_l1867_l1862_l1885_DUPLICATE_30d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1859_l1882_l1853_l1877_l1874_l1870_l1867_l1862_l1885_DUPLICATE_30d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1859_l1882_l1853_l1877_l1874_l1870_l1867_l1862_l1885_DUPLICATE_30d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1859_l1882_l1853_l1877_l1874_l1870_l1867_l1862_l1885_DUPLICATE_30d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1859_l1882_l1853_l1877_l1874_l1870_l1867_l1862_l1885_DUPLICATE_30d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1859_l1882_l1877_l1874_l1902_l1870_l1898_l1867_l1892_l1862_l1885_DUPLICATE_d3f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1859_l1882_l1877_l1874_l1902_l1870_l1898_l1867_l1892_l1862_l1885_DUPLICATE_d3f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1859_l1882_l1877_l1874_l1902_l1870_l1898_l1867_l1892_l1862_l1885_DUPLICATE_d3f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1859_l1882_l1877_l1874_l1902_l1870_l1898_l1867_l1892_l1862_l1885_DUPLICATE_d3f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1859_l1882_l1877_l1874_l1902_l1870_l1898_l1867_l1892_l1862_l1885_DUPLICATE_d3f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1859_l1882_l1877_l1874_l1902_l1870_l1898_l1867_l1892_l1862_l1885_DUPLICATE_d3f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1859_l1882_l1877_l1874_l1902_l1870_l1898_l1867_l1892_l1862_l1885_DUPLICATE_d3f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1859_l1882_l1877_l1874_l1902_l1870_l1898_l1867_l1892_l1862_l1885_DUPLICATE_d3f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_5d8f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1859_l1882_l1877_l1874_l1902_l1870_l1898_l1867_l1892_l1862_l1885_DUPLICATE_d3f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1898_c7_6d87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1859_l1882_l1877_l1874_l1902_l1870_l1898_l1867_l1892_l1862_l1885_DUPLICATE_d3f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1902_c7_5474_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1859_l1882_l1877_l1874_l1902_l1870_l1898_l1867_l1892_l1862_l1885_DUPLICATE_d3f4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1859_l1882_l1853_l1877_l1874_l1870_l1867_l1892_l1862_DUPLICATE_fd3c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1859_l1882_l1853_l1877_l1874_l1870_l1867_l1892_l1862_DUPLICATE_fd3c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1859_l1882_l1853_l1877_l1874_l1870_l1867_l1892_l1862_DUPLICATE_fd3c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1859_l1882_l1853_l1877_l1874_l1870_l1867_l1892_l1862_DUPLICATE_fd3c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1859_l1882_l1853_l1877_l1874_l1870_l1867_l1892_l1862_DUPLICATE_fd3c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1859_l1882_l1853_l1877_l1874_l1870_l1867_l1892_l1862_DUPLICATE_fd3c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1859_l1882_l1853_l1877_l1874_l1870_l1867_l1892_l1862_DUPLICATE_fd3c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1859_l1882_l1853_l1877_l1874_l1870_l1867_l1892_l1862_DUPLICATE_fd3c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_5d8f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1859_l1882_l1853_l1877_l1874_l1870_l1867_l1892_l1862_DUPLICATE_fd3c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1859_l1882_l1877_l1874_l1870_l1867_l1862_l1885_DUPLICATE_165d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1859_l1882_l1877_l1874_l1870_l1867_l1862_l1885_DUPLICATE_165d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1859_l1882_l1877_l1874_l1870_l1867_l1862_l1885_DUPLICATE_165d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1859_l1882_l1877_l1874_l1870_l1867_l1862_l1885_DUPLICATE_165d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1859_l1882_l1877_l1874_l1870_l1867_l1862_l1885_DUPLICATE_165d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1859_l1882_l1877_l1874_l1870_l1867_l1862_l1885_DUPLICATE_165d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1859_l1882_l1877_l1874_l1870_l1867_l1862_l1885_DUPLICATE_165d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1859_l1882_l1877_l1874_l1870_l1867_l1862_l1885_DUPLICATE_165d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1859_l1882_l1853_l1877_l1874_l1902_l1870_l1898_l1867_l1862_l1885_DUPLICATE_f520_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1859_l1882_l1853_l1877_l1874_l1902_l1870_l1898_l1867_l1862_l1885_DUPLICATE_f520_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1859_l1882_l1853_l1877_l1874_l1902_l1870_l1898_l1867_l1862_l1885_DUPLICATE_f520_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1859_l1882_l1853_l1877_l1874_l1902_l1870_l1898_l1867_l1862_l1885_DUPLICATE_f520_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1859_l1882_l1853_l1877_l1874_l1902_l1870_l1898_l1867_l1862_l1885_DUPLICATE_f520_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1859_l1882_l1853_l1877_l1874_l1902_l1870_l1898_l1867_l1862_l1885_DUPLICATE_f520_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1859_l1882_l1853_l1877_l1874_l1902_l1870_l1898_l1867_l1862_l1885_DUPLICATE_f520_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1859_l1882_l1853_l1877_l1874_l1902_l1870_l1898_l1867_l1862_l1885_DUPLICATE_f520_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1859_l1882_l1853_l1877_l1874_l1902_l1870_l1898_l1867_l1862_l1885_DUPLICATE_f520_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1898_c7_6d87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1859_l1882_l1853_l1877_l1874_l1902_l1870_l1898_l1867_l1862_l1885_DUPLICATE_f520_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1902_c7_5474_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1859_l1882_l1853_l1877_l1874_l1902_l1870_l1898_l1867_l1862_l1885_DUPLICATE_f520_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1898_l1885_DUPLICATE_3b24_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c7_6d87_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1898_l1885_DUPLICATE_3b24_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1859_l1882_l1853_l1877_l1874_l1870_l1898_l1867_l1862_l1885_DUPLICATE_1325_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1859_l1882_l1853_l1877_l1874_l1870_l1898_l1867_l1862_l1885_DUPLICATE_1325_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1859_l1882_l1853_l1877_l1874_l1870_l1898_l1867_l1862_l1885_DUPLICATE_1325_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1859_l1882_l1853_l1877_l1874_l1870_l1898_l1867_l1862_l1885_DUPLICATE_1325_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1859_l1882_l1853_l1877_l1874_l1870_l1898_l1867_l1862_l1885_DUPLICATE_1325_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1859_l1882_l1853_l1877_l1874_l1870_l1898_l1867_l1862_l1885_DUPLICATE_1325_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1859_l1882_l1853_l1877_l1874_l1870_l1898_l1867_l1862_l1885_DUPLICATE_1325_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1859_l1882_l1853_l1877_l1874_l1870_l1898_l1867_l1862_l1885_DUPLICATE_1325_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1859_l1882_l1853_l1877_l1874_l1870_l1898_l1867_l1862_l1885_DUPLICATE_1325_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1898_c7_6d87_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1859_l1882_l1853_l1877_l1874_l1870_l1898_l1867_l1862_l1885_DUPLICATE_1325_return_output;
     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1864_DUPLICATE_8a61 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1864_DUPLICATE_8a61_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1864_DUPLICATE_8a61_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1864_DUPLICATE_8a61_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1864_DUPLICATE_8a61_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1898_c7_6d87] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c7_6d87_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c7_6d87_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c7_6d87_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c7_6d87_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c7_6d87_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c7_6d87_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c7_6d87_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c7_6d87_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1890_c32_5b89] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1890_c32_5b89_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1890_c32_5b89_left;
     BIN_OP_GT_uxn_opcodes_h_l1890_c32_5b89_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1890_c32_5b89_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1890_c32_5b89_return_output := BIN_OP_GT_uxn_opcodes_h_l1890_c32_5b89_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1853_c1_b2a2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_b2a2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_b2a2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_b2a2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_b2a2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_b2a2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_b2a2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_b2a2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_b2a2_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1900_c24_8479] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1900_c24_8479_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1900_c34_23b6_return_output);

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1885_c7_2c46] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1885_c7_2c46_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1885_c7_2c46_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1902_c7_5474] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1902_c7_5474_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1902_c7_5474_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1902_c7_5474_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1902_c7_5474_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1902_c7_5474_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1902_c7_5474_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1902_c7_5474_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1902_c7_5474_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1902_c7_5474] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1902_c7_5474_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1902_c7_5474_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1902_c7_5474_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1902_c7_5474_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1902_c7_5474_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1902_c7_5474_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1902_c7_5474_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1902_c7_5474_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1892_c7_5d8f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_5d8f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_5d8f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_5d8f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_5d8f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_5d8f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_5d8f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_5d8f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_5d8f_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1886_c3_548c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1886_c3_548c_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1886_c3_548c_left;
     BIN_OP_OR_uxn_opcodes_h_l1886_c3_548c_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1886_c3_548c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1886_c3_548c_return_output := BIN_OP_OR_uxn_opcodes_h_l1886_c3_548c_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1871_c3_cbf9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1871_c3_cbf9_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1871_c3_cbf9_left;
     BIN_OP_OR_uxn_opcodes_h_l1871_c3_cbf9_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1871_c3_cbf9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1871_c3_cbf9_return_output := BIN_OP_OR_uxn_opcodes_h_l1871_c3_cbf9_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1890_c32_cd7d_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1890_c32_5b89_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1871_c3_cbf9_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1887_c11_596f_right := VAR_BIN_OP_OR_uxn_opcodes_h_l1886_c3_548c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1886_c3_548c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1898_c7_6d87_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1900_c24_8479_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1864_DUPLICATE_8a61_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1864_DUPLICATE_8a61_return_output;
     VAR_printf_uxn_opcodes_h_l1854_c3_80ca_uxn_opcodes_h_l1854_c3_80ca_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_b2a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1898_c7_6d87_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1902_c7_5474_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1892_c7_5d8f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1898_c7_6d87_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1902_c7_5474_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_5d8f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c7_6d87_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1898_c7_6d87] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1898_c7_6d87_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1898_c7_6d87_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1898_c7_6d87_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1898_c7_6d87_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1898_c7_6d87_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1898_c7_6d87_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1898_c7_6d87_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1898_c7_6d87_return_output;

     -- MUX[uxn_opcodes_h_l1890_c32_cd7d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1890_c32_cd7d_cond <= VAR_MUX_uxn_opcodes_h_l1890_c32_cd7d_cond;
     MUX_uxn_opcodes_h_l1890_c32_cd7d_iftrue <= VAR_MUX_uxn_opcodes_h_l1890_c32_cd7d_iftrue;
     MUX_uxn_opcodes_h_l1890_c32_cd7d_iffalse <= VAR_MUX_uxn_opcodes_h_l1890_c32_cd7d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1890_c32_cd7d_return_output := MUX_uxn_opcodes_h_l1890_c32_cd7d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1885_c7_2c46] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1885_c7_2c46_cond <= VAR_n16_MUX_uxn_opcodes_h_l1885_c7_2c46_cond;
     n16_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue;
     n16_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output := n16_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1885_c7_2c46] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_2c46_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_2c46_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1898_c7_6d87] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1898_c7_6d87_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1898_c7_6d87_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1898_c7_6d87_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1898_c7_6d87_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1898_c7_6d87_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1898_c7_6d87_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1898_c7_6d87_return_output := result_stack_value_MUX_uxn_opcodes_h_l1898_c7_6d87_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1892_c7_5d8f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_5d8f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_5d8f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_5d8f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_5d8f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_5d8f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_5d8f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_5d8f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_5d8f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1898_c7_6d87] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1898_c7_6d87_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1898_c7_6d87_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1898_c7_6d87_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1898_c7_6d87_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1898_c7_6d87_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1898_c7_6d87_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1898_c7_6d87_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1898_c7_6d87_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1882_c7_70bd] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1882_c7_70bd_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1882_c7_70bd_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l1887_c11_596f] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1887_c11_596f_left <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1887_c11_596f_left;
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1887_c11_596f_right <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1887_c11_596f_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1887_c11_596f_return_output := BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1887_c11_596f_return_output;

     -- printf_uxn_opcodes_h_l1854_c3_80ca[uxn_opcodes_h_l1854_c3_80ca] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1854_c3_80ca_uxn_opcodes_h_l1854_c3_80ca_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1854_c3_80ca_uxn_opcodes_h_l1854_c3_80ca_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t16_MUX[uxn_opcodes_h_l1870_c7_212f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1870_c7_212f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1870_c7_212f_cond;
     t16_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue;
     t16_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1870_c7_212f_return_output := t16_MUX_uxn_opcodes_h_l1870_c7_212f_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l1887_c3_7041 := resize(VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1887_c11_596f_return_output, 16);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue := VAR_MUX_uxn_opcodes_h_l1890_c32_cd7d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_5d8f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1898_c7_6d87_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_5d8f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1898_c7_6d87_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_5d8f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1892_c7_5d8f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1898_c7_6d87_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1870_c7_212f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue := VAR_tmp16_uxn_opcodes_h_l1887_c3_7041;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1882_c7_70bd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_70bd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_70bd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1885_c7_2c46] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1885_c7_2c46_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1885_c7_2c46_cond;
     tmp16_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output := tmp16_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output;

     -- n16_MUX[uxn_opcodes_h_l1882_c7_70bd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1882_c7_70bd_cond <= VAR_n16_MUX_uxn_opcodes_h_l1882_c7_70bd_cond;
     n16_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue;
     n16_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output := n16_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1877_c7_f081] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_f081_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_f081_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_f081_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_f081_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1885_c7_2c46] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1885_c7_2c46_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1885_c7_2c46_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1892_c7_5d8f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_5d8f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_5d8f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_5d8f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_5d8f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_5d8f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_5d8f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_5d8f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_5d8f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1892_c7_5d8f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1892_c7_5d8f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1892_c7_5d8f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1892_c7_5d8f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1892_c7_5d8f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1892_c7_5d8f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1892_c7_5d8f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1892_c7_5d8f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1892_c7_5d8f_return_output;

     -- t16_MUX[uxn_opcodes_h_l1867_c7_f18a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1867_c7_f18a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1867_c7_f18a_cond;
     t16_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue;
     t16_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output := t16_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1885_c7_2c46] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_2c46_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_2c46_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1892_c7_5d8f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_5d8f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_5d8f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_5d8f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_5d8f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_5d8f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_5d8f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_5d8f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_5d8f_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_5d8f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_f081_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_5d8f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1892_c7_5d8f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1885_c7_2c46] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_2c46_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_2c46_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1882_c7_70bd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_70bd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_70bd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1877_c7_f081] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_f081_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_f081_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_f081_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_f081_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1882_c7_70bd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_70bd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_70bd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1885_c7_2c46] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1885_c7_2c46_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1885_c7_2c46_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output := result_stack_value_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output;

     -- n16_MUX[uxn_opcodes_h_l1877_c7_f081] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1877_c7_f081_cond <= VAR_n16_MUX_uxn_opcodes_h_l1877_c7_f081_cond;
     n16_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue;
     n16_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1877_c7_f081_return_output := n16_MUX_uxn_opcodes_h_l1877_c7_f081_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1874_c7_7ad7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1882_c7_70bd] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1882_c7_70bd_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1882_c7_70bd_cond;
     tmp16_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output := tmp16_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output;

     -- t16_MUX[uxn_opcodes_h_l1862_c7_229e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1862_c7_229e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1862_c7_229e_cond;
     t16_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue;
     t16_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1862_c7_229e_return_output := t16_MUX_uxn_opcodes_h_l1862_c7_229e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1885_c7_2c46] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_2c46_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_2c46_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_2c46_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_2c46_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1877_c7_f081_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_f081_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1885_c7_2c46_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1862_c7_229e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1877_c7_f081] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_f081_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_f081_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_f081_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_f081_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1877_c7_f081] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1877_c7_f081_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1877_c7_f081_cond;
     tmp16_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1877_c7_f081_return_output := tmp16_MUX_uxn_opcodes_h_l1877_c7_f081_return_output;

     -- t16_MUX[uxn_opcodes_h_l1859_c7_c3c7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond <= VAR_t16_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond;
     t16_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue;
     t16_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output := t16_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1877_c7_f081] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_f081_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_f081_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_f081_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_f081_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1870_c7_212f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1870_c7_212f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1870_c7_212f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1870_c7_212f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1870_c7_212f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1874_c7_7ad7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond <= VAR_n16_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond;
     n16_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue;
     n16_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output := n16_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1882_c7_70bd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1882_c7_70bd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1882_c7_70bd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output := result_stack_value_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1882_c7_70bd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_70bd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_70bd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1874_c7_7ad7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1882_c7_70bd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_70bd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_70bd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_70bd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_70bd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1870_c7_212f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_f081_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_f081_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1882_c7_70bd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1877_c7_f081_return_output;
     -- t16_MUX[uxn_opcodes_h_l1853_c2_3d7b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond;
     t16_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue;
     t16_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output := t16_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1874_c7_7ad7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond;
     tmp16_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output := tmp16_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1867_c7_f18a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_f18a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_f18a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1874_c7_7ad7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1877_c7_f081] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1877_c7_f081_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1877_c7_f081_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1877_c7_f081_return_output := result_stack_value_MUX_uxn_opcodes_h_l1877_c7_f081_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1877_c7_f081] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_f081_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_f081_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_f081_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_f081_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1870_c7_212f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_212f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_212f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_212f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_212f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1874_c7_7ad7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output;

     -- n16_MUX[uxn_opcodes_h_l1870_c7_212f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1870_c7_212f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1870_c7_212f_cond;
     n16_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue;
     n16_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1870_c7_212f_return_output := n16_MUX_uxn_opcodes_h_l1870_c7_212f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1877_c7_f081] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_f081_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_f081_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_f081_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_f081_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_f081_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_f081_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1870_c7_212f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_f081_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_212f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_f081_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1877_c7_f081_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1870_c7_212f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_212f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_212f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_212f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_212f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1874_c7_7ad7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output := result_stack_value_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1870_c7_212f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1870_c7_212f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1870_c7_212f_cond;
     tmp16_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1870_c7_212f_return_output := tmp16_MUX_uxn_opcodes_h_l1870_c7_212f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1874_c7_7ad7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1874_c7_7ad7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7ad7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7ad7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7ad7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1862_c7_229e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_229e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_229e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_229e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_229e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1870_c7_212f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_212f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_212f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_212f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_212f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1867_c7_f18a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1867_c7_f18a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1867_c7_f18a_cond;
     n16_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue;
     n16_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output := n16_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1867_c7_f18a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_f18a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_f18a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_229e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_212f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_212f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1874_c7_7ad7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1870_c7_212f_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1867_c7_f18a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_f18a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_f18a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1870_c7_212f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_212f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_212f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_212f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_212f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1859_c7_c3c7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1870_c7_212f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_212f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_212f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_212f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_212f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1862_c7_229e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1862_c7_229e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1862_c7_229e_cond;
     n16_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue;
     n16_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1862_c7_229e_return_output := n16_MUX_uxn_opcodes_h_l1862_c7_229e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1862_c7_229e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_229e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_229e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_229e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_229e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1867_c7_f18a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1867_c7_f18a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1867_c7_f18a_cond;
     tmp16_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output := tmp16_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1867_c7_f18a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_f18a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_f18a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1870_c7_212f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1870_c7_212f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1870_c7_212f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1870_c7_212f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1870_c7_212f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1870_c7_212f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1870_c7_212f_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1862_c7_229e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_212f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_229e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_212f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1870_c7_212f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1853_c2_3d7b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1862_c7_229e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_229e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_229e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_229e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_229e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1859_c7_c3c7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1867_c7_f18a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1867_c7_f18a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c7_f18a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1859_c7_c3c7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond <= VAR_n16_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond;
     n16_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue;
     n16_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output := n16_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1862_c7_229e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1862_c7_229e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1862_c7_229e_cond;
     tmp16_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1862_c7_229e_return_output := tmp16_MUX_uxn_opcodes_h_l1862_c7_229e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1867_c7_f18a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_f18a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_f18a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1862_c7_229e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_229e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_229e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_229e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_229e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1867_c7_f18a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_f18a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_f18a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_f18a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_f18a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_229e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_229e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c7_f18a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1862_c7_229e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1859_c7_c3c7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1853_c2_3d7b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1862_c7_229e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1862_c7_229e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1862_c7_229e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1862_c7_229e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1862_c7_229e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1862_c7_229e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_229e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_229e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_229e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_229e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1859_c7_c3c7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond;
     tmp16_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output := tmp16_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1862_c7_229e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_229e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_229e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_229e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_229e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_229e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_229e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1859_c7_c3c7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output;

     -- n16_MUX[uxn_opcodes_h_l1853_c2_3d7b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond;
     n16_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue;
     n16_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output := n16_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_229e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_229e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1862_c7_229e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1859_c7_c3c7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1859_c7_c3c7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output := result_stack_value_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1853_c2_3d7b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1853_c2_3d7b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond;
     tmp16_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output := tmp16_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1853_c2_3d7b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1859_c7_c3c7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c3c7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c3c7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c3c7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1859_c7_c3c7_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1853_c2_3d7b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1853_c2_3d7b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1853_c2_3d7b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_3d7b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_3d7b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_3d7b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1849_l1907_DUPLICATE_4655 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1849_l1907_DUPLICATE_4655_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_df93(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_3d7b_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1849_l1907_DUPLICATE_4655_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1849_l1907_DUPLICATE_4655_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
