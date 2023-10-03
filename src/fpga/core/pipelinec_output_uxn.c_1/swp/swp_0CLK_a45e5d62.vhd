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
-- BIN_OP_EQ[uxn_opcodes_h_l1686_c6_6914]
signal BIN_OP_EQ_uxn_opcodes_h_l1686_c6_6914_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1686_c6_6914_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1686_c6_6914_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1686_c1_b608]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_b608_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_b608_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_b608_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_b608_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1686_c2_94ad]
signal n8_MUX_uxn_opcodes_h_l1686_c2_94ad_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1686_c2_94ad]
signal t8_MUX_uxn_opcodes_h_l1686_c2_94ad_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1686_c2_94ad]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_94ad_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1686_c2_94ad]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_94ad_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1686_c2_94ad]
signal result_stack_value_MUX_uxn_opcodes_h_l1686_c2_94ad_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1686_c2_94ad]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_94ad_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1686_c2_94ad]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_94ad_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1686_c2_94ad]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_94ad_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1686_c2_94ad]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_94ad_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1686_c2_94ad]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_94ad_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1687_c3_a873[uxn_opcodes_h_l1687_c3_a873]
signal printf_uxn_opcodes_h_l1687_c3_a873_uxn_opcodes_h_l1687_c3_a873_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1694_c11_c062]
signal BIN_OP_EQ_uxn_opcodes_h_l1694_c11_c062_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1694_c11_c062_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1694_c11_c062_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1694_c7_cc63]
signal n8_MUX_uxn_opcodes_h_l1694_c7_cc63_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1694_c7_cc63]
signal t8_MUX_uxn_opcodes_h_l1694_c7_cc63_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1694_c7_cc63]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_cc63_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1694_c7_cc63]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_cc63_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1694_c7_cc63]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_cc63_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1694_c7_cc63]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_cc63_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1694_c7_cc63]
signal result_stack_value_MUX_uxn_opcodes_h_l1694_c7_cc63_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1694_c7_cc63]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_cc63_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1694_c7_cc63]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_cc63_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1698_c11_57a3]
signal BIN_OP_EQ_uxn_opcodes_h_l1698_c11_57a3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1698_c11_57a3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1698_c11_57a3_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1698_c7_1f6e]
signal n8_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1698_c7_1f6e]
signal t8_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1698_c7_1f6e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1698_c7_1f6e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1698_c7_1f6e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1698_c7_1f6e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1698_c7_1f6e]
signal result_stack_value_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1698_c7_1f6e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1698_c7_1f6e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1703_c11_367b]
signal BIN_OP_EQ_uxn_opcodes_h_l1703_c11_367b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1703_c11_367b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1703_c11_367b_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1703_c7_5a57]
signal n8_MUX_uxn_opcodes_h_l1703_c7_5a57_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1703_c7_5a57_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1703_c7_5a57_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1703_c7_5a57]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_5a57_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_5a57_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_5a57_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1703_c7_5a57]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_5a57_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_5a57_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_5a57_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1703_c7_5a57]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_5a57_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_5a57_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_5a57_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1703_c7_5a57]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_5a57_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_5a57_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_5a57_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1703_c7_5a57]
signal result_stack_value_MUX_uxn_opcodes_h_l1703_c7_5a57_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1703_c7_5a57_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1703_c7_5a57_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1703_c7_5a57]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_5a57_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_5a57_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_5a57_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1703_c7_5a57]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_5a57_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_5a57_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_5a57_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1707_c11_0f75]
signal BIN_OP_EQ_uxn_opcodes_h_l1707_c11_0f75_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1707_c11_0f75_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1707_c11_0f75_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1707_c7_8fab]
signal n8_MUX_uxn_opcodes_h_l1707_c7_8fab_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1707_c7_8fab_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1707_c7_8fab_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1707_c7_8fab]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_8fab_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_8fab_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_8fab_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1707_c7_8fab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_8fab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_8fab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_8fab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1707_c7_8fab]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_8fab_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_8fab_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_8fab_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1707_c7_8fab]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_8fab_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_8fab_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_8fab_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1707_c7_8fab]
signal result_stack_value_MUX_uxn_opcodes_h_l1707_c7_8fab_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1707_c7_8fab_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1707_c7_8fab_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1707_c7_8fab]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_8fab_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_8fab_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_8fab_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1707_c7_8fab]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_8fab_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_8fab_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_8fab_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1711_c32_4bae]
signal BIN_OP_AND_uxn_opcodes_h_l1711_c32_4bae_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1711_c32_4bae_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1711_c32_4bae_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1711_c32_bdad]
signal BIN_OP_GT_uxn_opcodes_h_l1711_c32_bdad_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1711_c32_bdad_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1711_c32_bdad_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1711_c32_a7be]
signal MUX_uxn_opcodes_h_l1711_c32_a7be_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1711_c32_a7be_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1711_c32_a7be_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1711_c32_a7be_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1713_c11_f225]
signal BIN_OP_EQ_uxn_opcodes_h_l1713_c11_f225_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1713_c11_f225_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1713_c11_f225_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1713_c7_1e12]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1e12_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1e12_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1e12_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1e12_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1713_c7_1e12]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1e12_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1e12_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1e12_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1e12_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1713_c7_1e12]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1e12_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1e12_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1e12_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1e12_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1713_c7_1e12]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1e12_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1e12_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1e12_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1e12_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1713_c7_1e12]
signal result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1e12_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1e12_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1e12_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1e12_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1719_c11_1fb7]
signal BIN_OP_EQ_uxn_opcodes_h_l1719_c11_1fb7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1719_c11_1fb7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1719_c11_1fb7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1719_c7_b2f5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_b2f5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_b2f5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_b2f5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_b2f5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1719_c7_b2f5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_b2f5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_b2f5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_b2f5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_b2f5_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1719_c7_b2f5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_b2f5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_b2f5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_b2f5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_b2f5_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1719_c7_b2f5]
signal result_stack_value_MUX_uxn_opcodes_h_l1719_c7_b2f5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1719_c7_b2f5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1719_c7_b2f5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1719_c7_b2f5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1724_c11_2ae8]
signal BIN_OP_EQ_uxn_opcodes_h_l1724_c11_2ae8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1724_c11_2ae8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1724_c11_2ae8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1724_c7_c277]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_c277_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_c277_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_c277_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_c277_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1724_c7_c277]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_c277_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_c277_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_c277_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_c277_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1686_c6_6914
BIN_OP_EQ_uxn_opcodes_h_l1686_c6_6914 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1686_c6_6914_left,
BIN_OP_EQ_uxn_opcodes_h_l1686_c6_6914_right,
BIN_OP_EQ_uxn_opcodes_h_l1686_c6_6914_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_b608
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_b608 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_b608_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_b608_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_b608_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_b608_return_output);

-- n8_MUX_uxn_opcodes_h_l1686_c2_94ad
n8_MUX_uxn_opcodes_h_l1686_c2_94ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1686_c2_94ad_cond,
n8_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue,
n8_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse,
n8_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output);

-- t8_MUX_uxn_opcodes_h_l1686_c2_94ad
t8_MUX_uxn_opcodes_h_l1686_c2_94ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1686_c2_94ad_cond,
t8_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue,
t8_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse,
t8_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_94ad
result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_94ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_94ad_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_94ad
result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_94ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_94ad_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1686_c2_94ad
result_stack_value_MUX_uxn_opcodes_h_l1686_c2_94ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1686_c2_94ad_cond,
result_stack_value_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_94ad
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_94ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_94ad_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_94ad
result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_94ad : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_94ad_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_94ad
result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_94ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_94ad_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_94ad
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_94ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_94ad_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_94ad
result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_94ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_94ad_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output);

-- printf_uxn_opcodes_h_l1687_c3_a873_uxn_opcodes_h_l1687_c3_a873
printf_uxn_opcodes_h_l1687_c3_a873_uxn_opcodes_h_l1687_c3_a873 : entity work.printf_uxn_opcodes_h_l1687_c3_a873_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1687_c3_a873_uxn_opcodes_h_l1687_c3_a873_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1694_c11_c062
BIN_OP_EQ_uxn_opcodes_h_l1694_c11_c062 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1694_c11_c062_left,
BIN_OP_EQ_uxn_opcodes_h_l1694_c11_c062_right,
BIN_OP_EQ_uxn_opcodes_h_l1694_c11_c062_return_output);

-- n8_MUX_uxn_opcodes_h_l1694_c7_cc63
n8_MUX_uxn_opcodes_h_l1694_c7_cc63 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1694_c7_cc63_cond,
n8_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue,
n8_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse,
n8_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output);

-- t8_MUX_uxn_opcodes_h_l1694_c7_cc63
t8_MUX_uxn_opcodes_h_l1694_c7_cc63 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1694_c7_cc63_cond,
t8_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue,
t8_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse,
t8_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_cc63
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_cc63 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_cc63_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_cc63
result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_cc63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_cc63_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_cc63
result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_cc63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_cc63_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_cc63
result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_cc63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_cc63_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1694_c7_cc63
result_stack_value_MUX_uxn_opcodes_h_l1694_c7_cc63 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1694_c7_cc63_cond,
result_stack_value_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_cc63
result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_cc63 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_cc63_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_cc63
result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_cc63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_cc63_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1698_c11_57a3
BIN_OP_EQ_uxn_opcodes_h_l1698_c11_57a3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1698_c11_57a3_left,
BIN_OP_EQ_uxn_opcodes_h_l1698_c11_57a3_right,
BIN_OP_EQ_uxn_opcodes_h_l1698_c11_57a3_return_output);

-- n8_MUX_uxn_opcodes_h_l1698_c7_1f6e
n8_MUX_uxn_opcodes_h_l1698_c7_1f6e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond,
n8_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue,
n8_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse,
n8_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output);

-- t8_MUX_uxn_opcodes_h_l1698_c7_1f6e
t8_MUX_uxn_opcodes_h_l1698_c7_1f6e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond,
t8_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue,
t8_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse,
t8_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_1f6e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_1f6e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_1f6e
result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_1f6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_1f6e
result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_1f6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e
result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1698_c7_1f6e
result_stack_value_MUX_uxn_opcodes_h_l1698_c7_1f6e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_1f6e
result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_1f6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1703_c11_367b
BIN_OP_EQ_uxn_opcodes_h_l1703_c11_367b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1703_c11_367b_left,
BIN_OP_EQ_uxn_opcodes_h_l1703_c11_367b_right,
BIN_OP_EQ_uxn_opcodes_h_l1703_c11_367b_return_output);

-- n8_MUX_uxn_opcodes_h_l1703_c7_5a57
n8_MUX_uxn_opcodes_h_l1703_c7_5a57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1703_c7_5a57_cond,
n8_MUX_uxn_opcodes_h_l1703_c7_5a57_iftrue,
n8_MUX_uxn_opcodes_h_l1703_c7_5a57_iffalse,
n8_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_5a57
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_5a57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_5a57_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_5a57_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_5a57_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_5a57
result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_5a57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_5a57_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_5a57_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_5a57_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_5a57
result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_5a57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_5a57_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_5a57_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_5a57_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_5a57
result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_5a57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_5a57_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_5a57_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_5a57_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1703_c7_5a57
result_stack_value_MUX_uxn_opcodes_h_l1703_c7_5a57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1703_c7_5a57_cond,
result_stack_value_MUX_uxn_opcodes_h_l1703_c7_5a57_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1703_c7_5a57_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_5a57
result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_5a57 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_5a57_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_5a57_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_5a57_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_5a57
result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_5a57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_5a57_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_5a57_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_5a57_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1707_c11_0f75
BIN_OP_EQ_uxn_opcodes_h_l1707_c11_0f75 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1707_c11_0f75_left,
BIN_OP_EQ_uxn_opcodes_h_l1707_c11_0f75_right,
BIN_OP_EQ_uxn_opcodes_h_l1707_c11_0f75_return_output);

-- n8_MUX_uxn_opcodes_h_l1707_c7_8fab
n8_MUX_uxn_opcodes_h_l1707_c7_8fab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1707_c7_8fab_cond,
n8_MUX_uxn_opcodes_h_l1707_c7_8fab_iftrue,
n8_MUX_uxn_opcodes_h_l1707_c7_8fab_iffalse,
n8_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_8fab
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_8fab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_8fab_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_8fab_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_8fab_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_8fab
result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_8fab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_8fab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_8fab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_8fab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_8fab
result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_8fab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_8fab_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_8fab_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_8fab_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_8fab
result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_8fab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_8fab_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_8fab_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_8fab_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1707_c7_8fab
result_stack_value_MUX_uxn_opcodes_h_l1707_c7_8fab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1707_c7_8fab_cond,
result_stack_value_MUX_uxn_opcodes_h_l1707_c7_8fab_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1707_c7_8fab_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_8fab
result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_8fab : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_8fab_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_8fab_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_8fab_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_8fab
result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_8fab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_8fab_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_8fab_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_8fab_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1711_c32_4bae
BIN_OP_AND_uxn_opcodes_h_l1711_c32_4bae : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1711_c32_4bae_left,
BIN_OP_AND_uxn_opcodes_h_l1711_c32_4bae_right,
BIN_OP_AND_uxn_opcodes_h_l1711_c32_4bae_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1711_c32_bdad
BIN_OP_GT_uxn_opcodes_h_l1711_c32_bdad : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1711_c32_bdad_left,
BIN_OP_GT_uxn_opcodes_h_l1711_c32_bdad_right,
BIN_OP_GT_uxn_opcodes_h_l1711_c32_bdad_return_output);

-- MUX_uxn_opcodes_h_l1711_c32_a7be
MUX_uxn_opcodes_h_l1711_c32_a7be : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1711_c32_a7be_cond,
MUX_uxn_opcodes_h_l1711_c32_a7be_iftrue,
MUX_uxn_opcodes_h_l1711_c32_a7be_iffalse,
MUX_uxn_opcodes_h_l1711_c32_a7be_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1713_c11_f225
BIN_OP_EQ_uxn_opcodes_h_l1713_c11_f225 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1713_c11_f225_left,
BIN_OP_EQ_uxn_opcodes_h_l1713_c11_f225_right,
BIN_OP_EQ_uxn_opcodes_h_l1713_c11_f225_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1e12
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1e12 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1e12_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1e12_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1e12_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1e12_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1e12
result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1e12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1e12_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1e12_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1e12_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1e12_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1e12
result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1e12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1e12_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1e12_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1e12_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1e12_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1e12
result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1e12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1e12_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1e12_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1e12_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1e12_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1e12
result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1e12 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1e12_cond,
result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1e12_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1e12_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1e12_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1719_c11_1fb7
BIN_OP_EQ_uxn_opcodes_h_l1719_c11_1fb7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1719_c11_1fb7_left,
BIN_OP_EQ_uxn_opcodes_h_l1719_c11_1fb7_right,
BIN_OP_EQ_uxn_opcodes_h_l1719_c11_1fb7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_b2f5
result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_b2f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_b2f5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_b2f5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_b2f5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_b2f5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_b2f5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_b2f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_b2f5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_b2f5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_b2f5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_b2f5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_b2f5
result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_b2f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_b2f5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_b2f5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_b2f5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_b2f5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1719_c7_b2f5
result_stack_value_MUX_uxn_opcodes_h_l1719_c7_b2f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1719_c7_b2f5_cond,
result_stack_value_MUX_uxn_opcodes_h_l1719_c7_b2f5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1719_c7_b2f5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1719_c7_b2f5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1724_c11_2ae8
BIN_OP_EQ_uxn_opcodes_h_l1724_c11_2ae8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1724_c11_2ae8_left,
BIN_OP_EQ_uxn_opcodes_h_l1724_c11_2ae8_right,
BIN_OP_EQ_uxn_opcodes_h_l1724_c11_2ae8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_c277
result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_c277 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_c277_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_c277_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_c277_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_c277_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_c277
result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_c277 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_c277_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_c277_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_c277_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_c277_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1686_c6_6914_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_b608_return_output,
 n8_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output,
 t8_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1694_c11_c062_return_output,
 n8_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output,
 t8_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1698_c11_57a3_return_output,
 n8_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output,
 t8_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1703_c11_367b_return_output,
 n8_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1707_c11_0f75_return_output,
 n8_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1711_c32_4bae_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1711_c32_bdad_return_output,
 MUX_uxn_opcodes_h_l1711_c32_a7be_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1713_c11_f225_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1e12_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1e12_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1e12_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1e12_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1e12_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1719_c11_1fb7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_b2f5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_b2f5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_b2f5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1719_c7_b2f5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1724_c11_2ae8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_c277_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_c277_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_6914_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_6914_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_6914_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_b608_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_b608_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_b608_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_b608_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1686_c2_94ad_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1686_c2_94ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_94ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_94ad_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1686_c2_94ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1686_c2_94ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_94ad_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_94ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_94ad_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1690_c3_045d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_94ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_94ad_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1687_c3_a873_uxn_opcodes_h_l1687_c3_a873_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1694_c11_c062_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1694_c11_c062_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1694_c11_c062_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1694_c7_cc63_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1694_c7_cc63_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1696_c3_d1b4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_cc63_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_cc63_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_cc63_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_cc63_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1694_c7_cc63_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_cc63_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_cc63_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_57a3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_57a3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_57a3_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1701_c3_4814 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_367b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_367b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_367b_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1703_c7_5a57_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1703_c7_5a57_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1703_c7_5a57_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_5a57_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1705_c3_0272 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_5a57_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_5a57_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_5a57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_5a57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_5a57_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_5a57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_5a57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_5a57_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_5a57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_5a57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_5a57_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1703_c7_5a57_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1703_c7_5a57_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1703_c7_5a57_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_5a57_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_5a57_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_5a57_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_5a57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_5a57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_5a57_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_0f75_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_0f75_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_0f75_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1707_c7_8fab_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1707_c7_8fab_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1707_c7_8fab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_8fab_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_8fab_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1e12_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_8fab_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_8fab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_8fab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1e12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_8fab_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_8fab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_8fab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1e12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_8fab_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_8fab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_8fab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1e12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_8fab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1707_c7_8fab_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1707_c7_8fab_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1e12_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1707_c7_8fab_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_8fab_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_8fab_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_8fab_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_8fab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_8fab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1707_c7_8fab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_8fab_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1711_c32_a7be_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1711_c32_a7be_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1711_c32_a7be_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1711_c32_4bae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1711_c32_4bae_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1711_c32_4bae_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1711_c32_bdad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1711_c32_bdad_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1711_c32_bdad_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1711_c32_a7be_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_f225_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_f225_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_f225_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1e12_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1716_c3_78e9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1e12_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_b2f5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1e12_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1e12_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1e12_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_b2f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1e12_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1e12_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1e12_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_b2f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1e12_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1e12_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1e12_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1e12_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1e12_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1e12_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1719_c7_b2f5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1e12_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1719_c11_1fb7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1719_c11_1fb7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1719_c11_1fb7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_b2f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_b2f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_c277_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_b2f5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_b2f5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1721_c3_a369 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_b2f5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_b2f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_b2f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_b2f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_c277_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_b2f5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1719_c7_b2f5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1719_c7_b2f5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1719_c7_b2f5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1724_c11_2ae8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1724_c11_2ae8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1724_c11_2ae8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_c277_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_c277_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_c277_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_c277_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_c277_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_c277_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1686_l1719_l1707_DUPLICATE_5733_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1686_l1707_DUPLICATE_ce7c_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1686_l1713_DUPLICATE_9d79_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1724_l1719_l1713_l1707_DUPLICATE_b946_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1724_l1707_DUPLICATE_7f60_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1719_l1707_DUPLICATE_a6f9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1729_l1682_DUPLICATE_a656_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1e12_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_f225_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_c277_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1690_c3_045d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1690_c3_045d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_367b_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_0f75_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1e12_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1711_c32_a7be_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_MUX_uxn_opcodes_h_l1711_c32_a7be_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_6914_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_5a57_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1724_c11_2ae8_right := to_unsigned(7, 3);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1711_c32_bdad_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_c277_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1721_c3_a369 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_b2f5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1721_c3_a369;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_b608_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1711_c32_4bae_right := to_unsigned(128, 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_b2f5_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1701_c3_4814 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1701_c3_4814;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1694_c11_c062_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1716_c3_78e9 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1e12_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1716_c3_78e9;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1696_c3_d1b4 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1696_c3_d1b4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_57a3_right := to_unsigned(2, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1705_c3_0272 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_5a57_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1705_c3_0272;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_8fab_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1719_c11_1fb7_right := to_unsigned(6, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_8fab_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_b608_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1711_c32_4bae_left := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1703_c7_5a57_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1707_c7_8fab_iffalse := n8;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1e12_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_6914_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1694_c11_c062_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_57a3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_367b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_0f75_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_f225_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1719_c11_1fb7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1724_c11_2ae8_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1707_c7_8fab_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue := VAR_previous_stack_read;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1719_c7_b2f5_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1694_c11_c062] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1694_c11_c062_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1694_c11_c062_left;
     BIN_OP_EQ_uxn_opcodes_h_l1694_c11_c062_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1694_c11_c062_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1694_c11_c062_return_output := BIN_OP_EQ_uxn_opcodes_h_l1694_c11_c062_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1724_c11_2ae8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1724_c11_2ae8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1724_c11_2ae8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1724_c11_2ae8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1724_c11_2ae8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1724_c11_2ae8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1724_c11_2ae8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1686_l1713_DUPLICATE_9d79 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1686_l1713_DUPLICATE_9d79_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1703_c11_367b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1703_c11_367b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_367b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1703_c11_367b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_367b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_367b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1703_c11_367b_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1711_c32_4bae] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1711_c32_4bae_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1711_c32_4bae_left;
     BIN_OP_AND_uxn_opcodes_h_l1711_c32_4bae_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1711_c32_4bae_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1711_c32_4bae_return_output := BIN_OP_AND_uxn_opcodes_h_l1711_c32_4bae_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1719_l1707_DUPLICATE_a6f9 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1719_l1707_DUPLICATE_a6f9_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1719_c11_1fb7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1719_c11_1fb7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1719_c11_1fb7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1719_c11_1fb7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1719_c11_1fb7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1719_c11_1fb7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1719_c11_1fb7_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1686_l1719_l1707_DUPLICATE_5733 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1686_l1719_l1707_DUPLICATE_5733_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1707_c11_0f75] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1707_c11_0f75_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_0f75_left;
     BIN_OP_EQ_uxn_opcodes_h_l1707_c11_0f75_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_0f75_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_0f75_return_output := BIN_OP_EQ_uxn_opcodes_h_l1707_c11_0f75_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1713_c11_f225] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1713_c11_f225_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_f225_left;
     BIN_OP_EQ_uxn_opcodes_h_l1713_c11_f225_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_f225_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_f225_return_output := BIN_OP_EQ_uxn_opcodes_h_l1713_c11_f225_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1686_c6_6914] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1686_c6_6914_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_6914_left;
     BIN_OP_EQ_uxn_opcodes_h_l1686_c6_6914_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_6914_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_6914_return_output := BIN_OP_EQ_uxn_opcodes_h_l1686_c6_6914_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1724_l1719_l1713_l1707_DUPLICATE_b946 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1724_l1719_l1713_l1707_DUPLICATE_b946_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1724_l1707_DUPLICATE_7f60 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1724_l1707_DUPLICATE_7f60_return_output := result.is_stack_write;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l1707_c7_8fab] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1707_c7_8fab_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1698_c11_57a3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1698_c11_57a3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_57a3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1698_c11_57a3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_57a3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_57a3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1698_c11_57a3_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1686_c2_94ad] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1686_c2_94ad_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1686_l1707_DUPLICATE_ce7c LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1686_l1707_DUPLICATE_ce7c_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1711_c32_bdad_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1711_c32_4bae_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_b608_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_6914_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1686_c2_94ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_6914_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_94ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_6914_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_94ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_6914_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_94ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_6914_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_94ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_6914_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_94ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_6914_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_94ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_6914_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_94ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_6914_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1686_c2_94ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_6914_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1686_c2_94ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_6914_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1694_c7_cc63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1694_c11_c062_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_cc63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1694_c11_c062_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_cc63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1694_c11_c062_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_cc63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1694_c11_c062_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_cc63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1694_c11_c062_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_cc63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1694_c11_c062_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_cc63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1694_c11_c062_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1694_c7_cc63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1694_c11_c062_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1694_c7_cc63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1694_c11_c062_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_57a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_57a3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_57a3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_57a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_57a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_57a3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_57a3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_57a3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_57a3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1703_c7_5a57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_367b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_5a57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_367b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_5a57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_367b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_5a57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_367b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_5a57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_367b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_5a57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_367b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_5a57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_367b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1703_c7_5a57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_367b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1707_c7_8fab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_0f75_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_8fab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_0f75_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_8fab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_0f75_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_8fab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_0f75_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_8fab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_0f75_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_8fab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_0f75_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_8fab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_0f75_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1707_c7_8fab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_0f75_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1e12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_f225_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1e12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_f225_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1e12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_f225_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1e12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_f225_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1e12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_f225_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_b2f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1719_c11_1fb7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_b2f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1719_c11_1fb7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_b2f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1719_c11_1fb7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1719_c7_b2f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1719_c11_1fb7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_c277_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1724_c11_2ae8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_c277_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1724_c11_2ae8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1686_l1707_DUPLICATE_ce7c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1686_l1707_DUPLICATE_ce7c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1686_l1707_DUPLICATE_ce7c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_5a57_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1686_l1707_DUPLICATE_ce7c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_8fab_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1686_l1707_DUPLICATE_ce7c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1724_l1719_l1713_l1707_DUPLICATE_b946_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1724_l1719_l1713_l1707_DUPLICATE_b946_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_5a57_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1724_l1719_l1713_l1707_DUPLICATE_b946_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_8fab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1724_l1719_l1713_l1707_DUPLICATE_b946_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1e12_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1724_l1719_l1713_l1707_DUPLICATE_b946_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_b2f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1724_l1719_l1713_l1707_DUPLICATE_b946_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_c277_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1724_l1719_l1713_l1707_DUPLICATE_b946_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1686_l1713_DUPLICATE_9d79_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1686_l1713_DUPLICATE_9d79_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1686_l1713_DUPLICATE_9d79_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_5a57_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1686_l1713_DUPLICATE_9d79_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1e12_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1686_l1713_DUPLICATE_9d79_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1724_l1707_DUPLICATE_7f60_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1724_l1707_DUPLICATE_7f60_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_5a57_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1724_l1707_DUPLICATE_7f60_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_8fab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1724_l1707_DUPLICATE_7f60_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_c277_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1724_l1707_DUPLICATE_7f60_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_8fab_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1719_l1707_DUPLICATE_a6f9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_b2f5_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1719_l1707_DUPLICATE_a6f9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1686_l1719_l1707_DUPLICATE_5733_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1686_l1719_l1707_DUPLICATE_5733_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1686_l1719_l1707_DUPLICATE_5733_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1703_c7_5a57_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1686_l1719_l1707_DUPLICATE_5733_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1707_c7_8fab_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1686_l1719_l1707_DUPLICATE_5733_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1719_c7_b2f5_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1686_l1719_l1707_DUPLICATE_5733_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1686_c2_94ad_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_8fab_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1707_c7_8fab_return_output;
     -- n8_MUX[uxn_opcodes_h_l1707_c7_8fab] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1707_c7_8fab_cond <= VAR_n8_MUX_uxn_opcodes_h_l1707_c7_8fab_cond;
     n8_MUX_uxn_opcodes_h_l1707_c7_8fab_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1707_c7_8fab_iftrue;
     n8_MUX_uxn_opcodes_h_l1707_c7_8fab_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1707_c7_8fab_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output := n8_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output;

     -- t8_MUX[uxn_opcodes_h_l1698_c7_1f6e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond <= VAR_t8_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond;
     t8_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue;
     t8_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output := t8_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1719_c7_b2f5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_b2f5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_b2f5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_b2f5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_b2f5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_b2f5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_b2f5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_b2f5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_b2f5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1724_c7_c277] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_c277_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_c277_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_c277_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_c277_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_c277_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_c277_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_c277_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_c277_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1711_c32_bdad] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1711_c32_bdad_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1711_c32_bdad_left;
     BIN_OP_GT_uxn_opcodes_h_l1711_c32_bdad_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1711_c32_bdad_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1711_c32_bdad_return_output := BIN_OP_GT_uxn_opcodes_h_l1711_c32_bdad_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1707_c7_8fab] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_8fab_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_8fab_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_8fab_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_8fab_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_8fab_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_8fab_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1713_c7_1e12] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1e12_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1e12_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1e12_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1e12_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1e12_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1e12_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1e12_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1e12_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1686_c2_94ad] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_94ad_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_94ad_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1686_c1_b608] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_b608_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_b608_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_b608_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_b608_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_b608_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_b608_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_b608_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_b608_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1719_c7_b2f5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1719_c7_b2f5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1719_c7_b2f5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1719_c7_b2f5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1719_c7_b2f5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1719_c7_b2f5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1719_c7_b2f5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1719_c7_b2f5_return_output := result_stack_value_MUX_uxn_opcodes_h_l1719_c7_b2f5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1724_c7_c277] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_c277_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_c277_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_c277_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_c277_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_c277_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_c277_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_c277_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_c277_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1711_c32_a7be_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1711_c32_bdad_return_output;
     VAR_printf_uxn_opcodes_h_l1687_c3_a873_uxn_opcodes_h_l1687_c3_a873_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_b608_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1703_c7_5a57_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_b2f5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_c277_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_8fab_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1e12_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_5a57_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_b2f5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_c277_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1e12_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_b2f5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1e12_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1719_c7_b2f5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1707_c7_8fab] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_8fab_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_8fab_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_8fab_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_8fab_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_8fab_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_8fab_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output;

     -- t8_MUX[uxn_opcodes_h_l1694_c7_cc63] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1694_c7_cc63_cond <= VAR_t8_MUX_uxn_opcodes_h_l1694_c7_cc63_cond;
     t8_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue;
     t8_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output := t8_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output;

     -- n8_MUX[uxn_opcodes_h_l1703_c7_5a57] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1703_c7_5a57_cond <= VAR_n8_MUX_uxn_opcodes_h_l1703_c7_5a57_cond;
     n8_MUX_uxn_opcodes_h_l1703_c7_5a57_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1703_c7_5a57_iftrue;
     n8_MUX_uxn_opcodes_h_l1703_c7_5a57_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1703_c7_5a57_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output := n8_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1713_c7_1e12] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1e12_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1e12_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1e12_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1e12_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1e12_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1e12_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1e12_return_output := result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1e12_return_output;

     -- printf_uxn_opcodes_h_l1687_c3_a873[uxn_opcodes_h_l1687_c3_a873] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1687_c3_a873_uxn_opcodes_h_l1687_c3_a873_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1687_c3_a873_uxn_opcodes_h_l1687_c3_a873_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1703_c7_5a57] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_5a57_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_5a57_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_5a57_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_5a57_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_5a57_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_5a57_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1719_c7_b2f5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_b2f5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_b2f5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_b2f5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_b2f5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_b2f5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_b2f5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_b2f5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_b2f5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1719_c7_b2f5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_b2f5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_b2f5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_b2f5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_b2f5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_b2f5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_b2f5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_b2f5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_b2f5_return_output;

     -- MUX[uxn_opcodes_h_l1711_c32_a7be] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1711_c32_a7be_cond <= VAR_MUX_uxn_opcodes_h_l1711_c32_a7be_cond;
     MUX_uxn_opcodes_h_l1711_c32_a7be_iftrue <= VAR_MUX_uxn_opcodes_h_l1711_c32_a7be_iftrue;
     MUX_uxn_opcodes_h_l1711_c32_a7be_iffalse <= VAR_MUX_uxn_opcodes_h_l1711_c32_a7be_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1711_c32_a7be_return_output := MUX_uxn_opcodes_h_l1711_c32_a7be_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1713_c7_1e12] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1e12_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1e12_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1e12_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1e12_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1e12_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1e12_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1e12_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1e12_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_8fab_iftrue := VAR_MUX_uxn_opcodes_h_l1711_c32_a7be_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1e12_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_b2f5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_5a57_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1e12_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_b2f5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_8fab_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1e12_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1707_c7_8fab_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1e12_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output;
     -- n8_MUX[uxn_opcodes_h_l1698_c7_1f6e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond <= VAR_n8_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond;
     n8_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue;
     n8_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output := n8_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output;

     -- t8_MUX[uxn_opcodes_h_l1686_c2_94ad] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1686_c2_94ad_cond <= VAR_t8_MUX_uxn_opcodes_h_l1686_c2_94ad_cond;
     t8_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue;
     t8_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output := t8_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1703_c7_5a57] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_5a57_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_5a57_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_5a57_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_5a57_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_5a57_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_5a57_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1707_c7_8fab] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_8fab_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_8fab_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_8fab_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_8fab_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_8fab_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_8fab_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1707_c7_8fab] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_8fab_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_8fab_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_8fab_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_8fab_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_8fab_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_8fab_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1698_c7_1f6e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1713_c7_1e12] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1e12_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1e12_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1e12_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1e12_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1e12_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1e12_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1e12_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1e12_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1707_c7_8fab] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1707_c7_8fab_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1707_c7_8fab_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1707_c7_8fab_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1707_c7_8fab_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1707_c7_8fab_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1707_c7_8fab_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output := result_stack_value_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1713_c7_1e12] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1e12_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1e12_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1e12_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1e12_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1e12_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1e12_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1e12_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1e12_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_8fab_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1e12_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_8fab_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1e12_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_5a57_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_5a57_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1703_c7_5a57_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1703_c7_5a57] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1703_c7_5a57_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1703_c7_5a57_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1703_c7_5a57_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1703_c7_5a57_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1703_c7_5a57_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1703_c7_5a57_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output := result_stack_value_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1694_c7_cc63] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_cc63_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_cc63_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1703_c7_5a57] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_5a57_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_5a57_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_5a57_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_5a57_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_5a57_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_5a57_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1707_c7_8fab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_8fab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_8fab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_8fab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_8fab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_8fab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_8fab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1698_c7_1f6e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1703_c7_5a57] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_5a57_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_5a57_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_5a57_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_5a57_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_5a57_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_5a57_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output;

     -- n8_MUX[uxn_opcodes_h_l1694_c7_cc63] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1694_c7_cc63_cond <= VAR_n8_MUX_uxn_opcodes_h_l1694_c7_cc63_cond;
     n8_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue;
     n8_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output := n8_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1707_c7_8fab] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_8fab_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_8fab_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_8fab_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_8fab_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_8fab_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_8fab_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_5a57_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_5a57_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_8fab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1698_c7_1f6e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output;

     -- n8_MUX[uxn_opcodes_h_l1686_c2_94ad] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1686_c2_94ad_cond <= VAR_n8_MUX_uxn_opcodes_h_l1686_c2_94ad_cond;
     n8_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue;
     n8_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output := n8_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1698_c7_1f6e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1698_c7_1f6e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1686_c2_94ad] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_94ad_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_94ad_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1703_c7_5a57] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_5a57_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_5a57_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_5a57_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_5a57_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_5a57_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_5a57_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1694_c7_cc63] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_cc63_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_cc63_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1703_c7_5a57] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_5a57_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_5a57_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_5a57_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_5a57_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_5a57_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_5a57_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_5a57_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1694_c7_cc63] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_cc63_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_cc63_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1694_c7_cc63] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1694_c7_cc63_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1694_c7_cc63_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output := result_stack_value_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1694_c7_cc63] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_cc63_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_cc63_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1698_c7_1f6e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1698_c7_1f6e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_1f6e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_1f6e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_1f6e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1686_c2_94ad] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_94ad_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_94ad_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_1f6e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1694_c7_cc63] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_cc63_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_cc63_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1686_c2_94ad] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_94ad_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_94ad_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1694_c7_cc63] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_cc63_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_cc63_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_cc63_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_cc63_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1686_c2_94ad] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_94ad_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_94ad_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1686_c2_94ad] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1686_c2_94ad_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1686_c2_94ad_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output := result_stack_value_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_cc63_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1686_c2_94ad] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_94ad_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_94ad_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1686_c2_94ad] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_94ad_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_94ad_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_94ad_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_94ad_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1729_l1682_DUPLICATE_a656 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1729_l1682_DUPLICATE_a656_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_49dd(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_94ad_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1729_l1682_DUPLICATE_a656_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1729_l1682_DUPLICATE_a656_return_output;
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
