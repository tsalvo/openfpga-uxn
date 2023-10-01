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
-- Submodules: 69
entity swp_0CLK_a45e5d62 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end swp_0CLK_a45e5d62;
architecture arch of swp_0CLK_a45e5d62 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1686_c6_4ccd]
signal BIN_OP_EQ_uxn_opcodes_h_l1686_c6_4ccd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1686_c6_4ccd_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1686_c6_4ccd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1686_c1_64af]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_64af_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_64af_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_64af_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_64af_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1686_c2_a96d]
signal t8_MUX_uxn_opcodes_h_l1686_c2_a96d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1686_c2_a96d]
signal n8_MUX_uxn_opcodes_h_l1686_c2_a96d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1686_c2_a96d]
signal result_stack_value_MUX_uxn_opcodes_h_l1686_c2_a96d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1686_c2_a96d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_a96d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1686_c2_a96d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_a96d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1686_c2_a96d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_a96d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1686_c2_a96d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_a96d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1686_c2_a96d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_a96d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1686_c2_a96d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_a96d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1686_c2_a96d]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_a96d_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1687_c3_bd7a[uxn_opcodes_h_l1687_c3_bd7a]
signal printf_uxn_opcodes_h_l1687_c3_bd7a_uxn_opcodes_h_l1687_c3_bd7a_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1694_c11_ea42]
signal BIN_OP_EQ_uxn_opcodes_h_l1694_c11_ea42_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1694_c11_ea42_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1694_c11_ea42_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1694_c7_a20c]
signal t8_MUX_uxn_opcodes_h_l1694_c7_a20c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1694_c7_a20c]
signal n8_MUX_uxn_opcodes_h_l1694_c7_a20c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1694_c7_a20c]
signal result_stack_value_MUX_uxn_opcodes_h_l1694_c7_a20c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1694_c7_a20c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_a20c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1694_c7_a20c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_a20c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1694_c7_a20c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_a20c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1694_c7_a20c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_a20c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1694_c7_a20c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_a20c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1694_c7_a20c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_a20c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1698_c11_a42b]
signal BIN_OP_EQ_uxn_opcodes_h_l1698_c11_a42b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1698_c11_a42b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1698_c11_a42b_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1698_c7_6885]
signal t8_MUX_uxn_opcodes_h_l1698_c7_6885_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1698_c7_6885_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1698_c7_6885]
signal n8_MUX_uxn_opcodes_h_l1698_c7_6885_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1698_c7_6885_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1698_c7_6885]
signal result_stack_value_MUX_uxn_opcodes_h_l1698_c7_6885_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1698_c7_6885_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1698_c7_6885]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_6885_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_6885_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1698_c7_6885]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_6885_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_6885_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1698_c7_6885]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_6885_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_6885_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1698_c7_6885]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_6885_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_6885_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1698_c7_6885]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_6885_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_6885_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1698_c7_6885]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_6885_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_6885_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1703_c11_f491]
signal BIN_OP_EQ_uxn_opcodes_h_l1703_c11_f491_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1703_c11_f491_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1703_c11_f491_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1703_c7_7179]
signal n8_MUX_uxn_opcodes_h_l1703_c7_7179_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1703_c7_7179_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1703_c7_7179_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1703_c7_7179_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1703_c7_7179]
signal result_stack_value_MUX_uxn_opcodes_h_l1703_c7_7179_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1703_c7_7179_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1703_c7_7179_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1703_c7_7179_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1703_c7_7179]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_7179_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_7179_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_7179_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_7179_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1703_c7_7179]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_7179_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_7179_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_7179_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_7179_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1703_c7_7179]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_7179_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_7179_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_7179_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_7179_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1703_c7_7179]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_7179_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_7179_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_7179_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_7179_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1703_c7_7179]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_7179_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_7179_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_7179_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_7179_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1703_c7_7179]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_7179_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_7179_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_7179_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_7179_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1707_c11_2c1a]
signal BIN_OP_EQ_uxn_opcodes_h_l1707_c11_2c1a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1707_c11_2c1a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1707_c11_2c1a_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1707_c7_02ff]
signal n8_MUX_uxn_opcodes_h_l1707_c7_02ff_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1707_c7_02ff_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1707_c7_02ff_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1707_c7_02ff]
signal result_stack_value_MUX_uxn_opcodes_h_l1707_c7_02ff_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1707_c7_02ff_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1707_c7_02ff_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1707_c7_02ff]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_02ff_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_02ff_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_02ff_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1707_c7_02ff]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_02ff_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_02ff_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_02ff_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1707_c7_02ff]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_02ff_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_02ff_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_02ff_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1707_c7_02ff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_02ff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_02ff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_02ff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1707_c7_02ff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_02ff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_02ff_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_02ff_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1707_c7_02ff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_02ff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_02ff_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_02ff_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1711_c32_970c]
signal BIN_OP_AND_uxn_opcodes_h_l1711_c32_970c_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1711_c32_970c_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1711_c32_970c_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1711_c32_5e4f]
signal BIN_OP_GT_uxn_opcodes_h_l1711_c32_5e4f_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1711_c32_5e4f_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1711_c32_5e4f_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1711_c32_7fb0]
signal MUX_uxn_opcodes_h_l1711_c32_7fb0_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1711_c32_7fb0_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1711_c32_7fb0_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1711_c32_7fb0_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1713_c11_25ad]
signal BIN_OP_EQ_uxn_opcodes_h_l1713_c11_25ad_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1713_c11_25ad_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1713_c11_25ad_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1713_c7_3e1f]
signal result_stack_value_MUX_uxn_opcodes_h_l1713_c7_3e1f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1713_c7_3e1f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1713_c7_3e1f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1713_c7_3e1f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1713_c7_3e1f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_3e1f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_3e1f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_3e1f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_3e1f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1713_c7_3e1f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_3e1f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_3e1f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_3e1f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_3e1f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1713_c7_3e1f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_3e1f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_3e1f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_3e1f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_3e1f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1713_c7_3e1f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_3e1f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_3e1f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_3e1f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_3e1f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1719_c11_d43d]
signal BIN_OP_EQ_uxn_opcodes_h_l1719_c11_d43d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1719_c11_d43d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1719_c11_d43d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1719_c7_e156]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_e156_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_e156_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_e156_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_e156_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1719_c7_e156]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_e156_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_e156_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_e156_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_e156_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1719_c7_e156]
signal result_stack_value_MUX_uxn_opcodes_h_l1719_c7_e156_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1719_c7_e156_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1719_c7_e156_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1719_c7_e156_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1719_c7_e156]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_e156_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_e156_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_e156_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_e156_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1724_c11_0788]
signal BIN_OP_EQ_uxn_opcodes_h_l1724_c11_0788_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1724_c11_0788_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1724_c11_0788_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1724_c7_fdab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_fdab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_fdab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_fdab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_fdab_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1724_c7_fdab]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_fdab_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_fdab_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_fdab_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_fdab_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1686_c6_4ccd
BIN_OP_EQ_uxn_opcodes_h_l1686_c6_4ccd : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1686_c6_4ccd_left,
BIN_OP_EQ_uxn_opcodes_h_l1686_c6_4ccd_right,
BIN_OP_EQ_uxn_opcodes_h_l1686_c6_4ccd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_64af
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_64af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_64af_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_64af_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_64af_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_64af_return_output);

-- t8_MUX_uxn_opcodes_h_l1686_c2_a96d
t8_MUX_uxn_opcodes_h_l1686_c2_a96d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1686_c2_a96d_cond,
t8_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue,
t8_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse,
t8_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output);

-- n8_MUX_uxn_opcodes_h_l1686_c2_a96d
n8_MUX_uxn_opcodes_h_l1686_c2_a96d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1686_c2_a96d_cond,
n8_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue,
n8_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse,
n8_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1686_c2_a96d
result_stack_value_MUX_uxn_opcodes_h_l1686_c2_a96d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1686_c2_a96d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_a96d
result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_a96d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_a96d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_a96d
result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_a96d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_a96d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_a96d
result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_a96d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_a96d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_a96d
result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_a96d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_a96d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_a96d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_a96d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_a96d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_a96d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_a96d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_a96d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_a96d
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_a96d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_a96d_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output);

-- printf_uxn_opcodes_h_l1687_c3_bd7a_uxn_opcodes_h_l1687_c3_bd7a
printf_uxn_opcodes_h_l1687_c3_bd7a_uxn_opcodes_h_l1687_c3_bd7a : entity work.printf_uxn_opcodes_h_l1687_c3_bd7a_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1687_c3_bd7a_uxn_opcodes_h_l1687_c3_bd7a_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1694_c11_ea42
BIN_OP_EQ_uxn_opcodes_h_l1694_c11_ea42 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1694_c11_ea42_left,
BIN_OP_EQ_uxn_opcodes_h_l1694_c11_ea42_right,
BIN_OP_EQ_uxn_opcodes_h_l1694_c11_ea42_return_output);

-- t8_MUX_uxn_opcodes_h_l1694_c7_a20c
t8_MUX_uxn_opcodes_h_l1694_c7_a20c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1694_c7_a20c_cond,
t8_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue,
t8_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse,
t8_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output);

-- n8_MUX_uxn_opcodes_h_l1694_c7_a20c
n8_MUX_uxn_opcodes_h_l1694_c7_a20c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1694_c7_a20c_cond,
n8_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue,
n8_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse,
n8_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1694_c7_a20c
result_stack_value_MUX_uxn_opcodes_h_l1694_c7_a20c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1694_c7_a20c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_a20c
result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_a20c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_a20c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_a20c
result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_a20c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_a20c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_a20c
result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_a20c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_a20c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_a20c
result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_a20c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_a20c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_a20c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_a20c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_a20c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_a20c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_a20c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_a20c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1698_c11_a42b
BIN_OP_EQ_uxn_opcodes_h_l1698_c11_a42b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1698_c11_a42b_left,
BIN_OP_EQ_uxn_opcodes_h_l1698_c11_a42b_right,
BIN_OP_EQ_uxn_opcodes_h_l1698_c11_a42b_return_output);

-- t8_MUX_uxn_opcodes_h_l1698_c7_6885
t8_MUX_uxn_opcodes_h_l1698_c7_6885 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1698_c7_6885_cond,
t8_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue,
t8_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse,
t8_MUX_uxn_opcodes_h_l1698_c7_6885_return_output);

-- n8_MUX_uxn_opcodes_h_l1698_c7_6885
n8_MUX_uxn_opcodes_h_l1698_c7_6885 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1698_c7_6885_cond,
n8_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue,
n8_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse,
n8_MUX_uxn_opcodes_h_l1698_c7_6885_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1698_c7_6885
result_stack_value_MUX_uxn_opcodes_h_l1698_c7_6885 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1698_c7_6885_cond,
result_stack_value_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1698_c7_6885_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_6885
result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_6885 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_6885_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_6885_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_6885
result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_6885 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_6885_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_6885_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_6885
result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_6885 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_6885_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_6885_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_6885
result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_6885 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_6885_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_6885_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_6885
result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_6885 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_6885_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_6885_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_6885
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_6885 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_6885_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_6885_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1703_c11_f491
BIN_OP_EQ_uxn_opcodes_h_l1703_c11_f491 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1703_c11_f491_left,
BIN_OP_EQ_uxn_opcodes_h_l1703_c11_f491_right,
BIN_OP_EQ_uxn_opcodes_h_l1703_c11_f491_return_output);

-- n8_MUX_uxn_opcodes_h_l1703_c7_7179
n8_MUX_uxn_opcodes_h_l1703_c7_7179 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1703_c7_7179_cond,
n8_MUX_uxn_opcodes_h_l1703_c7_7179_iftrue,
n8_MUX_uxn_opcodes_h_l1703_c7_7179_iffalse,
n8_MUX_uxn_opcodes_h_l1703_c7_7179_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1703_c7_7179
result_stack_value_MUX_uxn_opcodes_h_l1703_c7_7179 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1703_c7_7179_cond,
result_stack_value_MUX_uxn_opcodes_h_l1703_c7_7179_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1703_c7_7179_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1703_c7_7179_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_7179
result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_7179 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_7179_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_7179_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_7179_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_7179_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_7179
result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_7179 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_7179_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_7179_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_7179_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_7179_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_7179
result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_7179 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_7179_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_7179_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_7179_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_7179_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_7179
result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_7179 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_7179_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_7179_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_7179_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_7179_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_7179
result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_7179 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_7179_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_7179_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_7179_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_7179_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_7179
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_7179 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_7179_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_7179_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_7179_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_7179_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1707_c11_2c1a
BIN_OP_EQ_uxn_opcodes_h_l1707_c11_2c1a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1707_c11_2c1a_left,
BIN_OP_EQ_uxn_opcodes_h_l1707_c11_2c1a_right,
BIN_OP_EQ_uxn_opcodes_h_l1707_c11_2c1a_return_output);

-- n8_MUX_uxn_opcodes_h_l1707_c7_02ff
n8_MUX_uxn_opcodes_h_l1707_c7_02ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1707_c7_02ff_cond,
n8_MUX_uxn_opcodes_h_l1707_c7_02ff_iftrue,
n8_MUX_uxn_opcodes_h_l1707_c7_02ff_iffalse,
n8_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1707_c7_02ff
result_stack_value_MUX_uxn_opcodes_h_l1707_c7_02ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1707_c7_02ff_cond,
result_stack_value_MUX_uxn_opcodes_h_l1707_c7_02ff_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1707_c7_02ff_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_02ff
result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_02ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_02ff_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_02ff_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_02ff_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_02ff
result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_02ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_02ff_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_02ff_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_02ff_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_02ff
result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_02ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_02ff_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_02ff_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_02ff_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_02ff
result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_02ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_02ff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_02ff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_02ff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_02ff
result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_02ff : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_02ff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_02ff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_02ff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_02ff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_02ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_02ff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_02ff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_02ff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1711_c32_970c
BIN_OP_AND_uxn_opcodes_h_l1711_c32_970c : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1711_c32_970c_left,
BIN_OP_AND_uxn_opcodes_h_l1711_c32_970c_right,
BIN_OP_AND_uxn_opcodes_h_l1711_c32_970c_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1711_c32_5e4f
BIN_OP_GT_uxn_opcodes_h_l1711_c32_5e4f : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1711_c32_5e4f_left,
BIN_OP_GT_uxn_opcodes_h_l1711_c32_5e4f_right,
BIN_OP_GT_uxn_opcodes_h_l1711_c32_5e4f_return_output);

-- MUX_uxn_opcodes_h_l1711_c32_7fb0
MUX_uxn_opcodes_h_l1711_c32_7fb0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1711_c32_7fb0_cond,
MUX_uxn_opcodes_h_l1711_c32_7fb0_iftrue,
MUX_uxn_opcodes_h_l1711_c32_7fb0_iffalse,
MUX_uxn_opcodes_h_l1711_c32_7fb0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1713_c11_25ad
BIN_OP_EQ_uxn_opcodes_h_l1713_c11_25ad : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1713_c11_25ad_left,
BIN_OP_EQ_uxn_opcodes_h_l1713_c11_25ad_right,
BIN_OP_EQ_uxn_opcodes_h_l1713_c11_25ad_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1713_c7_3e1f
result_stack_value_MUX_uxn_opcodes_h_l1713_c7_3e1f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1713_c7_3e1f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1713_c7_3e1f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1713_c7_3e1f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1713_c7_3e1f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_3e1f
result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_3e1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_3e1f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_3e1f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_3e1f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_3e1f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_3e1f
result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_3e1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_3e1f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_3e1f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_3e1f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_3e1f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_3e1f
result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_3e1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_3e1f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_3e1f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_3e1f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_3e1f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_3e1f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_3e1f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_3e1f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_3e1f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_3e1f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_3e1f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1719_c11_d43d
BIN_OP_EQ_uxn_opcodes_h_l1719_c11_d43d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1719_c11_d43d_left,
BIN_OP_EQ_uxn_opcodes_h_l1719_c11_d43d_right,
BIN_OP_EQ_uxn_opcodes_h_l1719_c11_d43d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_e156
result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_e156 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_e156_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_e156_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_e156_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_e156_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_e156
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_e156 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_e156_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_e156_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_e156_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_e156_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1719_c7_e156
result_stack_value_MUX_uxn_opcodes_h_l1719_c7_e156 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1719_c7_e156_cond,
result_stack_value_MUX_uxn_opcodes_h_l1719_c7_e156_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1719_c7_e156_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1719_c7_e156_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_e156
result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_e156 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_e156_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_e156_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_e156_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_e156_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1724_c11_0788
BIN_OP_EQ_uxn_opcodes_h_l1724_c11_0788 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1724_c11_0788_left,
BIN_OP_EQ_uxn_opcodes_h_l1724_c11_0788_right,
BIN_OP_EQ_uxn_opcodes_h_l1724_c11_0788_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_fdab
result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_fdab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_fdab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_fdab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_fdab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_fdab_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_fdab
result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_fdab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_fdab_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_fdab_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_fdab_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_fdab_return_output);



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
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1686_c6_4ccd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_64af_return_output,
 t8_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output,
 n8_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1694_c11_ea42_return_output,
 t8_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output,
 n8_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1698_c11_a42b_return_output,
 t8_MUX_uxn_opcodes_h_l1698_c7_6885_return_output,
 n8_MUX_uxn_opcodes_h_l1698_c7_6885_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1698_c7_6885_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_6885_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_6885_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_6885_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_6885_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_6885_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_6885_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1703_c11_f491_return_output,
 n8_MUX_uxn_opcodes_h_l1703_c7_7179_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1703_c7_7179_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_7179_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_7179_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_7179_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_7179_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_7179_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_7179_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1707_c11_2c1a_return_output,
 n8_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1711_c32_970c_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1711_c32_5e4f_return_output,
 MUX_uxn_opcodes_h_l1711_c32_7fb0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1713_c11_25ad_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1713_c7_3e1f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_3e1f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_3e1f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_3e1f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_3e1f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1719_c11_d43d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_e156_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_e156_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1719_c7_e156_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_e156_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1724_c11_0788_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_fdab_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_fdab_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_4ccd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_4ccd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_4ccd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_64af_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_64af_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_64af_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_64af_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1686_c2_a96d_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1686_c2_a96d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1686_c2_a96d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_a96d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_a96d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_a96d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_a96d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_a96d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1690_c3_d066 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_a96d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1686_c2_a96d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_a96d_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1687_c3_bd7a_uxn_opcodes_h_l1687_c3_bd7a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1694_c11_ea42_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1694_c11_ea42_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1694_c11_ea42_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1698_c7_6885_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1694_c7_a20c_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1698_c7_6885_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1694_c7_a20c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1698_c7_6885_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1694_c7_a20c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_6885_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_a20c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_6885_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_a20c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_6885_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_a20c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_6885_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_a20c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_6885_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_a20c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1696_c3_cd8e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_6885_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_a20c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_a42b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_a42b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_a42b_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1698_c7_6885_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1703_c7_7179_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1698_c7_6885_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1703_c7_7179_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1698_c7_6885_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_7179_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_6885_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_7179_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_6885_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_7179_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_6885_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_7179_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_6885_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_7179_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_6885_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1701_c3_9d75 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_7179_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_6885_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_f491_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_f491_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_f491_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1703_c7_7179_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1703_c7_7179_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1703_c7_7179_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1703_c7_7179_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1703_c7_7179_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1703_c7_7179_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_7179_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_7179_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_7179_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_7179_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_7179_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_7179_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_7179_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_7179_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_7179_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_7179_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_7179_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_7179_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_7179_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_7179_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_7179_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_7179_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1705_c3_19fc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_7179_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_7179_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_2c1a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_2c1a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_2c1a_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1707_c7_02ff_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1707_c7_02ff_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1707_c7_02ff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1707_c7_02ff_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1707_c7_02ff_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1713_c7_3e1f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1707_c7_02ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_02ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_02ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1707_c7_02ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_02ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_02ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_02ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_3e1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_02ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_02ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_02ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_3e1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_02ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_02ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_02ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_3e1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_02ff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_02ff_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_02ff_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_02ff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_02ff_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_02ff_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_3e1f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_02ff_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1711_c32_7fb0_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1711_c32_7fb0_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1711_c32_7fb0_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1711_c32_970c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1711_c32_970c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1711_c32_970c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1711_c32_5e4f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1711_c32_5e4f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1711_c32_5e4f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1711_c32_7fb0_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_25ad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_25ad_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_25ad_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1713_c7_3e1f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1713_c7_3e1f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1719_c7_e156_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1713_c7_3e1f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_3e1f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_3e1f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_e156_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_3e1f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_3e1f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_3e1f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_3e1f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_3e1f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_3e1f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_e156_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_3e1f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_3e1f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1716_c3_51c2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_3e1f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_e156_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_3e1f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1719_c11_d43d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1719_c11_d43d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1719_c11_d43d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_e156_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_e156_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_fdab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_e156_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_e156_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1721_c3_b243 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_e156_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_e156_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1719_c7_e156_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1719_c7_e156_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1719_c7_e156_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_e156_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_e156_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_fdab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_e156_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1724_c11_0788_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1724_c11_0788_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1724_c11_0788_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_fdab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_fdab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_fdab_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_fdab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_fdab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_fdab_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1698_l1694_l1686_l1719_l1707_l1703_DUPLICATE_5f17_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1698_l1694_l1686_l1713_l1703_DUPLICATE_f144_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1698_l1694_l1686_l1707_l1703_DUPLICATE_4dd4_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1698_l1694_l1724_l1707_l1703_DUPLICATE_976c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1698_l1694_l1724_l1719_l1713_l1707_l1703_DUPLICATE_dc8f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1719_l1707_DUPLICATE_8610_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l1729_l1682_DUPLICATE_907b_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_2c1a_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1716_c3_51c2 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_3e1f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1716_c3_51c2;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_4ccd_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1711_c32_970c_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1719_c11_d43d_right := to_unsigned(6, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_7179_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1724_c11_0788_right := to_unsigned(7, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_3e1f_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_02ff_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_02ff_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_fdab_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1711_c32_7fb0_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_f491_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_3e1f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1711_c32_5e4f_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1694_c11_ea42_right := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1696_c3_cd8e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1696_c3_cd8e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1721_c3_b243 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_e156_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1721_c3_b243;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_e156_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_a42b_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_fdab_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1690_c3_d066 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1690_c3_d066;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1705_c3_19fc := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_7179_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1705_c3_19fc;
     VAR_MUX_uxn_opcodes_h_l1711_c32_7fb0_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_64af_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1701_c3_9d75 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1701_c3_9d75;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_25ad_right := to_unsigned(5, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_64af_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1711_c32_970c_left := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1703_c7_7179_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1707_c7_02ff_iffalse := n8;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1713_c7_3e1f_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_4ccd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1694_c11_ea42_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_a42b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_f491_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_2c1a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_25ad_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1719_c11_d43d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1724_c11_0788_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1707_c7_02ff_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue := VAR_previous_stack_read;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1719_c7_e156_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1694_c11_ea42] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1694_c11_ea42_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1694_c11_ea42_left;
     BIN_OP_EQ_uxn_opcodes_h_l1694_c11_ea42_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1694_c11_ea42_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1694_c11_ea42_return_output := BIN_OP_EQ_uxn_opcodes_h_l1694_c11_ea42_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1686_c2_a96d] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1686_c2_a96d_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1698_l1694_l1686_l1719_l1707_l1703_DUPLICATE_5f17 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1698_l1694_l1686_l1719_l1707_l1703_DUPLICATE_5f17_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1698_l1694_l1724_l1719_l1713_l1707_l1703_DUPLICATE_dc8f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1698_l1694_l1724_l1719_l1713_l1707_l1703_DUPLICATE_dc8f_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1707_c11_2c1a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1707_c11_2c1a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_2c1a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1707_c11_2c1a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_2c1a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_2c1a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1707_c11_2c1a_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1719_l1707_DUPLICATE_8610 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1719_l1707_DUPLICATE_8610_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1698_c11_a42b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1698_c11_a42b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_a42b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1698_c11_a42b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_a42b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_a42b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1698_c11_a42b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1719_c11_d43d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1719_c11_d43d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1719_c11_d43d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1719_c11_d43d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1719_c11_d43d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1719_c11_d43d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1719_c11_d43d_return_output;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l1707_c7_02ff] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1707_c7_02ff_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1686_c6_4ccd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1686_c6_4ccd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_4ccd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1686_c6_4ccd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_4ccd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_4ccd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1686_c6_4ccd_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1698_l1694_l1686_l1713_l1703_DUPLICATE_f144 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1698_l1694_l1686_l1713_l1703_DUPLICATE_f144_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1703_c11_f491] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1703_c11_f491_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_f491_left;
     BIN_OP_EQ_uxn_opcodes_h_l1703_c11_f491_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_f491_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_f491_return_output := BIN_OP_EQ_uxn_opcodes_h_l1703_c11_f491_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1698_l1694_l1724_l1707_l1703_DUPLICATE_976c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1698_l1694_l1724_l1707_l1703_DUPLICATE_976c_return_output := result.is_stack_write;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1698_l1694_l1686_l1707_l1703_DUPLICATE_4dd4 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1698_l1694_l1686_l1707_l1703_DUPLICATE_4dd4_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1713_c11_25ad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1713_c11_25ad_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_25ad_left;
     BIN_OP_EQ_uxn_opcodes_h_l1713_c11_25ad_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_25ad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_25ad_return_output := BIN_OP_EQ_uxn_opcodes_h_l1713_c11_25ad_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1724_c11_0788] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1724_c11_0788_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1724_c11_0788_left;
     BIN_OP_EQ_uxn_opcodes_h_l1724_c11_0788_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1724_c11_0788_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1724_c11_0788_return_output := BIN_OP_EQ_uxn_opcodes_h_l1724_c11_0788_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1711_c32_970c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1711_c32_970c_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1711_c32_970c_left;
     BIN_OP_AND_uxn_opcodes_h_l1711_c32_970c_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1711_c32_970c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1711_c32_970c_return_output := BIN_OP_AND_uxn_opcodes_h_l1711_c32_970c_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1711_c32_5e4f_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1711_c32_970c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_64af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_4ccd_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1686_c2_a96d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_4ccd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_a96d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_4ccd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_a96d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_4ccd_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_a96d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_4ccd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_a96d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_4ccd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_a96d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_4ccd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_a96d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_4ccd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_a96d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_4ccd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1686_c2_a96d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_4ccd_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1686_c2_a96d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_4ccd_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1694_c7_a20c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1694_c11_ea42_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_a20c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1694_c11_ea42_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_a20c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1694_c11_ea42_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_a20c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1694_c11_ea42_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_a20c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1694_c11_ea42_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_a20c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1694_c11_ea42_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_a20c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1694_c11_ea42_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1694_c7_a20c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1694_c11_ea42_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1694_c7_a20c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1694_c11_ea42_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1698_c7_6885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_a42b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_6885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_a42b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_6885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_a42b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_6885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_a42b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_6885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_a42b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_6885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_a42b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_6885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_a42b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1698_c7_6885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_a42b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1698_c7_6885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_a42b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1703_c7_7179_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_f491_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_7179_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_f491_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_7179_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_f491_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_7179_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_f491_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_7179_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_f491_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_7179_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_f491_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_7179_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_f491_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1703_c7_7179_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_f491_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1707_c7_02ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_2c1a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_02ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_2c1a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_02ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_2c1a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_02ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_2c1a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_02ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_2c1a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_02ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_2c1a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_02ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_2c1a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1707_c7_02ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_2c1a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_3e1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_25ad_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_3e1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_25ad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_3e1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_25ad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_3e1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_25ad_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1713_c7_3e1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_25ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_e156_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1719_c11_d43d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_e156_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1719_c11_d43d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_e156_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1719_c11_d43d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1719_c7_e156_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1719_c11_d43d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_fdab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1724_c11_0788_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_fdab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1724_c11_0788_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1698_l1694_l1686_l1707_l1703_DUPLICATE_4dd4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1698_l1694_l1686_l1707_l1703_DUPLICATE_4dd4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1698_l1694_l1686_l1707_l1703_DUPLICATE_4dd4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_7179_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1698_l1694_l1686_l1707_l1703_DUPLICATE_4dd4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_02ff_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1698_l1694_l1686_l1707_l1703_DUPLICATE_4dd4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1698_l1694_l1724_l1719_l1713_l1707_l1703_DUPLICATE_dc8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1698_l1694_l1724_l1719_l1713_l1707_l1703_DUPLICATE_dc8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_7179_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1698_l1694_l1724_l1719_l1713_l1707_l1703_DUPLICATE_dc8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_02ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1698_l1694_l1724_l1719_l1713_l1707_l1703_DUPLICATE_dc8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_3e1f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1698_l1694_l1724_l1719_l1713_l1707_l1703_DUPLICATE_dc8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_e156_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1698_l1694_l1724_l1719_l1713_l1707_l1703_DUPLICATE_dc8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_fdab_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1698_l1694_l1724_l1719_l1713_l1707_l1703_DUPLICATE_dc8f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1698_l1694_l1686_l1713_l1703_DUPLICATE_f144_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1698_l1694_l1686_l1713_l1703_DUPLICATE_f144_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1698_l1694_l1686_l1713_l1703_DUPLICATE_f144_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_7179_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1698_l1694_l1686_l1713_l1703_DUPLICATE_f144_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_3e1f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1698_l1694_l1686_l1713_l1703_DUPLICATE_f144_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1698_l1694_l1724_l1707_l1703_DUPLICATE_976c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1698_l1694_l1724_l1707_l1703_DUPLICATE_976c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_7179_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1698_l1694_l1724_l1707_l1703_DUPLICATE_976c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_02ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1698_l1694_l1724_l1707_l1703_DUPLICATE_976c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_fdab_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1698_l1694_l1724_l1707_l1703_DUPLICATE_976c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_02ff_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1719_l1707_DUPLICATE_8610_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_e156_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1719_l1707_DUPLICATE_8610_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1698_l1694_l1686_l1719_l1707_l1703_DUPLICATE_5f17_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1698_l1694_l1686_l1719_l1707_l1703_DUPLICATE_5f17_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1698_l1694_l1686_l1719_l1707_l1703_DUPLICATE_5f17_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1703_c7_7179_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1698_l1694_l1686_l1719_l1707_l1703_DUPLICATE_5f17_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1707_c7_02ff_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1698_l1694_l1686_l1719_l1707_l1703_DUPLICATE_5f17_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1719_c7_e156_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1698_l1694_l1686_l1719_l1707_l1703_DUPLICATE_5f17_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1686_c2_a96d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_02ff_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1707_c7_02ff_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1724_c7_fdab] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_fdab_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_fdab_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_fdab_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_fdab_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_fdab_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_fdab_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_fdab_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_fdab_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1711_c32_5e4f] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1711_c32_5e4f_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1711_c32_5e4f_left;
     BIN_OP_GT_uxn_opcodes_h_l1711_c32_5e4f_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1711_c32_5e4f_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1711_c32_5e4f_return_output := BIN_OP_GT_uxn_opcodes_h_l1711_c32_5e4f_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1686_c2_a96d] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_a96d_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_a96d_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1707_c7_02ff] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_02ff_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_02ff_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_02ff_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_02ff_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_02ff_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_02ff_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1719_c7_e156] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1719_c7_e156_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1719_c7_e156_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1719_c7_e156_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1719_c7_e156_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1719_c7_e156_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1719_c7_e156_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1719_c7_e156_return_output := result_stack_value_MUX_uxn_opcodes_h_l1719_c7_e156_return_output;

     -- n8_MUX[uxn_opcodes_h_l1707_c7_02ff] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1707_c7_02ff_cond <= VAR_n8_MUX_uxn_opcodes_h_l1707_c7_02ff_cond;
     n8_MUX_uxn_opcodes_h_l1707_c7_02ff_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1707_c7_02ff_iftrue;
     n8_MUX_uxn_opcodes_h_l1707_c7_02ff_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1707_c7_02ff_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output := n8_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1719_c7_e156] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_e156_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_e156_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_e156_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_e156_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_e156_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_e156_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_e156_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_e156_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1713_c7_3e1f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_3e1f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_3e1f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_3e1f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_3e1f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_3e1f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_3e1f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_3e1f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_3e1f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1686_c1_64af] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_64af_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_64af_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_64af_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_64af_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_64af_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_64af_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_64af_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_64af_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1724_c7_fdab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_fdab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_fdab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_fdab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_fdab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_fdab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_fdab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_fdab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_fdab_return_output;

     -- t8_MUX[uxn_opcodes_h_l1698_c7_6885] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1698_c7_6885_cond <= VAR_t8_MUX_uxn_opcodes_h_l1698_c7_6885_cond;
     t8_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue;
     t8_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1698_c7_6885_return_output := t8_MUX_uxn_opcodes_h_l1698_c7_6885_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1711_c32_7fb0_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1711_c32_5e4f_return_output;
     VAR_printf_uxn_opcodes_h_l1687_c3_bd7a_uxn_opcodes_h_l1687_c3_bd7a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_64af_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1703_c7_7179_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_e156_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_fdab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_02ff_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_3e1f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_7179_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_e156_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_fdab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_3e1f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_e156_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1713_c7_3e1f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1719_c7_e156_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1698_c7_6885_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1707_c7_02ff] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_02ff_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_02ff_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_02ff_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_02ff_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_02ff_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_02ff_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1719_c7_e156] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_e156_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_e156_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_e156_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_e156_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_e156_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_e156_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_e156_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_e156_return_output;

     -- printf_uxn_opcodes_h_l1687_c3_bd7a[uxn_opcodes_h_l1687_c3_bd7a] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1687_c3_bd7a_uxn_opcodes_h_l1687_c3_bd7a_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1687_c3_bd7a_uxn_opcodes_h_l1687_c3_bd7a_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t8_MUX[uxn_opcodes_h_l1694_c7_a20c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1694_c7_a20c_cond <= VAR_t8_MUX_uxn_opcodes_h_l1694_c7_a20c_cond;
     t8_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue;
     t8_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output := t8_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1719_c7_e156] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_e156_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_e156_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_e156_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_e156_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_e156_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_e156_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_e156_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_e156_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1713_c7_3e1f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1713_c7_3e1f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1713_c7_3e1f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1713_c7_3e1f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1713_c7_3e1f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1713_c7_3e1f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1713_c7_3e1f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1713_c7_3e1f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1713_c7_3e1f_return_output;

     -- MUX[uxn_opcodes_h_l1711_c32_7fb0] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1711_c32_7fb0_cond <= VAR_MUX_uxn_opcodes_h_l1711_c32_7fb0_cond;
     MUX_uxn_opcodes_h_l1711_c32_7fb0_iftrue <= VAR_MUX_uxn_opcodes_h_l1711_c32_7fb0_iftrue;
     MUX_uxn_opcodes_h_l1711_c32_7fb0_iffalse <= VAR_MUX_uxn_opcodes_h_l1711_c32_7fb0_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1711_c32_7fb0_return_output := MUX_uxn_opcodes_h_l1711_c32_7fb0_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1703_c7_7179] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_7179_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_7179_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_7179_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_7179_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_7179_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_7179_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_7179_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_7179_return_output;

     -- n8_MUX[uxn_opcodes_h_l1703_c7_7179] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1703_c7_7179_cond <= VAR_n8_MUX_uxn_opcodes_h_l1703_c7_7179_cond;
     n8_MUX_uxn_opcodes_h_l1703_c7_7179_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1703_c7_7179_iftrue;
     n8_MUX_uxn_opcodes_h_l1703_c7_7179_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1703_c7_7179_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1703_c7_7179_return_output := n8_MUX_uxn_opcodes_h_l1703_c7_7179_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1713_c7_3e1f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_3e1f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_3e1f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_3e1f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_3e1f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_3e1f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_3e1f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_3e1f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_3e1f_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_02ff_iftrue := VAR_MUX_uxn_opcodes_h_l1711_c32_7fb0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1703_c7_7179_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_3e1f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_e156_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_7179_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_7179_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_3e1f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_e156_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_02ff_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_3e1f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1707_c7_02ff_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1713_c7_3e1f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1703_c7_7179] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_7179_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_7179_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_7179_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_7179_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_7179_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_7179_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_7179_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_7179_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1707_c7_02ff] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1707_c7_02ff_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1707_c7_02ff_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1707_c7_02ff_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1707_c7_02ff_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1707_c7_02ff_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1707_c7_02ff_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output := result_stack_value_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1713_c7_3e1f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_3e1f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_3e1f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_3e1f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_3e1f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_3e1f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_3e1f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_3e1f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_3e1f_return_output;

     -- t8_MUX[uxn_opcodes_h_l1686_c2_a96d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1686_c2_a96d_cond <= VAR_t8_MUX_uxn_opcodes_h_l1686_c2_a96d_cond;
     t8_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue;
     t8_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output := t8_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1707_c7_02ff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_02ff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_02ff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_02ff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_02ff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_02ff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_02ff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output;

     -- n8_MUX[uxn_opcodes_h_l1698_c7_6885] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1698_c7_6885_cond <= VAR_n8_MUX_uxn_opcodes_h_l1698_c7_6885_cond;
     n8_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue;
     n8_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1698_c7_6885_return_output := n8_MUX_uxn_opcodes_h_l1698_c7_6885_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1698_c7_6885] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_6885_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_6885_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_6885_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_6885_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1713_c7_3e1f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_3e1f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_3e1f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_3e1f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_3e1f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_3e1f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_3e1f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_3e1f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_3e1f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1707_c7_02ff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_02ff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_02ff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_02ff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_02ff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_02ff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_02ff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1698_c7_6885_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_02ff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_3e1f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_7179_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_6885_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_02ff_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_3e1f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_7179_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_7179_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1703_c7_7179_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1703_c7_7179] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_7179_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_7179_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_7179_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_7179_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_7179_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_7179_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_7179_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_7179_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1703_c7_7179] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1703_c7_7179_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1703_c7_7179_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1703_c7_7179_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1703_c7_7179_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1703_c7_7179_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1703_c7_7179_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1703_c7_7179_return_output := result_stack_value_MUX_uxn_opcodes_h_l1703_c7_7179_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1694_c7_a20c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_a20c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_a20c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1698_c7_6885] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_6885_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_6885_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_6885_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_6885_return_output;

     -- n8_MUX[uxn_opcodes_h_l1694_c7_a20c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1694_c7_a20c_cond <= VAR_n8_MUX_uxn_opcodes_h_l1694_c7_a20c_cond;
     n8_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue;
     n8_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output := n8_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1703_c7_7179] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_7179_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_7179_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_7179_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_7179_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_7179_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_7179_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_7179_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_7179_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1707_c7_02ff] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_02ff_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_02ff_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_02ff_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_02ff_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_02ff_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_02ff_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1707_c7_02ff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_02ff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_02ff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_02ff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_02ff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_02ff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_02ff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_7179_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_6885_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_7179_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_02ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_7179_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_7179_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1703_c7_7179_return_output;
     -- n8_MUX[uxn_opcodes_h_l1686_c2_a96d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1686_c2_a96d_cond <= VAR_n8_MUX_uxn_opcodes_h_l1686_c2_a96d_cond;
     n8_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue;
     n8_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output := n8_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1686_c2_a96d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_a96d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_a96d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1703_c7_7179] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_7179_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_7179_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_7179_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_7179_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_7179_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_7179_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_7179_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_7179_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1694_c7_a20c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_a20c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_a20c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1698_c7_6885] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1698_c7_6885_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1698_c7_6885_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1698_c7_6885_return_output := result_stack_value_MUX_uxn_opcodes_h_l1698_c7_6885_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1703_c7_7179] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_7179_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_7179_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_7179_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_7179_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_7179_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_7179_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_7179_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_7179_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1698_c7_6885] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_6885_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_6885_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_6885_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_6885_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1698_c7_6885] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_6885_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_6885_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_6885_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_6885_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_7179_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_7179_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_6885_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_6885_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1698_c7_6885_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1698_c7_6885] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_6885_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_6885_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_6885_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_6885_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1694_c7_a20c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_a20c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_a20c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1694_c7_a20c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1694_c7_a20c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1694_c7_a20c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1698_c7_6885] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_6885_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_6885_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_6885_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_6885_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_6885_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_6885_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1694_c7_a20c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_a20c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_a20c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1686_c2_a96d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_a96d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_a96d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_6885_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_6885_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1694_c7_a20c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_a20c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_a20c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1686_c2_a96d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1686_c2_a96d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1686_c2_a96d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1686_c2_a96d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_a96d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_a96d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1686_c2_a96d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_a96d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_a96d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1694_c7_a20c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_a20c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_a20c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_a20c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_a20c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_a20c_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1686_c2_a96d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_a96d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_a96d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1686_c2_a96d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_a96d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_a96d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_a96d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_a96d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l1729_l1682_DUPLICATE_907b LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l1729_l1682_DUPLICATE_907b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_81ab(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_a96d_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l1729_l1682_DUPLICATE_907b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l1729_l1682_DUPLICATE_907b_return_output;
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
