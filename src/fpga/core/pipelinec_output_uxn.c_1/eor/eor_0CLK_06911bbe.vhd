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
-- BIN_OP_EQ[uxn_opcodes_h_l789_c6_e083]
signal BIN_OP_EQ_uxn_opcodes_h_l789_c6_e083_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l789_c6_e083_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l789_c6_e083_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l789_c1_88a0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_88a0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_88a0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_88a0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_88a0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l789_c2_54b8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_54b8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_54b8_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l789_c2_54b8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_54b8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_54b8_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l789_c2_54b8]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_54b8_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_54b8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l789_c2_54b8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_54b8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_54b8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l789_c2_54b8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_54b8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_54b8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l789_c2_54b8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_54b8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_54b8_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l789_c2_54b8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_54b8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_54b8_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l789_c2_54b8]
signal result_stack_value_MUX_uxn_opcodes_h_l789_c2_54b8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l789_c2_54b8_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l789_c2_54b8]
signal t8_MUX_uxn_opcodes_h_l789_c2_54b8_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l789_c2_54b8_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l789_c2_54b8]
signal n8_MUX_uxn_opcodes_h_l789_c2_54b8_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l789_c2_54b8_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l790_c3_af44[uxn_opcodes_h_l790_c3_af44]
signal printf_uxn_opcodes_h_l790_c3_af44_uxn_opcodes_h_l790_c3_af44_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l797_c11_5517]
signal BIN_OP_EQ_uxn_opcodes_h_l797_c11_5517_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l797_c11_5517_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l797_c11_5517_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l797_c7_1124]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_1124_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_1124_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_1124_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_1124_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l797_c7_1124]
signal result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_1124_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_1124_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_1124_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_1124_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l797_c7_1124]
signal result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_1124_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_1124_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_1124_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_1124_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l797_c7_1124]
signal result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_1124_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_1124_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_1124_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_1124_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l797_c7_1124]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_1124_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_1124_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_1124_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_1124_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l797_c7_1124]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_1124_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_1124_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_1124_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_1124_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l797_c7_1124]
signal result_stack_value_MUX_uxn_opcodes_h_l797_c7_1124_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l797_c7_1124_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l797_c7_1124_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l797_c7_1124_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l797_c7_1124]
signal t8_MUX_uxn_opcodes_h_l797_c7_1124_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l797_c7_1124_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l797_c7_1124_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l797_c7_1124_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l797_c7_1124]
signal n8_MUX_uxn_opcodes_h_l797_c7_1124_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l797_c7_1124_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l797_c7_1124_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l797_c7_1124_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l801_c11_8d6c]
signal BIN_OP_EQ_uxn_opcodes_h_l801_c11_8d6c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l801_c11_8d6c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l801_c11_8d6c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l801_c7_177f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_177f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_177f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_177f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_177f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l801_c7_177f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_177f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_177f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_177f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_177f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l801_c7_177f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_177f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_177f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_177f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_177f_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l801_c7_177f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_177f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_177f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_177f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_177f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l801_c7_177f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_177f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_177f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_177f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_177f_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l801_c7_177f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_177f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_177f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_177f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_177f_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l801_c7_177f]
signal result_stack_value_MUX_uxn_opcodes_h_l801_c7_177f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l801_c7_177f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l801_c7_177f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l801_c7_177f_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l801_c7_177f]
signal t8_MUX_uxn_opcodes_h_l801_c7_177f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l801_c7_177f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l801_c7_177f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l801_c7_177f_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l801_c7_177f]
signal n8_MUX_uxn_opcodes_h_l801_c7_177f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l801_c7_177f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l801_c7_177f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l801_c7_177f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l806_c11_100d]
signal BIN_OP_EQ_uxn_opcodes_h_l806_c11_100d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l806_c11_100d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l806_c11_100d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l806_c7_b67e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b67e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b67e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b67e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b67e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l806_c7_b67e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b67e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b67e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b67e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b67e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l806_c7_b67e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b67e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b67e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b67e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b67e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l806_c7_b67e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b67e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b67e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b67e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b67e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l806_c7_b67e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b67e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b67e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b67e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b67e_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l806_c7_b67e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b67e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b67e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b67e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b67e_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l806_c7_b67e]
signal result_stack_value_MUX_uxn_opcodes_h_l806_c7_b67e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l806_c7_b67e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l806_c7_b67e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l806_c7_b67e_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l806_c7_b67e]
signal n8_MUX_uxn_opcodes_h_l806_c7_b67e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l806_c7_b67e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l806_c7_b67e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l806_c7_b67e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l810_c11_753d]
signal BIN_OP_EQ_uxn_opcodes_h_l810_c11_753d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l810_c11_753d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l810_c11_753d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l810_c7_fa6c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_fa6c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_fa6c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_fa6c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l810_c7_fa6c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_fa6c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_fa6c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_fa6c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l810_c7_fa6c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_fa6c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_fa6c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_fa6c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l810_c7_fa6c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_fa6c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_fa6c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_fa6c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l810_c7_fa6c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_fa6c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_fa6c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_fa6c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l810_c7_fa6c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_fa6c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_fa6c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_fa6c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l810_c7_fa6c]
signal result_stack_value_MUX_uxn_opcodes_h_l810_c7_fa6c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l810_c7_fa6c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l810_c7_fa6c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l810_c7_fa6c]
signal n8_MUX_uxn_opcodes_h_l810_c7_fa6c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l810_c7_fa6c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l810_c7_fa6c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l814_c32_c2a4]
signal BIN_OP_AND_uxn_opcodes_h_l814_c32_c2a4_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l814_c32_c2a4_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l814_c32_c2a4_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l814_c32_a5c0]
signal BIN_OP_GT_uxn_opcodes_h_l814_c32_a5c0_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l814_c32_a5c0_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l814_c32_a5c0_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l814_c32_f831]
signal MUX_uxn_opcodes_h_l814_c32_f831_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l814_c32_f831_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l814_c32_f831_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l814_c32_f831_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l816_c11_274f]
signal BIN_OP_EQ_uxn_opcodes_h_l816_c11_274f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l816_c11_274f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l816_c11_274f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l816_c7_bfa6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_bfa6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_bfa6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_bfa6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_bfa6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l816_c7_bfa6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_bfa6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_bfa6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_bfa6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_bfa6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l816_c7_bfa6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_bfa6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_bfa6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_bfa6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_bfa6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l816_c7_bfa6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_bfa6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_bfa6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_bfa6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_bfa6_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l816_c7_bfa6]
signal result_stack_value_MUX_uxn_opcodes_h_l816_c7_bfa6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l816_c7_bfa6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l816_c7_bfa6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l816_c7_bfa6_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l820_c24_b11e]
signal BIN_OP_XOR_uxn_opcodes_h_l820_c24_b11e_left : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l820_c24_b11e_right : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l820_c24_b11e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l822_c11_6a5e]
signal BIN_OP_EQ_uxn_opcodes_h_l822_c11_6a5e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l822_c11_6a5e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l822_c11_6a5e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l822_c7_beaf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_beaf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_beaf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_beaf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_beaf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l822_c7_beaf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_beaf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_beaf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_beaf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_beaf_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l789_c6_e083
BIN_OP_EQ_uxn_opcodes_h_l789_c6_e083 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l789_c6_e083_left,
BIN_OP_EQ_uxn_opcodes_h_l789_c6_e083_right,
BIN_OP_EQ_uxn_opcodes_h_l789_c6_e083_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_88a0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_88a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_88a0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_88a0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_88a0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_88a0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_54b8
result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_54b8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_54b8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_54b8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_54b8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_54b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_54b8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_54b8_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_54b8
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_54b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_54b8_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_54b8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_54b8
result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_54b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_54b8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_54b8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_54b8
result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_54b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_54b8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_54b8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_54b8
result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_54b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_54b8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_54b8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_54b8
result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_54b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_54b8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_54b8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l789_c2_54b8
result_stack_value_MUX_uxn_opcodes_h_l789_c2_54b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l789_c2_54b8_cond,
result_stack_value_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l789_c2_54b8_return_output);

-- t8_MUX_uxn_opcodes_h_l789_c2_54b8
t8_MUX_uxn_opcodes_h_l789_c2_54b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l789_c2_54b8_cond,
t8_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue,
t8_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse,
t8_MUX_uxn_opcodes_h_l789_c2_54b8_return_output);

-- n8_MUX_uxn_opcodes_h_l789_c2_54b8
n8_MUX_uxn_opcodes_h_l789_c2_54b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l789_c2_54b8_cond,
n8_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue,
n8_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse,
n8_MUX_uxn_opcodes_h_l789_c2_54b8_return_output);

-- printf_uxn_opcodes_h_l790_c3_af44_uxn_opcodes_h_l790_c3_af44
printf_uxn_opcodes_h_l790_c3_af44_uxn_opcodes_h_l790_c3_af44 : entity work.printf_uxn_opcodes_h_l790_c3_af44_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l790_c3_af44_uxn_opcodes_h_l790_c3_af44_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l797_c11_5517
BIN_OP_EQ_uxn_opcodes_h_l797_c11_5517 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l797_c11_5517_left,
BIN_OP_EQ_uxn_opcodes_h_l797_c11_5517_right,
BIN_OP_EQ_uxn_opcodes_h_l797_c11_5517_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_1124
result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_1124 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_1124_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_1124_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_1124_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_1124_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_1124
result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_1124 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_1124_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_1124_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_1124_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_1124_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_1124
result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_1124 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_1124_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_1124_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_1124_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_1124_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_1124
result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_1124 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_1124_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_1124_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_1124_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_1124_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_1124
result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_1124 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_1124_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_1124_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_1124_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_1124_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_1124
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_1124 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_1124_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_1124_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_1124_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_1124_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l797_c7_1124
result_stack_value_MUX_uxn_opcodes_h_l797_c7_1124 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l797_c7_1124_cond,
result_stack_value_MUX_uxn_opcodes_h_l797_c7_1124_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l797_c7_1124_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l797_c7_1124_return_output);

-- t8_MUX_uxn_opcodes_h_l797_c7_1124
t8_MUX_uxn_opcodes_h_l797_c7_1124 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l797_c7_1124_cond,
t8_MUX_uxn_opcodes_h_l797_c7_1124_iftrue,
t8_MUX_uxn_opcodes_h_l797_c7_1124_iffalse,
t8_MUX_uxn_opcodes_h_l797_c7_1124_return_output);

-- n8_MUX_uxn_opcodes_h_l797_c7_1124
n8_MUX_uxn_opcodes_h_l797_c7_1124 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l797_c7_1124_cond,
n8_MUX_uxn_opcodes_h_l797_c7_1124_iftrue,
n8_MUX_uxn_opcodes_h_l797_c7_1124_iffalse,
n8_MUX_uxn_opcodes_h_l797_c7_1124_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l801_c11_8d6c
BIN_OP_EQ_uxn_opcodes_h_l801_c11_8d6c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l801_c11_8d6c_left,
BIN_OP_EQ_uxn_opcodes_h_l801_c11_8d6c_right,
BIN_OP_EQ_uxn_opcodes_h_l801_c11_8d6c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_177f
result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_177f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_177f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_177f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_177f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_177f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_177f
result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_177f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_177f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_177f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_177f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_177f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_177f
result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_177f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_177f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_177f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_177f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_177f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_177f
result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_177f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_177f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_177f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_177f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_177f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_177f
result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_177f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_177f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_177f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_177f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_177f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_177f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_177f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_177f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_177f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_177f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_177f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l801_c7_177f
result_stack_value_MUX_uxn_opcodes_h_l801_c7_177f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l801_c7_177f_cond,
result_stack_value_MUX_uxn_opcodes_h_l801_c7_177f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l801_c7_177f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l801_c7_177f_return_output);

-- t8_MUX_uxn_opcodes_h_l801_c7_177f
t8_MUX_uxn_opcodes_h_l801_c7_177f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l801_c7_177f_cond,
t8_MUX_uxn_opcodes_h_l801_c7_177f_iftrue,
t8_MUX_uxn_opcodes_h_l801_c7_177f_iffalse,
t8_MUX_uxn_opcodes_h_l801_c7_177f_return_output);

-- n8_MUX_uxn_opcodes_h_l801_c7_177f
n8_MUX_uxn_opcodes_h_l801_c7_177f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l801_c7_177f_cond,
n8_MUX_uxn_opcodes_h_l801_c7_177f_iftrue,
n8_MUX_uxn_opcodes_h_l801_c7_177f_iffalse,
n8_MUX_uxn_opcodes_h_l801_c7_177f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l806_c11_100d
BIN_OP_EQ_uxn_opcodes_h_l806_c11_100d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l806_c11_100d_left,
BIN_OP_EQ_uxn_opcodes_h_l806_c11_100d_right,
BIN_OP_EQ_uxn_opcodes_h_l806_c11_100d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b67e
result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b67e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b67e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b67e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b67e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b67e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b67e
result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b67e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b67e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b67e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b67e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b67e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b67e
result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b67e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b67e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b67e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b67e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b67e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b67e
result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b67e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b67e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b67e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b67e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b67e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b67e
result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b67e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b67e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b67e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b67e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b67e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b67e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b67e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b67e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b67e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b67e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b67e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l806_c7_b67e
result_stack_value_MUX_uxn_opcodes_h_l806_c7_b67e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l806_c7_b67e_cond,
result_stack_value_MUX_uxn_opcodes_h_l806_c7_b67e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l806_c7_b67e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l806_c7_b67e_return_output);

-- n8_MUX_uxn_opcodes_h_l806_c7_b67e
n8_MUX_uxn_opcodes_h_l806_c7_b67e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l806_c7_b67e_cond,
n8_MUX_uxn_opcodes_h_l806_c7_b67e_iftrue,
n8_MUX_uxn_opcodes_h_l806_c7_b67e_iffalse,
n8_MUX_uxn_opcodes_h_l806_c7_b67e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l810_c11_753d
BIN_OP_EQ_uxn_opcodes_h_l810_c11_753d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l810_c11_753d_left,
BIN_OP_EQ_uxn_opcodes_h_l810_c11_753d_right,
BIN_OP_EQ_uxn_opcodes_h_l810_c11_753d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_fa6c
result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_fa6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_fa6c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_fa6c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_fa6c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_fa6c
result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_fa6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_fa6c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_fa6c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_fa6c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_fa6c
result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_fa6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_fa6c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_fa6c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_fa6c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_fa6c
result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_fa6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_fa6c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_fa6c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_fa6c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_fa6c
result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_fa6c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_fa6c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_fa6c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_fa6c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_fa6c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_fa6c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_fa6c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_fa6c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_fa6c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l810_c7_fa6c
result_stack_value_MUX_uxn_opcodes_h_l810_c7_fa6c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l810_c7_fa6c_cond,
result_stack_value_MUX_uxn_opcodes_h_l810_c7_fa6c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l810_c7_fa6c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output);

-- n8_MUX_uxn_opcodes_h_l810_c7_fa6c
n8_MUX_uxn_opcodes_h_l810_c7_fa6c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l810_c7_fa6c_cond,
n8_MUX_uxn_opcodes_h_l810_c7_fa6c_iftrue,
n8_MUX_uxn_opcodes_h_l810_c7_fa6c_iffalse,
n8_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l814_c32_c2a4
BIN_OP_AND_uxn_opcodes_h_l814_c32_c2a4 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l814_c32_c2a4_left,
BIN_OP_AND_uxn_opcodes_h_l814_c32_c2a4_right,
BIN_OP_AND_uxn_opcodes_h_l814_c32_c2a4_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l814_c32_a5c0
BIN_OP_GT_uxn_opcodes_h_l814_c32_a5c0 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l814_c32_a5c0_left,
BIN_OP_GT_uxn_opcodes_h_l814_c32_a5c0_right,
BIN_OP_GT_uxn_opcodes_h_l814_c32_a5c0_return_output);

-- MUX_uxn_opcodes_h_l814_c32_f831
MUX_uxn_opcodes_h_l814_c32_f831 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l814_c32_f831_cond,
MUX_uxn_opcodes_h_l814_c32_f831_iftrue,
MUX_uxn_opcodes_h_l814_c32_f831_iffalse,
MUX_uxn_opcodes_h_l814_c32_f831_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l816_c11_274f
BIN_OP_EQ_uxn_opcodes_h_l816_c11_274f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l816_c11_274f_left,
BIN_OP_EQ_uxn_opcodes_h_l816_c11_274f_right,
BIN_OP_EQ_uxn_opcodes_h_l816_c11_274f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_bfa6
result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_bfa6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_bfa6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_bfa6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_bfa6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_bfa6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_bfa6
result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_bfa6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_bfa6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_bfa6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_bfa6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_bfa6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_bfa6
result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_bfa6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_bfa6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_bfa6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_bfa6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_bfa6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_bfa6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_bfa6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_bfa6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_bfa6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_bfa6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_bfa6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l816_c7_bfa6
result_stack_value_MUX_uxn_opcodes_h_l816_c7_bfa6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l816_c7_bfa6_cond,
result_stack_value_MUX_uxn_opcodes_h_l816_c7_bfa6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l816_c7_bfa6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l816_c7_bfa6_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l820_c24_b11e
BIN_OP_XOR_uxn_opcodes_h_l820_c24_b11e : entity work.BIN_OP_XOR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l820_c24_b11e_left,
BIN_OP_XOR_uxn_opcodes_h_l820_c24_b11e_right,
BIN_OP_XOR_uxn_opcodes_h_l820_c24_b11e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l822_c11_6a5e
BIN_OP_EQ_uxn_opcodes_h_l822_c11_6a5e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l822_c11_6a5e_left,
BIN_OP_EQ_uxn_opcodes_h_l822_c11_6a5e_right,
BIN_OP_EQ_uxn_opcodes_h_l822_c11_6a5e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_beaf
result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_beaf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_beaf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_beaf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_beaf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_beaf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_beaf
result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_beaf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_beaf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_beaf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_beaf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_beaf_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l789_c6_e083_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_88a0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_54b8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_54b8_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_54b8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_54b8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_54b8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_54b8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_54b8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l789_c2_54b8_return_output,
 t8_MUX_uxn_opcodes_h_l789_c2_54b8_return_output,
 n8_MUX_uxn_opcodes_h_l789_c2_54b8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l797_c11_5517_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_1124_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_1124_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_1124_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_1124_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_1124_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_1124_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l797_c7_1124_return_output,
 t8_MUX_uxn_opcodes_h_l797_c7_1124_return_output,
 n8_MUX_uxn_opcodes_h_l797_c7_1124_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l801_c11_8d6c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_177f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_177f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_177f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_177f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_177f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_177f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l801_c7_177f_return_output,
 t8_MUX_uxn_opcodes_h_l801_c7_177f_return_output,
 n8_MUX_uxn_opcodes_h_l801_c7_177f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l806_c11_100d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b67e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b67e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b67e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b67e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b67e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b67e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l806_c7_b67e_return_output,
 n8_MUX_uxn_opcodes_h_l806_c7_b67e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l810_c11_753d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output,
 n8_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output,
 BIN_OP_AND_uxn_opcodes_h_l814_c32_c2a4_return_output,
 BIN_OP_GT_uxn_opcodes_h_l814_c32_a5c0_return_output,
 MUX_uxn_opcodes_h_l814_c32_f831_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l816_c11_274f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_bfa6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_bfa6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_bfa6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_bfa6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l816_c7_bfa6_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l820_c24_b11e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l822_c11_6a5e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_beaf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_beaf_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_e083_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_e083_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_e083_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_88a0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_88a0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_88a0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_88a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_1124_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_54b8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_54b8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l793_c3_81a1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_1124_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_54b8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_54b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l789_c2_54b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_54b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_54b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_1124_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_54b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_54b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_1124_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_54b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_54b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_1124_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_54b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_54b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_1124_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_54b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_54b8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l797_c7_1124_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l789_c2_54b8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l789_c2_54b8_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l797_c7_1124_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l789_c2_54b8_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l789_c2_54b8_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l797_c7_1124_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l789_c2_54b8_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l789_c2_54b8_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l790_c3_af44_uxn_opcodes_h_l790_c3_af44_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_5517_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_5517_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_5517_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_1124_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_1124_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_177f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_1124_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_1124_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_1124_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_177f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_1124_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_1124_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_1124_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_177f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_1124_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_1124_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_1124_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_177f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_1124_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_1124_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_1124_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_177f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_1124_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_1124_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l799_c3_f55a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_1124_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_177f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_1124_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l797_c7_1124_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l797_c7_1124_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_177f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l797_c7_1124_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l797_c7_1124_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l797_c7_1124_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l801_c7_177f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l797_c7_1124_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l797_c7_1124_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l797_c7_1124_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l801_c7_177f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l797_c7_1124_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_8d6c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_8d6c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_8d6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_177f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_177f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b67e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_177f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_177f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_177f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b67e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_177f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_177f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_177f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b67e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_177f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_177f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_177f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b67e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_177f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_177f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_177f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b67e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_177f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_177f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l804_c3_1fa8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_177f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b67e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_177f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_177f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_177f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l806_c7_b67e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_177f_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l801_c7_177f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l801_c7_177f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l801_c7_177f_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l801_c7_177f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l801_c7_177f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l806_c7_b67e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l801_c7_177f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_100d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_100d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_100d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b67e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b67e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b67e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b67e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b67e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b67e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b67e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b67e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b67e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b67e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b67e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b67e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b67e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b67e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b67e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b67e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l808_c3_ea6d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b67e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b67e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l806_c7_b67e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l806_c7_b67e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l806_c7_b67e_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l806_c7_b67e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l806_c7_b67e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l806_c7_b67e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_753d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_753d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_753d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_fa6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_fa6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_bfa6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_fa6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_fa6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_fa6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_bfa6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_fa6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_fa6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_fa6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_bfa6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_fa6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_fa6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_fa6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l810_c7_fa6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_fa6c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_fa6c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_fa6c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_fa6c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_fa6c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_fa6c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_bfa6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_fa6c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c7_fa6c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c7_fa6c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_bfa6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c7_fa6c_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l810_c7_fa6c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l810_c7_fa6c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l810_c7_fa6c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l814_c32_f831_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l814_c32_f831_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l814_c32_f831_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l814_c32_c2a4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l814_c32_c2a4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l814_c32_c2a4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l814_c32_a5c0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l814_c32_a5c0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l814_c32_a5c0_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l814_c32_f831_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_274f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_274f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_274f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_bfa6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_bfa6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_bfa6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_bfa6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_bfa6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_beaf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_bfa6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_bfa6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_bfa6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_beaf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_bfa6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_bfa6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l819_c3_d0fb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_bfa6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_bfa6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_bfa6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_bfa6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_bfa6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l820_c24_b11e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l820_c24_b11e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l820_c24_b11e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_6a5e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_6a5e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_6a5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_beaf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_beaf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_beaf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_beaf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_beaf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_beaf_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l797_l789_l810_l806_l801_DUPLICATE_536f_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l797_l789_l816_l806_l801_DUPLICATE_f7e1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l797_l789_l816_l810_l806_l801_DUPLICATE_42ed_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l797_l822_l810_l806_l801_DUPLICATE_082a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l797_l822_l816_l810_l806_l801_DUPLICATE_65f5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l810_l816_DUPLICATE_b312_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l827_l785_DUPLICATE_82c5_return_output : opcode_result_t;
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
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_fa6c_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b67e_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_753d_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l814_c32_f831_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_MUX_uxn_opcodes_h_l814_c32_f831_iffalse := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_6a5e_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l808_c3_ea6d := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b67e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l808_c3_ea6d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_8d6c_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_100d_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l804_c3_1fa8 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_177f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l804_c3_1fa8;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l799_c3_f55a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_1124_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l799_c3_f55a;
     VAR_BIN_OP_AND_uxn_opcodes_h_l814_c32_c2a4_right := to_unsigned(128, 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_bfa6_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_5517_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_fa6c_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l819_c3_d0fb := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_bfa6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l819_c3_d0fb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_e083_right := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l814_c32_a5c0_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l793_c3_81a1 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l793_c3_81a1;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_177f_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_1124_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_bfa6_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_88a0_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_274f_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_beaf_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_beaf_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_88a0_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l814_c32_c2a4_left := VAR_ins;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l820_c24_b11e_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l797_c7_1124_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l801_c7_177f_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l806_c7_b67e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l810_c7_fa6c_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_e083_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_5517_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_8d6c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_100d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_753d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_274f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_6a5e_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l810_c7_fa6c_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l801_c7_177f_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l820_c24_b11e_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l797_c7_1124_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l801_c7_177f_iffalse := t8;
     -- BIN_OP_XOR[uxn_opcodes_h_l820_c24_b11e] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l820_c24_b11e_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l820_c24_b11e_left;
     BIN_OP_XOR_uxn_opcodes_h_l820_c24_b11e_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l820_c24_b11e_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l820_c24_b11e_return_output := BIN_OP_XOR_uxn_opcodes_h_l820_c24_b11e_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l797_l789_l816_l810_l806_l801_DUPLICATE_42ed LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l797_l789_l816_l810_l806_l801_DUPLICATE_42ed_return_output := result.stack_value;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l789_c2_54b8] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l789_c2_54b8_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l822_c11_6a5e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l822_c11_6a5e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_6a5e_left;
     BIN_OP_EQ_uxn_opcodes_h_l822_c11_6a5e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_6a5e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_6a5e_return_output := BIN_OP_EQ_uxn_opcodes_h_l822_c11_6a5e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l789_c6_e083] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l789_c6_e083_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_e083_left;
     BIN_OP_EQ_uxn_opcodes_h_l789_c6_e083_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_e083_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_e083_return_output := BIN_OP_EQ_uxn_opcodes_h_l789_c6_e083_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l797_l789_l816_l806_l801_DUPLICATE_f7e1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l797_l789_l816_l806_l801_DUPLICATE_f7e1_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l810_l816_DUPLICATE_b312 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l810_l816_DUPLICATE_b312_return_output := result.stack_address_sp_offset;

     -- BIN_OP_AND[uxn_opcodes_h_l814_c32_c2a4] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l814_c32_c2a4_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l814_c32_c2a4_left;
     BIN_OP_AND_uxn_opcodes_h_l814_c32_c2a4_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l814_c32_c2a4_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l814_c32_c2a4_return_output := BIN_OP_AND_uxn_opcodes_h_l814_c32_c2a4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l816_c11_274f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l816_c11_274f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_274f_left;
     BIN_OP_EQ_uxn_opcodes_h_l816_c11_274f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_274f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_274f_return_output := BIN_OP_EQ_uxn_opcodes_h_l816_c11_274f_return_output;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l810_c7_fa6c] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l810_c7_fa6c_return_output := result.is_stack_read;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l797_l789_l810_l806_l801_DUPLICATE_536f LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l797_l789_l810_l806_l801_DUPLICATE_536f_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l801_c11_8d6c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l801_c11_8d6c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_8d6c_left;
     BIN_OP_EQ_uxn_opcodes_h_l801_c11_8d6c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_8d6c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_8d6c_return_output := BIN_OP_EQ_uxn_opcodes_h_l801_c11_8d6c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l797_l822_l810_l806_l801_DUPLICATE_082a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l797_l822_l810_l806_l801_DUPLICATE_082a_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l810_c11_753d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l810_c11_753d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_753d_left;
     BIN_OP_EQ_uxn_opcodes_h_l810_c11_753d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_753d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_753d_return_output := BIN_OP_EQ_uxn_opcodes_h_l810_c11_753d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l797_l822_l816_l810_l806_l801_DUPLICATE_65f5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l797_l822_l816_l810_l806_l801_DUPLICATE_65f5_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l806_c11_100d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l806_c11_100d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_100d_left;
     BIN_OP_EQ_uxn_opcodes_h_l806_c11_100d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_100d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_100d_return_output := BIN_OP_EQ_uxn_opcodes_h_l806_c11_100d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l797_c11_5517] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l797_c11_5517_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_5517_left;
     BIN_OP_EQ_uxn_opcodes_h_l797_c11_5517_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_5517_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_5517_return_output := BIN_OP_EQ_uxn_opcodes_h_l797_c11_5517_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l814_c32_a5c0_left := VAR_BIN_OP_AND_uxn_opcodes_h_l814_c32_c2a4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_88a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_e083_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l789_c2_54b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_e083_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_54b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_e083_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_54b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_e083_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_54b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_e083_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_54b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_e083_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_54b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_e083_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_54b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_e083_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_54b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_e083_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l789_c2_54b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_e083_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l789_c2_54b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_e083_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l797_c7_1124_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_5517_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_1124_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_5517_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_1124_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_5517_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_1124_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_5517_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_1124_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_5517_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_1124_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_5517_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_1124_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_5517_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l797_c7_1124_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_5517_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l797_c7_1124_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_5517_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l801_c7_177f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_8d6c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_177f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_8d6c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_177f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_8d6c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_177f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_8d6c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_177f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_8d6c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_177f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_8d6c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_177f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_8d6c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_177f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_8d6c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l801_c7_177f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_8d6c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l806_c7_b67e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_100d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b67e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_100d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b67e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_100d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b67e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_100d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b67e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_100d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b67e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_100d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b67e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_100d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l806_c7_b67e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_100d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l810_c7_fa6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_753d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_fa6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_753d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_fa6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_753d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_fa6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_753d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_fa6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_753d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_fa6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_753d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_fa6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_753d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c7_fa6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_753d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_bfa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_274f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_bfa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_274f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_bfa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_274f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_bfa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_274f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_bfa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_274f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_beaf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_6a5e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_beaf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_6a5e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_bfa6_iftrue := VAR_BIN_OP_XOR_uxn_opcodes_h_l820_c24_b11e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l797_l789_l810_l806_l801_DUPLICATE_536f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_1124_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l797_l789_l810_l806_l801_DUPLICATE_536f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_177f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l797_l789_l810_l806_l801_DUPLICATE_536f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b67e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l797_l789_l810_l806_l801_DUPLICATE_536f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_fa6c_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l797_l789_l810_l806_l801_DUPLICATE_536f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_1124_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l797_l822_l816_l810_l806_l801_DUPLICATE_65f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_177f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l797_l822_l816_l810_l806_l801_DUPLICATE_65f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b67e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l797_l822_l816_l810_l806_l801_DUPLICATE_65f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_fa6c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l797_l822_l816_l810_l806_l801_DUPLICATE_65f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_bfa6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l797_l822_l816_l810_l806_l801_DUPLICATE_65f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_beaf_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l797_l822_l816_l810_l806_l801_DUPLICATE_65f5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l797_l789_l816_l806_l801_DUPLICATE_f7e1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_1124_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l797_l789_l816_l806_l801_DUPLICATE_f7e1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_177f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l797_l789_l816_l806_l801_DUPLICATE_f7e1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b67e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l797_l789_l816_l806_l801_DUPLICATE_f7e1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_bfa6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l797_l789_l816_l806_l801_DUPLICATE_f7e1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_1124_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l797_l822_l810_l806_l801_DUPLICATE_082a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_177f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l797_l822_l810_l806_l801_DUPLICATE_082a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b67e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l797_l822_l810_l806_l801_DUPLICATE_082a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_fa6c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l797_l822_l810_l806_l801_DUPLICATE_082a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_beaf_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l797_l822_l810_l806_l801_DUPLICATE_082a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_fa6c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l810_l816_DUPLICATE_b312_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_bfa6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l810_l816_DUPLICATE_b312_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l797_l789_l816_l810_l806_l801_DUPLICATE_42ed_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l797_c7_1124_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l797_l789_l816_l810_l806_l801_DUPLICATE_42ed_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_177f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l797_l789_l816_l810_l806_l801_DUPLICATE_42ed_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l806_c7_b67e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l797_l789_l816_l810_l806_l801_DUPLICATE_42ed_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c7_fa6c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l797_l789_l816_l810_l806_l801_DUPLICATE_42ed_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_bfa6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l797_l789_l816_l810_l806_l801_DUPLICATE_42ed_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l789_c2_54b8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_fa6c_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l810_c7_fa6c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l822_c7_beaf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_beaf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_beaf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_beaf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_beaf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_beaf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_beaf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_beaf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_beaf_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l816_c7_bfa6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l816_c7_bfa6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_bfa6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l816_c7_bfa6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_bfa6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l816_c7_bfa6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_bfa6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_bfa6_return_output := result_stack_value_MUX_uxn_opcodes_h_l816_c7_bfa6_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l810_c7_fa6c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_fa6c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_fa6c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_fa6c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_fa6c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_fa6c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_fa6c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l789_c2_54b8] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_54b8_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_54b8_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_54b8_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_54b8_return_output;

     -- t8_MUX[uxn_opcodes_h_l801_c7_177f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l801_c7_177f_cond <= VAR_t8_MUX_uxn_opcodes_h_l801_c7_177f_cond;
     t8_MUX_uxn_opcodes_h_l801_c7_177f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l801_c7_177f_iftrue;
     t8_MUX_uxn_opcodes_h_l801_c7_177f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l801_c7_177f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l801_c7_177f_return_output := t8_MUX_uxn_opcodes_h_l801_c7_177f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l816_c7_bfa6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_bfa6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_bfa6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_bfa6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_bfa6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_bfa6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_bfa6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_bfa6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_bfa6_return_output;

     -- n8_MUX[uxn_opcodes_h_l810_c7_fa6c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l810_c7_fa6c_cond <= VAR_n8_MUX_uxn_opcodes_h_l810_c7_fa6c_cond;
     n8_MUX_uxn_opcodes_h_l810_c7_fa6c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l810_c7_fa6c_iftrue;
     n8_MUX_uxn_opcodes_h_l810_c7_fa6c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l810_c7_fa6c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output := n8_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l814_c32_a5c0] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l814_c32_a5c0_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l814_c32_a5c0_left;
     BIN_OP_GT_uxn_opcodes_h_l814_c32_a5c0_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l814_c32_a5c0_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l814_c32_a5c0_return_output := BIN_OP_GT_uxn_opcodes_h_l814_c32_a5c0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l789_c1_88a0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_88a0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_88a0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_88a0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_88a0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_88a0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_88a0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_88a0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_88a0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l816_c7_bfa6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_bfa6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_bfa6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_bfa6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_bfa6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_bfa6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_bfa6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_bfa6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_bfa6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l822_c7_beaf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_beaf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_beaf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_beaf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_beaf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_beaf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_beaf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_beaf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_beaf_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l814_c32_f831_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l814_c32_a5c0_return_output;
     VAR_printf_uxn_opcodes_h_l790_c3_af44_uxn_opcodes_h_l790_c3_af44_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_88a0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l806_c7_b67e_iffalse := VAR_n8_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_bfa6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_beaf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_fa6c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_bfa6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b67e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_bfa6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_beaf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_fa6c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_bfa6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c7_fa6c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_bfa6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l797_c7_1124_iffalse := VAR_t8_MUX_uxn_opcodes_h_l801_c7_177f_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l806_c7_b67e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b67e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b67e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b67e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b67e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b67e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b67e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b67e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b67e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l816_c7_bfa6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_bfa6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_bfa6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_bfa6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_bfa6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_bfa6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_bfa6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_bfa6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_bfa6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l810_c7_fa6c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_fa6c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_fa6c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_fa6c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_fa6c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_fa6c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_fa6c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l810_c7_fa6c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_fa6c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_fa6c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_fa6c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_fa6c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_fa6c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_fa6c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output;

     -- t8_MUX[uxn_opcodes_h_l797_c7_1124] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l797_c7_1124_cond <= VAR_t8_MUX_uxn_opcodes_h_l797_c7_1124_cond;
     t8_MUX_uxn_opcodes_h_l797_c7_1124_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l797_c7_1124_iftrue;
     t8_MUX_uxn_opcodes_h_l797_c7_1124_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l797_c7_1124_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l797_c7_1124_return_output := t8_MUX_uxn_opcodes_h_l797_c7_1124_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l816_c7_bfa6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_bfa6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_bfa6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_bfa6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_bfa6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_bfa6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_bfa6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_bfa6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_bfa6_return_output;

     -- MUX[uxn_opcodes_h_l814_c32_f831] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l814_c32_f831_cond <= VAR_MUX_uxn_opcodes_h_l814_c32_f831_cond;
     MUX_uxn_opcodes_h_l814_c32_f831_iftrue <= VAR_MUX_uxn_opcodes_h_l814_c32_f831_iftrue;
     MUX_uxn_opcodes_h_l814_c32_f831_iffalse <= VAR_MUX_uxn_opcodes_h_l814_c32_f831_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l814_c32_f831_return_output := MUX_uxn_opcodes_h_l814_c32_f831_return_output;

     -- n8_MUX[uxn_opcodes_h_l806_c7_b67e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l806_c7_b67e_cond <= VAR_n8_MUX_uxn_opcodes_h_l806_c7_b67e_cond;
     n8_MUX_uxn_opcodes_h_l806_c7_b67e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l806_c7_b67e_iftrue;
     n8_MUX_uxn_opcodes_h_l806_c7_b67e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l806_c7_b67e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l806_c7_b67e_return_output := n8_MUX_uxn_opcodes_h_l806_c7_b67e_return_output;

     -- printf_uxn_opcodes_h_l790_c3_af44[uxn_opcodes_h_l790_c3_af44] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l790_c3_af44_uxn_opcodes_h_l790_c3_af44_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l790_c3_af44_uxn_opcodes_h_l790_c3_af44_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_value_MUX[uxn_opcodes_h_l810_c7_fa6c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l810_c7_fa6c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c7_fa6c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l810_c7_fa6c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c7_fa6c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l810_c7_fa6c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c7_fa6c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output := result_stack_value_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_fa6c_iftrue := VAR_MUX_uxn_opcodes_h_l814_c32_f831_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l801_c7_177f_iffalse := VAR_n8_MUX_uxn_opcodes_h_l806_c7_b67e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_fa6c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_bfa6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b67e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_177f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_b67e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_fa6c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_bfa6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b67e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l806_c7_b67e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse := VAR_t8_MUX_uxn_opcodes_h_l797_c7_1124_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l806_c7_b67e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b67e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b67e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b67e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b67e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b67e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b67e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b67e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b67e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l806_c7_b67e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b67e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b67e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b67e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b67e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b67e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b67e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b67e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b67e_return_output;

     -- t8_MUX[uxn_opcodes_h_l789_c2_54b8] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l789_c2_54b8_cond <= VAR_t8_MUX_uxn_opcodes_h_l789_c2_54b8_cond;
     t8_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue;
     t8_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l789_c2_54b8_return_output := t8_MUX_uxn_opcodes_h_l789_c2_54b8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l810_c7_fa6c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_fa6c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_fa6c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_fa6c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_fa6c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_fa6c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_fa6c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output;

     -- n8_MUX[uxn_opcodes_h_l801_c7_177f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l801_c7_177f_cond <= VAR_n8_MUX_uxn_opcodes_h_l801_c7_177f_cond;
     n8_MUX_uxn_opcodes_h_l801_c7_177f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l801_c7_177f_iftrue;
     n8_MUX_uxn_opcodes_h_l801_c7_177f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l801_c7_177f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l801_c7_177f_return_output := n8_MUX_uxn_opcodes_h_l801_c7_177f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l810_c7_fa6c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_fa6c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_fa6c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_fa6c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_fa6c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_fa6c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_fa6c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l801_c7_177f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_177f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_177f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_177f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_177f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_177f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_177f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_177f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_177f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l806_c7_b67e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l806_c7_b67e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l806_c7_b67e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l806_c7_b67e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l806_c7_b67e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l806_c7_b67e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l806_c7_b67e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l806_c7_b67e_return_output := result_stack_value_MUX_uxn_opcodes_h_l806_c7_b67e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l810_c7_fa6c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_fa6c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_fa6c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_fa6c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_fa6c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_fa6c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_fa6c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l797_c7_1124_iffalse := VAR_n8_MUX_uxn_opcodes_h_l801_c7_177f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b67e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_177f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_b67e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_1124_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_177f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b67e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b67e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_fa6c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_177f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_b67e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_177f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l806_c7_b67e_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l789_c2_54b8_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l801_c7_177f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l801_c7_177f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_177f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l801_c7_177f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_177f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l801_c7_177f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_177f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_177f_return_output := result_stack_value_MUX_uxn_opcodes_h_l801_c7_177f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l806_c7_b67e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b67e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b67e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b67e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b67e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b67e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b67e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b67e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b67e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l806_c7_b67e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b67e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b67e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b67e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b67e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b67e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b67e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b67e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b67e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l801_c7_177f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_177f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_177f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_177f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_177f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_177f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_177f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_177f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_177f_return_output;

     -- n8_MUX[uxn_opcodes_h_l797_c7_1124] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l797_c7_1124_cond <= VAR_n8_MUX_uxn_opcodes_h_l797_c7_1124_cond;
     n8_MUX_uxn_opcodes_h_l797_c7_1124_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l797_c7_1124_iftrue;
     n8_MUX_uxn_opcodes_h_l797_c7_1124_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l797_c7_1124_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l797_c7_1124_return_output := n8_MUX_uxn_opcodes_h_l797_c7_1124_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l797_c7_1124] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_1124_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_1124_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_1124_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_1124_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_1124_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_1124_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_1124_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_1124_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l801_c7_177f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_177f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_177f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_177f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_177f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_177f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_177f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_177f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_177f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l806_c7_b67e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b67e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b67e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b67e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b67e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b67e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b67e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b67e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b67e_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse := VAR_n8_MUX_uxn_opcodes_h_l797_c7_1124_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_177f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_b67e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_1124_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_177f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_1124_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_177f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_b67e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_177f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_b67e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_1124_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_177f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l797_c7_1124_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_177f_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l797_c7_1124] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_1124_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_1124_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_1124_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_1124_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_1124_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_1124_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_1124_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_1124_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l797_c7_1124] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_1124_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_1124_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_1124_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_1124_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_1124_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_1124_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_1124_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_1124_return_output;

     -- n8_MUX[uxn_opcodes_h_l789_c2_54b8] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l789_c2_54b8_cond <= VAR_n8_MUX_uxn_opcodes_h_l789_c2_54b8_cond;
     n8_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue;
     n8_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l789_c2_54b8_return_output := n8_MUX_uxn_opcodes_h_l789_c2_54b8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l801_c7_177f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_177f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_177f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_177f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_177f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_177f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_177f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_177f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_177f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l797_c7_1124] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l797_c7_1124_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l797_c7_1124_cond;
     result_stack_value_MUX_uxn_opcodes_h_l797_c7_1124_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l797_c7_1124_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l797_c7_1124_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l797_c7_1124_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l797_c7_1124_return_output := result_stack_value_MUX_uxn_opcodes_h_l797_c7_1124_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l801_c7_177f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_177f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_177f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_177f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_177f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_177f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_177f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_177f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_177f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l801_c7_177f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_177f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_177f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_177f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_177f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_177f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_177f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_177f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_177f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l789_c2_54b8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_54b8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_54b8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_54b8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_54b8_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l789_c2_54b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_1124_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_177f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_1124_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_1124_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_177f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_1124_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_177f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_1124_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l797_c7_1124_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l797_c7_1124] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_1124_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_1124_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_1124_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_1124_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_1124_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_1124_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_1124_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_1124_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l789_c2_54b8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l789_c2_54b8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l789_c2_54b8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l789_c2_54b8_return_output := result_stack_value_MUX_uxn_opcodes_h_l789_c2_54b8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l797_c7_1124] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_1124_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_1124_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_1124_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_1124_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_1124_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_1124_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_1124_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_1124_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l797_c7_1124] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_1124_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_1124_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_1124_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_1124_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_1124_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_1124_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_1124_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_1124_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l789_c2_54b8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_54b8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_54b8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_54b8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_54b8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l789_c2_54b8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_54b8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_54b8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_54b8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_54b8_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_1124_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_1124_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_1124_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l789_c2_54b8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_54b8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_54b8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_54b8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_54b8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l789_c2_54b8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_54b8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_54b8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_54b8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_54b8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l789_c2_54b8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_54b8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_54b8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_54b8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_54b8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_54b8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_54b8_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l827_l785_DUPLICATE_82c5 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l827_l785_DUPLICATE_82c5_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_54b8_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_54b8_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_54b8_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_54b8_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_54b8_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_54b8_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_54b8_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l789_c2_54b8_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l827_l785_DUPLICATE_82c5_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l827_l785_DUPLICATE_82c5_return_output;
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
