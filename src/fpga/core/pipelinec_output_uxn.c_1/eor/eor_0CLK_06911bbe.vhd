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
-- Submodules: 65
entity eor_0CLK_06911bbe is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end eor_0CLK_06911bbe;
architecture arch of eor_0CLK_06911bbe is
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
-- BIN_OP_EQ[uxn_opcodes_h_l789_c6_086c]
signal BIN_OP_EQ_uxn_opcodes_h_l789_c6_086c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l789_c6_086c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l789_c6_086c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l789_c1_bf8f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_bf8f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_bf8f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_bf8f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_bf8f_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l789_c2_6854]
signal t8_MUX_uxn_opcodes_h_l789_c2_6854_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l789_c2_6854_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l789_c2_6854_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l789_c2_6854_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l789_c2_6854]
signal n8_MUX_uxn_opcodes_h_l789_c2_6854_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l789_c2_6854_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l789_c2_6854_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l789_c2_6854_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l789_c2_6854]
signal result_stack_value_MUX_uxn_opcodes_h_l789_c2_6854_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l789_c2_6854_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l789_c2_6854_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l789_c2_6854_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l789_c2_6854]
signal result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_6854_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_6854_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_6854_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_6854_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l789_c2_6854]
signal result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_6854_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_6854_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_6854_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_6854_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l789_c2_6854]
signal result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_6854_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_6854_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_6854_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_6854_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l789_c2_6854]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_6854_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_6854_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_6854_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_6854_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l789_c2_6854]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_6854_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_6854_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_6854_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_6854_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l789_c2_6854]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_6854_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_6854_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_6854_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_6854_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l789_c2_6854]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_6854_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_6854_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_6854_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_6854_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l790_c3_239b[uxn_opcodes_h_l790_c3_239b]
signal printf_uxn_opcodes_h_l790_c3_239b_uxn_opcodes_h_l790_c3_239b_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l797_c11_05f3]
signal BIN_OP_EQ_uxn_opcodes_h_l797_c11_05f3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l797_c11_05f3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l797_c11_05f3_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l797_c7_45b8]
signal t8_MUX_uxn_opcodes_h_l797_c7_45b8_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l797_c7_45b8_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l797_c7_45b8]
signal n8_MUX_uxn_opcodes_h_l797_c7_45b8_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l797_c7_45b8_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l797_c7_45b8]
signal result_stack_value_MUX_uxn_opcodes_h_l797_c7_45b8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l797_c7_45b8_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l797_c7_45b8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_45b8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_45b8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l797_c7_45b8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_45b8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_45b8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l797_c7_45b8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_45b8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_45b8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l797_c7_45b8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_45b8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_45b8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l797_c7_45b8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_45b8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_45b8_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l797_c7_45b8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_45b8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_45b8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l801_c11_724f]
signal BIN_OP_EQ_uxn_opcodes_h_l801_c11_724f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l801_c11_724f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l801_c11_724f_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l801_c7_e8c7]
signal t8_MUX_uxn_opcodes_h_l801_c7_e8c7_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l801_c7_e8c7]
signal n8_MUX_uxn_opcodes_h_l801_c7_e8c7_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l801_c7_e8c7]
signal result_stack_value_MUX_uxn_opcodes_h_l801_c7_e8c7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l801_c7_e8c7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_e8c7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l801_c7_e8c7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_e8c7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l801_c7_e8c7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_e8c7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l801_c7_e8c7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_e8c7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l801_c7_e8c7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_e8c7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l801_c7_e8c7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_e8c7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l806_c11_b92e]
signal BIN_OP_EQ_uxn_opcodes_h_l806_c11_b92e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l806_c11_b92e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l806_c11_b92e_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l806_c7_3e2c]
signal n8_MUX_uxn_opcodes_h_l806_c7_3e2c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l806_c7_3e2c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l806_c7_3e2c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l806_c7_3e2c]
signal result_stack_value_MUX_uxn_opcodes_h_l806_c7_3e2c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l806_c7_3e2c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l806_c7_3e2c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l806_c7_3e2c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_3e2c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_3e2c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_3e2c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l806_c7_3e2c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_3e2c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_3e2c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_3e2c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l806_c7_3e2c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_3e2c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_3e2c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_3e2c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l806_c7_3e2c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_3e2c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_3e2c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_3e2c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l806_c7_3e2c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_3e2c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_3e2c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_3e2c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l806_c7_3e2c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_3e2c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_3e2c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_3e2c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l810_c11_583d]
signal BIN_OP_EQ_uxn_opcodes_h_l810_c11_583d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l810_c11_583d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l810_c11_583d_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l810_c7_daa6]
signal n8_MUX_uxn_opcodes_h_l810_c7_daa6_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l810_c7_daa6_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l810_c7_daa6_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l810_c7_daa6_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l810_c7_daa6]
signal result_stack_value_MUX_uxn_opcodes_h_l810_c7_daa6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l810_c7_daa6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l810_c7_daa6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l810_c7_daa6_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l810_c7_daa6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_daa6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_daa6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_daa6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_daa6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l810_c7_daa6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_daa6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_daa6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_daa6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_daa6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l810_c7_daa6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_daa6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_daa6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_daa6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_daa6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l810_c7_daa6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_daa6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_daa6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_daa6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_daa6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l810_c7_daa6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_daa6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_daa6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_daa6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_daa6_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l810_c7_daa6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_daa6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_daa6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_daa6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_daa6_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l814_c32_44ab]
signal BIN_OP_AND_uxn_opcodes_h_l814_c32_44ab_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l814_c32_44ab_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l814_c32_44ab_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l814_c32_6c5c]
signal BIN_OP_GT_uxn_opcodes_h_l814_c32_6c5c_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l814_c32_6c5c_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l814_c32_6c5c_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l814_c32_1999]
signal MUX_uxn_opcodes_h_l814_c32_1999_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l814_c32_1999_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l814_c32_1999_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l814_c32_1999_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l816_c11_c757]
signal BIN_OP_EQ_uxn_opcodes_h_l816_c11_c757_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l816_c11_c757_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l816_c11_c757_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l816_c7_41f2]
signal result_stack_value_MUX_uxn_opcodes_h_l816_c7_41f2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l816_c7_41f2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l816_c7_41f2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l816_c7_41f2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l816_c7_41f2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_41f2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_41f2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_41f2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_41f2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l816_c7_41f2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_41f2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_41f2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_41f2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_41f2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l816_c7_41f2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_41f2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_41f2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_41f2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_41f2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l816_c7_41f2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_41f2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_41f2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_41f2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_41f2_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l820_c24_6885]
signal BIN_OP_XOR_uxn_opcodes_h_l820_c24_6885_left : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l820_c24_6885_right : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l820_c24_6885_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l822_c11_0448]
signal BIN_OP_EQ_uxn_opcodes_h_l822_c11_0448_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l822_c11_0448_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l822_c11_0448_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l822_c7_79c0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_79c0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_79c0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_79c0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_79c0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l822_c7_79c0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_79c0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_79c0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_79c0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_79c0_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l789_c6_086c
BIN_OP_EQ_uxn_opcodes_h_l789_c6_086c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l789_c6_086c_left,
BIN_OP_EQ_uxn_opcodes_h_l789_c6_086c_right,
BIN_OP_EQ_uxn_opcodes_h_l789_c6_086c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_bf8f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_bf8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_bf8f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_bf8f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_bf8f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_bf8f_return_output);

-- t8_MUX_uxn_opcodes_h_l789_c2_6854
t8_MUX_uxn_opcodes_h_l789_c2_6854 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l789_c2_6854_cond,
t8_MUX_uxn_opcodes_h_l789_c2_6854_iftrue,
t8_MUX_uxn_opcodes_h_l789_c2_6854_iffalse,
t8_MUX_uxn_opcodes_h_l789_c2_6854_return_output);

-- n8_MUX_uxn_opcodes_h_l789_c2_6854
n8_MUX_uxn_opcodes_h_l789_c2_6854 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l789_c2_6854_cond,
n8_MUX_uxn_opcodes_h_l789_c2_6854_iftrue,
n8_MUX_uxn_opcodes_h_l789_c2_6854_iffalse,
n8_MUX_uxn_opcodes_h_l789_c2_6854_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l789_c2_6854
result_stack_value_MUX_uxn_opcodes_h_l789_c2_6854 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l789_c2_6854_cond,
result_stack_value_MUX_uxn_opcodes_h_l789_c2_6854_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l789_c2_6854_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l789_c2_6854_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_6854
result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_6854 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_6854_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_6854_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_6854_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_6854_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_6854
result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_6854 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_6854_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_6854_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_6854_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_6854_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_6854
result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_6854 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_6854_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_6854_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_6854_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_6854_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_6854
result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_6854 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_6854_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_6854_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_6854_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_6854_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_6854
result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_6854 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_6854_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_6854_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_6854_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_6854_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_6854
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_6854 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_6854_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_6854_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_6854_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_6854_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_6854
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_6854 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_6854_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_6854_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_6854_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_6854_return_output);

-- printf_uxn_opcodes_h_l790_c3_239b_uxn_opcodes_h_l790_c3_239b
printf_uxn_opcodes_h_l790_c3_239b_uxn_opcodes_h_l790_c3_239b : entity work.printf_uxn_opcodes_h_l790_c3_239b_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l790_c3_239b_uxn_opcodes_h_l790_c3_239b_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l797_c11_05f3
BIN_OP_EQ_uxn_opcodes_h_l797_c11_05f3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l797_c11_05f3_left,
BIN_OP_EQ_uxn_opcodes_h_l797_c11_05f3_right,
BIN_OP_EQ_uxn_opcodes_h_l797_c11_05f3_return_output);

-- t8_MUX_uxn_opcodes_h_l797_c7_45b8
t8_MUX_uxn_opcodes_h_l797_c7_45b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l797_c7_45b8_cond,
t8_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue,
t8_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse,
t8_MUX_uxn_opcodes_h_l797_c7_45b8_return_output);

-- n8_MUX_uxn_opcodes_h_l797_c7_45b8
n8_MUX_uxn_opcodes_h_l797_c7_45b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l797_c7_45b8_cond,
n8_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue,
n8_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse,
n8_MUX_uxn_opcodes_h_l797_c7_45b8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l797_c7_45b8
result_stack_value_MUX_uxn_opcodes_h_l797_c7_45b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l797_c7_45b8_cond,
result_stack_value_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l797_c7_45b8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_45b8
result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_45b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_45b8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_45b8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_45b8
result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_45b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_45b8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_45b8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_45b8
result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_45b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_45b8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_45b8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_45b8
result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_45b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_45b8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_45b8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_45b8
result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_45b8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_45b8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_45b8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_45b8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_45b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_45b8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_45b8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l801_c11_724f
BIN_OP_EQ_uxn_opcodes_h_l801_c11_724f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l801_c11_724f_left,
BIN_OP_EQ_uxn_opcodes_h_l801_c11_724f_right,
BIN_OP_EQ_uxn_opcodes_h_l801_c11_724f_return_output);

-- t8_MUX_uxn_opcodes_h_l801_c7_e8c7
t8_MUX_uxn_opcodes_h_l801_c7_e8c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l801_c7_e8c7_cond,
t8_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue,
t8_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse,
t8_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output);

-- n8_MUX_uxn_opcodes_h_l801_c7_e8c7
n8_MUX_uxn_opcodes_h_l801_c7_e8c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l801_c7_e8c7_cond,
n8_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue,
n8_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse,
n8_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l801_c7_e8c7
result_stack_value_MUX_uxn_opcodes_h_l801_c7_e8c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l801_c7_e8c7_cond,
result_stack_value_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_e8c7
result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_e8c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_e8c7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_e8c7
result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_e8c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_e8c7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_e8c7
result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_e8c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_e8c7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_e8c7
result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_e8c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_e8c7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_e8c7
result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_e8c7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_e8c7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_e8c7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_e8c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_e8c7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l806_c11_b92e
BIN_OP_EQ_uxn_opcodes_h_l806_c11_b92e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l806_c11_b92e_left,
BIN_OP_EQ_uxn_opcodes_h_l806_c11_b92e_right,
BIN_OP_EQ_uxn_opcodes_h_l806_c11_b92e_return_output);

-- n8_MUX_uxn_opcodes_h_l806_c7_3e2c
n8_MUX_uxn_opcodes_h_l806_c7_3e2c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l806_c7_3e2c_cond,
n8_MUX_uxn_opcodes_h_l806_c7_3e2c_iftrue,
n8_MUX_uxn_opcodes_h_l806_c7_3e2c_iffalse,
n8_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l806_c7_3e2c
result_stack_value_MUX_uxn_opcodes_h_l806_c7_3e2c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l806_c7_3e2c_cond,
result_stack_value_MUX_uxn_opcodes_h_l806_c7_3e2c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l806_c7_3e2c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_3e2c
result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_3e2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_3e2c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_3e2c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_3e2c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_3e2c
result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_3e2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_3e2c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_3e2c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_3e2c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_3e2c
result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_3e2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_3e2c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_3e2c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_3e2c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_3e2c
result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_3e2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_3e2c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_3e2c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_3e2c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_3e2c
result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_3e2c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_3e2c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_3e2c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_3e2c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_3e2c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_3e2c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_3e2c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_3e2c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_3e2c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l810_c11_583d
BIN_OP_EQ_uxn_opcodes_h_l810_c11_583d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l810_c11_583d_left,
BIN_OP_EQ_uxn_opcodes_h_l810_c11_583d_right,
BIN_OP_EQ_uxn_opcodes_h_l810_c11_583d_return_output);

-- n8_MUX_uxn_opcodes_h_l810_c7_daa6
n8_MUX_uxn_opcodes_h_l810_c7_daa6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l810_c7_daa6_cond,
n8_MUX_uxn_opcodes_h_l810_c7_daa6_iftrue,
n8_MUX_uxn_opcodes_h_l810_c7_daa6_iffalse,
n8_MUX_uxn_opcodes_h_l810_c7_daa6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l810_c7_daa6
result_stack_value_MUX_uxn_opcodes_h_l810_c7_daa6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l810_c7_daa6_cond,
result_stack_value_MUX_uxn_opcodes_h_l810_c7_daa6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l810_c7_daa6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l810_c7_daa6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_daa6
result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_daa6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_daa6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_daa6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_daa6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_daa6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_daa6
result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_daa6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_daa6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_daa6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_daa6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_daa6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_daa6
result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_daa6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_daa6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_daa6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_daa6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_daa6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_daa6
result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_daa6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_daa6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_daa6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_daa6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_daa6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_daa6
result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_daa6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_daa6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_daa6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_daa6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_daa6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_daa6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_daa6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_daa6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_daa6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_daa6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_daa6_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l814_c32_44ab
BIN_OP_AND_uxn_opcodes_h_l814_c32_44ab : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l814_c32_44ab_left,
BIN_OP_AND_uxn_opcodes_h_l814_c32_44ab_right,
BIN_OP_AND_uxn_opcodes_h_l814_c32_44ab_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l814_c32_6c5c
BIN_OP_GT_uxn_opcodes_h_l814_c32_6c5c : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l814_c32_6c5c_left,
BIN_OP_GT_uxn_opcodes_h_l814_c32_6c5c_right,
BIN_OP_GT_uxn_opcodes_h_l814_c32_6c5c_return_output);

-- MUX_uxn_opcodes_h_l814_c32_1999
MUX_uxn_opcodes_h_l814_c32_1999 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l814_c32_1999_cond,
MUX_uxn_opcodes_h_l814_c32_1999_iftrue,
MUX_uxn_opcodes_h_l814_c32_1999_iffalse,
MUX_uxn_opcodes_h_l814_c32_1999_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l816_c11_c757
BIN_OP_EQ_uxn_opcodes_h_l816_c11_c757 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l816_c11_c757_left,
BIN_OP_EQ_uxn_opcodes_h_l816_c11_c757_right,
BIN_OP_EQ_uxn_opcodes_h_l816_c11_c757_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l816_c7_41f2
result_stack_value_MUX_uxn_opcodes_h_l816_c7_41f2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l816_c7_41f2_cond,
result_stack_value_MUX_uxn_opcodes_h_l816_c7_41f2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l816_c7_41f2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l816_c7_41f2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_41f2
result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_41f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_41f2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_41f2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_41f2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_41f2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_41f2
result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_41f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_41f2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_41f2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_41f2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_41f2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_41f2
result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_41f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_41f2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_41f2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_41f2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_41f2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_41f2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_41f2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_41f2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_41f2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_41f2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_41f2_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l820_c24_6885
BIN_OP_XOR_uxn_opcodes_h_l820_c24_6885 : entity work.BIN_OP_XOR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l820_c24_6885_left,
BIN_OP_XOR_uxn_opcodes_h_l820_c24_6885_right,
BIN_OP_XOR_uxn_opcodes_h_l820_c24_6885_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l822_c11_0448
BIN_OP_EQ_uxn_opcodes_h_l822_c11_0448 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l822_c11_0448_left,
BIN_OP_EQ_uxn_opcodes_h_l822_c11_0448_right,
BIN_OP_EQ_uxn_opcodes_h_l822_c11_0448_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_79c0
result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_79c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_79c0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_79c0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_79c0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_79c0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_79c0
result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_79c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_79c0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_79c0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_79c0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_79c0_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l789_c6_086c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_bf8f_return_output,
 t8_MUX_uxn_opcodes_h_l789_c2_6854_return_output,
 n8_MUX_uxn_opcodes_h_l789_c2_6854_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l789_c2_6854_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_6854_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_6854_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_6854_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_6854_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_6854_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_6854_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_6854_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l797_c11_05f3_return_output,
 t8_MUX_uxn_opcodes_h_l797_c7_45b8_return_output,
 n8_MUX_uxn_opcodes_h_l797_c7_45b8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l797_c7_45b8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_45b8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_45b8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_45b8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_45b8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_45b8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_45b8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l801_c11_724f_return_output,
 t8_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output,
 n8_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l806_c11_b92e_return_output,
 n8_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l810_c11_583d_return_output,
 n8_MUX_uxn_opcodes_h_l810_c7_daa6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l810_c7_daa6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_daa6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_daa6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_daa6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_daa6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_daa6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_daa6_return_output,
 BIN_OP_AND_uxn_opcodes_h_l814_c32_44ab_return_output,
 BIN_OP_GT_uxn_opcodes_h_l814_c32_6c5c_return_output,
 MUX_uxn_opcodes_h_l814_c32_1999_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l816_c11_c757_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l816_c7_41f2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_41f2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_41f2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_41f2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_41f2_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l820_c24_6885_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l822_c11_0448_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_79c0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_79c0_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_086c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_086c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_086c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_bf8f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_bf8f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_bf8f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_bf8f_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l789_c2_6854_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l789_c2_6854_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l797_c7_45b8_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l789_c2_6854_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l789_c2_6854_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l789_c2_6854_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l789_c2_6854_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l797_c7_45b8_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l789_c2_6854_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l789_c2_6854_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l789_c2_6854_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l789_c2_6854_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l797_c7_45b8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l789_c2_6854_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l789_c2_6854_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_6854_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_6854_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_45b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_6854_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_6854_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_6854_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_6854_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_45b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_6854_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_6854_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_6854_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_6854_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_45b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_6854_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_6854_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_6854_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_6854_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_45b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_6854_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_6854_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_6854_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_6854_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_45b8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_6854_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_6854_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_6854_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l793_c3_fe5a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_6854_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_45b8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_6854_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_6854_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_6854_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_6854_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l789_c2_6854_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_6854_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_6854_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l790_c3_239b_uxn_opcodes_h_l790_c3_239b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_05f3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_05f3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_05f3_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l797_c7_45b8_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l797_c7_45b8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l797_c7_45b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_45b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_45b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_45b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_45b8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_45b8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l799_c3_303e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_45b8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_724f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_724f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_724f_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l801_c7_e8c7_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l801_c7_e8c7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_e8c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_e8c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_e8c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_e8c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_e8c7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_e8c7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l804_c3_e78e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_e8c7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_b92e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_b92e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_b92e_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l806_c7_3e2c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l806_c7_3e2c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l810_c7_daa6_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l806_c7_3e2c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l806_c7_3e2c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l806_c7_3e2c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c7_daa6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l806_c7_3e2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_3e2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_3e2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_daa6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_3e2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_3e2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_3e2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_daa6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_3e2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_3e2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_3e2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_daa6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_3e2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_3e2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_3e2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_daa6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_3e2c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_3e2c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_3e2c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_daa6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_3e2c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_3e2c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l808_c3_f436 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_3e2c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_daa6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_3e2c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_583d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_583d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_583d_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l810_c7_daa6_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l810_c7_daa6_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l810_c7_daa6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c7_daa6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c7_daa6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_41f2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c7_daa6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_daa6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_daa6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l810_c7_daa6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_daa6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_daa6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_daa6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_41f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_daa6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_daa6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_daa6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_41f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_daa6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_daa6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_daa6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_41f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_daa6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_daa6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_daa6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_daa6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_daa6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_daa6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_41f2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_daa6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l814_c32_1999_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l814_c32_1999_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l814_c32_1999_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l814_c32_44ab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l814_c32_44ab_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l814_c32_44ab_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l814_c32_6c5c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l814_c32_6c5c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l814_c32_6c5c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l814_c32_1999_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_c757_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_c757_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_c757_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_41f2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_41f2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_41f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_41f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_41f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_79c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_41f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_41f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_41f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_41f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_41f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_41f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_79c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_41f2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_41f2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l819_c3_6c06 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_41f2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_41f2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l820_c24_6885_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l820_c24_6885_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l820_c24_6885_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_0448_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_0448_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_0448_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_79c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_79c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_79c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_79c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_79c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_79c0_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l797_l789_l816_l810_l806_l801_DUPLICATE_25e2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l797_l789_l816_l806_l801_DUPLICATE_d8d9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l797_l789_l810_l806_l801_DUPLICATE_6d00_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l797_l822_l810_l806_l801_DUPLICATE_9ef9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l797_l822_l816_l810_l806_l801_DUPLICATE_1a0c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l810_l816_DUPLICATE_97d0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l827_l785_DUPLICATE_b0ca_return_output : opcode_result_t;
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
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_3e2c_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_bf8f_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_6854_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l808_c3_f436 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_3e2c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l808_c3_f436;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l793_c3_fe5a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_6854_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l793_c3_fe5a;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_daa6_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l804_c3_e78e := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l804_c3_e78e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_724f_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_05f3_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_6854_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l814_c32_6c5c_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_79c0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_086c_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_daa6_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_41f2_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_41f2_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l814_c32_1999_iffalse := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_b92e_right := to_unsigned(3, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_0448_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l819_c3_6c06 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_41f2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l819_c3_6c06;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_79c0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_c757_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_583d_right := to_unsigned(4, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l814_c32_44ab_right := to_unsigned(128, 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_6854_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l799_c3_303e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l799_c3_303e;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_6854_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l814_c32_1999_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_bf8f_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l814_c32_44ab_left := VAR_ins;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l820_c24_6885_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l789_c2_6854_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l806_c7_3e2c_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l810_c7_daa6_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_086c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_05f3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_724f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_b92e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_583d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_c757_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_0448_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l810_c7_daa6_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l820_c24_6885_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l789_c2_6854_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse := t8;
     -- BIN_OP_AND[uxn_opcodes_h_l814_c32_44ab] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l814_c32_44ab_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l814_c32_44ab_left;
     BIN_OP_AND_uxn_opcodes_h_l814_c32_44ab_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l814_c32_44ab_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l814_c32_44ab_return_output := BIN_OP_AND_uxn_opcodes_h_l814_c32_44ab_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l797_l822_l810_l806_l801_DUPLICATE_9ef9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l797_l822_l810_l806_l801_DUPLICATE_9ef9_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l797_l789_l816_l806_l801_DUPLICATE_d8d9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l797_l789_l816_l806_l801_DUPLICATE_d8d9_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l810_l816_DUPLICATE_97d0 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l810_l816_DUPLICATE_97d0_return_output := result.stack_address_sp_offset;

     -- BIN_OP_XOR[uxn_opcodes_h_l820_c24_6885] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l820_c24_6885_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l820_c24_6885_left;
     BIN_OP_XOR_uxn_opcodes_h_l820_c24_6885_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l820_c24_6885_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l820_c24_6885_return_output := BIN_OP_XOR_uxn_opcodes_h_l820_c24_6885_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l797_l789_l810_l806_l801_DUPLICATE_6d00 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l797_l789_l810_l806_l801_DUPLICATE_6d00_return_output := result.sp_relative_shift;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l810_c7_daa6] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l810_c7_daa6_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l822_c11_0448] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l822_c11_0448_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_0448_left;
     BIN_OP_EQ_uxn_opcodes_h_l822_c11_0448_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_0448_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_0448_return_output := BIN_OP_EQ_uxn_opcodes_h_l822_c11_0448_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l797_l789_l816_l810_l806_l801_DUPLICATE_25e2 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l797_l789_l816_l810_l806_l801_DUPLICATE_25e2_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l789_c6_086c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l789_c6_086c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_086c_left;
     BIN_OP_EQ_uxn_opcodes_h_l789_c6_086c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_086c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_086c_return_output := BIN_OP_EQ_uxn_opcodes_h_l789_c6_086c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l797_c11_05f3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l797_c11_05f3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_05f3_left;
     BIN_OP_EQ_uxn_opcodes_h_l797_c11_05f3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_05f3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_05f3_return_output := BIN_OP_EQ_uxn_opcodes_h_l797_c11_05f3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l801_c11_724f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l801_c11_724f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_724f_left;
     BIN_OP_EQ_uxn_opcodes_h_l801_c11_724f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_724f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_724f_return_output := BIN_OP_EQ_uxn_opcodes_h_l801_c11_724f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l797_l822_l816_l810_l806_l801_DUPLICATE_1a0c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l797_l822_l816_l810_l806_l801_DUPLICATE_1a0c_return_output := result.is_opc_done;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l789_c2_6854] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l789_c2_6854_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l816_c11_c757] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l816_c11_c757_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_c757_left;
     BIN_OP_EQ_uxn_opcodes_h_l816_c11_c757_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_c757_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_c757_return_output := BIN_OP_EQ_uxn_opcodes_h_l816_c11_c757_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l806_c11_b92e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l806_c11_b92e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_b92e_left;
     BIN_OP_EQ_uxn_opcodes_h_l806_c11_b92e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_b92e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_b92e_return_output := BIN_OP_EQ_uxn_opcodes_h_l806_c11_b92e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l810_c11_583d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l810_c11_583d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_583d_left;
     BIN_OP_EQ_uxn_opcodes_h_l810_c11_583d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_583d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_583d_return_output := BIN_OP_EQ_uxn_opcodes_h_l810_c11_583d_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l814_c32_6c5c_left := VAR_BIN_OP_AND_uxn_opcodes_h_l814_c32_44ab_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_bf8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_086c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l789_c2_6854_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_086c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_6854_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_086c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_6854_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_086c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_6854_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_086c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_6854_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_086c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_6854_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_086c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_6854_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_086c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_6854_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_086c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l789_c2_6854_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_086c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l789_c2_6854_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_086c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l797_c7_45b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_05f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_45b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_05f3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_45b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_05f3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_45b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_05f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_45b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_05f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_45b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_05f3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_45b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_05f3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l797_c7_45b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_05f3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l797_c7_45b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_05f3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l801_c7_e8c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_724f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_e8c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_724f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_e8c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_724f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_e8c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_724f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_e8c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_724f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_e8c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_724f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_e8c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_724f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_e8c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_724f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l801_c7_e8c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_724f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l806_c7_3e2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_b92e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_3e2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_b92e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_3e2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_b92e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_3e2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_b92e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_3e2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_b92e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_3e2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_b92e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_3e2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_b92e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l806_c7_3e2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_b92e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l810_c7_daa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_583d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_daa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_583d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_daa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_583d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_daa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_583d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_daa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_583d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_daa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_583d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_daa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_583d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c7_daa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_583d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_41f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_c757_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_41f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_c757_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_41f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_c757_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_41f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_c757_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_41f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_c757_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_79c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_0448_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_79c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_0448_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_41f2_iftrue := VAR_BIN_OP_XOR_uxn_opcodes_h_l820_c24_6885_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_6854_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l797_l789_l810_l806_l801_DUPLICATE_6d00_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l797_l789_l810_l806_l801_DUPLICATE_6d00_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l797_l789_l810_l806_l801_DUPLICATE_6d00_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_3e2c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l797_l789_l810_l806_l801_DUPLICATE_6d00_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_daa6_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l797_l789_l810_l806_l801_DUPLICATE_6d00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l797_l822_l816_l810_l806_l801_DUPLICATE_1a0c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l797_l822_l816_l810_l806_l801_DUPLICATE_1a0c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_3e2c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l797_l822_l816_l810_l806_l801_DUPLICATE_1a0c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_daa6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l797_l822_l816_l810_l806_l801_DUPLICATE_1a0c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_41f2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l797_l822_l816_l810_l806_l801_DUPLICATE_1a0c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_79c0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l797_l822_l816_l810_l806_l801_DUPLICATE_1a0c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_6854_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l797_l789_l816_l806_l801_DUPLICATE_d8d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l797_l789_l816_l806_l801_DUPLICATE_d8d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l797_l789_l816_l806_l801_DUPLICATE_d8d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_3e2c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l797_l789_l816_l806_l801_DUPLICATE_d8d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_41f2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l797_l789_l816_l806_l801_DUPLICATE_d8d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l797_l822_l810_l806_l801_DUPLICATE_9ef9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l797_l822_l810_l806_l801_DUPLICATE_9ef9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_3e2c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l797_l822_l810_l806_l801_DUPLICATE_9ef9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_daa6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l797_l822_l810_l806_l801_DUPLICATE_9ef9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_79c0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l797_l822_l810_l806_l801_DUPLICATE_9ef9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_daa6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l810_l816_DUPLICATE_97d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_41f2_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l810_l816_DUPLICATE_97d0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l789_c2_6854_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l797_l789_l816_l810_l806_l801_DUPLICATE_25e2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l797_l789_l816_l810_l806_l801_DUPLICATE_25e2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l797_l789_l816_l810_l806_l801_DUPLICATE_25e2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l806_c7_3e2c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l797_l789_l816_l810_l806_l801_DUPLICATE_25e2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c7_daa6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l797_l789_l816_l810_l806_l801_DUPLICATE_25e2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_41f2_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l797_l789_l816_l810_l806_l801_DUPLICATE_25e2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_6854_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l789_c2_6854_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_daa6_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l810_c7_daa6_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l816_c7_41f2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l816_c7_41f2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_41f2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l816_c7_41f2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_41f2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l816_c7_41f2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_41f2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_41f2_return_output := result_stack_value_MUX_uxn_opcodes_h_l816_c7_41f2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l822_c7_79c0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_79c0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_79c0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_79c0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_79c0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_79c0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_79c0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_79c0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_79c0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l789_c1_bf8f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_bf8f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_bf8f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_bf8f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_bf8f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_bf8f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_bf8f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_bf8f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_bf8f_return_output;

     -- n8_MUX[uxn_opcodes_h_l810_c7_daa6] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l810_c7_daa6_cond <= VAR_n8_MUX_uxn_opcodes_h_l810_c7_daa6_cond;
     n8_MUX_uxn_opcodes_h_l810_c7_daa6_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l810_c7_daa6_iftrue;
     n8_MUX_uxn_opcodes_h_l810_c7_daa6_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l810_c7_daa6_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l810_c7_daa6_return_output := n8_MUX_uxn_opcodes_h_l810_c7_daa6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l816_c7_41f2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_41f2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_41f2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_41f2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_41f2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_41f2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_41f2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_41f2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_41f2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l816_c7_41f2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_41f2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_41f2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_41f2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_41f2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_41f2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_41f2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_41f2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_41f2_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l789_c2_6854] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_6854_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_6854_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_6854_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_6854_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_6854_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_6854_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_6854_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_6854_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l810_c7_daa6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_daa6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_daa6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_daa6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_daa6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_daa6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_daa6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_daa6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_daa6_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l814_c32_6c5c] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l814_c32_6c5c_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l814_c32_6c5c_left;
     BIN_OP_GT_uxn_opcodes_h_l814_c32_6c5c_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l814_c32_6c5c_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l814_c32_6c5c_return_output := BIN_OP_GT_uxn_opcodes_h_l814_c32_6c5c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l822_c7_79c0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_79c0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_79c0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_79c0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_79c0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_79c0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_79c0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_79c0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_79c0_return_output;

     -- t8_MUX[uxn_opcodes_h_l801_c7_e8c7] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l801_c7_e8c7_cond <= VAR_t8_MUX_uxn_opcodes_h_l801_c7_e8c7_cond;
     t8_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue;
     t8_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output := t8_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l814_c32_1999_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l814_c32_6c5c_return_output;
     VAR_printf_uxn_opcodes_h_l790_c3_239b_uxn_opcodes_h_l790_c3_239b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_bf8f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l806_c7_3e2c_iffalse := VAR_n8_MUX_uxn_opcodes_h_l810_c7_daa6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_41f2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_79c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_daa6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_41f2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_3e2c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_daa6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_41f2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_79c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_daa6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_41f2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c7_daa6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_41f2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse := VAR_t8_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output;
     -- printf_uxn_opcodes_h_l790_c3_239b[uxn_opcodes_h_l790_c3_239b] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l790_c3_239b_uxn_opcodes_h_l790_c3_239b_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l790_c3_239b_uxn_opcodes_h_l790_c3_239b_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l816_c7_41f2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_41f2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_41f2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_41f2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_41f2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_41f2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_41f2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_41f2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_41f2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l810_c7_daa6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l810_c7_daa6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c7_daa6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l810_c7_daa6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c7_daa6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l810_c7_daa6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c7_daa6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c7_daa6_return_output := result_stack_value_MUX_uxn_opcodes_h_l810_c7_daa6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l816_c7_41f2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_41f2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_41f2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_41f2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_41f2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_41f2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_41f2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_41f2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_41f2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l810_c7_daa6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_daa6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_daa6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_daa6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_daa6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_daa6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_daa6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_daa6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_daa6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l810_c7_daa6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_daa6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_daa6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_daa6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_daa6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_daa6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_daa6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_daa6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_daa6_return_output;

     -- n8_MUX[uxn_opcodes_h_l806_c7_3e2c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l806_c7_3e2c_cond <= VAR_n8_MUX_uxn_opcodes_h_l806_c7_3e2c_cond;
     n8_MUX_uxn_opcodes_h_l806_c7_3e2c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l806_c7_3e2c_iftrue;
     n8_MUX_uxn_opcodes_h_l806_c7_3e2c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l806_c7_3e2c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output := n8_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output;

     -- t8_MUX[uxn_opcodes_h_l797_c7_45b8] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l797_c7_45b8_cond <= VAR_t8_MUX_uxn_opcodes_h_l797_c7_45b8_cond;
     t8_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue;
     t8_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l797_c7_45b8_return_output := t8_MUX_uxn_opcodes_h_l797_c7_45b8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l806_c7_3e2c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_3e2c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_3e2c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_3e2c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_3e2c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_3e2c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_3e2c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output;

     -- MUX[uxn_opcodes_h_l814_c32_1999] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l814_c32_1999_cond <= VAR_MUX_uxn_opcodes_h_l814_c32_1999_cond;
     MUX_uxn_opcodes_h_l814_c32_1999_iftrue <= VAR_MUX_uxn_opcodes_h_l814_c32_1999_iftrue;
     MUX_uxn_opcodes_h_l814_c32_1999_iffalse <= VAR_MUX_uxn_opcodes_h_l814_c32_1999_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l814_c32_1999_return_output := MUX_uxn_opcodes_h_l814_c32_1999_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_daa6_iftrue := VAR_MUX_uxn_opcodes_h_l814_c32_1999_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse := VAR_n8_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_daa6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_41f2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_3e2c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_daa6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_daa6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_41f2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_3e2c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_daa6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l806_c7_3e2c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c7_daa6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l789_c2_6854_iffalse := VAR_t8_MUX_uxn_opcodes_h_l797_c7_45b8_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l801_c7_e8c7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_e8c7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_e8c7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l810_c7_daa6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_daa6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_daa6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_daa6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_daa6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_daa6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_daa6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_daa6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_daa6_return_output;

     -- t8_MUX[uxn_opcodes_h_l789_c2_6854] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l789_c2_6854_cond <= VAR_t8_MUX_uxn_opcodes_h_l789_c2_6854_cond;
     t8_MUX_uxn_opcodes_h_l789_c2_6854_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l789_c2_6854_iftrue;
     t8_MUX_uxn_opcodes_h_l789_c2_6854_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l789_c2_6854_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l789_c2_6854_return_output := t8_MUX_uxn_opcodes_h_l789_c2_6854_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l806_c7_3e2c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_3e2c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_3e2c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_3e2c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_3e2c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_3e2c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_3e2c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output;

     -- n8_MUX[uxn_opcodes_h_l801_c7_e8c7] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l801_c7_e8c7_cond <= VAR_n8_MUX_uxn_opcodes_h_l801_c7_e8c7_cond;
     n8_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue;
     n8_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output := n8_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l810_c7_daa6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_daa6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_daa6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_daa6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_daa6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_daa6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_daa6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_daa6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_daa6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l806_c7_3e2c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_3e2c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_3e2c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_3e2c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_3e2c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_3e2c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_3e2c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l806_c7_3e2c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l806_c7_3e2c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l806_c7_3e2c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l806_c7_3e2c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l806_c7_3e2c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l806_c7_3e2c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l806_c7_3e2c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output := result_stack_value_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l810_c7_daa6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_daa6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_daa6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_daa6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_daa6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_daa6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_daa6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_daa6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_daa6_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse := VAR_n8_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_3e2c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_daa6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_3e2c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_daa6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_3e2c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_daa6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l789_c2_6854_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l806_c7_3e2c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_3e2c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_3e2c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_3e2c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_3e2c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_3e2c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_3e2c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output;

     -- n8_MUX[uxn_opcodes_h_l797_c7_45b8] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l797_c7_45b8_cond <= VAR_n8_MUX_uxn_opcodes_h_l797_c7_45b8_cond;
     n8_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue;
     n8_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l797_c7_45b8_return_output := n8_MUX_uxn_opcodes_h_l797_c7_45b8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l801_c7_e8c7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l801_c7_e8c7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_e8c7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output := result_stack_value_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l806_c7_3e2c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_3e2c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_3e2c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_3e2c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_3e2c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_3e2c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_3e2c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l801_c7_e8c7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_e8c7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_e8c7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l797_c7_45b8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_45b8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_45b8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_45b8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_45b8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l806_c7_3e2c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_3e2c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_3e2c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_3e2c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_3e2c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_3e2c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_3e2c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l801_c7_e8c7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_e8c7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_e8c7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l789_c2_6854_iffalse := VAR_n8_MUX_uxn_opcodes_h_l797_c7_45b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_6854_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_45b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_3e2c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l797_c7_45b8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_45b8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_45b8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_45b8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_45b8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l797_c7_45b8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_45b8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_45b8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_45b8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_45b8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l801_c7_e8c7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_e8c7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_e8c7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l789_c2_6854] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_6854_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_6854_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_6854_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_6854_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_6854_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_6854_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_6854_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_6854_return_output;

     -- n8_MUX[uxn_opcodes_h_l789_c2_6854] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l789_c2_6854_cond <= VAR_n8_MUX_uxn_opcodes_h_l789_c2_6854_cond;
     n8_MUX_uxn_opcodes_h_l789_c2_6854_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l789_c2_6854_iftrue;
     n8_MUX_uxn_opcodes_h_l789_c2_6854_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l789_c2_6854_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l789_c2_6854_return_output := n8_MUX_uxn_opcodes_h_l789_c2_6854_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l801_c7_e8c7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_e8c7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_e8c7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l797_c7_45b8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l797_c7_45b8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l797_c7_45b8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l797_c7_45b8_return_output := result_stack_value_MUX_uxn_opcodes_h_l797_c7_45b8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l801_c7_e8c7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_e8c7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_e8c7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_e8c7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_e8c7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l789_c2_6854_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_6854_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_45b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_e8c7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_6854_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_45b8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l789_c2_6854_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l797_c7_45b8_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l789_c2_6854] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_6854_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_6854_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_6854_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_6854_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_6854_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_6854_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_6854_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_6854_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l789_c2_6854] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_6854_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_6854_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_6854_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_6854_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_6854_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_6854_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_6854_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_6854_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l797_c7_45b8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_45b8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_45b8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_45b8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_45b8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l797_c7_45b8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_45b8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_45b8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_45b8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_45b8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l789_c2_6854] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l789_c2_6854_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l789_c2_6854_cond;
     result_stack_value_MUX_uxn_opcodes_h_l789_c2_6854_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l789_c2_6854_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l789_c2_6854_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l789_c2_6854_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l789_c2_6854_return_output := result_stack_value_MUX_uxn_opcodes_h_l789_c2_6854_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l797_c7_45b8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_45b8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_45b8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_45b8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_45b8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_45b8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_45b8_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_6854_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_45b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_6854_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_45b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_6854_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_45b8_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l789_c2_6854] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_6854_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_6854_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_6854_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_6854_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_6854_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_6854_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_6854_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_6854_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l789_c2_6854] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_6854_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_6854_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_6854_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_6854_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_6854_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_6854_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_6854_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_6854_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l789_c2_6854] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_6854_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_6854_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_6854_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_6854_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_6854_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_6854_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_6854_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_6854_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l827_l785_DUPLICATE_b0ca LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l827_l785_DUPLICATE_b0ca_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_81ab(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l789_c2_6854_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_6854_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_6854_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_6854_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_6854_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_6854_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_6854_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_6854_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l827_l785_DUPLICATE_b0ca_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l827_l785_DUPLICATE_b0ca_return_output;
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
