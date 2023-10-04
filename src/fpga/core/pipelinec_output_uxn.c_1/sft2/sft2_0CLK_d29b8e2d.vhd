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
-- Submodules: 104
entity sft2_0CLK_d29b8e2d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sft2_0CLK_d29b8e2d;
architecture arch of sft2_0CLK_d29b8e2d is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1991_c6_d52b]
signal BIN_OP_EQ_uxn_opcodes_h_l1991_c6_d52b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1991_c6_d52b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1991_c6_d52b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1991_c1_6622]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1991_c1_6622_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1991_c1_6622_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1991_c1_6622_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1991_c1_6622_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1991_c2_ebf8]
signal tmp16_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1991_c2_ebf8]
signal t8_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1991_c2_ebf8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1991_c2_ebf8]
signal result_stack_value_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1991_c2_ebf8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1991_c2_ebf8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1991_c2_ebf8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1991_c2_ebf8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1991_c2_ebf8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1991_c2_ebf8]
signal n16_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1992_c3_b7de[uxn_opcodes_h_l1992_c3_b7de]
signal printf_uxn_opcodes_h_l1992_c3_b7de_uxn_opcodes_h_l1992_c3_b7de_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1997_c11_f137]
signal BIN_OP_EQ_uxn_opcodes_h_l1997_c11_f137_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1997_c11_f137_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1997_c11_f137_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1997_c7_a02f]
signal tmp16_MUX_uxn_opcodes_h_l1997_c7_a02f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1997_c7_a02f]
signal t8_MUX_uxn_opcodes_h_l1997_c7_a02f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1997_c7_a02f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_a02f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1997_c7_a02f]
signal result_stack_value_MUX_uxn_opcodes_h_l1997_c7_a02f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1997_c7_a02f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_a02f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1997_c7_a02f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_a02f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1997_c7_a02f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_a02f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1997_c7_a02f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_a02f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1997_c7_a02f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1997_c7_a02f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1997_c7_a02f]
signal n16_MUX_uxn_opcodes_h_l1997_c7_a02f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2000_c11_b1c0]
signal BIN_OP_EQ_uxn_opcodes_h_l2000_c11_b1c0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2000_c11_b1c0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2000_c11_b1c0_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2000_c7_f480]
signal tmp16_MUX_uxn_opcodes_h_l2000_c7_f480_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2000_c7_f480_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l2000_c7_f480]
signal t8_MUX_uxn_opcodes_h_l2000_c7_f480_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2000_c7_f480_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2000_c7_f480]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2000_c7_f480_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2000_c7_f480_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2000_c7_f480]
signal result_stack_value_MUX_uxn_opcodes_h_l2000_c7_f480_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2000_c7_f480_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2000_c7_f480]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2000_c7_f480_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2000_c7_f480_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2000_c7_f480]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2000_c7_f480_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2000_c7_f480_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2000_c7_f480]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2000_c7_f480_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2000_c7_f480_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2000_c7_f480]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2000_c7_f480_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2000_c7_f480_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2000_c7_f480]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2000_c7_f480_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2000_c7_f480_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2000_c7_f480]
signal n16_MUX_uxn_opcodes_h_l2000_c7_f480_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2000_c7_f480_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2004_c11_66a8]
signal BIN_OP_EQ_uxn_opcodes_h_l2004_c11_66a8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2004_c11_66a8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2004_c11_66a8_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2004_c7_4fe2]
signal tmp16_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2004_c7_4fe2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2004_c7_4fe2]
signal result_stack_value_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2004_c7_4fe2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2004_c7_4fe2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2004_c7_4fe2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2004_c7_4fe2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2004_c7_4fe2]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2004_c7_4fe2]
signal n16_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2007_c11_a742]
signal BIN_OP_EQ_uxn_opcodes_h_l2007_c11_a742_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2007_c11_a742_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2007_c11_a742_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2007_c7_bf5c]
signal tmp16_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2007_c7_bf5c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2007_c7_bf5c]
signal result_stack_value_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2007_c7_bf5c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2007_c7_bf5c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2007_c7_bf5c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2007_c7_bf5c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2007_c7_bf5c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2007_c7_bf5c]
signal n16_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2009_c3_b156]
signal CONST_SL_8_uxn_opcodes_h_l2009_c3_b156_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2009_c3_b156_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2012_c11_77c3]
signal BIN_OP_EQ_uxn_opcodes_h_l2012_c11_77c3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2012_c11_77c3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2012_c11_77c3_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2012_c7_254f]
signal tmp16_MUX_uxn_opcodes_h_l2012_c7_254f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2012_c7_254f_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2012_c7_254f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_254f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_254f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2012_c7_254f]
signal result_stack_value_MUX_uxn_opcodes_h_l2012_c7_254f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2012_c7_254f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2012_c7_254f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_254f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_254f_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2012_c7_254f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_254f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_254f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2012_c7_254f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_254f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_254f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2012_c7_254f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_254f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_254f_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2012_c7_254f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_254f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_254f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2012_c7_254f]
signal n16_MUX_uxn_opcodes_h_l2012_c7_254f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2012_c7_254f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2015_c11_606f]
signal BIN_OP_EQ_uxn_opcodes_h_l2015_c11_606f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2015_c11_606f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2015_c11_606f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2015_c7_cedb]
signal tmp16_MUX_uxn_opcodes_h_l2015_c7_cedb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2015_c7_cedb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_cedb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2015_c7_cedb]
signal result_stack_value_MUX_uxn_opcodes_h_l2015_c7_cedb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2015_c7_cedb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2015_c7_cedb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2015_c7_cedb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_cedb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2015_c7_cedb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_cedb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2015_c7_cedb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_cedb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2015_c7_cedb]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2015_c7_cedb_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2015_c7_cedb]
signal n16_MUX_uxn_opcodes_h_l2015_c7_cedb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2016_c3_c9b3]
signal BIN_OP_OR_uxn_opcodes_h_l2016_c3_c9b3_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2016_c3_c9b3_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2016_c3_c9b3_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2019_c32_9977]
signal BIN_OP_AND_uxn_opcodes_h_l2019_c32_9977_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2019_c32_9977_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2019_c32_9977_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2019_c32_a916]
signal BIN_OP_GT_uxn_opcodes_h_l2019_c32_a916_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2019_c32_a916_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2019_c32_a916_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2019_c32_057d]
signal MUX_uxn_opcodes_h_l2019_c32_057d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2019_c32_057d_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2019_c32_057d_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2019_c32_057d_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2021_c11_1249]
signal BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1249_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1249_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1249_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2021_c7_0f99]
signal tmp16_MUX_uxn_opcodes_h_l2021_c7_0f99_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2021_c7_0f99_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2021_c7_0f99_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2021_c7_0f99_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2021_c7_0f99]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_0f99_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_0f99_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_0f99_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_0f99_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2021_c7_0f99]
signal result_stack_value_MUX_uxn_opcodes_h_l2021_c7_0f99_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2021_c7_0f99_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2021_c7_0f99_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2021_c7_0f99_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2021_c7_0f99]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_0f99_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_0f99_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_0f99_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_0f99_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2021_c7_0f99]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_0f99_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_0f99_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_0f99_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_0f99_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2021_c7_0f99]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_0f99_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_0f99_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_0f99_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_0f99_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2022_c20_162f]
signal BIN_OP_AND_uxn_opcodes_h_l2022_c20_162f_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2022_c20_162f_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2022_c20_162f_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l2022_c12_d9c7]
signal BIN_OP_SR_uxn_opcodes_h_l2022_c12_d9c7_left : unsigned(15 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2022_c12_d9c7_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2022_c12_d9c7_return_output : unsigned(15 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l2022_c36_bd0b]
signal CONST_SR_4_uxn_opcodes_h_l2022_c36_bd0b_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l2022_c36_bd0b_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l2022_c12_efbb]
signal BIN_OP_SL_uxn_opcodes_h_l2022_c12_efbb_left : unsigned(15 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2022_c12_efbb_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2022_c12_efbb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2028_c11_5d93]
signal BIN_OP_EQ_uxn_opcodes_h_l2028_c11_5d93_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2028_c11_5d93_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2028_c11_5d93_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2028_c7_32ae]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2028_c7_32ae_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2028_c7_32ae_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2028_c7_32ae_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2028_c7_32ae_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2028_c7_32ae]
signal result_stack_value_MUX_uxn_opcodes_h_l2028_c7_32ae_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2028_c7_32ae_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2028_c7_32ae_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2028_c7_32ae_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2028_c7_32ae]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2028_c7_32ae_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2028_c7_32ae_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2028_c7_32ae_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2028_c7_32ae_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2028_c7_32ae]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2028_c7_32ae_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2028_c7_32ae_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2028_c7_32ae_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2028_c7_32ae_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2030_c34_f932]
signal CONST_SR_8_uxn_opcodes_h_l2030_c34_f932_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2030_c34_f932_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2032_c11_abbf]
signal BIN_OP_EQ_uxn_opcodes_h_l2032_c11_abbf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2032_c11_abbf_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2032_c11_abbf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2032_c7_549d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_549d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_549d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_549d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_549d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2032_c7_549d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_549d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_549d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_549d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_549d_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1991_c6_d52b
BIN_OP_EQ_uxn_opcodes_h_l1991_c6_d52b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1991_c6_d52b_left,
BIN_OP_EQ_uxn_opcodes_h_l1991_c6_d52b_right,
BIN_OP_EQ_uxn_opcodes_h_l1991_c6_d52b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1991_c1_6622
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1991_c1_6622 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1991_c1_6622_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1991_c1_6622_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1991_c1_6622_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1991_c1_6622_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1991_c2_ebf8
tmp16_MUX_uxn_opcodes_h_l1991_c2_ebf8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond,
tmp16_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue,
tmp16_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse,
tmp16_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output);

-- t8_MUX_uxn_opcodes_h_l1991_c2_ebf8
t8_MUX_uxn_opcodes_h_l1991_c2_ebf8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond,
t8_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue,
t8_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse,
t8_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8
result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1991_c2_ebf8
result_stack_value_MUX_uxn_opcodes_h_l1991_c2_ebf8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond,
result_stack_value_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1991_c2_ebf8
result_is_stack_write_MUX_uxn_opcodes_h_l1991_c2_ebf8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1991_c2_ebf8
result_is_opc_done_MUX_uxn_opcodes_h_l1991_c2_ebf8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c2_ebf8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c2_ebf8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1991_c2_ebf8
result_is_stack_read_MUX_uxn_opcodes_h_l1991_c2_ebf8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output);

-- n16_MUX_uxn_opcodes_h_l1991_c2_ebf8
n16_MUX_uxn_opcodes_h_l1991_c2_ebf8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond,
n16_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue,
n16_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse,
n16_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output);

-- printf_uxn_opcodes_h_l1992_c3_b7de_uxn_opcodes_h_l1992_c3_b7de
printf_uxn_opcodes_h_l1992_c3_b7de_uxn_opcodes_h_l1992_c3_b7de : entity work.printf_uxn_opcodes_h_l1992_c3_b7de_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1992_c3_b7de_uxn_opcodes_h_l1992_c3_b7de_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1997_c11_f137
BIN_OP_EQ_uxn_opcodes_h_l1997_c11_f137 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1997_c11_f137_left,
BIN_OP_EQ_uxn_opcodes_h_l1997_c11_f137_right,
BIN_OP_EQ_uxn_opcodes_h_l1997_c11_f137_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1997_c7_a02f
tmp16_MUX_uxn_opcodes_h_l1997_c7_a02f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1997_c7_a02f_cond,
tmp16_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output);

-- t8_MUX_uxn_opcodes_h_l1997_c7_a02f
t8_MUX_uxn_opcodes_h_l1997_c7_a02f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1997_c7_a02f_cond,
t8_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue,
t8_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse,
t8_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_a02f
result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_a02f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_a02f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1997_c7_a02f
result_stack_value_MUX_uxn_opcodes_h_l1997_c7_a02f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1997_c7_a02f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_a02f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_a02f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_a02f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_a02f
result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_a02f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_a02f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_a02f
result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_a02f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_a02f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_a02f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_a02f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_a02f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1997_c7_a02f
result_is_stack_read_MUX_uxn_opcodes_h_l1997_c7_a02f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1997_c7_a02f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output);

-- n16_MUX_uxn_opcodes_h_l1997_c7_a02f
n16_MUX_uxn_opcodes_h_l1997_c7_a02f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1997_c7_a02f_cond,
n16_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue,
n16_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse,
n16_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2000_c11_b1c0
BIN_OP_EQ_uxn_opcodes_h_l2000_c11_b1c0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2000_c11_b1c0_left,
BIN_OP_EQ_uxn_opcodes_h_l2000_c11_b1c0_right,
BIN_OP_EQ_uxn_opcodes_h_l2000_c11_b1c0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2000_c7_f480
tmp16_MUX_uxn_opcodes_h_l2000_c7_f480 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2000_c7_f480_cond,
tmp16_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue,
tmp16_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse,
tmp16_MUX_uxn_opcodes_h_l2000_c7_f480_return_output);

-- t8_MUX_uxn_opcodes_h_l2000_c7_f480
t8_MUX_uxn_opcodes_h_l2000_c7_f480 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2000_c7_f480_cond,
t8_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue,
t8_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse,
t8_MUX_uxn_opcodes_h_l2000_c7_f480_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2000_c7_f480
result_is_sp_shift_MUX_uxn_opcodes_h_l2000_c7_f480 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2000_c7_f480_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2000_c7_f480_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2000_c7_f480
result_stack_value_MUX_uxn_opcodes_h_l2000_c7_f480 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2000_c7_f480_cond,
result_stack_value_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2000_c7_f480_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2000_c7_f480
result_sp_relative_shift_MUX_uxn_opcodes_h_l2000_c7_f480 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2000_c7_f480_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2000_c7_f480_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2000_c7_f480
result_is_stack_write_MUX_uxn_opcodes_h_l2000_c7_f480 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2000_c7_f480_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2000_c7_f480_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2000_c7_f480
result_is_opc_done_MUX_uxn_opcodes_h_l2000_c7_f480 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2000_c7_f480_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2000_c7_f480_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2000_c7_f480
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2000_c7_f480 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2000_c7_f480_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2000_c7_f480_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2000_c7_f480
result_is_stack_read_MUX_uxn_opcodes_h_l2000_c7_f480 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2000_c7_f480_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2000_c7_f480_return_output);

-- n16_MUX_uxn_opcodes_h_l2000_c7_f480
n16_MUX_uxn_opcodes_h_l2000_c7_f480 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2000_c7_f480_cond,
n16_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue,
n16_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse,
n16_MUX_uxn_opcodes_h_l2000_c7_f480_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2004_c11_66a8
BIN_OP_EQ_uxn_opcodes_h_l2004_c11_66a8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2004_c11_66a8_left,
BIN_OP_EQ_uxn_opcodes_h_l2004_c11_66a8_right,
BIN_OP_EQ_uxn_opcodes_h_l2004_c11_66a8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2004_c7_4fe2
tmp16_MUX_uxn_opcodes_h_l2004_c7_4fe2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond,
tmp16_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue,
tmp16_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse,
tmp16_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2
result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2004_c7_4fe2
result_stack_value_MUX_uxn_opcodes_h_l2004_c7_4fe2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond,
result_stack_value_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_4fe2
result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_4fe2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_4fe2
result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_4fe2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_4fe2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_4fe2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_4fe2
result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_4fe2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output);

-- n16_MUX_uxn_opcodes_h_l2004_c7_4fe2
n16_MUX_uxn_opcodes_h_l2004_c7_4fe2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond,
n16_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue,
n16_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse,
n16_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2007_c11_a742
BIN_OP_EQ_uxn_opcodes_h_l2007_c11_a742 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2007_c11_a742_left,
BIN_OP_EQ_uxn_opcodes_h_l2007_c11_a742_right,
BIN_OP_EQ_uxn_opcodes_h_l2007_c11_a742_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2007_c7_bf5c
tmp16_MUX_uxn_opcodes_h_l2007_c7_bf5c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond,
tmp16_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue,
tmp16_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse,
tmp16_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c
result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2007_c7_bf5c
result_stack_value_MUX_uxn_opcodes_h_l2007_c7_bf5c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond,
result_stack_value_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_bf5c
result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_bf5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_bf5c
result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_bf5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_bf5c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_bf5c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_bf5c
result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_bf5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output);

-- n16_MUX_uxn_opcodes_h_l2007_c7_bf5c
n16_MUX_uxn_opcodes_h_l2007_c7_bf5c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond,
n16_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue,
n16_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse,
n16_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2009_c3_b156
CONST_SL_8_uxn_opcodes_h_l2009_c3_b156 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2009_c3_b156_x,
CONST_SL_8_uxn_opcodes_h_l2009_c3_b156_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2012_c11_77c3
BIN_OP_EQ_uxn_opcodes_h_l2012_c11_77c3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2012_c11_77c3_left,
BIN_OP_EQ_uxn_opcodes_h_l2012_c11_77c3_right,
BIN_OP_EQ_uxn_opcodes_h_l2012_c11_77c3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2012_c7_254f
tmp16_MUX_uxn_opcodes_h_l2012_c7_254f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2012_c7_254f_cond,
tmp16_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue,
tmp16_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse,
tmp16_MUX_uxn_opcodes_h_l2012_c7_254f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_254f
result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_254f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_254f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_254f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2012_c7_254f
result_stack_value_MUX_uxn_opcodes_h_l2012_c7_254f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2012_c7_254f_cond,
result_stack_value_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2012_c7_254f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_254f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_254f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_254f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_254f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_254f
result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_254f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_254f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_254f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_254f
result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_254f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_254f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_254f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_254f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_254f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_254f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_254f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_254f
result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_254f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_254f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_254f_return_output);

-- n16_MUX_uxn_opcodes_h_l2012_c7_254f
n16_MUX_uxn_opcodes_h_l2012_c7_254f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2012_c7_254f_cond,
n16_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue,
n16_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse,
n16_MUX_uxn_opcodes_h_l2012_c7_254f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2015_c11_606f
BIN_OP_EQ_uxn_opcodes_h_l2015_c11_606f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2015_c11_606f_left,
BIN_OP_EQ_uxn_opcodes_h_l2015_c11_606f_right,
BIN_OP_EQ_uxn_opcodes_h_l2015_c11_606f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2015_c7_cedb
tmp16_MUX_uxn_opcodes_h_l2015_c7_cedb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2015_c7_cedb_cond,
tmp16_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue,
tmp16_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse,
tmp16_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_cedb
result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_cedb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_cedb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2015_c7_cedb
result_stack_value_MUX_uxn_opcodes_h_l2015_c7_cedb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2015_c7_cedb_cond,
result_stack_value_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2015_c7_cedb
result_sp_relative_shift_MUX_uxn_opcodes_h_l2015_c7_cedb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2015_c7_cedb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_cedb
result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_cedb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_cedb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_cedb
result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_cedb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_cedb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_cedb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_cedb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_cedb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2015_c7_cedb
result_is_stack_read_MUX_uxn_opcodes_h_l2015_c7_cedb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2015_c7_cedb_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output);

-- n16_MUX_uxn_opcodes_h_l2015_c7_cedb
n16_MUX_uxn_opcodes_h_l2015_c7_cedb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2015_c7_cedb_cond,
n16_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue,
n16_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse,
n16_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2016_c3_c9b3
BIN_OP_OR_uxn_opcodes_h_l2016_c3_c9b3 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2016_c3_c9b3_left,
BIN_OP_OR_uxn_opcodes_h_l2016_c3_c9b3_right,
BIN_OP_OR_uxn_opcodes_h_l2016_c3_c9b3_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2019_c32_9977
BIN_OP_AND_uxn_opcodes_h_l2019_c32_9977 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2019_c32_9977_left,
BIN_OP_AND_uxn_opcodes_h_l2019_c32_9977_right,
BIN_OP_AND_uxn_opcodes_h_l2019_c32_9977_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2019_c32_a916
BIN_OP_GT_uxn_opcodes_h_l2019_c32_a916 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2019_c32_a916_left,
BIN_OP_GT_uxn_opcodes_h_l2019_c32_a916_right,
BIN_OP_GT_uxn_opcodes_h_l2019_c32_a916_return_output);

-- MUX_uxn_opcodes_h_l2019_c32_057d
MUX_uxn_opcodes_h_l2019_c32_057d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2019_c32_057d_cond,
MUX_uxn_opcodes_h_l2019_c32_057d_iftrue,
MUX_uxn_opcodes_h_l2019_c32_057d_iffalse,
MUX_uxn_opcodes_h_l2019_c32_057d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1249
BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1249 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1249_left,
BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1249_right,
BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1249_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2021_c7_0f99
tmp16_MUX_uxn_opcodes_h_l2021_c7_0f99 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2021_c7_0f99_cond,
tmp16_MUX_uxn_opcodes_h_l2021_c7_0f99_iftrue,
tmp16_MUX_uxn_opcodes_h_l2021_c7_0f99_iffalse,
tmp16_MUX_uxn_opcodes_h_l2021_c7_0f99_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_0f99
result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_0f99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_0f99_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_0f99_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_0f99_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_0f99_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2021_c7_0f99
result_stack_value_MUX_uxn_opcodes_h_l2021_c7_0f99 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2021_c7_0f99_cond,
result_stack_value_MUX_uxn_opcodes_h_l2021_c7_0f99_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2021_c7_0f99_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2021_c7_0f99_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_0f99
result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_0f99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_0f99_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_0f99_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_0f99_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_0f99_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_0f99
result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_0f99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_0f99_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_0f99_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_0f99_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_0f99_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_0f99
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_0f99 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_0f99_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_0f99_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_0f99_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_0f99_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2022_c20_162f
BIN_OP_AND_uxn_opcodes_h_l2022_c20_162f : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2022_c20_162f_left,
BIN_OP_AND_uxn_opcodes_h_l2022_c20_162f_right,
BIN_OP_AND_uxn_opcodes_h_l2022_c20_162f_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l2022_c12_d9c7
BIN_OP_SR_uxn_opcodes_h_l2022_c12_d9c7 : entity work.BIN_OP_SR_uint16_t_uint8_t_0CLK_295015b8 port map (
BIN_OP_SR_uxn_opcodes_h_l2022_c12_d9c7_left,
BIN_OP_SR_uxn_opcodes_h_l2022_c12_d9c7_right,
BIN_OP_SR_uxn_opcodes_h_l2022_c12_d9c7_return_output);

-- CONST_SR_4_uxn_opcodes_h_l2022_c36_bd0b
CONST_SR_4_uxn_opcodes_h_l2022_c36_bd0b : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l2022_c36_bd0b_x,
CONST_SR_4_uxn_opcodes_h_l2022_c36_bd0b_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l2022_c12_efbb
BIN_OP_SL_uxn_opcodes_h_l2022_c12_efbb : entity work.BIN_OP_SL_uint16_t_uint8_t_0CLK_b6546dec port map (
BIN_OP_SL_uxn_opcodes_h_l2022_c12_efbb_left,
BIN_OP_SL_uxn_opcodes_h_l2022_c12_efbb_right,
BIN_OP_SL_uxn_opcodes_h_l2022_c12_efbb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2028_c11_5d93
BIN_OP_EQ_uxn_opcodes_h_l2028_c11_5d93 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2028_c11_5d93_left,
BIN_OP_EQ_uxn_opcodes_h_l2028_c11_5d93_right,
BIN_OP_EQ_uxn_opcodes_h_l2028_c11_5d93_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2028_c7_32ae
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2028_c7_32ae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2028_c7_32ae_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2028_c7_32ae_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2028_c7_32ae_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2028_c7_32ae_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2028_c7_32ae
result_stack_value_MUX_uxn_opcodes_h_l2028_c7_32ae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2028_c7_32ae_cond,
result_stack_value_MUX_uxn_opcodes_h_l2028_c7_32ae_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2028_c7_32ae_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2028_c7_32ae_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2028_c7_32ae
result_is_opc_done_MUX_uxn_opcodes_h_l2028_c7_32ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2028_c7_32ae_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2028_c7_32ae_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2028_c7_32ae_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2028_c7_32ae_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2028_c7_32ae
result_is_stack_write_MUX_uxn_opcodes_h_l2028_c7_32ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2028_c7_32ae_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2028_c7_32ae_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2028_c7_32ae_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2028_c7_32ae_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2030_c34_f932
CONST_SR_8_uxn_opcodes_h_l2030_c34_f932 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2030_c34_f932_x,
CONST_SR_8_uxn_opcodes_h_l2030_c34_f932_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2032_c11_abbf
BIN_OP_EQ_uxn_opcodes_h_l2032_c11_abbf : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2032_c11_abbf_left,
BIN_OP_EQ_uxn_opcodes_h_l2032_c11_abbf_right,
BIN_OP_EQ_uxn_opcodes_h_l2032_c11_abbf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_549d
result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_549d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_549d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_549d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_549d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_549d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_549d
result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_549d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_549d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_549d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_549d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_549d_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1991_c6_d52b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1991_c1_6622_return_output,
 tmp16_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output,
 t8_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output,
 n16_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1997_c11_f137_return_output,
 tmp16_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output,
 t8_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output,
 n16_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2000_c11_b1c0_return_output,
 tmp16_MUX_uxn_opcodes_h_l2000_c7_f480_return_output,
 t8_MUX_uxn_opcodes_h_l2000_c7_f480_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2000_c7_f480_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2000_c7_f480_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2000_c7_f480_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2000_c7_f480_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2000_c7_f480_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2000_c7_f480_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2000_c7_f480_return_output,
 n16_MUX_uxn_opcodes_h_l2000_c7_f480_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2004_c11_66a8_return_output,
 tmp16_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output,
 n16_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2007_c11_a742_return_output,
 tmp16_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output,
 n16_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output,
 CONST_SL_8_uxn_opcodes_h_l2009_c3_b156_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2012_c11_77c3_return_output,
 tmp16_MUX_uxn_opcodes_h_l2012_c7_254f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_254f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2012_c7_254f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_254f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_254f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_254f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_254f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_254f_return_output,
 n16_MUX_uxn_opcodes_h_l2012_c7_254f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2015_c11_606f_return_output,
 tmp16_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output,
 n16_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2016_c3_c9b3_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2019_c32_9977_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2019_c32_a916_return_output,
 MUX_uxn_opcodes_h_l2019_c32_057d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1249_return_output,
 tmp16_MUX_uxn_opcodes_h_l2021_c7_0f99_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_0f99_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2021_c7_0f99_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_0f99_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_0f99_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_0f99_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2022_c20_162f_return_output,
 BIN_OP_SR_uxn_opcodes_h_l2022_c12_d9c7_return_output,
 CONST_SR_4_uxn_opcodes_h_l2022_c36_bd0b_return_output,
 BIN_OP_SL_uxn_opcodes_h_l2022_c12_efbb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2028_c11_5d93_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2028_c7_32ae_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2028_c7_32ae_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2028_c7_32ae_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2028_c7_32ae_return_output,
 CONST_SR_8_uxn_opcodes_h_l2030_c34_f932_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2032_c11_abbf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_549d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_549d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1991_c6_d52b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1991_c6_d52b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1991_c6_d52b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1991_c1_6622_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1991_c1_6622_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1991_c1_6622_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1991_c1_6622_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1994_c3_1a69 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1992_c3_b7de_uxn_opcodes_h_l1992_c3_b7de_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_f137_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_f137_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_f137_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2000_c7_f480_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1997_c7_a02f_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2000_c7_f480_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1997_c7_a02f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2000_c7_f480_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_a02f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2000_c7_f480_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1997_c7_a02f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2000_c7_f480_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_a02f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2000_c7_f480_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_a02f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2000_c7_f480_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_a02f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1998_c3_867e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2000_c7_f480_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_a02f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2000_c7_f480_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1997_c7_a02f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2000_c7_f480_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1997_c7_a02f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2000_c11_b1c0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2000_c11_b1c0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2000_c11_b1c0_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2000_c7_f480_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2000_c7_f480_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2000_c7_f480_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2000_c7_f480_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2000_c7_f480_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2000_c7_f480_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2000_c7_f480_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2002_c3_fdfe : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2000_c7_f480_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2000_c7_f480_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2000_c7_f480_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c11_66a8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c11_66a8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c11_66a8_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2005_c3_14c9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c11_a742_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c11_a742_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c11_a742_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2012_c7_254f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_254f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2012_c7_254f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_254f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_254f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_254f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2010_c3_1c06 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_254f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_254f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2012_c7_254f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2009_c3_b156_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2009_c3_b156_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_77c3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_77c3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_77c3_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2012_c7_254f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_254f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2012_c7_254f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_254f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_254f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_254f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2013_c3_453e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_254f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_254f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2012_c7_254f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_606f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_606f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_606f_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_0f99_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2015_c7_cedb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_0f99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_cedb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2021_c7_0f99_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2015_c7_cedb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2015_c7_cedb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_0f99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_cedb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_0f99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_cedb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_0f99_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_cedb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2015_c7_cedb_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2015_c7_cedb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2016_c3_c9b3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2016_c3_c9b3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2016_c3_c9b3_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2019_c32_057d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2019_c32_057d_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2019_c32_057d_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2019_c32_9977_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2019_c32_9977_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2019_c32_9977_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2019_c32_a916_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2019_c32_a916_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2019_c32_a916_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2019_c32_057d_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1249_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1249_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1249_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_0f99_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_0f99_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_0f99_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_0f99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_0f99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_0f99_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2021_c7_0f99_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2021_c7_0f99_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2028_c7_32ae_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2021_c7_0f99_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_0f99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_0f99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2028_c7_32ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_0f99_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_0f99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_0f99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2028_c7_32ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_0f99_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_0f99_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2025_c3_e450 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_0f99_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2028_c7_32ae_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_0f99_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2022_c12_d9c7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2022_c20_162f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2022_c20_162f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2022_c20_162f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2022_c12_d9c7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2022_c12_d9c7_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2022_c12_efbb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2022_c12_efbb_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2022_c36_bd0b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2022_c36_bd0b_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2022_c12_efbb_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2026_c24_b117_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2028_c11_5d93_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2028_c11_5d93_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2028_c11_5d93_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2028_c7_32ae_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2029_c3_6a38 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2028_c7_32ae_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2028_c7_32ae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2028_c7_32ae_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2028_c7_32ae_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2028_c7_32ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2028_c7_32ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2028_c7_32ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_549d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2028_c7_32ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2028_c7_32ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2028_c7_32ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_549d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2028_c7_32ae_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2030_c34_f932_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2030_c34_f932_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2030_c24_13ef_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_abbf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_abbf_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_abbf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_549d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_549d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_549d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_549d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_549d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_549d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2004_l2000_l1997_l2021_l1991_l2012_l2007_DUPLICATE_f794_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2004_l2000_l2028_l1997_l1991_l2015_l2012_l2007_DUPLICATE_1b2a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2004_l2000_l1997_l1991_l2015_l2012_l2007_DUPLICATE_e59d_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2004_l2032_l2000_l2028_l1997_l1991_l2015_l2012_l2007_DUPLICATE_a854_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2004_l2032_l2000_l2028_l1997_l2021_l2015_l2012_l2007_DUPLICATE_83cd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2004_l2000_l1997_l2015_l2012_l2007_DUPLICATE_17db_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2008_l2016_DUPLICATE_bf6b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2028_l2015_DUPLICATE_55f4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l2037_l1986_DUPLICATE_52e1_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_f137_right := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2019_c32_057d_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1994_c3_1a69 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1994_c3_1a69;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2019_c32_a916_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2019_c32_9977_right := to_unsigned(128, 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1991_c1_6622_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_abbf_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2025_c3_e450 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_0f99_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2025_c3_e450;
     VAR_MUX_uxn_opcodes_h_l2019_c32_057d_iffalse := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1991_c6_d52b_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2010_c3_1c06 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2010_c3_1c06;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_549d_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_549d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c11_66a8_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_0f99_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2000_c11_b1c0_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_77c3_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2005_c3_14c9 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2005_c3_14c9;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_606f_right := to_unsigned(6, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2029_c3_6a38 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2028_c7_32ae_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2029_c3_6a38;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2022_c20_162f_right := to_unsigned(15, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_0f99_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c11_a742_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1998_c3_867e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1998_c3_867e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2002_c3_fdfe := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2002_c3_fdfe;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1249_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2028_c11_5d93_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2013_c3_453e := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2013_c3_453e;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1991_c1_6622_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2019_c32_9977_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2016_c3_c9b3_left := n16;
     VAR_BIN_OP_SR_uxn_opcodes_h_l2022_c12_d9c7_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1991_c6_d52b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_f137_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2000_c11_b1c0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c11_66a8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c11_a742_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_77c3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_606f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1249_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2028_c11_5d93_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_abbf_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2022_c20_162f_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l2022_c36_bd0b_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse := t8;
     VAR_CONST_SR_8_uxn_opcodes_h_l2030_c34_f932_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_0f99_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2021_c11_1249] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1249_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1249_left;
     BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1249_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1249_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1249_return_output := BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1249_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2032_c11_abbf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2032_c11_abbf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_abbf_left;
     BIN_OP_EQ_uxn_opcodes_h_l2032_c11_abbf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_abbf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_abbf_return_output := BIN_OP_EQ_uxn_opcodes_h_l2032_c11_abbf_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2004_l2000_l1997_l1991_l2015_l2012_l2007_DUPLICATE_e59d LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2004_l2000_l1997_l1991_l2015_l2012_l2007_DUPLICATE_e59d_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1997_c11_f137] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1997_c11_f137_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_f137_left;
     BIN_OP_EQ_uxn_opcodes_h_l1997_c11_f137_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_f137_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_f137_return_output := BIN_OP_EQ_uxn_opcodes_h_l1997_c11_f137_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1991_c6_d52b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1991_c6_d52b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1991_c6_d52b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1991_c6_d52b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1991_c6_d52b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1991_c6_d52b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1991_c6_d52b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2004_l2032_l2000_l2028_l1997_l2021_l2015_l2012_l2007_DUPLICATE_83cd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2004_l2032_l2000_l2028_l1997_l2021_l2015_l2012_l2007_DUPLICATE_83cd_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2012_c11_77c3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2012_c11_77c3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_77c3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2012_c11_77c3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_77c3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_77c3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2012_c11_77c3_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2028_l2015_DUPLICATE_55f4 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2028_l2015_DUPLICATE_55f4_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2004_l2032_l2000_l2028_l1997_l1991_l2015_l2012_l2007_DUPLICATE_a854 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2004_l2032_l2000_l2028_l1997_l1991_l2015_l2012_l2007_DUPLICATE_a854_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2004_l2000_l2028_l1997_l1991_l2015_l2012_l2007_DUPLICATE_1b2a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2004_l2000_l2028_l1997_l1991_l2015_l2012_l2007_DUPLICATE_1b2a_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2004_c11_66a8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2004_c11_66a8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c11_66a8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2004_c11_66a8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c11_66a8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c11_66a8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2004_c11_66a8_return_output;

     -- CONST_SR_4[uxn_opcodes_h_l2022_c36_bd0b] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l2022_c36_bd0b_x <= VAR_CONST_SR_4_uxn_opcodes_h_l2022_c36_bd0b_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l2022_c36_bd0b_return_output := CONST_SR_4_uxn_opcodes_h_l2022_c36_bd0b_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2030_c34_f932] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2030_c34_f932_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2030_c34_f932_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2030_c34_f932_return_output := CONST_SR_8_uxn_opcodes_h_l2030_c34_f932_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2028_c11_5d93] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2028_c11_5d93_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2028_c11_5d93_left;
     BIN_OP_EQ_uxn_opcodes_h_l2028_c11_5d93_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2028_c11_5d93_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2028_c11_5d93_return_output := BIN_OP_EQ_uxn_opcodes_h_l2028_c11_5d93_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2022_c20_162f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2022_c20_162f_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2022_c20_162f_left;
     BIN_OP_AND_uxn_opcodes_h_l2022_c20_162f_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2022_c20_162f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2022_c20_162f_return_output := BIN_OP_AND_uxn_opcodes_h_l2022_c20_162f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2004_l2000_l1997_l2021_l1991_l2012_l2007_DUPLICATE_f794 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2004_l2000_l1997_l2021_l1991_l2012_l2007_DUPLICATE_f794_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2007_c11_a742] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2007_c11_a742_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c11_a742_left;
     BIN_OP_EQ_uxn_opcodes_h_l2007_c11_a742_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c11_a742_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c11_a742_return_output := BIN_OP_EQ_uxn_opcodes_h_l2007_c11_a742_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2008_l2016_DUPLICATE_bf6b LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2008_l2016_DUPLICATE_bf6b_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2015_c11_606f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2015_c11_606f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_606f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2015_c11_606f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_606f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_606f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2015_c11_606f_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2019_c32_9977] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2019_c32_9977_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2019_c32_9977_left;
     BIN_OP_AND_uxn_opcodes_h_l2019_c32_9977_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2019_c32_9977_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2019_c32_9977_return_output := BIN_OP_AND_uxn_opcodes_h_l2019_c32_9977_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2004_l2000_l1997_l2015_l2012_l2007_DUPLICATE_17db LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2004_l2000_l1997_l2015_l2012_l2007_DUPLICATE_17db_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l2000_c11_b1c0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2000_c11_b1c0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2000_c11_b1c0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2000_c11_b1c0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2000_c11_b1c0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2000_c11_b1c0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2000_c11_b1c0_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2019_c32_a916_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2019_c32_9977_return_output;
     VAR_BIN_OP_SR_uxn_opcodes_h_l2022_c12_d9c7_right := VAR_BIN_OP_AND_uxn_opcodes_h_l2022_c20_162f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1991_c1_6622_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1991_c6_d52b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1991_c6_d52b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1991_c6_d52b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1991_c6_d52b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1991_c6_d52b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1991_c6_d52b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1991_c6_d52b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1991_c6_d52b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1991_c6_d52b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1991_c6_d52b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1991_c6_d52b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1997_c7_a02f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_f137_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_a02f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_f137_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_a02f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_f137_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1997_c7_a02f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_f137_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_a02f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_f137_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_a02f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_f137_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_a02f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_f137_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1997_c7_a02f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_f137_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1997_c7_a02f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_f137_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1997_c7_a02f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_f137_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2000_c7_f480_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2000_c11_b1c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2000_c7_f480_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2000_c11_b1c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2000_c7_f480_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2000_c11_b1c0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2000_c7_f480_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2000_c11_b1c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2000_c7_f480_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2000_c11_b1c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2000_c7_f480_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2000_c11_b1c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2000_c7_f480_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2000_c11_b1c0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2000_c7_f480_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2000_c11_b1c0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2000_c7_f480_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2000_c11_b1c0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2000_c7_f480_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2000_c11_b1c0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c11_66a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c11_66a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c11_66a8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c11_66a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c11_66a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c11_66a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c11_66a8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c11_66a8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c11_66a8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c11_a742_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c11_a742_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c11_a742_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c11_a742_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c11_a742_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c11_a742_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c11_a742_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c11_a742_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c11_a742_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2012_c7_254f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_77c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_254f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_77c3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_254f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_77c3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_254f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_77c3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_254f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_77c3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_254f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_77c3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_254f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_77c3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2012_c7_254f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_77c3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2012_c7_254f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_77c3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2015_c7_cedb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_606f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_cedb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_606f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_cedb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_606f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2015_c7_cedb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_606f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_cedb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_606f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2015_c7_cedb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_606f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_cedb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_606f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2015_c7_cedb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_606f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2015_c7_cedb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2015_c11_606f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_0f99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1249_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_0f99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1249_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_0f99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1249_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_0f99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1249_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2021_c7_0f99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1249_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_0f99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1249_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2028_c7_32ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2028_c11_5d93_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2028_c7_32ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2028_c11_5d93_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2028_c7_32ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2028_c11_5d93_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2028_c7_32ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2028_c11_5d93_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_549d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_abbf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_549d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_abbf_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2016_c3_c9b3_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2008_l2016_DUPLICATE_bf6b_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2009_c3_b156_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2008_l2016_DUPLICATE_bf6b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2004_l2000_l1997_l1991_l2015_l2012_l2007_DUPLICATE_e59d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2004_l2000_l1997_l1991_l2015_l2012_l2007_DUPLICATE_e59d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2004_l2000_l1997_l1991_l2015_l2012_l2007_DUPLICATE_e59d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2004_l2000_l1997_l1991_l2015_l2012_l2007_DUPLICATE_e59d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2004_l2000_l1997_l1991_l2015_l2012_l2007_DUPLICATE_e59d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2004_l2000_l1997_l1991_l2015_l2012_l2007_DUPLICATE_e59d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2004_l2000_l1997_l1991_l2015_l2012_l2007_DUPLICATE_e59d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2004_l2032_l2000_l2028_l1997_l2021_l2015_l2012_l2007_DUPLICATE_83cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2004_l2032_l2000_l2028_l1997_l2021_l2015_l2012_l2007_DUPLICATE_83cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2004_l2032_l2000_l2028_l1997_l2021_l2015_l2012_l2007_DUPLICATE_83cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2004_l2032_l2000_l2028_l1997_l2021_l2015_l2012_l2007_DUPLICATE_83cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2004_l2032_l2000_l2028_l1997_l2021_l2015_l2012_l2007_DUPLICATE_83cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2004_l2032_l2000_l2028_l1997_l2021_l2015_l2012_l2007_DUPLICATE_83cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_0f99_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2004_l2032_l2000_l2028_l1997_l2021_l2015_l2012_l2007_DUPLICATE_83cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2028_c7_32ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2004_l2032_l2000_l2028_l1997_l2021_l2015_l2012_l2007_DUPLICATE_83cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_549d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2004_l2032_l2000_l2028_l1997_l2021_l2015_l2012_l2007_DUPLICATE_83cd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2004_l2000_l1997_l2021_l1991_l2012_l2007_DUPLICATE_f794_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2004_l2000_l1997_l2021_l1991_l2012_l2007_DUPLICATE_f794_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2004_l2000_l1997_l2021_l1991_l2012_l2007_DUPLICATE_f794_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2004_l2000_l1997_l2021_l1991_l2012_l2007_DUPLICATE_f794_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2004_l2000_l1997_l2021_l1991_l2012_l2007_DUPLICATE_f794_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2004_l2000_l1997_l2021_l1991_l2012_l2007_DUPLICATE_f794_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_0f99_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2004_l2000_l1997_l2021_l1991_l2012_l2007_DUPLICATE_f794_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2004_l2000_l1997_l2015_l2012_l2007_DUPLICATE_17db_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2004_l2000_l1997_l2015_l2012_l2007_DUPLICATE_17db_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2004_l2000_l1997_l2015_l2012_l2007_DUPLICATE_17db_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2004_l2000_l1997_l2015_l2012_l2007_DUPLICATE_17db_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2004_l2000_l1997_l2015_l2012_l2007_DUPLICATE_17db_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2004_l2000_l1997_l2015_l2012_l2007_DUPLICATE_17db_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2004_l2032_l2000_l2028_l1997_l1991_l2015_l2012_l2007_DUPLICATE_a854_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2004_l2032_l2000_l2028_l1997_l1991_l2015_l2012_l2007_DUPLICATE_a854_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2004_l2032_l2000_l2028_l1997_l1991_l2015_l2012_l2007_DUPLICATE_a854_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2004_l2032_l2000_l2028_l1997_l1991_l2015_l2012_l2007_DUPLICATE_a854_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2004_l2032_l2000_l2028_l1997_l1991_l2015_l2012_l2007_DUPLICATE_a854_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2004_l2032_l2000_l2028_l1997_l1991_l2015_l2012_l2007_DUPLICATE_a854_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2004_l2032_l2000_l2028_l1997_l1991_l2015_l2012_l2007_DUPLICATE_a854_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2028_c7_32ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2004_l2032_l2000_l2028_l1997_l1991_l2015_l2012_l2007_DUPLICATE_a854_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_549d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2004_l2032_l2000_l2028_l1997_l1991_l2015_l2012_l2007_DUPLICATE_a854_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2028_l2015_DUPLICATE_55f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2028_c7_32ae_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2028_l2015_DUPLICATE_55f4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2004_l2000_l2028_l1997_l1991_l2015_l2012_l2007_DUPLICATE_1b2a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2004_l2000_l2028_l1997_l1991_l2015_l2012_l2007_DUPLICATE_1b2a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2004_l2000_l2028_l1997_l1991_l2015_l2012_l2007_DUPLICATE_1b2a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2004_l2000_l2028_l1997_l1991_l2015_l2012_l2007_DUPLICATE_1b2a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2004_l2000_l2028_l1997_l1991_l2015_l2012_l2007_DUPLICATE_1b2a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2004_l2000_l2028_l1997_l1991_l2015_l2012_l2007_DUPLICATE_1b2a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2004_l2000_l2028_l1997_l1991_l2015_l2012_l2007_DUPLICATE_1b2a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2028_c7_32ae_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2004_l2000_l2028_l1997_l1991_l2015_l2012_l2007_DUPLICATE_1b2a_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2022_c12_efbb_right := VAR_CONST_SR_4_uxn_opcodes_h_l2022_c36_bd0b_return_output;
     -- BIN_OP_SR[uxn_opcodes_h_l2022_c12_d9c7] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l2022_c12_d9c7_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l2022_c12_d9c7_left;
     BIN_OP_SR_uxn_opcodes_h_l2022_c12_d9c7_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l2022_c12_d9c7_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l2022_c12_d9c7_return_output := BIN_OP_SR_uxn_opcodes_h_l2022_c12_d9c7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2032_c7_549d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_549d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_549d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_549d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_549d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_549d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_549d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_549d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_549d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2028_c7_32ae] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2028_c7_32ae_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2028_c7_32ae_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2028_c7_32ae_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2028_c7_32ae_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2028_c7_32ae_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2028_c7_32ae_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2028_c7_32ae_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2028_c7_32ae_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2019_c32_a916] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2019_c32_a916_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2019_c32_a916_left;
     BIN_OP_GT_uxn_opcodes_h_l2019_c32_a916_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2019_c32_a916_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2019_c32_a916_return_output := BIN_OP_GT_uxn_opcodes_h_l2019_c32_a916_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2015_c7_cedb] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2015_c7_cedb_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2015_c7_cedb_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2032_c7_549d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_549d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_549d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_549d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_549d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_549d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_549d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_549d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_549d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2016_c3_c9b3] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2016_c3_c9b3_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2016_c3_c9b3_left;
     BIN_OP_OR_uxn_opcodes_h_l2016_c3_c9b3_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2016_c3_c9b3_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2016_c3_c9b3_return_output := BIN_OP_OR_uxn_opcodes_h_l2016_c3_c9b3_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2009_c3_b156] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2009_c3_b156_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2009_c3_b156_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2009_c3_b156_return_output := CONST_SL_8_uxn_opcodes_h_l2009_c3_b156_return_output;

     -- t8_MUX[uxn_opcodes_h_l2000_c7_f480] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2000_c7_f480_cond <= VAR_t8_MUX_uxn_opcodes_h_l2000_c7_f480_cond;
     t8_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue;
     t8_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2000_c7_f480_return_output := t8_MUX_uxn_opcodes_h_l2000_c7_f480_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2030_c24_13ef] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2030_c24_13ef_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2030_c34_f932_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2021_c7_0f99] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_0f99_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_0f99_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_0f99_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_0f99_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_0f99_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_0f99_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_0f99_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_0f99_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1991_c1_6622] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1991_c1_6622_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1991_c1_6622_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1991_c1_6622_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1991_c1_6622_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1991_c1_6622_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1991_c1_6622_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1991_c1_6622_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1991_c1_6622_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2019_c32_057d_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2019_c32_a916_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2016_c3_c9b3_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2022_c12_efbb_left := VAR_BIN_OP_SR_uxn_opcodes_h_l2022_c12_d9c7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2028_c7_32ae_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2030_c24_13ef_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2009_c3_b156_return_output;
     VAR_printf_uxn_opcodes_h_l1992_c3_b7de_uxn_opcodes_h_l1992_c3_b7de_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1991_c1_6622_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2028_c7_32ae_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_549d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_0f99_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2028_c7_32ae_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_549d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_0f99_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2028_c7_32ae_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2000_c7_f480_return_output;
     -- t8_MUX[uxn_opcodes_h_l1997_c7_a02f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1997_c7_a02f_cond <= VAR_t8_MUX_uxn_opcodes_h_l1997_c7_a02f_cond;
     t8_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue;
     t8_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output := t8_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2028_c7_32ae] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2028_c7_32ae_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2028_c7_32ae_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2028_c7_32ae_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2028_c7_32ae_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2028_c7_32ae_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2028_c7_32ae_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2028_c7_32ae_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2028_c7_32ae_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2028_c7_32ae] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2028_c7_32ae_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2028_c7_32ae_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2028_c7_32ae_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2028_c7_32ae_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2028_c7_32ae_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2028_c7_32ae_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2028_c7_32ae_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2028_c7_32ae_return_output;

     -- n16_MUX[uxn_opcodes_h_l2015_c7_cedb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2015_c7_cedb_cond <= VAR_n16_MUX_uxn_opcodes_h_l2015_c7_cedb_cond;
     n16_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue;
     n16_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output := n16_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output;

     -- MUX[uxn_opcodes_h_l2019_c32_057d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2019_c32_057d_cond <= VAR_MUX_uxn_opcodes_h_l2019_c32_057d_cond;
     MUX_uxn_opcodes_h_l2019_c32_057d_iftrue <= VAR_MUX_uxn_opcodes_h_l2019_c32_057d_iftrue;
     MUX_uxn_opcodes_h_l2019_c32_057d_iffalse <= VAR_MUX_uxn_opcodes_h_l2019_c32_057d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2019_c32_057d_return_output := MUX_uxn_opcodes_h_l2019_c32_057d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2012_c7_254f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_254f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_254f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_254f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_254f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2028_c7_32ae] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2028_c7_32ae_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2028_c7_32ae_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2028_c7_32ae_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2028_c7_32ae_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2028_c7_32ae_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2028_c7_32ae_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2028_c7_32ae_return_output := result_stack_value_MUX_uxn_opcodes_h_l2028_c7_32ae_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2021_c7_0f99] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_0f99_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_0f99_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_0f99_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_0f99_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_0f99_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_0f99_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_0f99_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_0f99_return_output;

     -- BIN_OP_SL[uxn_opcodes_h_l2022_c12_efbb] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l2022_c12_efbb_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l2022_c12_efbb_left;
     BIN_OP_SL_uxn_opcodes_h_l2022_c12_efbb_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l2022_c12_efbb_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l2022_c12_efbb_return_output := BIN_OP_SL_uxn_opcodes_h_l2022_c12_efbb_return_output;

     -- printf_uxn_opcodes_h_l1992_c3_b7de[uxn_opcodes_h_l1992_c3_b7de] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1992_c3_b7de_uxn_opcodes_h_l1992_c3_b7de_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1992_c3_b7de_uxn_opcodes_h_l1992_c3_b7de_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2015_c7_cedb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_cedb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_cedb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_0f99_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2022_c12_efbb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue := VAR_MUX_uxn_opcodes_h_l2019_c32_057d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_0f99_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2028_c7_32ae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_254f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_0f99_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2028_c7_32ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_0f99_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2021_c7_0f99_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2028_c7_32ae_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2015_c7_cedb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2015_c7_cedb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2015_c7_cedb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2007_c7_bf5c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2012_c7_254f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2012_c7_254f_cond <= VAR_n16_MUX_uxn_opcodes_h_l2012_c7_254f_cond;
     n16_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue;
     n16_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2012_c7_254f_return_output := n16_MUX_uxn_opcodes_h_l2012_c7_254f_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2026_c24_b117] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2026_c24_b117_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_SL_uxn_opcodes_h_l2022_c12_efbb_return_output);

     -- tmp16_MUX[uxn_opcodes_h_l2021_c7_0f99] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2021_c7_0f99_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_0f99_cond;
     tmp16_MUX_uxn_opcodes_h_l2021_c7_0f99_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_0f99_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2021_c7_0f99_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_0f99_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_0f99_return_output := tmp16_MUX_uxn_opcodes_h_l2021_c7_0f99_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2015_c7_cedb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_cedb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_cedb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2012_c7_254f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_254f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_254f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_254f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_254f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2021_c7_0f99] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_0f99_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_0f99_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_0f99_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_0f99_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_0f99_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_0f99_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_0f99_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_0f99_return_output;

     -- t8_MUX[uxn_opcodes_h_l1991_c2_ebf8] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond <= VAR_t8_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond;
     t8_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue;
     t8_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output := t8_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2021_c7_0f99] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_0f99_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_0f99_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_0f99_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_0f99_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_0f99_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_0f99_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_0f99_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_0f99_return_output;

     -- Submodule level 4
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2021_c7_0f99_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2026_c24_b117_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2012_c7_254f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_0f99_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_254f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_0f99_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_0f99_return_output;
     -- n16_MUX[uxn_opcodes_h_l2007_c7_bf5c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond <= VAR_n16_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond;
     n16_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue;
     n16_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output := n16_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2021_c7_0f99] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2021_c7_0f99_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2021_c7_0f99_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2021_c7_0f99_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2021_c7_0f99_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2021_c7_0f99_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2021_c7_0f99_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2021_c7_0f99_return_output := result_stack_value_MUX_uxn_opcodes_h_l2021_c7_0f99_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2007_c7_bf5c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2004_c7_4fe2] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2015_c7_cedb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_cedb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_cedb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2015_c7_cedb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_cedb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_cedb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2012_c7_254f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_254f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_254f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_254f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_254f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2012_c7_254f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_254f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_254f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_254f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_254f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2015_c7_cedb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2015_c7_cedb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2015_c7_cedb_cond;
     tmp16_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output := tmp16_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_254f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_254f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2021_c7_0f99_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2012_c7_254f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2012_c7_254f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2012_c7_254f_cond;
     tmp16_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2012_c7_254f_return_output := tmp16_MUX_uxn_opcodes_h_l2012_c7_254f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2004_c7_4fe2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2007_c7_bf5c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2007_c7_bf5c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2004_c7_4fe2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond <= VAR_n16_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond;
     n16_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue;
     n16_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output := n16_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2012_c7_254f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_254f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_254f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_254f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_254f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2000_c7_f480] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2000_c7_f480_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2000_c7_f480_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2000_c7_f480_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2000_c7_f480_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2015_c7_cedb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2015_c7_cedb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2015_c7_cedb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2015_c7_cedb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2015_c7_cedb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output := result_stack_value_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2012_c7_254f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_254f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_254f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_254f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_254f_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_254f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2000_c7_f480_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_254f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2015_c7_cedb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2012_c7_254f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2007_c7_bf5c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2000_c7_f480] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2000_c7_f480_cond <= VAR_n16_MUX_uxn_opcodes_h_l2000_c7_f480_cond;
     n16_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue;
     n16_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2000_c7_f480_return_output := n16_MUX_uxn_opcodes_h_l2000_c7_f480_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2000_c7_f480] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2000_c7_f480_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2000_c7_f480_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2000_c7_f480_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2000_c7_f480_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2004_c7_4fe2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2007_c7_bf5c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1997_c7_a02f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1997_c7_a02f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1997_c7_a02f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2012_c7_254f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2012_c7_254f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2012_c7_254f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2012_c7_254f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2012_c7_254f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2012_c7_254f_return_output := result_stack_value_MUX_uxn_opcodes_h_l2012_c7_254f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2007_c7_bf5c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond;
     tmp16_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output := tmp16_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2004_c7_4fe2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2000_c7_f480_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2000_c7_f480_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2012_c7_254f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output;
     -- n16_MUX[uxn_opcodes_h_l1997_c7_a02f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1997_c7_a02f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1997_c7_a02f_cond;
     n16_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue;
     n16_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output := n16_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2000_c7_f480] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2000_c7_f480_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2000_c7_f480_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2000_c7_f480_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2000_c7_f480_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2004_c7_4fe2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1997_c7_a02f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_a02f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_a02f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2004_c7_4fe2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond;
     tmp16_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output := tmp16_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2007_c7_bf5c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2007_c7_bf5c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2007_c7_bf5c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2007_c7_bf5c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output := result_stack_value_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2000_c7_f480] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2000_c7_f480_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2000_c7_f480_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2000_c7_f480_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2000_c7_f480_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1991_c2_ebf8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2004_c7_4fe2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2000_c7_f480_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2000_c7_f480_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2007_c7_bf5c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1997_c7_a02f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_a02f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_a02f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1991_c2_ebf8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1997_c7_a02f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_a02f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_a02f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2000_c7_f480] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2000_c7_f480_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2000_c7_f480_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2000_c7_f480_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2000_c7_f480_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2000_c7_f480] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2000_c7_f480_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2000_c7_f480_cond;
     tmp16_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2000_c7_f480_return_output := tmp16_MUX_uxn_opcodes_h_l2000_c7_f480_return_output;

     -- n16_MUX[uxn_opcodes_h_l1991_c2_ebf8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond <= VAR_n16_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond;
     n16_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue;
     n16_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output := n16_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2000_c7_f480] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2000_c7_f480_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2000_c7_f480_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2000_c7_f480_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2000_c7_f480_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2004_c7_4fe2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2004_c7_4fe2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2004_c7_4fe2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2004_c7_4fe2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output := result_stack_value_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output;

     -- Submodule level 9
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2000_c7_f480_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2000_c7_f480_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2004_c7_4fe2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2000_c7_f480_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1997_c7_a02f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_a02f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_a02f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2000_c7_f480] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2000_c7_f480_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2000_c7_f480_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2000_c7_f480_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2000_c7_f480_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2000_c7_f480_return_output := result_stack_value_MUX_uxn_opcodes_h_l2000_c7_f480_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1991_c2_ebf8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1997_c7_a02f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1997_c7_a02f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1997_c7_a02f_cond;
     tmp16_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output := tmp16_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1991_c2_ebf8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1997_c7_a02f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_a02f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_a02f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2000_c7_f480_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1991_c2_ebf8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1991_c2_ebf8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1991_c2_ebf8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond;
     tmp16_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output := tmp16_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1997_c7_a02f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1997_c7_a02f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1997_c7_a02f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1997_c7_a02f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1997_c7_a02f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output;

     -- Submodule level 11
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1997_c7_a02f_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1991_c2_ebf8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1991_c2_ebf8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1991_c2_ebf8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1991_c2_ebf8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output := result_stack_value_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l2037_l1986_DUPLICATE_52e1 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l2037_l1986_DUPLICATE_52e1_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e56b(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1991_c2_ebf8_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l2037_l1986_DUPLICATE_52e1_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l2037_l1986_DUPLICATE_52e1_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
