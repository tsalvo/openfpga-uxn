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
-- BIN_OP_EQ[uxn_opcodes_h_l1708_c6_75c5]
signal BIN_OP_EQ_uxn_opcodes_h_l1708_c6_75c5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1708_c6_75c5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1708_c6_75c5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1708_c1_dbc4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1708_c1_dbc4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1708_c1_dbc4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1708_c1_dbc4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1708_c1_dbc4_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1708_c2_52f6]
signal tmp16_MUX_uxn_opcodes_h_l1708_c2_52f6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1708_c2_52f6]
signal t16_MUX_uxn_opcodes_h_l1708_c2_52f6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1708_c2_52f6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1708_c2_52f6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1708_c2_52f6]
signal result_stack_value_MUX_uxn_opcodes_h_l1708_c2_52f6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1708_c2_52f6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1708_c2_52f6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1708_c2_52f6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1708_c2_52f6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1708_c2_52f6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1708_c2_52f6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1708_c2_52f6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1708_c2_52f6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1708_c2_52f6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1708_c2_52f6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1708_c2_52f6]
signal n16_MUX_uxn_opcodes_h_l1708_c2_52f6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1709_c3_50c8[uxn_opcodes_h_l1709_c3_50c8]
signal printf_uxn_opcodes_h_l1709_c3_50c8_uxn_opcodes_h_l1709_c3_50c8_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1714_c11_0ea7]
signal BIN_OP_EQ_uxn_opcodes_h_l1714_c11_0ea7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1714_c11_0ea7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1714_c11_0ea7_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1714_c7_2bcf]
signal tmp16_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1714_c7_2bcf]
signal t16_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1714_c7_2bcf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1714_c7_2bcf]
signal result_stack_value_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1714_c7_2bcf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1714_c7_2bcf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1714_c7_2bcf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1714_c7_2bcf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1714_c7_2bcf]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1714_c7_2bcf]
signal n16_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1717_c11_f850]
signal BIN_OP_EQ_uxn_opcodes_h_l1717_c11_f850_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1717_c11_f850_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1717_c11_f850_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1717_c7_d246]
signal tmp16_MUX_uxn_opcodes_h_l1717_c7_d246_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1717_c7_d246_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1717_c7_d246]
signal t16_MUX_uxn_opcodes_h_l1717_c7_d246_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1717_c7_d246_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1717_c7_d246]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d246_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d246_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1717_c7_d246]
signal result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d246_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d246_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1717_c7_d246]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d246_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d246_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1717_c7_d246]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d246_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d246_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1717_c7_d246]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d246_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d246_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1717_c7_d246]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d246_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d246_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1717_c7_d246]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d246_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d246_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1717_c7_d246]
signal n16_MUX_uxn_opcodes_h_l1717_c7_d246_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1717_c7_d246_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1722_c11_4660]
signal BIN_OP_EQ_uxn_opcodes_h_l1722_c11_4660_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1722_c11_4660_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1722_c11_4660_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1722_c7_7fa9]
signal tmp16_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1722_c7_7fa9]
signal t16_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1722_c7_7fa9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1722_c7_7fa9]
signal result_stack_value_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1722_c7_7fa9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1722_c7_7fa9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1722_c7_7fa9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1722_c7_7fa9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1722_c7_7fa9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1722_c7_7fa9]
signal n16_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1725_c11_5b2d]
signal BIN_OP_EQ_uxn_opcodes_h_l1725_c11_5b2d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1725_c11_5b2d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1725_c11_5b2d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1725_c7_01ed]
signal tmp16_MUX_uxn_opcodes_h_l1725_c7_01ed_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1725_c7_01ed]
signal t16_MUX_uxn_opcodes_h_l1725_c7_01ed_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1725_c7_01ed]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_01ed_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1725_c7_01ed]
signal result_stack_value_MUX_uxn_opcodes_h_l1725_c7_01ed_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1725_c7_01ed]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_01ed_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1725_c7_01ed]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_01ed_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1725_c7_01ed]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_01ed_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1725_c7_01ed]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_01ed_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1725_c7_01ed]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_01ed_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1725_c7_01ed]
signal n16_MUX_uxn_opcodes_h_l1725_c7_01ed_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1726_c3_69fb]
signal BIN_OP_OR_uxn_opcodes_h_l1726_c3_69fb_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1726_c3_69fb_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1726_c3_69fb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1729_c11_bf11]
signal BIN_OP_EQ_uxn_opcodes_h_l1729_c11_bf11_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1729_c11_bf11_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1729_c11_bf11_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1729_c7_1972]
signal tmp16_MUX_uxn_opcodes_h_l1729_c7_1972_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1729_c7_1972_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1729_c7_1972]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1972_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1972_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1729_c7_1972]
signal result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1972_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1972_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1729_c7_1972]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1972_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1972_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1729_c7_1972]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1972_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1972_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1729_c7_1972]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1972_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1972_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1729_c7_1972]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1972_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1972_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1729_c7_1972]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1729_c7_1972_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1729_c7_1972_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1729_c7_1972]
signal n16_MUX_uxn_opcodes_h_l1729_c7_1972_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1729_c7_1972_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1732_c11_2738]
signal BIN_OP_EQ_uxn_opcodes_h_l1732_c11_2738_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1732_c11_2738_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1732_c11_2738_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1732_c7_598c]
signal tmp16_MUX_uxn_opcodes_h_l1732_c7_598c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1732_c7_598c_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1732_c7_598c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_598c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_598c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1732_c7_598c]
signal result_stack_value_MUX_uxn_opcodes_h_l1732_c7_598c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1732_c7_598c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1732_c7_598c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_598c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_598c_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1732_c7_598c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_598c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_598c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1732_c7_598c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_598c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_598c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1732_c7_598c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_598c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_598c_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1732_c7_598c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1732_c7_598c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1732_c7_598c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1732_c7_598c]
signal n16_MUX_uxn_opcodes_h_l1732_c7_598c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1732_c7_598c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1737_c11_8644]
signal BIN_OP_EQ_uxn_opcodes_h_l1737_c11_8644_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1737_c11_8644_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1737_c11_8644_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1737_c7_c0db]
signal tmp16_MUX_uxn_opcodes_h_l1737_c7_c0db_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1737_c7_c0db]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_c0db_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1737_c7_c0db]
signal result_stack_value_MUX_uxn_opcodes_h_l1737_c7_c0db_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1737_c7_c0db]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_c0db_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1737_c7_c0db]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_c0db_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1737_c7_c0db]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_c0db_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1737_c7_c0db]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_c0db_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1737_c7_c0db]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1737_c7_c0db_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1737_c7_c0db]
signal n16_MUX_uxn_opcodes_h_l1737_c7_c0db_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1740_c11_489b]
signal BIN_OP_EQ_uxn_opcodes_h_l1740_c11_489b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1740_c11_489b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1740_c11_489b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1740_c7_f869]
signal tmp16_MUX_uxn_opcodes_h_l1740_c7_f869_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1740_c7_f869_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1740_c7_f869]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_f869_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_f869_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1740_c7_f869]
signal result_stack_value_MUX_uxn_opcodes_h_l1740_c7_f869_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1740_c7_f869_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1740_c7_f869]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c7_f869_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c7_f869_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1740_c7_f869]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_f869_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_f869_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1740_c7_f869]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_f869_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_f869_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1740_c7_f869]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_f869_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_f869_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1740_c7_f869]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1740_c7_f869_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1740_c7_f869_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1740_c7_f869]
signal n16_MUX_uxn_opcodes_h_l1740_c7_f869_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1740_c7_f869_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1741_c3_0915]
signal BIN_OP_OR_uxn_opcodes_h_l1741_c3_0915_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1741_c3_0915_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1741_c3_0915_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l1742_c11_6625]
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1742_c11_6625_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1742_c11_6625_right : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1742_c11_6625_return_output : unsigned(31 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1745_c32_0540]
signal BIN_OP_AND_uxn_opcodes_h_l1745_c32_0540_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1745_c32_0540_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1745_c32_0540_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1745_c32_6f4b]
signal BIN_OP_GT_uxn_opcodes_h_l1745_c32_6f4b_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1745_c32_6f4b_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1745_c32_6f4b_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1745_c32_4b52]
signal MUX_uxn_opcodes_h_l1745_c32_4b52_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1745_c32_4b52_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1745_c32_4b52_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1745_c32_4b52_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1747_c11_83cf]
signal BIN_OP_EQ_uxn_opcodes_h_l1747_c11_83cf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1747_c11_83cf_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1747_c11_83cf_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1747_c7_9174]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_9174_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_9174_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_9174_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_9174_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1747_c7_9174]
signal result_stack_value_MUX_uxn_opcodes_h_l1747_c7_9174_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1747_c7_9174_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1747_c7_9174_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1747_c7_9174_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1747_c7_9174]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_9174_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_9174_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_9174_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_9174_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1747_c7_9174]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_9174_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_9174_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_9174_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_9174_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1747_c7_9174]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_9174_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_9174_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_9174_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_9174_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1753_c11_881c]
signal BIN_OP_EQ_uxn_opcodes_h_l1753_c11_881c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1753_c11_881c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1753_c11_881c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1753_c7_33b1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_33b1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_33b1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_33b1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_33b1_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1753_c7_33b1]
signal result_stack_value_MUX_uxn_opcodes_h_l1753_c7_33b1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1753_c7_33b1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1753_c7_33b1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1753_c7_33b1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1753_c7_33b1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_33b1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_33b1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_33b1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_33b1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1753_c7_33b1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1753_c7_33b1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1753_c7_33b1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1753_c7_33b1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1753_c7_33b1_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1755_c34_e17b]
signal CONST_SR_8_uxn_opcodes_h_l1755_c34_e17b_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1755_c34_e17b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1757_c11_d849]
signal BIN_OP_EQ_uxn_opcodes_h_l1757_c11_d849_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1757_c11_d849_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1757_c11_d849_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1757_c7_157d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_157d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_157d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_157d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_157d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1757_c7_157d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_157d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_157d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_157d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_157d_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1719_l1734_DUPLICATE_fa73
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1719_l1734_DUPLICATE_fa73_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1719_l1734_DUPLICATE_fa73_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1708_c6_75c5
BIN_OP_EQ_uxn_opcodes_h_l1708_c6_75c5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1708_c6_75c5_left,
BIN_OP_EQ_uxn_opcodes_h_l1708_c6_75c5_right,
BIN_OP_EQ_uxn_opcodes_h_l1708_c6_75c5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1708_c1_dbc4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1708_c1_dbc4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1708_c1_dbc4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1708_c1_dbc4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1708_c1_dbc4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1708_c1_dbc4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1708_c2_52f6
tmp16_MUX_uxn_opcodes_h_l1708_c2_52f6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1708_c2_52f6_cond,
tmp16_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue,
tmp16_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse,
tmp16_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output);

-- t16_MUX_uxn_opcodes_h_l1708_c2_52f6
t16_MUX_uxn_opcodes_h_l1708_c2_52f6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1708_c2_52f6_cond,
t16_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue,
t16_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse,
t16_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1708_c2_52f6
result_is_sp_shift_MUX_uxn_opcodes_h_l1708_c2_52f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1708_c2_52f6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1708_c2_52f6
result_stack_value_MUX_uxn_opcodes_h_l1708_c2_52f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1708_c2_52f6_cond,
result_stack_value_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1708_c2_52f6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1708_c2_52f6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1708_c2_52f6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1708_c2_52f6
result_is_stack_write_MUX_uxn_opcodes_h_l1708_c2_52f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1708_c2_52f6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1708_c2_52f6
result_is_opc_done_MUX_uxn_opcodes_h_l1708_c2_52f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1708_c2_52f6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1708_c2_52f6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1708_c2_52f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1708_c2_52f6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1708_c2_52f6
result_is_stack_read_MUX_uxn_opcodes_h_l1708_c2_52f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1708_c2_52f6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output);

-- n16_MUX_uxn_opcodes_h_l1708_c2_52f6
n16_MUX_uxn_opcodes_h_l1708_c2_52f6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1708_c2_52f6_cond,
n16_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue,
n16_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse,
n16_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output);

-- printf_uxn_opcodes_h_l1709_c3_50c8_uxn_opcodes_h_l1709_c3_50c8
printf_uxn_opcodes_h_l1709_c3_50c8_uxn_opcodes_h_l1709_c3_50c8 : entity work.printf_uxn_opcodes_h_l1709_c3_50c8_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1709_c3_50c8_uxn_opcodes_h_l1709_c3_50c8_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1714_c11_0ea7
BIN_OP_EQ_uxn_opcodes_h_l1714_c11_0ea7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1714_c11_0ea7_left,
BIN_OP_EQ_uxn_opcodes_h_l1714_c11_0ea7_right,
BIN_OP_EQ_uxn_opcodes_h_l1714_c11_0ea7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1714_c7_2bcf
tmp16_MUX_uxn_opcodes_h_l1714_c7_2bcf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond,
tmp16_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue,
tmp16_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse,
tmp16_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output);

-- t16_MUX_uxn_opcodes_h_l1714_c7_2bcf
t16_MUX_uxn_opcodes_h_l1714_c7_2bcf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond,
t16_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue,
t16_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse,
t16_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf
result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1714_c7_2bcf
result_stack_value_MUX_uxn_opcodes_h_l1714_c7_2bcf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond,
result_stack_value_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf
result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_2bcf
result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_2bcf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_2bcf
result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_2bcf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_2bcf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_2bcf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_2bcf
result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_2bcf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output);

-- n16_MUX_uxn_opcodes_h_l1714_c7_2bcf
n16_MUX_uxn_opcodes_h_l1714_c7_2bcf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond,
n16_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue,
n16_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse,
n16_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1717_c11_f850
BIN_OP_EQ_uxn_opcodes_h_l1717_c11_f850 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1717_c11_f850_left,
BIN_OP_EQ_uxn_opcodes_h_l1717_c11_f850_right,
BIN_OP_EQ_uxn_opcodes_h_l1717_c11_f850_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1717_c7_d246
tmp16_MUX_uxn_opcodes_h_l1717_c7_d246 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1717_c7_d246_cond,
tmp16_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue,
tmp16_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse,
tmp16_MUX_uxn_opcodes_h_l1717_c7_d246_return_output);

-- t16_MUX_uxn_opcodes_h_l1717_c7_d246
t16_MUX_uxn_opcodes_h_l1717_c7_d246 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1717_c7_d246_cond,
t16_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue,
t16_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse,
t16_MUX_uxn_opcodes_h_l1717_c7_d246_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d246
result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d246 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d246_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d246_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d246
result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d246 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d246_cond,
result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d246_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d246
result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d246 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d246_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d246_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d246
result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d246 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d246_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d246_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d246
result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d246 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d246_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d246_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d246
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d246 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d246_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d246_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d246
result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d246 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d246_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d246_return_output);

-- n16_MUX_uxn_opcodes_h_l1717_c7_d246
n16_MUX_uxn_opcodes_h_l1717_c7_d246 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1717_c7_d246_cond,
n16_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue,
n16_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse,
n16_MUX_uxn_opcodes_h_l1717_c7_d246_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1722_c11_4660
BIN_OP_EQ_uxn_opcodes_h_l1722_c11_4660 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1722_c11_4660_left,
BIN_OP_EQ_uxn_opcodes_h_l1722_c11_4660_right,
BIN_OP_EQ_uxn_opcodes_h_l1722_c11_4660_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1722_c7_7fa9
tmp16_MUX_uxn_opcodes_h_l1722_c7_7fa9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond,
tmp16_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue,
tmp16_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse,
tmp16_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output);

-- t16_MUX_uxn_opcodes_h_l1722_c7_7fa9
t16_MUX_uxn_opcodes_h_l1722_c7_7fa9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond,
t16_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue,
t16_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse,
t16_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9
result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1722_c7_7fa9
result_stack_value_MUX_uxn_opcodes_h_l1722_c7_7fa9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond,
result_stack_value_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_7fa9
result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_7fa9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_7fa9
result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_7fa9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_7fa9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_7fa9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_7fa9
result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_7fa9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output);

-- n16_MUX_uxn_opcodes_h_l1722_c7_7fa9
n16_MUX_uxn_opcodes_h_l1722_c7_7fa9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond,
n16_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue,
n16_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse,
n16_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1725_c11_5b2d
BIN_OP_EQ_uxn_opcodes_h_l1725_c11_5b2d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1725_c11_5b2d_left,
BIN_OP_EQ_uxn_opcodes_h_l1725_c11_5b2d_right,
BIN_OP_EQ_uxn_opcodes_h_l1725_c11_5b2d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1725_c7_01ed
tmp16_MUX_uxn_opcodes_h_l1725_c7_01ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1725_c7_01ed_cond,
tmp16_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue,
tmp16_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse,
tmp16_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output);

-- t16_MUX_uxn_opcodes_h_l1725_c7_01ed
t16_MUX_uxn_opcodes_h_l1725_c7_01ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1725_c7_01ed_cond,
t16_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue,
t16_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse,
t16_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_01ed
result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_01ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_01ed_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1725_c7_01ed
result_stack_value_MUX_uxn_opcodes_h_l1725_c7_01ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1725_c7_01ed_cond,
result_stack_value_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_01ed
result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_01ed : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_01ed_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_01ed
result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_01ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_01ed_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_01ed
result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_01ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_01ed_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_01ed
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_01ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_01ed_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_01ed
result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_01ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_01ed_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output);

-- n16_MUX_uxn_opcodes_h_l1725_c7_01ed
n16_MUX_uxn_opcodes_h_l1725_c7_01ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1725_c7_01ed_cond,
n16_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue,
n16_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse,
n16_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1726_c3_69fb
BIN_OP_OR_uxn_opcodes_h_l1726_c3_69fb : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1726_c3_69fb_left,
BIN_OP_OR_uxn_opcodes_h_l1726_c3_69fb_right,
BIN_OP_OR_uxn_opcodes_h_l1726_c3_69fb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1729_c11_bf11
BIN_OP_EQ_uxn_opcodes_h_l1729_c11_bf11 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1729_c11_bf11_left,
BIN_OP_EQ_uxn_opcodes_h_l1729_c11_bf11_right,
BIN_OP_EQ_uxn_opcodes_h_l1729_c11_bf11_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1729_c7_1972
tmp16_MUX_uxn_opcodes_h_l1729_c7_1972 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1729_c7_1972_cond,
tmp16_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue,
tmp16_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse,
tmp16_MUX_uxn_opcodes_h_l1729_c7_1972_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1972
result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1972 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1972_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1972_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1972
result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1972 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1972_cond,
result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1972_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1972
result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1972 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1972_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1972_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1972
result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1972 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1972_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1972_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1972
result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1972 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1972_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1972_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1972
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1972 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1972_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1972_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1729_c7_1972
result_is_stack_read_MUX_uxn_opcodes_h_l1729_c7_1972 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1729_c7_1972_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1729_c7_1972_return_output);

-- n16_MUX_uxn_opcodes_h_l1729_c7_1972
n16_MUX_uxn_opcodes_h_l1729_c7_1972 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1729_c7_1972_cond,
n16_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue,
n16_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse,
n16_MUX_uxn_opcodes_h_l1729_c7_1972_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1732_c11_2738
BIN_OP_EQ_uxn_opcodes_h_l1732_c11_2738 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1732_c11_2738_left,
BIN_OP_EQ_uxn_opcodes_h_l1732_c11_2738_right,
BIN_OP_EQ_uxn_opcodes_h_l1732_c11_2738_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1732_c7_598c
tmp16_MUX_uxn_opcodes_h_l1732_c7_598c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1732_c7_598c_cond,
tmp16_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1732_c7_598c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_598c
result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_598c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_598c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_598c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1732_c7_598c
result_stack_value_MUX_uxn_opcodes_h_l1732_c7_598c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1732_c7_598c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1732_c7_598c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_598c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_598c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_598c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_598c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_598c
result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_598c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_598c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_598c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_598c
result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_598c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_598c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_598c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_598c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_598c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_598c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_598c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1732_c7_598c
result_is_stack_read_MUX_uxn_opcodes_h_l1732_c7_598c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1732_c7_598c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1732_c7_598c_return_output);

-- n16_MUX_uxn_opcodes_h_l1732_c7_598c
n16_MUX_uxn_opcodes_h_l1732_c7_598c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1732_c7_598c_cond,
n16_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue,
n16_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse,
n16_MUX_uxn_opcodes_h_l1732_c7_598c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1737_c11_8644
BIN_OP_EQ_uxn_opcodes_h_l1737_c11_8644 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1737_c11_8644_left,
BIN_OP_EQ_uxn_opcodes_h_l1737_c11_8644_right,
BIN_OP_EQ_uxn_opcodes_h_l1737_c11_8644_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1737_c7_c0db
tmp16_MUX_uxn_opcodes_h_l1737_c7_c0db : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1737_c7_c0db_cond,
tmp16_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue,
tmp16_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse,
tmp16_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_c0db
result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_c0db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_c0db_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1737_c7_c0db
result_stack_value_MUX_uxn_opcodes_h_l1737_c7_c0db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1737_c7_c0db_cond,
result_stack_value_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_c0db
result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_c0db : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_c0db_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_c0db
result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_c0db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_c0db_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_c0db
result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_c0db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_c0db_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_c0db
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_c0db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_c0db_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1737_c7_c0db
result_is_stack_read_MUX_uxn_opcodes_h_l1737_c7_c0db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1737_c7_c0db_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output);

-- n16_MUX_uxn_opcodes_h_l1737_c7_c0db
n16_MUX_uxn_opcodes_h_l1737_c7_c0db : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1737_c7_c0db_cond,
n16_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue,
n16_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse,
n16_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1740_c11_489b
BIN_OP_EQ_uxn_opcodes_h_l1740_c11_489b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1740_c11_489b_left,
BIN_OP_EQ_uxn_opcodes_h_l1740_c11_489b_right,
BIN_OP_EQ_uxn_opcodes_h_l1740_c11_489b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1740_c7_f869
tmp16_MUX_uxn_opcodes_h_l1740_c7_f869 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1740_c7_f869_cond,
tmp16_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue,
tmp16_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse,
tmp16_MUX_uxn_opcodes_h_l1740_c7_f869_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_f869
result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_f869 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_f869_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_f869_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1740_c7_f869
result_stack_value_MUX_uxn_opcodes_h_l1740_c7_f869 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1740_c7_f869_cond,
result_stack_value_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1740_c7_f869_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c7_f869
result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c7_f869 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c7_f869_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c7_f869_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_f869
result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_f869 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_f869_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_f869_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_f869
result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_f869 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_f869_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_f869_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_f869
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_f869 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_f869_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_f869_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1740_c7_f869
result_is_stack_read_MUX_uxn_opcodes_h_l1740_c7_f869 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1740_c7_f869_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1740_c7_f869_return_output);

-- n16_MUX_uxn_opcodes_h_l1740_c7_f869
n16_MUX_uxn_opcodes_h_l1740_c7_f869 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1740_c7_f869_cond,
n16_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue,
n16_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse,
n16_MUX_uxn_opcodes_h_l1740_c7_f869_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1741_c3_0915
BIN_OP_OR_uxn_opcodes_h_l1741_c3_0915 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1741_c3_0915_left,
BIN_OP_OR_uxn_opcodes_h_l1741_c3_0915_right,
BIN_OP_OR_uxn_opcodes_h_l1741_c3_0915_return_output);

-- BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1742_c11_6625
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1742_c11_6625 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1742_c11_6625_left,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1742_c11_6625_right,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1742_c11_6625_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1745_c32_0540
BIN_OP_AND_uxn_opcodes_h_l1745_c32_0540 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1745_c32_0540_left,
BIN_OP_AND_uxn_opcodes_h_l1745_c32_0540_right,
BIN_OP_AND_uxn_opcodes_h_l1745_c32_0540_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1745_c32_6f4b
BIN_OP_GT_uxn_opcodes_h_l1745_c32_6f4b : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1745_c32_6f4b_left,
BIN_OP_GT_uxn_opcodes_h_l1745_c32_6f4b_right,
BIN_OP_GT_uxn_opcodes_h_l1745_c32_6f4b_return_output);

-- MUX_uxn_opcodes_h_l1745_c32_4b52
MUX_uxn_opcodes_h_l1745_c32_4b52 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1745_c32_4b52_cond,
MUX_uxn_opcodes_h_l1745_c32_4b52_iftrue,
MUX_uxn_opcodes_h_l1745_c32_4b52_iffalse,
MUX_uxn_opcodes_h_l1745_c32_4b52_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1747_c11_83cf
BIN_OP_EQ_uxn_opcodes_h_l1747_c11_83cf : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1747_c11_83cf_left,
BIN_OP_EQ_uxn_opcodes_h_l1747_c11_83cf_right,
BIN_OP_EQ_uxn_opcodes_h_l1747_c11_83cf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_9174
result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_9174 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_9174_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_9174_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_9174_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_9174_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1747_c7_9174
result_stack_value_MUX_uxn_opcodes_h_l1747_c7_9174 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1747_c7_9174_cond,
result_stack_value_MUX_uxn_opcodes_h_l1747_c7_9174_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1747_c7_9174_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1747_c7_9174_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_9174
result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_9174 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_9174_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_9174_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_9174_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_9174_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_9174
result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_9174 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_9174_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_9174_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_9174_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_9174_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_9174
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_9174 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_9174_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_9174_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_9174_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_9174_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1753_c11_881c
BIN_OP_EQ_uxn_opcodes_h_l1753_c11_881c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1753_c11_881c_left,
BIN_OP_EQ_uxn_opcodes_h_l1753_c11_881c_right,
BIN_OP_EQ_uxn_opcodes_h_l1753_c11_881c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_33b1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_33b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_33b1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_33b1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_33b1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_33b1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1753_c7_33b1
result_stack_value_MUX_uxn_opcodes_h_l1753_c7_33b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1753_c7_33b1_cond,
result_stack_value_MUX_uxn_opcodes_h_l1753_c7_33b1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1753_c7_33b1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1753_c7_33b1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_33b1
result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_33b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_33b1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_33b1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_33b1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_33b1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1753_c7_33b1
result_is_stack_write_MUX_uxn_opcodes_h_l1753_c7_33b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1753_c7_33b1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1753_c7_33b1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1753_c7_33b1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1753_c7_33b1_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1755_c34_e17b
CONST_SR_8_uxn_opcodes_h_l1755_c34_e17b : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1755_c34_e17b_x,
CONST_SR_8_uxn_opcodes_h_l1755_c34_e17b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1757_c11_d849
BIN_OP_EQ_uxn_opcodes_h_l1757_c11_d849 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1757_c11_d849_left,
BIN_OP_EQ_uxn_opcodes_h_l1757_c11_d849_right,
BIN_OP_EQ_uxn_opcodes_h_l1757_c11_d849_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_157d
result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_157d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_157d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_157d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_157d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_157d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_157d
result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_157d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_157d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_157d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_157d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_157d_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1719_l1734_DUPLICATE_fa73
CONST_SL_8_uint16_t_uxn_opcodes_h_l1719_l1734_DUPLICATE_fa73 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1719_l1734_DUPLICATE_fa73_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1719_l1734_DUPLICATE_fa73_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1708_c6_75c5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1708_c1_dbc4_return_output,
 tmp16_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output,
 t16_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output,
 n16_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1714_c11_0ea7_return_output,
 tmp16_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output,
 t16_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output,
 n16_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1717_c11_f850_return_output,
 tmp16_MUX_uxn_opcodes_h_l1717_c7_d246_return_output,
 t16_MUX_uxn_opcodes_h_l1717_c7_d246_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d246_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d246_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d246_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d246_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d246_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d246_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d246_return_output,
 n16_MUX_uxn_opcodes_h_l1717_c7_d246_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1722_c11_4660_return_output,
 tmp16_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output,
 t16_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output,
 n16_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1725_c11_5b2d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output,
 t16_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output,
 n16_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1726_c3_69fb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1729_c11_bf11_return_output,
 tmp16_MUX_uxn_opcodes_h_l1729_c7_1972_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1972_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1972_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1972_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1972_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1972_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1972_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1729_c7_1972_return_output,
 n16_MUX_uxn_opcodes_h_l1729_c7_1972_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1732_c11_2738_return_output,
 tmp16_MUX_uxn_opcodes_h_l1732_c7_598c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_598c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1732_c7_598c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_598c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_598c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_598c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_598c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1732_c7_598c_return_output,
 n16_MUX_uxn_opcodes_h_l1732_c7_598c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1737_c11_8644_return_output,
 tmp16_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output,
 n16_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1740_c11_489b_return_output,
 tmp16_MUX_uxn_opcodes_h_l1740_c7_f869_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_f869_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1740_c7_f869_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c7_f869_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_f869_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_f869_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_f869_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1740_c7_f869_return_output,
 n16_MUX_uxn_opcodes_h_l1740_c7_f869_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1741_c3_0915_return_output,
 BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1742_c11_6625_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1745_c32_0540_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1745_c32_6f4b_return_output,
 MUX_uxn_opcodes_h_l1745_c32_4b52_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1747_c11_83cf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_9174_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1747_c7_9174_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_9174_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_9174_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_9174_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1753_c11_881c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_33b1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1753_c7_33b1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_33b1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1753_c7_33b1_return_output,
 CONST_SR_8_uxn_opcodes_h_l1755_c34_e17b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1757_c11_d849_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_157d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_157d_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1719_l1734_DUPLICATE_fa73_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1708_c6_75c5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1708_c6_75c5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1708_c6_75c5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1708_c1_dbc4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1708_c1_dbc4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1708_c1_dbc4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1708_c1_dbc4_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1708_c2_52f6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1708_c2_52f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1708_c2_52f6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1708_c2_52f6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1708_c2_52f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1708_c2_52f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1708_c2_52f6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1711_c3_d093 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1708_c2_52f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1708_c2_52f6_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1708_c2_52f6_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1709_c3_50c8_uxn_opcodes_h_l1709_c3_50c8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_0ea7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_0ea7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_0ea7_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1717_c7_d246_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1717_c7_d246_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d246_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d246_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d246_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d246_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d246_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1715_c3_9410 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d246_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d246_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1717_c7_d246_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_f850_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_f850_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_f850_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1717_c7_d246_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1717_c7_d246_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d246_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d246_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d246_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d246_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d246_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1720_c3_83af : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d246_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d246_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1717_c7_d246_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c11_4660_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c11_4660_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c11_4660_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1723_c3_8615 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1725_c11_5b2d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1725_c11_5b2d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1725_c11_5b2d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1729_c7_1972_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1725_c7_01ed_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1725_c7_01ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1972_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_01ed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1972_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1725_c7_01ed_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1972_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_01ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1972_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_01ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1972_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_01ed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1727_c3_6848 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1972_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_01ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1729_c7_1972_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_01ed_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1729_c7_1972_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1725_c7_01ed_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1726_c3_69fb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1726_c3_69fb_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1726_c3_69fb_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c11_bf11_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c11_bf11_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c11_bf11_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1732_c7_598c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1729_c7_1972_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_598c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1972_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1732_c7_598c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1972_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_598c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1972_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_598c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1972_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_598c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1972_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1730_c3_09ef : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_598c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1972_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1732_c7_598c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1729_c7_1972_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1732_c7_598c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1729_c7_1972_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1732_c11_2738_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1732_c11_2738_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1732_c11_2738_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1732_c7_598c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_598c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1732_c7_598c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_598c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_598c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_598c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1735_c3_b8b5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_598c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1732_c7_598c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1732_c7_598c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_8644_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_8644_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_8644_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1740_c7_f869_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1737_c7_c0db_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_f869_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_c0db_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1740_c7_f869_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1737_c7_c0db_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c7_f869_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_c0db_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_f869_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_c0db_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_f869_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_c0db_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1738_c3_dd3e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_f869_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_c0db_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1740_c7_f869_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1737_c7_c0db_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1740_c7_f869_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1737_c7_c0db_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c11_489b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c11_489b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c11_489b_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l1742_c3_f900 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1740_c7_f869_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_9174_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_f869_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1747_c7_9174_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1740_c7_f869_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c7_f869_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_9174_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_f869_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_9174_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_f869_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_9174_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_f869_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1740_c7_f869_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1740_c7_f869_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1741_c3_0915_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1741_c3_0915_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1741_c3_0915_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1742_c11_6625_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1742_c11_6625_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1742_c11_6625_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1745_c32_4b52_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1745_c32_4b52_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1745_c32_4b52_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1745_c32_0540_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1745_c32_0540_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1745_c32_0540_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1745_c32_6f4b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1745_c32_6f4b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1745_c32_6f4b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1745_c32_4b52_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_83cf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_83cf_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_83cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_9174_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_9174_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_9174_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1747_c7_9174_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1747_c7_9174_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1753_c7_33b1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1747_c7_9174_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_9174_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_9174_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_33b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_9174_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_9174_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_9174_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1753_c7_33b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_9174_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_9174_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1750_c3_7757 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_9174_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_33b1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_9174_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1751_c24_5e00_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_881c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_881c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_881c_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_33b1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1754_c3_7d97 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_33b1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_33b1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1753_c7_33b1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1753_c7_33b1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1753_c7_33b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_33b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_33b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_157d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_33b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1753_c7_33b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1753_c7_33b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_157d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1753_c7_33b1_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1755_c34_e17b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1755_c34_e17b_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1755_c24_7c0d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c11_d849_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c11_d849_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c11_d849_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_157d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_157d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_157d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_157d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_157d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_157d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1732_l1729_l1725_l1722_l1747_l1717_l1714_l1737_l1708_DUPLICATE_4abb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1732_l1729_l1725_l1753_l1722_l1717_l1740_l1714_l1737_l1708_DUPLICATE_3c80_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1732_l1729_l1725_l1722_l1717_l1740_l1714_l1737_l1708_DUPLICATE_4dc7_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1732_l1729_l1757_l1725_l1753_l1722_l1717_l1740_l1714_l1737_l1708_DUPLICATE_2d3a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1732_l1729_l1757_l1725_l1753_l1722_l1747_l1717_l1740_l1714_l1737_DUPLICATE_6ffa_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1732_l1729_l1725_l1722_l1717_l1740_l1714_l1737_DUPLICATE_99d2_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1718_l1733_l1726_l1741_DUPLICATE_8e65_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1719_l1734_DUPLICATE_fa73_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1719_l1734_DUPLICATE_fa73_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1753_l1740_DUPLICATE_82ca_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1704_l1762_DUPLICATE_a969_return_output : opcode_result_t;
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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1708_c1_dbc4_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1725_c11_5b2d_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1732_c11_2738_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_83cf_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1708_c6_75c5_right := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1745_c32_6f4b_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c11_d849_right := to_unsigned(11, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1730_c3_09ef := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1730_c3_09ef;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_9174_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1754_c3_7d97 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_33b1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1754_c3_7d97;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1738_c3_dd3e := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1738_c3_dd3e;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1711_c3_d093 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1711_c3_d093;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c11_489b_right := to_unsigned(8, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_8644_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1715_c3_9410 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1715_c3_9410;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1720_c3_83af := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1720_c3_83af;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c11_4660_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1723_c3_8615 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1723_c3_8615;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_157d_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_157d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_0ea7_right := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1745_c32_0540_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c11_bf11_right := to_unsigned(5, 3);
     VAR_MUX_uxn_opcodes_h_l1745_c32_4b52_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_f850_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1735_c3_b8b5 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1735_c3_b8b5;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1750_c3_7757 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_9174_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1750_c3_7757;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_881c_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1727_c3_6848 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1727_c3_6848;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_9174_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1745_c32_4b52_iffalse := resize(to_signed(-2, 3), 8);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1708_c1_dbc4_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1745_c32_0540_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1741_c3_0915_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1708_c6_75c5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_0ea7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_f850_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c11_4660_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1725_c11_5b2d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c11_bf11_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1732_c11_2738_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_8644_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c11_489b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_83cf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_881c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c11_d849_left := VAR_phase;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1742_c11_6625_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1726_c3_69fb_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1755_c34_e17b_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1732_l1729_l1725_l1722_l1717_l1740_l1714_l1737_DUPLICATE_99d2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1732_l1729_l1725_l1722_l1717_l1740_l1714_l1737_DUPLICATE_99d2_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1740_c11_489b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1740_c11_489b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c11_489b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1740_c11_489b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c11_489b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c11_489b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1740_c11_489b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1751_c24_5e00] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1751_c24_5e00_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1757_c11_d849] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1757_c11_d849_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c11_d849_left;
     BIN_OP_EQ_uxn_opcodes_h_l1757_c11_d849_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c11_d849_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c11_d849_return_output := BIN_OP_EQ_uxn_opcodes_h_l1757_c11_d849_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1753_l1740_DUPLICATE_82ca LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1753_l1740_DUPLICATE_82ca_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1747_c11_83cf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1747_c11_83cf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_83cf_left;
     BIN_OP_EQ_uxn_opcodes_h_l1747_c11_83cf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_83cf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_83cf_return_output := BIN_OP_EQ_uxn_opcodes_h_l1747_c11_83cf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1753_c11_881c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1753_c11_881c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_881c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1753_c11_881c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_881c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_881c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1753_c11_881c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1722_c11_4660] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1722_c11_4660_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c11_4660_left;
     BIN_OP_EQ_uxn_opcodes_h_l1722_c11_4660_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c11_4660_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c11_4660_return_output := BIN_OP_EQ_uxn_opcodes_h_l1722_c11_4660_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1745_c32_0540] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1745_c32_0540_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1745_c32_0540_left;
     BIN_OP_AND_uxn_opcodes_h_l1745_c32_0540_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1745_c32_0540_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1745_c32_0540_return_output := BIN_OP_AND_uxn_opcodes_h_l1745_c32_0540_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1732_c11_2738] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1732_c11_2738_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1732_c11_2738_left;
     BIN_OP_EQ_uxn_opcodes_h_l1732_c11_2738_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1732_c11_2738_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1732_c11_2738_return_output := BIN_OP_EQ_uxn_opcodes_h_l1732_c11_2738_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1732_l1729_l1757_l1725_l1753_l1722_l1747_l1717_l1740_l1714_l1737_DUPLICATE_6ffa LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1732_l1729_l1757_l1725_l1753_l1722_l1747_l1717_l1740_l1714_l1737_DUPLICATE_6ffa_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1708_c6_75c5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1708_c6_75c5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1708_c6_75c5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1708_c6_75c5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1708_c6_75c5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1708_c6_75c5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1708_c6_75c5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1725_c11_5b2d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1725_c11_5b2d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1725_c11_5b2d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1725_c11_5b2d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1725_c11_5b2d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1725_c11_5b2d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1725_c11_5b2d_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1718_l1733_l1726_l1741_DUPLICATE_8e65 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1718_l1733_l1726_l1741_DUPLICATE_8e65_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1729_c11_bf11] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1729_c11_bf11_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c11_bf11_left;
     BIN_OP_EQ_uxn_opcodes_h_l1729_c11_bf11_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c11_bf11_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c11_bf11_return_output := BIN_OP_EQ_uxn_opcodes_h_l1729_c11_bf11_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1732_l1729_l1725_l1722_l1747_l1717_l1714_l1737_l1708_DUPLICATE_4abb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1732_l1729_l1725_l1722_l1747_l1717_l1714_l1737_l1708_DUPLICATE_4abb_return_output := result.is_sp_shift;

     -- CONST_SR_8[uxn_opcodes_h_l1755_c34_e17b] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1755_c34_e17b_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1755_c34_e17b_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1755_c34_e17b_return_output := CONST_SR_8_uxn_opcodes_h_l1755_c34_e17b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1717_c11_f850] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1717_c11_f850_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_f850_left;
     BIN_OP_EQ_uxn_opcodes_h_l1717_c11_f850_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_f850_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_f850_return_output := BIN_OP_EQ_uxn_opcodes_h_l1717_c11_f850_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1732_l1729_l1757_l1725_l1753_l1722_l1717_l1740_l1714_l1737_l1708_DUPLICATE_2d3a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1732_l1729_l1757_l1725_l1753_l1722_l1717_l1740_l1714_l1737_l1708_DUPLICATE_2d3a_return_output := result.is_stack_write;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1732_l1729_l1725_l1722_l1717_l1740_l1714_l1737_l1708_DUPLICATE_4dc7 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1732_l1729_l1725_l1722_l1717_l1740_l1714_l1737_l1708_DUPLICATE_4dc7_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1714_c11_0ea7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1714_c11_0ea7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_0ea7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1714_c11_0ea7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_0ea7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_0ea7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1714_c11_0ea7_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1732_l1729_l1725_l1753_l1722_l1717_l1740_l1714_l1737_l1708_DUPLICATE_3c80 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1732_l1729_l1725_l1753_l1722_l1717_l1740_l1714_l1737_l1708_DUPLICATE_3c80_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1737_c11_8644] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1737_c11_8644_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_8644_left;
     BIN_OP_EQ_uxn_opcodes_h_l1737_c11_8644_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_8644_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_8644_return_output := BIN_OP_EQ_uxn_opcodes_h_l1737_c11_8644_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1745_c32_6f4b_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1745_c32_0540_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1708_c1_dbc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1708_c6_75c5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1708_c2_52f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1708_c6_75c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1708_c2_52f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1708_c6_75c5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1708_c2_52f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1708_c6_75c5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1708_c2_52f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1708_c6_75c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1708_c2_52f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1708_c6_75c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1708_c2_52f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1708_c6_75c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1708_c2_52f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1708_c6_75c5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1708_c2_52f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1708_c6_75c5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1708_c2_52f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1708_c6_75c5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1708_c2_52f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1708_c6_75c5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_0ea7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_0ea7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_0ea7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_0ea7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_0ea7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_0ea7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_0ea7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_0ea7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_0ea7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_0ea7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1717_c7_d246_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_f850_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d246_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_f850_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d246_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_f850_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d246_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_f850_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d246_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_f850_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d246_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_f850_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d246_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_f850_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d246_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_f850_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1717_c7_d246_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_f850_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1717_c7_d246_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_f850_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c11_4660_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c11_4660_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c11_4660_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c11_4660_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c11_4660_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c11_4660_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c11_4660_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c11_4660_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c11_4660_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c11_4660_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1725_c7_01ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1725_c11_5b2d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_01ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1725_c11_5b2d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_01ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1725_c11_5b2d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_01ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1725_c11_5b2d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_01ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1725_c11_5b2d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_01ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1725_c11_5b2d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_01ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1725_c11_5b2d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1725_c7_01ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1725_c11_5b2d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1725_c7_01ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1725_c11_5b2d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1725_c7_01ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1725_c11_5b2d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1729_c7_1972_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c11_bf11_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1972_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c11_bf11_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1972_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c11_bf11_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1729_c7_1972_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c11_bf11_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1972_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c11_bf11_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1972_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c11_bf11_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1972_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c11_bf11_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1972_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c11_bf11_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1729_c7_1972_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c11_bf11_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1732_c7_598c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1732_c11_2738_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_598c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1732_c11_2738_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_598c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1732_c11_2738_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1732_c7_598c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1732_c11_2738_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_598c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1732_c11_2738_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_598c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1732_c11_2738_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_598c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1732_c11_2738_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1732_c7_598c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1732_c11_2738_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1732_c7_598c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1732_c11_2738_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1737_c7_c0db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_8644_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_c0db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_8644_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_c0db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_8644_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1737_c7_c0db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_8644_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_c0db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_8644_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_c0db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_8644_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_c0db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_8644_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1737_c7_c0db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_8644_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1737_c7_c0db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_8644_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1740_c7_f869_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c11_489b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_f869_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c11_489b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_f869_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c11_489b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1740_c7_f869_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c11_489b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_f869_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c11_489b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c7_f869_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c11_489b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_f869_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c11_489b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1740_c7_f869_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c11_489b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1740_c7_f869_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c11_489b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_9174_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_83cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_9174_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_83cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_9174_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_83cf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_9174_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_83cf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1747_c7_9174_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_83cf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_33b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_881c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1753_c7_33b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_881c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_33b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_881c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1753_c7_33b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_881c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_157d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c11_d849_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_157d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c11_d849_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1726_c3_69fb_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1718_l1733_l1726_l1741_DUPLICATE_8e65_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1741_c3_0915_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1718_l1733_l1726_l1741_DUPLICATE_8e65_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1719_l1734_DUPLICATE_fa73_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1718_l1733_l1726_l1741_DUPLICATE_8e65_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1747_c7_9174_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1751_c24_5e00_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1732_l1729_l1725_l1722_l1717_l1740_l1714_l1737_l1708_DUPLICATE_4dc7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1732_l1729_l1725_l1722_l1717_l1740_l1714_l1737_l1708_DUPLICATE_4dc7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1732_l1729_l1725_l1722_l1717_l1740_l1714_l1737_l1708_DUPLICATE_4dc7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1732_l1729_l1725_l1722_l1717_l1740_l1714_l1737_l1708_DUPLICATE_4dc7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1732_l1729_l1725_l1722_l1717_l1740_l1714_l1737_l1708_DUPLICATE_4dc7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1732_l1729_l1725_l1722_l1717_l1740_l1714_l1737_l1708_DUPLICATE_4dc7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1732_l1729_l1725_l1722_l1717_l1740_l1714_l1737_l1708_DUPLICATE_4dc7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1732_l1729_l1725_l1722_l1717_l1740_l1714_l1737_l1708_DUPLICATE_4dc7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1732_l1729_l1725_l1722_l1717_l1740_l1714_l1737_l1708_DUPLICATE_4dc7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1732_l1729_l1757_l1725_l1753_l1722_l1747_l1717_l1740_l1714_l1737_DUPLICATE_6ffa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1732_l1729_l1757_l1725_l1753_l1722_l1747_l1717_l1740_l1714_l1737_DUPLICATE_6ffa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1732_l1729_l1757_l1725_l1753_l1722_l1747_l1717_l1740_l1714_l1737_DUPLICATE_6ffa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1732_l1729_l1757_l1725_l1753_l1722_l1747_l1717_l1740_l1714_l1737_DUPLICATE_6ffa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1732_l1729_l1757_l1725_l1753_l1722_l1747_l1717_l1740_l1714_l1737_DUPLICATE_6ffa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1732_l1729_l1757_l1725_l1753_l1722_l1747_l1717_l1740_l1714_l1737_DUPLICATE_6ffa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1732_l1729_l1757_l1725_l1753_l1722_l1747_l1717_l1740_l1714_l1737_DUPLICATE_6ffa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1732_l1729_l1757_l1725_l1753_l1722_l1747_l1717_l1740_l1714_l1737_DUPLICATE_6ffa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_9174_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1732_l1729_l1757_l1725_l1753_l1722_l1747_l1717_l1740_l1714_l1737_DUPLICATE_6ffa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_33b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1732_l1729_l1757_l1725_l1753_l1722_l1747_l1717_l1740_l1714_l1737_DUPLICATE_6ffa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_157d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1732_l1729_l1757_l1725_l1753_l1722_l1747_l1717_l1740_l1714_l1737_DUPLICATE_6ffa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1732_l1729_l1725_l1722_l1747_l1717_l1714_l1737_l1708_DUPLICATE_4abb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1732_l1729_l1725_l1722_l1747_l1717_l1714_l1737_l1708_DUPLICATE_4abb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1732_l1729_l1725_l1722_l1747_l1717_l1714_l1737_l1708_DUPLICATE_4abb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1732_l1729_l1725_l1722_l1747_l1717_l1714_l1737_l1708_DUPLICATE_4abb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1732_l1729_l1725_l1722_l1747_l1717_l1714_l1737_l1708_DUPLICATE_4abb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1732_l1729_l1725_l1722_l1747_l1717_l1714_l1737_l1708_DUPLICATE_4abb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1732_l1729_l1725_l1722_l1747_l1717_l1714_l1737_l1708_DUPLICATE_4abb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1732_l1729_l1725_l1722_l1747_l1717_l1714_l1737_l1708_DUPLICATE_4abb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_9174_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1732_l1729_l1725_l1722_l1747_l1717_l1714_l1737_l1708_DUPLICATE_4abb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1732_l1729_l1725_l1722_l1717_l1740_l1714_l1737_DUPLICATE_99d2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1732_l1729_l1725_l1722_l1717_l1740_l1714_l1737_DUPLICATE_99d2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1732_l1729_l1725_l1722_l1717_l1740_l1714_l1737_DUPLICATE_99d2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1732_l1729_l1725_l1722_l1717_l1740_l1714_l1737_DUPLICATE_99d2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1732_l1729_l1725_l1722_l1717_l1740_l1714_l1737_DUPLICATE_99d2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1732_l1729_l1725_l1722_l1717_l1740_l1714_l1737_DUPLICATE_99d2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1732_l1729_l1725_l1722_l1717_l1740_l1714_l1737_DUPLICATE_99d2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1732_l1729_l1725_l1722_l1717_l1740_l1714_l1737_DUPLICATE_99d2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1732_l1729_l1757_l1725_l1753_l1722_l1717_l1740_l1714_l1737_l1708_DUPLICATE_2d3a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1732_l1729_l1757_l1725_l1753_l1722_l1717_l1740_l1714_l1737_l1708_DUPLICATE_2d3a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1732_l1729_l1757_l1725_l1753_l1722_l1717_l1740_l1714_l1737_l1708_DUPLICATE_2d3a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1732_l1729_l1757_l1725_l1753_l1722_l1717_l1740_l1714_l1737_l1708_DUPLICATE_2d3a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1732_l1729_l1757_l1725_l1753_l1722_l1717_l1740_l1714_l1737_l1708_DUPLICATE_2d3a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1732_l1729_l1757_l1725_l1753_l1722_l1717_l1740_l1714_l1737_l1708_DUPLICATE_2d3a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1732_l1729_l1757_l1725_l1753_l1722_l1717_l1740_l1714_l1737_l1708_DUPLICATE_2d3a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1732_l1729_l1757_l1725_l1753_l1722_l1717_l1740_l1714_l1737_l1708_DUPLICATE_2d3a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1732_l1729_l1757_l1725_l1753_l1722_l1717_l1740_l1714_l1737_l1708_DUPLICATE_2d3a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1753_c7_33b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1732_l1729_l1757_l1725_l1753_l1722_l1717_l1740_l1714_l1737_l1708_DUPLICATE_2d3a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_157d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1732_l1729_l1757_l1725_l1753_l1722_l1717_l1740_l1714_l1737_l1708_DUPLICATE_2d3a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1753_l1740_DUPLICATE_82ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_33b1_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1753_l1740_DUPLICATE_82ca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1732_l1729_l1725_l1753_l1722_l1717_l1740_l1714_l1737_l1708_DUPLICATE_3c80_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1732_l1729_l1725_l1753_l1722_l1717_l1740_l1714_l1737_l1708_DUPLICATE_3c80_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1732_l1729_l1725_l1753_l1722_l1717_l1740_l1714_l1737_l1708_DUPLICATE_3c80_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1732_l1729_l1725_l1753_l1722_l1717_l1740_l1714_l1737_l1708_DUPLICATE_3c80_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1732_l1729_l1725_l1753_l1722_l1717_l1740_l1714_l1737_l1708_DUPLICATE_3c80_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1732_l1729_l1725_l1753_l1722_l1717_l1740_l1714_l1737_l1708_DUPLICATE_3c80_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1732_l1729_l1725_l1753_l1722_l1717_l1740_l1714_l1737_l1708_DUPLICATE_3c80_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1732_l1729_l1725_l1753_l1722_l1717_l1740_l1714_l1737_l1708_DUPLICATE_3c80_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1732_l1729_l1725_l1753_l1722_l1717_l1740_l1714_l1737_l1708_DUPLICATE_3c80_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1753_c7_33b1_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1732_l1729_l1725_l1753_l1722_l1717_l1740_l1714_l1737_l1708_DUPLICATE_3c80_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1757_c7_157d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_157d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_157d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_157d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_157d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_157d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_157d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_157d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_157d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1757_c7_157d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_157d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_157d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_157d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_157d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_157d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_157d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_157d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_157d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1740_c7_f869] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1740_c7_f869_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1740_c7_f869_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1740_c7_f869_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1740_c7_f869_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1708_c1_dbc4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1708_c1_dbc4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1708_c1_dbc4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1708_c1_dbc4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1708_c1_dbc4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1708_c1_dbc4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1708_c1_dbc4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1708_c1_dbc4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1708_c1_dbc4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1747_c7_9174] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_9174_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_9174_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_9174_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_9174_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_9174_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_9174_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_9174_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_9174_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1719_l1734_DUPLICATE_fa73 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1719_l1734_DUPLICATE_fa73_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1719_l1734_DUPLICATE_fa73_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1719_l1734_DUPLICATE_fa73_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1719_l1734_DUPLICATE_fa73_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1745_c32_6f4b] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1745_c32_6f4b_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1745_c32_6f4b_left;
     BIN_OP_GT_uxn_opcodes_h_l1745_c32_6f4b_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1745_c32_6f4b_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1745_c32_6f4b_return_output := BIN_OP_GT_uxn_opcodes_h_l1745_c32_6f4b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1755_c24_7c0d] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1755_c24_7c0d_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1755_c34_e17b_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l1741_c3_0915] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1741_c3_0915_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1741_c3_0915_left;
     BIN_OP_OR_uxn_opcodes_h_l1741_c3_0915_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1741_c3_0915_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1741_c3_0915_return_output := BIN_OP_OR_uxn_opcodes_h_l1741_c3_0915_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1753_c7_33b1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_33b1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_33b1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_33b1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_33b1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_33b1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_33b1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_33b1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_33b1_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1726_c3_69fb] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1726_c3_69fb_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1726_c3_69fb_left;
     BIN_OP_OR_uxn_opcodes_h_l1726_c3_69fb_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1726_c3_69fb_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1726_c3_69fb_return_output := BIN_OP_OR_uxn_opcodes_h_l1726_c3_69fb_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1745_c32_4b52_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1745_c32_6f4b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1726_c3_69fb_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1742_c11_6625_right := VAR_BIN_OP_OR_uxn_opcodes_h_l1741_c3_0915_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1741_c3_0915_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1753_c7_33b1_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1755_c24_7c0d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1719_l1734_DUPLICATE_fa73_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1719_l1734_DUPLICATE_fa73_return_output;
     VAR_printf_uxn_opcodes_h_l1709_c3_50c8_uxn_opcodes_h_l1709_c3_50c8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1708_c1_dbc4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_33b1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_157d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1747_c7_9174_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1740_c7_f869_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1753_c7_33b1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_157d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_9174_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_33b1_return_output;
     -- printf_uxn_opcodes_h_l1709_c3_50c8[uxn_opcodes_h_l1709_c3_50c8] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1709_c3_50c8_uxn_opcodes_h_l1709_c3_50c8_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1709_c3_50c8_uxn_opcodes_h_l1709_c3_50c8_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n16_MUX[uxn_opcodes_h_l1740_c7_f869] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1740_c7_f869_cond <= VAR_n16_MUX_uxn_opcodes_h_l1740_c7_f869_cond;
     n16_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue;
     n16_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1740_c7_f869_return_output := n16_MUX_uxn_opcodes_h_l1740_c7_f869_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1740_c7_f869] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_f869_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_f869_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_f869_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_f869_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1747_c7_9174] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_9174_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_9174_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_9174_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_9174_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_9174_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_9174_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_9174_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_9174_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1753_c7_33b1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1753_c7_33b1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1753_c7_33b1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1753_c7_33b1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1753_c7_33b1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1753_c7_33b1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1753_c7_33b1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1753_c7_33b1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1753_c7_33b1_return_output;

     -- t16_MUX[uxn_opcodes_h_l1725_c7_01ed] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1725_c7_01ed_cond <= VAR_t16_MUX_uxn_opcodes_h_l1725_c7_01ed_cond;
     t16_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue;
     t16_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output := t16_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output;

     -- MUX[uxn_opcodes_h_l1745_c32_4b52] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1745_c32_4b52_cond <= VAR_MUX_uxn_opcodes_h_l1745_c32_4b52_cond;
     MUX_uxn_opcodes_h_l1745_c32_4b52_iftrue <= VAR_MUX_uxn_opcodes_h_l1745_c32_4b52_iftrue;
     MUX_uxn_opcodes_h_l1745_c32_4b52_iffalse <= VAR_MUX_uxn_opcodes_h_l1745_c32_4b52_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1745_c32_4b52_return_output := MUX_uxn_opcodes_h_l1745_c32_4b52_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1737_c7_c0db] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1737_c7_c0db_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1737_c7_c0db_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l1742_c11_6625] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1742_c11_6625_left <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1742_c11_6625_left;
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1742_c11_6625_right <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1742_c11_6625_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1742_c11_6625_return_output := BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1742_c11_6625_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1753_c7_33b1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1753_c7_33b1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1753_c7_33b1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1753_c7_33b1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1753_c7_33b1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1753_c7_33b1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1753_c7_33b1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1753_c7_33b1_return_output := result_stack_value_MUX_uxn_opcodes_h_l1753_c7_33b1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1753_c7_33b1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_33b1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_33b1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_33b1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_33b1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_33b1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_33b1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_33b1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_33b1_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l1742_c3_f900 := resize(VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1742_c11_6625_return_output, 16);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue := VAR_MUX_uxn_opcodes_h_l1745_c32_4b52_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1740_c7_f869_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_9174_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_33b1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_f869_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_9174_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1753_c7_33b1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_9174_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1747_c7_9174_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1753_c7_33b1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue := VAR_tmp16_uxn_opcodes_h_l1742_c3_f900;
     -- tmp16_MUX[uxn_opcodes_h_l1740_c7_f869] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1740_c7_f869_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1740_c7_f869_cond;
     tmp16_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1740_c7_f869_return_output := tmp16_MUX_uxn_opcodes_h_l1740_c7_f869_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1732_c7_598c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1732_c7_598c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1732_c7_598c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1732_c7_598c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1732_c7_598c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1740_c7_f869] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c7_f869_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c7_f869_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c7_f869_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c7_f869_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1740_c7_f869] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_f869_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_f869_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_f869_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_f869_return_output;

     -- n16_MUX[uxn_opcodes_h_l1737_c7_c0db] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1737_c7_c0db_cond <= VAR_n16_MUX_uxn_opcodes_h_l1737_c7_c0db_cond;
     n16_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue;
     n16_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output := n16_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1737_c7_c0db] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_c0db_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_c0db_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1747_c7_9174] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_9174_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_9174_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_9174_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_9174_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_9174_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_9174_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_9174_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_9174_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1747_c7_9174] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_9174_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_9174_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_9174_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_9174_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_9174_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_9174_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_9174_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_9174_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1747_c7_9174] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1747_c7_9174_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1747_c7_9174_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1747_c7_9174_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1747_c7_9174_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1747_c7_9174_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1747_c7_9174_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1747_c7_9174_return_output := result_stack_value_MUX_uxn_opcodes_h_l1747_c7_9174_return_output;

     -- t16_MUX[uxn_opcodes_h_l1722_c7_7fa9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond <= VAR_t16_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond;
     t16_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue;
     t16_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output := t16_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_9174_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1732_c7_598c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_9174_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c7_f869_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_f869_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1747_c7_9174_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1740_c7_f869_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1737_c7_c0db] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_c0db_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_c0db_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1729_c7_1972] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1729_c7_1972_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1729_c7_1972_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1729_c7_1972_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1729_c7_1972_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1737_c7_c0db] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1737_c7_c0db_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1737_c7_c0db_cond;
     tmp16_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output := tmp16_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output;

     -- t16_MUX[uxn_opcodes_h_l1717_c7_d246] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1717_c7_d246_cond <= VAR_t16_MUX_uxn_opcodes_h_l1717_c7_d246_cond;
     t16_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue;
     t16_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1717_c7_d246_return_output := t16_MUX_uxn_opcodes_h_l1717_c7_d246_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1740_c7_f869] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1740_c7_f869_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1740_c7_f869_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1740_c7_f869_return_output := result_stack_value_MUX_uxn_opcodes_h_l1740_c7_f869_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1732_c7_598c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_598c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_598c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_598c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_598c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1732_c7_598c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1732_c7_598c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1732_c7_598c_cond;
     n16_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue;
     n16_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1732_c7_598c_return_output := n16_MUX_uxn_opcodes_h_l1732_c7_598c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1740_c7_f869] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_f869_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_f869_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_f869_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_f869_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1737_c7_c0db] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_c0db_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_c0db_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1740_c7_f869] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_f869_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_f869_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_f869_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_f869_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_f869_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_f869_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1732_c7_598c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_f869_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_598c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1729_c7_1972_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_f869_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1740_c7_f869_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1717_c7_d246_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output;
     -- t16_MUX[uxn_opcodes_h_l1714_c7_2bcf] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond <= VAR_t16_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond;
     t16_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue;
     t16_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output := t16_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1732_c7_598c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_598c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_598c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_598c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_598c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1732_c7_598c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_598c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_598c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_598c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_598c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1725_c7_01ed] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_01ed_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_01ed_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1729_c7_1972] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1972_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1972_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1972_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1972_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1732_c7_598c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1732_c7_598c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1732_c7_598c_cond;
     tmp16_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1732_c7_598c_return_output := tmp16_MUX_uxn_opcodes_h_l1732_c7_598c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1737_c7_c0db] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1737_c7_c0db_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1737_c7_c0db_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output := result_stack_value_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output;

     -- n16_MUX[uxn_opcodes_h_l1729_c7_1972] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1729_c7_1972_cond <= VAR_n16_MUX_uxn_opcodes_h_l1729_c7_1972_cond;
     n16_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue;
     n16_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1729_c7_1972_return_output := n16_MUX_uxn_opcodes_h_l1729_c7_1972_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1737_c7_c0db] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_c0db_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_c0db_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1737_c7_c0db] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_c0db_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_c0db_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_c0db_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_c0db_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1729_c7_1972_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1972_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_598c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_598c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1737_c7_c0db_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1732_c7_598c_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1729_c7_1972] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1729_c7_1972_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1729_c7_1972_cond;
     tmp16_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1729_c7_1972_return_output := tmp16_MUX_uxn_opcodes_h_l1729_c7_1972_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1725_c7_01ed] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_01ed_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_01ed_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1722_c7_7fa9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1732_c7_598c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_598c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_598c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_598c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_598c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1725_c7_01ed] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1725_c7_01ed_cond <= VAR_n16_MUX_uxn_opcodes_h_l1725_c7_01ed_cond;
     n16_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue;
     n16_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output := n16_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1729_c7_1972] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1972_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1972_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1972_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1972_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1732_c7_598c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1732_c7_598c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1732_c7_598c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1732_c7_598c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1732_c7_598c_return_output;

     -- t16_MUX[uxn_opcodes_h_l1708_c2_52f6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1708_c2_52f6_cond <= VAR_t16_MUX_uxn_opcodes_h_l1708_c2_52f6_cond;
     t16_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue;
     t16_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output := t16_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1729_c7_1972] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1972_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1972_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1972_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1972_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1732_c7_598c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_598c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_598c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_598c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_598c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_598c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_598c_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_598c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_598c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1972_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1972_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1732_c7_598c_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1729_c7_1972_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1725_c7_01ed] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1725_c7_01ed_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1725_c7_01ed_cond;
     tmp16_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output := tmp16_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1729_c7_1972] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1972_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1972_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1972_return_output := result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1972_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1729_c7_1972] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1972_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1972_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1972_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1972_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1729_c7_1972] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1972_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1972_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1972_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1972_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1972_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1972_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1725_c7_01ed] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_01ed_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_01ed_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1725_c7_01ed] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_01ed_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_01ed_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1717_c7_d246] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d246_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d246_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d246_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d246_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1722_c7_7fa9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output;

     -- n16_MUX[uxn_opcodes_h_l1722_c7_7fa9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond <= VAR_n16_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond;
     n16_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue;
     n16_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output := n16_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1972_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1717_c7_d246_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1972_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1972_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1725_c7_01ed] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1725_c7_01ed_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1725_c7_01ed_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output := result_stack_value_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1722_c7_7fa9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1722_c7_7fa9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond;
     tmp16_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output := tmp16_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1722_c7_7fa9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1717_c7_d246] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d246_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d246_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d246_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d246_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1725_c7_01ed] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_01ed_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_01ed_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1714_c7_2bcf] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1725_c7_01ed] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_01ed_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_01ed_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_01ed_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_01ed_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output;

     -- n16_MUX[uxn_opcodes_h_l1717_c7_d246] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1717_c7_d246_cond <= VAR_n16_MUX_uxn_opcodes_h_l1717_c7_d246_cond;
     n16_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue;
     n16_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1717_c7_d246_return_output := n16_MUX_uxn_opcodes_h_l1717_c7_d246_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1717_c7_d246_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c7_d246_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1725_c7_01ed_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1717_c7_d246] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d246_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d246_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d246_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d246_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1717_c7_d246] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d246_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d246_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d246_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d246_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1717_c7_d246] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1717_c7_d246_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1717_c7_d246_cond;
     tmp16_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1717_c7_d246_return_output := tmp16_MUX_uxn_opcodes_h_l1717_c7_d246_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1722_c7_7fa9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1722_c7_7fa9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1722_c7_7fa9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1722_c7_7fa9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1722_c7_7fa9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1722_c7_7fa9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output := result_stack_value_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1708_c2_52f6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1708_c2_52f6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1708_c2_52f6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output;

     -- n16_MUX[uxn_opcodes_h_l1714_c7_2bcf] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond <= VAR_n16_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond;
     n16_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue;
     n16_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output := n16_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1714_c7_2bcf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_d246_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c7_d246_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1722_c7_7fa9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1717_c7_d246_return_output;
     -- n16_MUX[uxn_opcodes_h_l1708_c2_52f6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1708_c2_52f6_cond <= VAR_n16_MUX_uxn_opcodes_h_l1708_c2_52f6_cond;
     n16_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue;
     n16_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output := n16_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1714_c7_2bcf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1717_c7_d246] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d246_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d246_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d246_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d246_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1708_c2_52f6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1708_c2_52f6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1708_c2_52f6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1714_c7_2bcf] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond;
     tmp16_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output := tmp16_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1717_c7_d246] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d246_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d246_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d246_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d246_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1717_c7_d246] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d246_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d246_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d246_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d246_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d246_return_output := result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d246_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1714_c7_2bcf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_d246_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c7_d246_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1717_c7_d246_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1708_c2_52f6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1708_c2_52f6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1708_c2_52f6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1714_c7_2bcf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1714_c7_2bcf] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output := result_stack_value_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1714_c7_2bcf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_2bcf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_2bcf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_2bcf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1708_c2_52f6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1708_c2_52f6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1708_c2_52f6_cond;
     tmp16_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output := tmp16_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1708_c2_52f6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1708_c2_52f6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1708_c2_52f6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1714_c7_2bcf_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1708_c2_52f6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1708_c2_52f6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1708_c2_52f6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1708_c2_52f6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1708_c2_52f6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1708_c2_52f6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output := result_stack_value_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1708_c2_52f6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1708_c2_52f6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1708_c2_52f6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1708_c2_52f6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1708_c2_52f6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1704_l1762_DUPLICATE_a969 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1704_l1762_DUPLICATE_a969_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e56b(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1708_c2_52f6_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1704_l1762_DUPLICATE_a969_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1704_l1762_DUPLICATE_a969_return_output;
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
