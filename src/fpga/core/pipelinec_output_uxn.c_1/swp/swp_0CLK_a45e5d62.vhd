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
-- BIN_OP_EQ[uxn_opcodes_h_l1686_c6_a2fc]
signal BIN_OP_EQ_uxn_opcodes_h_l1686_c6_a2fc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1686_c6_a2fc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1686_c6_a2fc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1686_c1_faf7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_faf7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_faf7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_faf7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_faf7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1686_c2_8298]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_8298_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_8298_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1686_c2_8298]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_8298_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_8298_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1686_c2_8298]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_8298_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_8298_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1686_c2_8298]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_8298_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_8298_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1686_c2_8298]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_8298_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_8298_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1686_c2_8298]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_8298_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_8298_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1686_c2_8298]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_8298_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_8298_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1686_c2_8298]
signal result_stack_value_MUX_uxn_opcodes_h_l1686_c2_8298_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1686_c2_8298_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1686_c2_8298]
signal t8_MUX_uxn_opcodes_h_l1686_c2_8298_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1686_c2_8298_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1686_c2_8298]
signal n8_MUX_uxn_opcodes_h_l1686_c2_8298_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1686_c2_8298_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1687_c3_5354[uxn_opcodes_h_l1687_c3_5354]
signal printf_uxn_opcodes_h_l1687_c3_5354_uxn_opcodes_h_l1687_c3_5354_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1694_c11_6f2b]
signal BIN_OP_EQ_uxn_opcodes_h_l1694_c11_6f2b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1694_c11_6f2b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1694_c11_6f2b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1694_c7_29cd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_29cd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1694_c7_29cd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_29cd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1694_c7_29cd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_29cd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1694_c7_29cd]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_29cd_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1694_c7_29cd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_29cd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1694_c7_29cd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_29cd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1694_c7_29cd]
signal result_stack_value_MUX_uxn_opcodes_h_l1694_c7_29cd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1694_c7_29cd]
signal t8_MUX_uxn_opcodes_h_l1694_c7_29cd_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1694_c7_29cd]
signal n8_MUX_uxn_opcodes_h_l1694_c7_29cd_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1698_c11_3ce4]
signal BIN_OP_EQ_uxn_opcodes_h_l1698_c11_3ce4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1698_c11_3ce4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1698_c11_3ce4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1698_c7_06ed]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_06ed_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1698_c7_06ed]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_06ed_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1698_c7_06ed]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_06ed_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1698_c7_06ed]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_06ed_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1698_c7_06ed]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_06ed_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1698_c7_06ed]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_06ed_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1698_c7_06ed]
signal result_stack_value_MUX_uxn_opcodes_h_l1698_c7_06ed_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1698_c7_06ed]
signal t8_MUX_uxn_opcodes_h_l1698_c7_06ed_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1698_c7_06ed]
signal n8_MUX_uxn_opcodes_h_l1698_c7_06ed_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1703_c11_7734]
signal BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7734_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7734_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7734_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1703_c7_4213]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_4213_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_4213_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_4213_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_4213_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1703_c7_4213]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_4213_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_4213_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_4213_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_4213_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1703_c7_4213]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_4213_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_4213_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_4213_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_4213_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1703_c7_4213]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_4213_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_4213_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_4213_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_4213_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1703_c7_4213]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_4213_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_4213_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_4213_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_4213_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1703_c7_4213]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_4213_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_4213_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_4213_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_4213_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1703_c7_4213]
signal result_stack_value_MUX_uxn_opcodes_h_l1703_c7_4213_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1703_c7_4213_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1703_c7_4213_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1703_c7_4213_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1703_c7_4213]
signal n8_MUX_uxn_opcodes_h_l1703_c7_4213_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1703_c7_4213_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1703_c7_4213_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1703_c7_4213_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1707_c11_b8dc]
signal BIN_OP_EQ_uxn_opcodes_h_l1707_c11_b8dc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1707_c11_b8dc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1707_c11_b8dc_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1707_c7_36cd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_36cd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_36cd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_36cd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1707_c7_36cd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_36cd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_36cd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_36cd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1707_c7_36cd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_36cd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_36cd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_36cd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1707_c7_36cd]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_36cd_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_36cd_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_36cd_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1707_c7_36cd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_36cd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_36cd_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_36cd_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1707_c7_36cd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_36cd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_36cd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_36cd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1707_c7_36cd]
signal result_stack_value_MUX_uxn_opcodes_h_l1707_c7_36cd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1707_c7_36cd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1707_c7_36cd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1707_c7_36cd]
signal n8_MUX_uxn_opcodes_h_l1707_c7_36cd_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1707_c7_36cd_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1707_c7_36cd_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1711_c32_5eb1]
signal BIN_OP_AND_uxn_opcodes_h_l1711_c32_5eb1_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1711_c32_5eb1_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1711_c32_5eb1_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1711_c32_a657]
signal BIN_OP_GT_uxn_opcodes_h_l1711_c32_a657_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1711_c32_a657_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1711_c32_a657_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1711_c32_aea8]
signal MUX_uxn_opcodes_h_l1711_c32_aea8_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1711_c32_aea8_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1711_c32_aea8_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1711_c32_aea8_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1713_c11_5706]
signal BIN_OP_EQ_uxn_opcodes_h_l1713_c11_5706_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1713_c11_5706_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1713_c11_5706_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1713_c7_1dd1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1dd1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1dd1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1dd1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1dd1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1713_c7_1dd1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1dd1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1dd1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1dd1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1dd1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1713_c7_1dd1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1dd1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1dd1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1dd1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1dd1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1713_c7_1dd1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1dd1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1dd1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1dd1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1dd1_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1713_c7_1dd1]
signal result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1dd1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1dd1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1dd1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1dd1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1719_c11_5b4a]
signal BIN_OP_EQ_uxn_opcodes_h_l1719_c11_5b4a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1719_c11_5b4a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1719_c11_5b4a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1719_c7_2f22]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_2f22_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_2f22_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_2f22_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_2f22_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1719_c7_2f22]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_2f22_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_2f22_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_2f22_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_2f22_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1719_c7_2f22]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_2f22_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_2f22_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_2f22_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_2f22_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1719_c7_2f22]
signal result_stack_value_MUX_uxn_opcodes_h_l1719_c7_2f22_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1719_c7_2f22_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1719_c7_2f22_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1719_c7_2f22_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1724_c11_d0af]
signal BIN_OP_EQ_uxn_opcodes_h_l1724_c11_d0af_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1724_c11_d0af_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1724_c11_d0af_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1724_c7_5f45]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_5f45_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_5f45_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_5f45_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_5f45_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1724_c7_5f45]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_5f45_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_5f45_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_5f45_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_5f45_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1686_c6_a2fc
BIN_OP_EQ_uxn_opcodes_h_l1686_c6_a2fc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1686_c6_a2fc_left,
BIN_OP_EQ_uxn_opcodes_h_l1686_c6_a2fc_right,
BIN_OP_EQ_uxn_opcodes_h_l1686_c6_a2fc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_faf7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_faf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_faf7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_faf7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_faf7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_faf7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_8298
result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_8298 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_8298_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_8298_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_8298
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_8298 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_8298_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_8298_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_8298
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_8298 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_8298_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_8298_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_8298
result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_8298 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_8298_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_8298_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_8298
result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_8298 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_8298_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_8298_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_8298
result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_8298 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_8298_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_8298_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_8298
result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_8298 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_8298_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_8298_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1686_c2_8298
result_stack_value_MUX_uxn_opcodes_h_l1686_c2_8298 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1686_c2_8298_cond,
result_stack_value_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1686_c2_8298_return_output);

-- t8_MUX_uxn_opcodes_h_l1686_c2_8298
t8_MUX_uxn_opcodes_h_l1686_c2_8298 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1686_c2_8298_cond,
t8_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue,
t8_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse,
t8_MUX_uxn_opcodes_h_l1686_c2_8298_return_output);

-- n8_MUX_uxn_opcodes_h_l1686_c2_8298
n8_MUX_uxn_opcodes_h_l1686_c2_8298 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1686_c2_8298_cond,
n8_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue,
n8_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse,
n8_MUX_uxn_opcodes_h_l1686_c2_8298_return_output);

-- printf_uxn_opcodes_h_l1687_c3_5354_uxn_opcodes_h_l1687_c3_5354
printf_uxn_opcodes_h_l1687_c3_5354_uxn_opcodes_h_l1687_c3_5354 : entity work.printf_uxn_opcodes_h_l1687_c3_5354_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1687_c3_5354_uxn_opcodes_h_l1687_c3_5354_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1694_c11_6f2b
BIN_OP_EQ_uxn_opcodes_h_l1694_c11_6f2b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1694_c11_6f2b_left,
BIN_OP_EQ_uxn_opcodes_h_l1694_c11_6f2b_right,
BIN_OP_EQ_uxn_opcodes_h_l1694_c11_6f2b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_29cd
result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_29cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_29cd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_29cd
result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_29cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_29cd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_29cd
result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_29cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_29cd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_29cd
result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_29cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_29cd_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_29cd
result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_29cd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_29cd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_29cd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_29cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_29cd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1694_c7_29cd
result_stack_value_MUX_uxn_opcodes_h_l1694_c7_29cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1694_c7_29cd_cond,
result_stack_value_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output);

-- t8_MUX_uxn_opcodes_h_l1694_c7_29cd
t8_MUX_uxn_opcodes_h_l1694_c7_29cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1694_c7_29cd_cond,
t8_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue,
t8_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse,
t8_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output);

-- n8_MUX_uxn_opcodes_h_l1694_c7_29cd
n8_MUX_uxn_opcodes_h_l1694_c7_29cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1694_c7_29cd_cond,
n8_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue,
n8_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse,
n8_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1698_c11_3ce4
BIN_OP_EQ_uxn_opcodes_h_l1698_c11_3ce4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1698_c11_3ce4_left,
BIN_OP_EQ_uxn_opcodes_h_l1698_c11_3ce4_right,
BIN_OP_EQ_uxn_opcodes_h_l1698_c11_3ce4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_06ed
result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_06ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_06ed_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_06ed
result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_06ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_06ed_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_06ed
result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_06ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_06ed_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_06ed
result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_06ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_06ed_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_06ed
result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_06ed : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_06ed_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_06ed
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_06ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_06ed_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1698_c7_06ed
result_stack_value_MUX_uxn_opcodes_h_l1698_c7_06ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1698_c7_06ed_cond,
result_stack_value_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output);

-- t8_MUX_uxn_opcodes_h_l1698_c7_06ed
t8_MUX_uxn_opcodes_h_l1698_c7_06ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1698_c7_06ed_cond,
t8_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue,
t8_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse,
t8_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output);

-- n8_MUX_uxn_opcodes_h_l1698_c7_06ed
n8_MUX_uxn_opcodes_h_l1698_c7_06ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1698_c7_06ed_cond,
n8_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue,
n8_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse,
n8_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7734
BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7734 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7734_left,
BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7734_right,
BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7734_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_4213
result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_4213 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_4213_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_4213_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_4213_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_4213_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_4213
result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_4213 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_4213_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_4213_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_4213_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_4213_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_4213
result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_4213 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_4213_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_4213_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_4213_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_4213_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_4213
result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_4213 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_4213_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_4213_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_4213_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_4213_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_4213
result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_4213 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_4213_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_4213_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_4213_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_4213_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_4213
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_4213 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_4213_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_4213_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_4213_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_4213_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1703_c7_4213
result_stack_value_MUX_uxn_opcodes_h_l1703_c7_4213 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1703_c7_4213_cond,
result_stack_value_MUX_uxn_opcodes_h_l1703_c7_4213_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1703_c7_4213_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1703_c7_4213_return_output);

-- n8_MUX_uxn_opcodes_h_l1703_c7_4213
n8_MUX_uxn_opcodes_h_l1703_c7_4213 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1703_c7_4213_cond,
n8_MUX_uxn_opcodes_h_l1703_c7_4213_iftrue,
n8_MUX_uxn_opcodes_h_l1703_c7_4213_iffalse,
n8_MUX_uxn_opcodes_h_l1703_c7_4213_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1707_c11_b8dc
BIN_OP_EQ_uxn_opcodes_h_l1707_c11_b8dc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1707_c11_b8dc_left,
BIN_OP_EQ_uxn_opcodes_h_l1707_c11_b8dc_right,
BIN_OP_EQ_uxn_opcodes_h_l1707_c11_b8dc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_36cd
result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_36cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_36cd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_36cd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_36cd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_36cd
result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_36cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_36cd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_36cd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_36cd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_36cd
result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_36cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_36cd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_36cd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_36cd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_36cd
result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_36cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_36cd_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_36cd_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_36cd_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_36cd
result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_36cd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_36cd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_36cd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_36cd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_36cd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_36cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_36cd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_36cd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_36cd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1707_c7_36cd
result_stack_value_MUX_uxn_opcodes_h_l1707_c7_36cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1707_c7_36cd_cond,
result_stack_value_MUX_uxn_opcodes_h_l1707_c7_36cd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1707_c7_36cd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output);

-- n8_MUX_uxn_opcodes_h_l1707_c7_36cd
n8_MUX_uxn_opcodes_h_l1707_c7_36cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1707_c7_36cd_cond,
n8_MUX_uxn_opcodes_h_l1707_c7_36cd_iftrue,
n8_MUX_uxn_opcodes_h_l1707_c7_36cd_iffalse,
n8_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1711_c32_5eb1
BIN_OP_AND_uxn_opcodes_h_l1711_c32_5eb1 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1711_c32_5eb1_left,
BIN_OP_AND_uxn_opcodes_h_l1711_c32_5eb1_right,
BIN_OP_AND_uxn_opcodes_h_l1711_c32_5eb1_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1711_c32_a657
BIN_OP_GT_uxn_opcodes_h_l1711_c32_a657 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1711_c32_a657_left,
BIN_OP_GT_uxn_opcodes_h_l1711_c32_a657_right,
BIN_OP_GT_uxn_opcodes_h_l1711_c32_a657_return_output);

-- MUX_uxn_opcodes_h_l1711_c32_aea8
MUX_uxn_opcodes_h_l1711_c32_aea8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1711_c32_aea8_cond,
MUX_uxn_opcodes_h_l1711_c32_aea8_iftrue,
MUX_uxn_opcodes_h_l1711_c32_aea8_iffalse,
MUX_uxn_opcodes_h_l1711_c32_aea8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1713_c11_5706
BIN_OP_EQ_uxn_opcodes_h_l1713_c11_5706 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1713_c11_5706_left,
BIN_OP_EQ_uxn_opcodes_h_l1713_c11_5706_right,
BIN_OP_EQ_uxn_opcodes_h_l1713_c11_5706_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1dd1
result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1dd1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1dd1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1dd1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1dd1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1dd1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1dd1
result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1dd1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1dd1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1dd1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1dd1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1dd1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1dd1
result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1dd1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1dd1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1dd1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1dd1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1dd1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1dd1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1dd1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1dd1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1dd1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1dd1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1dd1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1dd1
result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1dd1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1dd1_cond,
result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1dd1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1dd1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1dd1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1719_c11_5b4a
BIN_OP_EQ_uxn_opcodes_h_l1719_c11_5b4a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1719_c11_5b4a_left,
BIN_OP_EQ_uxn_opcodes_h_l1719_c11_5b4a_right,
BIN_OP_EQ_uxn_opcodes_h_l1719_c11_5b4a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_2f22
result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_2f22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_2f22_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_2f22_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_2f22_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_2f22_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_2f22
result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_2f22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_2f22_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_2f22_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_2f22_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_2f22_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_2f22
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_2f22 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_2f22_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_2f22_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_2f22_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_2f22_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1719_c7_2f22
result_stack_value_MUX_uxn_opcodes_h_l1719_c7_2f22 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1719_c7_2f22_cond,
result_stack_value_MUX_uxn_opcodes_h_l1719_c7_2f22_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1719_c7_2f22_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1719_c7_2f22_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1724_c11_d0af
BIN_OP_EQ_uxn_opcodes_h_l1724_c11_d0af : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1724_c11_d0af_left,
BIN_OP_EQ_uxn_opcodes_h_l1724_c11_d0af_right,
BIN_OP_EQ_uxn_opcodes_h_l1724_c11_d0af_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_5f45
result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_5f45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_5f45_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_5f45_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_5f45_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_5f45_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_5f45
result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_5f45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_5f45_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_5f45_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_5f45_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_5f45_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1686_c6_a2fc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_faf7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_8298_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_8298_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_8298_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_8298_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_8298_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_8298_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_8298_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1686_c2_8298_return_output,
 t8_MUX_uxn_opcodes_h_l1686_c2_8298_return_output,
 n8_MUX_uxn_opcodes_h_l1686_c2_8298_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1694_c11_6f2b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output,
 t8_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output,
 n8_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1698_c11_3ce4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output,
 t8_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output,
 n8_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7734_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_4213_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_4213_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_4213_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_4213_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_4213_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_4213_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1703_c7_4213_return_output,
 n8_MUX_uxn_opcodes_h_l1703_c7_4213_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1707_c11_b8dc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output,
 n8_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1711_c32_5eb1_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1711_c32_a657_return_output,
 MUX_uxn_opcodes_h_l1711_c32_aea8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1713_c11_5706_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1dd1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1dd1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1dd1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1dd1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1dd1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1719_c11_5b4a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_2f22_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_2f22_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_2f22_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1719_c7_2f22_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1724_c11_d0af_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_5f45_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_5f45_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_a2fc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_a2fc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_a2fc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_faf7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_faf7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_faf7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_faf7_iffalse : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_8298_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_8298_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1690_c3_b333 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_8298_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_8298_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1686_c2_8298_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_8298_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_8298_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_8298_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_8298_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_8298_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_8298_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_8298_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_8298_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_8298_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_8298_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1686_c2_8298_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1686_c2_8298_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1686_c2_8298_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1686_c2_8298_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1686_c2_8298_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1686_c2_8298_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1687_c3_5354_uxn_opcodes_h_l1687_c3_5354_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1694_c11_6f2b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1694_c11_6f2b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1694_c11_6f2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_29cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_29cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_29cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_29cd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_29cd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1696_c3_a5b7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_29cd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1694_c7_29cd_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1694_c7_29cd_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1694_c7_29cd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_3ce4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_3ce4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_3ce4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_4213_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_06ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_4213_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_06ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_4213_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_06ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_4213_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_06ed_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_4213_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_06ed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1701_c3_7019 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_4213_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_06ed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1703_c7_4213_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1698_c7_06ed_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1698_c7_06ed_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1703_c7_4213_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1698_c7_06ed_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7734_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7734_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7734_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_4213_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_4213_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_4213_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_4213_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_4213_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_4213_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_4213_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_4213_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_4213_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_4213_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_4213_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_4213_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_4213_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_4213_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_4213_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_4213_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1705_c3_d7b1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_4213_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_4213_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1703_c7_4213_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1703_c7_4213_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1703_c7_4213_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1703_c7_4213_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1703_c7_4213_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1703_c7_4213_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_b8dc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_b8dc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_b8dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_36cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_36cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1dd1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_36cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_36cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_36cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1dd1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_36cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_36cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_36cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1dd1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_36cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_36cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_36cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1707_c7_36cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_36cd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_36cd_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_36cd_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_36cd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_36cd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_36cd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1dd1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_36cd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1707_c7_36cd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1707_c7_36cd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1dd1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1707_c7_36cd_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1707_c7_36cd_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1707_c7_36cd_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1707_c7_36cd_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1711_c32_aea8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1711_c32_aea8_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1711_c32_aea8_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1711_c32_5eb1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1711_c32_5eb1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1711_c32_5eb1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1711_c32_a657_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1711_c32_a657_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1711_c32_a657_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1711_c32_aea8_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_5706_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_5706_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_5706_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1dd1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1dd1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1dd1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1dd1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1dd1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_2f22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1dd1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1dd1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1dd1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_2f22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1dd1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1dd1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1716_c3_9c1b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1dd1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_2f22_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1dd1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1dd1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1dd1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1719_c7_2f22_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1dd1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1719_c11_5b4a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1719_c11_5b4a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1719_c11_5b4a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_2f22_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_2f22_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_5f45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_2f22_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_2f22_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_2f22_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_5f45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_2f22_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_2f22_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1721_c3_9760 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_2f22_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_2f22_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1719_c7_2f22_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1719_c7_2f22_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1719_c7_2f22_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1724_c11_d0af_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1724_c11_d0af_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1724_c11_d0af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_5f45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_5f45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_5f45_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_5f45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_5f45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_5f45_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1686_l1707_DUPLICATE_45a1_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1686_l1713_DUPLICATE_c776_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1686_l1719_l1707_DUPLICATE_bfc0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1724_l1707_DUPLICATE_cdbf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1724_l1719_l1713_l1707_DUPLICATE_f01f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1719_l1707_DUPLICATE_8f48_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1729_l1682_DUPLICATE_5eae_return_output : opcode_result_t;
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
     VAR_BIN_OP_AND_uxn_opcodes_h_l1711_c32_5eb1_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_5706_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1701_c3_7019 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1701_c3_7019;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_36cd_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1705_c3_d7b1 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_4213_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1705_c3_d7b1;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1690_c3_b333 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1690_c3_b333;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1716_c3_9c1b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1dd1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1716_c3_9c1b;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_faf7_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1711_c32_a657_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1dd1_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_4213_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_a2fc_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_5f45_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1721_c3_9760 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_2f22_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1721_c3_9760;
     VAR_MUX_uxn_opcodes_h_l1711_c32_aea8_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1dd1_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_36cd_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_5f45_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_3ce4_right := to_unsigned(2, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7734_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_2f22_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_b8dc_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1724_c11_d0af_right := to_unsigned(7, 3);
     VAR_MUX_uxn_opcodes_h_l1711_c32_aea8_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1696_c3_a5b7 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1696_c3_a5b7;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1694_c11_6f2b_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1719_c11_5b4a_right := to_unsigned(6, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_faf7_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1711_c32_5eb1_left := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1703_c7_4213_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1707_c7_36cd_iffalse := n8;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1dd1_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_a2fc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1694_c11_6f2b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_3ce4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7734_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_b8dc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_5706_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1719_c11_5b4a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1724_c11_d0af_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1707_c7_36cd_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue := VAR_previous_stack_read;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1719_c7_2f22_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1719_c11_5b4a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1719_c11_5b4a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1719_c11_5b4a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1719_c11_5b4a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1719_c11_5b4a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1719_c11_5b4a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1719_c11_5b4a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1724_l1707_DUPLICATE_cdbf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1724_l1707_DUPLICATE_cdbf_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1703_c11_7734] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7734_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7734_left;
     BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7734_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7734_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7734_return_output := BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7734_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1686_l1719_l1707_DUPLICATE_bfc0 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1686_l1719_l1707_DUPLICATE_bfc0_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1724_c11_d0af] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1724_c11_d0af_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1724_c11_d0af_left;
     BIN_OP_EQ_uxn_opcodes_h_l1724_c11_d0af_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1724_c11_d0af_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1724_c11_d0af_return_output := BIN_OP_EQ_uxn_opcodes_h_l1724_c11_d0af_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1686_l1713_DUPLICATE_c776 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1686_l1713_DUPLICATE_c776_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1724_l1719_l1713_l1707_DUPLICATE_f01f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1724_l1719_l1713_l1707_DUPLICATE_f01f_return_output := result.is_opc_done;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1686_l1707_DUPLICATE_45a1 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1686_l1707_DUPLICATE_45a1_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1713_c11_5706] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1713_c11_5706_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_5706_left;
     BIN_OP_EQ_uxn_opcodes_h_l1713_c11_5706_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_5706_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_5706_return_output := BIN_OP_EQ_uxn_opcodes_h_l1713_c11_5706_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1686_c6_a2fc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1686_c6_a2fc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_a2fc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1686_c6_a2fc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_a2fc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_a2fc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1686_c6_a2fc_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1711_c32_5eb1] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1711_c32_5eb1_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1711_c32_5eb1_left;
     BIN_OP_AND_uxn_opcodes_h_l1711_c32_5eb1_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1711_c32_5eb1_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1711_c32_5eb1_return_output := BIN_OP_AND_uxn_opcodes_h_l1711_c32_5eb1_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1686_c2_8298] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1686_c2_8298_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1698_c11_3ce4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1698_c11_3ce4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_3ce4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1698_c11_3ce4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_3ce4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_3ce4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1698_c11_3ce4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1694_c11_6f2b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1694_c11_6f2b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1694_c11_6f2b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1694_c11_6f2b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1694_c11_6f2b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1694_c11_6f2b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1694_c11_6f2b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1707_c11_b8dc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1707_c11_b8dc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_b8dc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1707_c11_b8dc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_b8dc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_b8dc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1707_c11_b8dc_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1719_l1707_DUPLICATE_8f48 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1719_l1707_DUPLICATE_8f48_return_output := result.stack_address_sp_offset;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l1707_c7_36cd] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1707_c7_36cd_return_output := result.is_stack_read;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1711_c32_a657_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1711_c32_5eb1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_faf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_a2fc_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1686_c2_8298_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_a2fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_8298_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_a2fc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_8298_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_a2fc_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_8298_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_a2fc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_8298_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_a2fc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_8298_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_a2fc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_8298_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_a2fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_8298_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_a2fc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1686_c2_8298_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_a2fc_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1686_c2_8298_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c6_a2fc_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1694_c7_29cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1694_c11_6f2b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_29cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1694_c11_6f2b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_29cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1694_c11_6f2b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_29cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1694_c11_6f2b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_29cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1694_c11_6f2b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_29cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1694_c11_6f2b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_29cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1694_c11_6f2b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1694_c7_29cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1694_c11_6f2b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1694_c7_29cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1694_c11_6f2b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1698_c7_06ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_3ce4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_06ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_3ce4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_06ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_3ce4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_06ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_3ce4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_06ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_3ce4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_06ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_3ce4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_06ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_3ce4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1698_c7_06ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_3ce4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1698_c7_06ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_3ce4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1703_c7_4213_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7734_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_4213_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7734_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_4213_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7734_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_4213_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7734_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_4213_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7734_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_4213_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7734_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_4213_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7734_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1703_c7_4213_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_7734_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1707_c7_36cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_b8dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_36cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_b8dc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_36cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_b8dc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_36cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_b8dc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_36cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_b8dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_36cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_b8dc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_36cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_b8dc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1707_c7_36cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_b8dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1dd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_5706_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1dd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_5706_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1dd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_5706_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1dd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_5706_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1dd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_5706_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_2f22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1719_c11_5b4a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_2f22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1719_c11_5b4a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_2f22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1719_c11_5b4a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1719_c7_2f22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1719_c11_5b4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_5f45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1724_c11_d0af_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_5f45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1724_c11_d0af_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1686_l1707_DUPLICATE_45a1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1686_l1707_DUPLICATE_45a1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1686_l1707_DUPLICATE_45a1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_4213_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1686_l1707_DUPLICATE_45a1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_36cd_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1686_l1707_DUPLICATE_45a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1724_l1719_l1713_l1707_DUPLICATE_f01f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1724_l1719_l1713_l1707_DUPLICATE_f01f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_4213_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1724_l1719_l1713_l1707_DUPLICATE_f01f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_36cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1724_l1719_l1713_l1707_DUPLICATE_f01f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1dd1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1724_l1719_l1713_l1707_DUPLICATE_f01f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_2f22_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1724_l1719_l1713_l1707_DUPLICATE_f01f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_5f45_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1724_l1719_l1713_l1707_DUPLICATE_f01f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1686_l1713_DUPLICATE_c776_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1686_l1713_DUPLICATE_c776_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1686_l1713_DUPLICATE_c776_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_4213_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1686_l1713_DUPLICATE_c776_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1dd1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1686_l1713_DUPLICATE_c776_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1724_l1707_DUPLICATE_cdbf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1724_l1707_DUPLICATE_cdbf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_4213_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1724_l1707_DUPLICATE_cdbf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_36cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1724_l1707_DUPLICATE_cdbf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_5f45_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1724_l1707_DUPLICATE_cdbf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_36cd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1719_l1707_DUPLICATE_8f48_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_2f22_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1719_l1707_DUPLICATE_8f48_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1686_l1719_l1707_DUPLICATE_bfc0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1686_l1719_l1707_DUPLICATE_bfc0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1686_l1719_l1707_DUPLICATE_bfc0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1703_c7_4213_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1686_l1719_l1707_DUPLICATE_bfc0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1707_c7_36cd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1686_l1719_l1707_DUPLICATE_bfc0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1719_c7_2f22_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1703_l1698_l1694_l1686_l1719_l1707_DUPLICATE_bfc0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1686_c2_8298_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_36cd_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1707_c7_36cd_return_output;
     -- t8_MUX[uxn_opcodes_h_l1698_c7_06ed] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1698_c7_06ed_cond <= VAR_t8_MUX_uxn_opcodes_h_l1698_c7_06ed_cond;
     t8_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue;
     t8_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output := t8_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1707_c7_36cd] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_36cd_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_36cd_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_36cd_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_36cd_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_36cd_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_36cd_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1724_c7_5f45] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_5f45_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_5f45_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_5f45_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_5f45_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_5f45_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_5f45_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_5f45_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_5f45_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1686_c1_faf7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_faf7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_faf7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_faf7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_faf7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_faf7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_faf7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_faf7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_faf7_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1686_c2_8298] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_8298_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_8298_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_8298_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_8298_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1713_c7_1dd1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1dd1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1dd1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1dd1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1dd1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1dd1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1dd1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1dd1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1dd1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1719_c7_2f22] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1719_c7_2f22_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1719_c7_2f22_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1719_c7_2f22_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1719_c7_2f22_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1719_c7_2f22_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1719_c7_2f22_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1719_c7_2f22_return_output := result_stack_value_MUX_uxn_opcodes_h_l1719_c7_2f22_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1719_c7_2f22] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_2f22_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_2f22_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_2f22_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_2f22_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_2f22_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_2f22_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_2f22_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_2f22_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1724_c7_5f45] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_5f45_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_5f45_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_5f45_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_5f45_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_5f45_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_5f45_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_5f45_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_5f45_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1711_c32_a657] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1711_c32_a657_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1711_c32_a657_left;
     BIN_OP_GT_uxn_opcodes_h_l1711_c32_a657_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1711_c32_a657_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1711_c32_a657_return_output := BIN_OP_GT_uxn_opcodes_h_l1711_c32_a657_return_output;

     -- n8_MUX[uxn_opcodes_h_l1707_c7_36cd] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1707_c7_36cd_cond <= VAR_n8_MUX_uxn_opcodes_h_l1707_c7_36cd_cond;
     n8_MUX_uxn_opcodes_h_l1707_c7_36cd_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1707_c7_36cd_iftrue;
     n8_MUX_uxn_opcodes_h_l1707_c7_36cd_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1707_c7_36cd_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output := n8_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1711_c32_aea8_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1711_c32_a657_return_output;
     VAR_printf_uxn_opcodes_h_l1687_c3_5354_uxn_opcodes_h_l1687_c3_5354_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1686_c1_faf7_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1703_c7_4213_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_2f22_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1724_c7_5f45_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_36cd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1713_c7_1dd1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_4213_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_2f22_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1724_c7_5f45_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1dd1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1719_c7_2f22_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1dd1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1719_c7_2f22_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1713_c7_1dd1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1dd1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1dd1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1dd1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1dd1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1dd1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1dd1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1dd1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1dd1_return_output;

     -- t8_MUX[uxn_opcodes_h_l1694_c7_29cd] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1694_c7_29cd_cond <= VAR_t8_MUX_uxn_opcodes_h_l1694_c7_29cd_cond;
     t8_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue;
     t8_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output := t8_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1703_c7_4213] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_4213_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_4213_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_4213_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_4213_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_4213_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_4213_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_4213_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_4213_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1719_c7_2f22] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_2f22_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_2f22_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_2f22_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_2f22_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_2f22_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_2f22_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_2f22_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_2f22_return_output;

     -- n8_MUX[uxn_opcodes_h_l1703_c7_4213] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1703_c7_4213_cond <= VAR_n8_MUX_uxn_opcodes_h_l1703_c7_4213_cond;
     n8_MUX_uxn_opcodes_h_l1703_c7_4213_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1703_c7_4213_iftrue;
     n8_MUX_uxn_opcodes_h_l1703_c7_4213_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1703_c7_4213_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1703_c7_4213_return_output := n8_MUX_uxn_opcodes_h_l1703_c7_4213_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1719_c7_2f22] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_2f22_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_2f22_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_2f22_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_2f22_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_2f22_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_2f22_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_2f22_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_2f22_return_output;

     -- MUX[uxn_opcodes_h_l1711_c32_aea8] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1711_c32_aea8_cond <= VAR_MUX_uxn_opcodes_h_l1711_c32_aea8_cond;
     MUX_uxn_opcodes_h_l1711_c32_aea8_iftrue <= VAR_MUX_uxn_opcodes_h_l1711_c32_aea8_iftrue;
     MUX_uxn_opcodes_h_l1711_c32_aea8_iffalse <= VAR_MUX_uxn_opcodes_h_l1711_c32_aea8_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1711_c32_aea8_return_output := MUX_uxn_opcodes_h_l1711_c32_aea8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1707_c7_36cd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_36cd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_36cd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_36cd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_36cd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_36cd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_36cd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output;

     -- printf_uxn_opcodes_h_l1687_c3_5354[uxn_opcodes_h_l1687_c3_5354] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1687_c3_5354_uxn_opcodes_h_l1687_c3_5354_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1687_c3_5354_uxn_opcodes_h_l1687_c3_5354_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_value_MUX[uxn_opcodes_h_l1713_c7_1dd1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1dd1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1dd1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1dd1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1dd1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1dd1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1dd1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1dd1_return_output := result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1dd1_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_36cd_iftrue := VAR_MUX_uxn_opcodes_h_l1711_c32_aea8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1703_c7_4213_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1dd1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_2f22_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_4213_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1703_c7_4213_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1dd1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1719_c7_2f22_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_36cd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_1dd1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1707_c7_36cd_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1713_c7_1dd1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1707_c7_36cd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1707_c7_36cd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1707_c7_36cd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1707_c7_36cd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1707_c7_36cd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1707_c7_36cd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1707_c7_36cd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output := result_stack_value_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output;

     -- t8_MUX[uxn_opcodes_h_l1686_c2_8298] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1686_c2_8298_cond <= VAR_t8_MUX_uxn_opcodes_h_l1686_c2_8298_cond;
     t8_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue;
     t8_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1686_c2_8298_return_output := t8_MUX_uxn_opcodes_h_l1686_c2_8298_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1713_c7_1dd1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1dd1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1dd1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1dd1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1dd1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1dd1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1dd1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1dd1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1dd1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1713_c7_1dd1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1dd1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1dd1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1dd1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1dd1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1dd1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1dd1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1dd1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1dd1_return_output;

     -- n8_MUX[uxn_opcodes_h_l1698_c7_06ed] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1698_c7_06ed_cond <= VAR_n8_MUX_uxn_opcodes_h_l1698_c7_06ed_cond;
     n8_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue;
     n8_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output := n8_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1707_c7_36cd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_36cd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_36cd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_36cd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_36cd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_36cd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_36cd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1707_c7_36cd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_36cd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_36cd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_36cd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_36cd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_36cd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_36cd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1698_c7_06ed] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_06ed_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_06ed_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1703_c7_4213] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_4213_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_4213_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_4213_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_4213_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_4213_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_4213_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_4213_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_4213_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_36cd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_1dd1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_4213_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_36cd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1713_c7_1dd1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_4213_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_4213_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1703_c7_4213_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1686_c2_8298_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1707_c7_36cd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_36cd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_36cd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_36cd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_36cd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_36cd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_36cd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1698_c7_06ed] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_06ed_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_06ed_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output;

     -- n8_MUX[uxn_opcodes_h_l1694_c7_29cd] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1694_c7_29cd_cond <= VAR_n8_MUX_uxn_opcodes_h_l1694_c7_29cd_cond;
     n8_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue;
     n8_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output := n8_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1703_c7_4213] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_4213_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_4213_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_4213_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_4213_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_4213_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_4213_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_4213_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_4213_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1707_c7_36cd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_36cd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_36cd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_36cd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_36cd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_36cd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_36cd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1703_c7_4213] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1703_c7_4213_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1703_c7_4213_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1703_c7_4213_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1703_c7_4213_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1703_c7_4213_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1703_c7_4213_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1703_c7_4213_return_output := result_stack_value_MUX_uxn_opcodes_h_l1703_c7_4213_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1703_c7_4213] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_4213_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_4213_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_4213_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_4213_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_4213_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_4213_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_4213_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_4213_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1694_c7_29cd] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_29cd_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_29cd_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_4213_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_4213_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1707_c7_36cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_4213_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1703_c7_4213_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1703_c7_4213_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1698_c7_06ed] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_06ed_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_06ed_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1698_c7_06ed] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1698_c7_06ed_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1698_c7_06ed_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output := result_stack_value_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output;

     -- n8_MUX[uxn_opcodes_h_l1686_c2_8298] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1686_c2_8298_cond <= VAR_n8_MUX_uxn_opcodes_h_l1686_c2_8298_cond;
     n8_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue;
     n8_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1686_c2_8298_return_output := n8_MUX_uxn_opcodes_h_l1686_c2_8298_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1698_c7_06ed] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_06ed_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_06ed_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1703_c7_4213] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_4213_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_4213_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_4213_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_4213_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_4213_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_4213_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_4213_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_4213_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1686_c2_8298] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_8298_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_8298_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_8298_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_8298_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1703_c7_4213] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_4213_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_4213_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_4213_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_4213_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_4213_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_4213_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_4213_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_4213_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1694_c7_29cd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_29cd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_29cd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1686_c2_8298_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_4213_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1703_c7_4213_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1686_c2_8298] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_8298_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_8298_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_8298_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_8298_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1698_c7_06ed] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_06ed_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_06ed_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1694_c7_29cd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1694_c7_29cd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1694_c7_29cd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output := result_stack_value_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1698_c7_06ed] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_06ed_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_06ed_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_06ed_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_06ed_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1694_c7_29cd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_29cd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_29cd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1694_c7_29cd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_29cd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_29cd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1698_c7_06ed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1686_c2_8298] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_8298_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_8298_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_8298_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_8298_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1694_c7_29cd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_29cd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_29cd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1694_c7_29cd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_29cd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_29cd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_29cd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_29cd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1686_c2_8298] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_8298_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_8298_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_8298_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_8298_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1686_c2_8298] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1686_c2_8298_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1686_c2_8298_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1686_c2_8298_return_output := result_stack_value_MUX_uxn_opcodes_h_l1686_c2_8298_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1694_c7_29cd_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1686_c2_8298] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_8298_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_8298_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_8298_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_8298_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1686_c2_8298] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_8298_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_8298_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_8298_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_8298_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_8298_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_8298_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1729_l1682_DUPLICATE_5eae LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1729_l1682_DUPLICATE_5eae_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c2_8298_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c2_8298_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1686_c2_8298_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c2_8298_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c2_8298_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c2_8298_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1686_c2_8298_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1686_c2_8298_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1729_l1682_DUPLICATE_5eae_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1729_l1682_DUPLICATE_5eae_return_output;
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
