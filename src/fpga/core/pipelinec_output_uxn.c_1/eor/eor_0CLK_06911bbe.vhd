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
-- BIN_OP_EQ[uxn_opcodes_h_l789_c6_eec7]
signal BIN_OP_EQ_uxn_opcodes_h_l789_c6_eec7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l789_c6_eec7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l789_c6_eec7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l789_c1_e948]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_e948_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_e948_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_e948_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_e948_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l789_c2_8543]
signal n8_MUX_uxn_opcodes_h_l789_c2_8543_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l789_c2_8543_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l789_c2_8543_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l789_c2_8543_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l789_c2_8543]
signal t8_MUX_uxn_opcodes_h_l789_c2_8543_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l789_c2_8543_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l789_c2_8543_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l789_c2_8543_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l789_c2_8543]
signal result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_8543_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_8543_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_8543_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_8543_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l789_c2_8543]
signal result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_8543_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_8543_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_8543_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_8543_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l789_c2_8543]
signal result_stack_value_MUX_uxn_opcodes_h_l789_c2_8543_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l789_c2_8543_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l789_c2_8543_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l789_c2_8543_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l789_c2_8543]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_8543_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_8543_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_8543_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_8543_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l789_c2_8543]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_8543_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_8543_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_8543_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_8543_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l789_c2_8543]
signal result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_8543_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_8543_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_8543_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_8543_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l789_c2_8543]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_8543_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_8543_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_8543_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_8543_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l789_c2_8543]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_8543_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_8543_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_8543_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_8543_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l790_c3_fa1d[uxn_opcodes_h_l790_c3_fa1d]
signal printf_uxn_opcodes_h_l790_c3_fa1d_uxn_opcodes_h_l790_c3_fa1d_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l797_c11_d84b]
signal BIN_OP_EQ_uxn_opcodes_h_l797_c11_d84b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l797_c11_d84b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l797_c11_d84b_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l797_c7_02b4]
signal n8_MUX_uxn_opcodes_h_l797_c7_02b4_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l797_c7_02b4_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l797_c7_02b4]
signal t8_MUX_uxn_opcodes_h_l797_c7_02b4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l797_c7_02b4_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l797_c7_02b4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_02b4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_02b4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l797_c7_02b4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_02b4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_02b4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l797_c7_02b4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_02b4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_02b4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l797_c7_02b4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_02b4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_02b4_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l797_c7_02b4]
signal result_stack_value_MUX_uxn_opcodes_h_l797_c7_02b4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l797_c7_02b4_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l797_c7_02b4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_02b4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_02b4_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l797_c7_02b4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_02b4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_02b4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l801_c11_47bf]
signal BIN_OP_EQ_uxn_opcodes_h_l801_c11_47bf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l801_c11_47bf_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l801_c11_47bf_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l801_c7_72fd]
signal n8_MUX_uxn_opcodes_h_l801_c7_72fd_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l801_c7_72fd_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l801_c7_72fd]
signal t8_MUX_uxn_opcodes_h_l801_c7_72fd_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l801_c7_72fd_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l801_c7_72fd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_72fd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_72fd_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l801_c7_72fd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_72fd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_72fd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l801_c7_72fd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_72fd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_72fd_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l801_c7_72fd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_72fd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_72fd_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l801_c7_72fd]
signal result_stack_value_MUX_uxn_opcodes_h_l801_c7_72fd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l801_c7_72fd_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l801_c7_72fd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_72fd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_72fd_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l801_c7_72fd]
signal result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_72fd_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_72fd_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l806_c11_fbe9]
signal BIN_OP_EQ_uxn_opcodes_h_l806_c11_fbe9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l806_c11_fbe9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l806_c11_fbe9_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l806_c7_fd9f]
signal n8_MUX_uxn_opcodes_h_l806_c7_fd9f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l806_c7_fd9f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l806_c7_fd9f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l806_c7_fd9f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_fd9f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_fd9f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_fd9f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l806_c7_fd9f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_fd9f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_fd9f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_fd9f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l806_c7_fd9f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_fd9f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_fd9f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_fd9f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l806_c7_fd9f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_fd9f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_fd9f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_fd9f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l806_c7_fd9f]
signal result_stack_value_MUX_uxn_opcodes_h_l806_c7_fd9f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l806_c7_fd9f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l806_c7_fd9f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l806_c7_fd9f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_fd9f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_fd9f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_fd9f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l806_c7_fd9f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_fd9f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_fd9f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_fd9f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l810_c11_1772]
signal BIN_OP_EQ_uxn_opcodes_h_l810_c11_1772_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l810_c11_1772_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l810_c11_1772_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l810_c7_9226]
signal n8_MUX_uxn_opcodes_h_l810_c7_9226_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l810_c7_9226_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l810_c7_9226_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l810_c7_9226_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l810_c7_9226]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_9226_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_9226_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_9226_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_9226_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l810_c7_9226]
signal result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_9226_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_9226_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_9226_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_9226_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l810_c7_9226]
signal result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_9226_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_9226_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_9226_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_9226_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l810_c7_9226]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_9226_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_9226_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_9226_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_9226_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l810_c7_9226]
signal result_stack_value_MUX_uxn_opcodes_h_l810_c7_9226_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l810_c7_9226_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l810_c7_9226_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l810_c7_9226_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l810_c7_9226]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_9226_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_9226_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_9226_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_9226_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l810_c7_9226]
signal result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_9226_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_9226_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_9226_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_9226_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l814_c32_4821]
signal BIN_OP_AND_uxn_opcodes_h_l814_c32_4821_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l814_c32_4821_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l814_c32_4821_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l814_c32_a5a9]
signal BIN_OP_GT_uxn_opcodes_h_l814_c32_a5a9_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l814_c32_a5a9_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l814_c32_a5a9_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l814_c32_5e2b]
signal MUX_uxn_opcodes_h_l814_c32_5e2b_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l814_c32_5e2b_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l814_c32_5e2b_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l814_c32_5e2b_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l816_c11_4d74]
signal BIN_OP_EQ_uxn_opcodes_h_l816_c11_4d74_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l816_c11_4d74_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l816_c11_4d74_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l816_c7_c410]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_c410_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_c410_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_c410_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_c410_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l816_c7_c410]
signal result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_c410_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_c410_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_c410_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_c410_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l816_c7_c410]
signal result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_c410_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_c410_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_c410_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_c410_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l816_c7_c410]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_c410_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_c410_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_c410_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_c410_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l816_c7_c410]
signal result_stack_value_MUX_uxn_opcodes_h_l816_c7_c410_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l816_c7_c410_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l816_c7_c410_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l816_c7_c410_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l820_c24_8b0a]
signal BIN_OP_XOR_uxn_opcodes_h_l820_c24_8b0a_left : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l820_c24_8b0a_right : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l820_c24_8b0a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l822_c11_1abe]
signal BIN_OP_EQ_uxn_opcodes_h_l822_c11_1abe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l822_c11_1abe_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l822_c11_1abe_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l822_c7_fd56]
signal result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_fd56_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_fd56_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_fd56_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_fd56_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l822_c7_fd56]
signal result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_fd56_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_fd56_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_fd56_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_fd56_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l789_c6_eec7
BIN_OP_EQ_uxn_opcodes_h_l789_c6_eec7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l789_c6_eec7_left,
BIN_OP_EQ_uxn_opcodes_h_l789_c6_eec7_right,
BIN_OP_EQ_uxn_opcodes_h_l789_c6_eec7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_e948
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_e948 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_e948_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_e948_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_e948_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_e948_return_output);

-- n8_MUX_uxn_opcodes_h_l789_c2_8543
n8_MUX_uxn_opcodes_h_l789_c2_8543 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l789_c2_8543_cond,
n8_MUX_uxn_opcodes_h_l789_c2_8543_iftrue,
n8_MUX_uxn_opcodes_h_l789_c2_8543_iffalse,
n8_MUX_uxn_opcodes_h_l789_c2_8543_return_output);

-- t8_MUX_uxn_opcodes_h_l789_c2_8543
t8_MUX_uxn_opcodes_h_l789_c2_8543 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l789_c2_8543_cond,
t8_MUX_uxn_opcodes_h_l789_c2_8543_iftrue,
t8_MUX_uxn_opcodes_h_l789_c2_8543_iffalse,
t8_MUX_uxn_opcodes_h_l789_c2_8543_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_8543
result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_8543 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_8543_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_8543_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_8543_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_8543_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_8543
result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_8543 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_8543_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_8543_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_8543_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_8543_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l789_c2_8543
result_stack_value_MUX_uxn_opcodes_h_l789_c2_8543 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l789_c2_8543_cond,
result_stack_value_MUX_uxn_opcodes_h_l789_c2_8543_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l789_c2_8543_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l789_c2_8543_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_8543
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_8543 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_8543_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_8543_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_8543_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_8543_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_8543
result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_8543 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_8543_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_8543_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_8543_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_8543_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_8543
result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_8543 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_8543_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_8543_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_8543_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_8543_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_8543
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_8543 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_8543_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_8543_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_8543_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_8543_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_8543
result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_8543 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_8543_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_8543_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_8543_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_8543_return_output);

-- printf_uxn_opcodes_h_l790_c3_fa1d_uxn_opcodes_h_l790_c3_fa1d
printf_uxn_opcodes_h_l790_c3_fa1d_uxn_opcodes_h_l790_c3_fa1d : entity work.printf_uxn_opcodes_h_l790_c3_fa1d_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l790_c3_fa1d_uxn_opcodes_h_l790_c3_fa1d_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l797_c11_d84b
BIN_OP_EQ_uxn_opcodes_h_l797_c11_d84b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l797_c11_d84b_left,
BIN_OP_EQ_uxn_opcodes_h_l797_c11_d84b_right,
BIN_OP_EQ_uxn_opcodes_h_l797_c11_d84b_return_output);

-- n8_MUX_uxn_opcodes_h_l797_c7_02b4
n8_MUX_uxn_opcodes_h_l797_c7_02b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l797_c7_02b4_cond,
n8_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue,
n8_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse,
n8_MUX_uxn_opcodes_h_l797_c7_02b4_return_output);

-- t8_MUX_uxn_opcodes_h_l797_c7_02b4
t8_MUX_uxn_opcodes_h_l797_c7_02b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l797_c7_02b4_cond,
t8_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue,
t8_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse,
t8_MUX_uxn_opcodes_h_l797_c7_02b4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_02b4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_02b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_02b4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_02b4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_02b4
result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_02b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_02b4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_02b4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_02b4
result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_02b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_02b4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_02b4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_02b4
result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_02b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_02b4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_02b4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l797_c7_02b4
result_stack_value_MUX_uxn_opcodes_h_l797_c7_02b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l797_c7_02b4_cond,
result_stack_value_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l797_c7_02b4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_02b4
result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_02b4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_02b4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_02b4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_02b4
result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_02b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_02b4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_02b4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l801_c11_47bf
BIN_OP_EQ_uxn_opcodes_h_l801_c11_47bf : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l801_c11_47bf_left,
BIN_OP_EQ_uxn_opcodes_h_l801_c11_47bf_right,
BIN_OP_EQ_uxn_opcodes_h_l801_c11_47bf_return_output);

-- n8_MUX_uxn_opcodes_h_l801_c7_72fd
n8_MUX_uxn_opcodes_h_l801_c7_72fd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l801_c7_72fd_cond,
n8_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue,
n8_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse,
n8_MUX_uxn_opcodes_h_l801_c7_72fd_return_output);

-- t8_MUX_uxn_opcodes_h_l801_c7_72fd
t8_MUX_uxn_opcodes_h_l801_c7_72fd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l801_c7_72fd_cond,
t8_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue,
t8_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse,
t8_MUX_uxn_opcodes_h_l801_c7_72fd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_72fd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_72fd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_72fd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_72fd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_72fd
result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_72fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_72fd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_72fd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_72fd
result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_72fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_72fd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_72fd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_72fd
result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_72fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_72fd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_72fd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l801_c7_72fd
result_stack_value_MUX_uxn_opcodes_h_l801_c7_72fd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l801_c7_72fd_cond,
result_stack_value_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l801_c7_72fd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_72fd
result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_72fd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_72fd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_72fd_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_72fd
result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_72fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_72fd_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_72fd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l806_c11_fbe9
BIN_OP_EQ_uxn_opcodes_h_l806_c11_fbe9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l806_c11_fbe9_left,
BIN_OP_EQ_uxn_opcodes_h_l806_c11_fbe9_right,
BIN_OP_EQ_uxn_opcodes_h_l806_c11_fbe9_return_output);

-- n8_MUX_uxn_opcodes_h_l806_c7_fd9f
n8_MUX_uxn_opcodes_h_l806_c7_fd9f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l806_c7_fd9f_cond,
n8_MUX_uxn_opcodes_h_l806_c7_fd9f_iftrue,
n8_MUX_uxn_opcodes_h_l806_c7_fd9f_iffalse,
n8_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_fd9f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_fd9f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_fd9f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_fd9f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_fd9f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_fd9f
result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_fd9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_fd9f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_fd9f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_fd9f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_fd9f
result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_fd9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_fd9f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_fd9f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_fd9f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_fd9f
result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_fd9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_fd9f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_fd9f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_fd9f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l806_c7_fd9f
result_stack_value_MUX_uxn_opcodes_h_l806_c7_fd9f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l806_c7_fd9f_cond,
result_stack_value_MUX_uxn_opcodes_h_l806_c7_fd9f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l806_c7_fd9f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_fd9f
result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_fd9f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_fd9f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_fd9f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_fd9f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_fd9f
result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_fd9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_fd9f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_fd9f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_fd9f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l810_c11_1772
BIN_OP_EQ_uxn_opcodes_h_l810_c11_1772 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l810_c11_1772_left,
BIN_OP_EQ_uxn_opcodes_h_l810_c11_1772_right,
BIN_OP_EQ_uxn_opcodes_h_l810_c11_1772_return_output);

-- n8_MUX_uxn_opcodes_h_l810_c7_9226
n8_MUX_uxn_opcodes_h_l810_c7_9226 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l810_c7_9226_cond,
n8_MUX_uxn_opcodes_h_l810_c7_9226_iftrue,
n8_MUX_uxn_opcodes_h_l810_c7_9226_iffalse,
n8_MUX_uxn_opcodes_h_l810_c7_9226_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_9226
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_9226 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_9226_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_9226_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_9226_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_9226_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_9226
result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_9226 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_9226_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_9226_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_9226_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_9226_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_9226
result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_9226 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_9226_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_9226_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_9226_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_9226_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_9226
result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_9226 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_9226_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_9226_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_9226_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_9226_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l810_c7_9226
result_stack_value_MUX_uxn_opcodes_h_l810_c7_9226 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l810_c7_9226_cond,
result_stack_value_MUX_uxn_opcodes_h_l810_c7_9226_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l810_c7_9226_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l810_c7_9226_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_9226
result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_9226 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_9226_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_9226_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_9226_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_9226_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_9226
result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_9226 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_9226_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_9226_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_9226_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_9226_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l814_c32_4821
BIN_OP_AND_uxn_opcodes_h_l814_c32_4821 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l814_c32_4821_left,
BIN_OP_AND_uxn_opcodes_h_l814_c32_4821_right,
BIN_OP_AND_uxn_opcodes_h_l814_c32_4821_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l814_c32_a5a9
BIN_OP_GT_uxn_opcodes_h_l814_c32_a5a9 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l814_c32_a5a9_left,
BIN_OP_GT_uxn_opcodes_h_l814_c32_a5a9_right,
BIN_OP_GT_uxn_opcodes_h_l814_c32_a5a9_return_output);

-- MUX_uxn_opcodes_h_l814_c32_5e2b
MUX_uxn_opcodes_h_l814_c32_5e2b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l814_c32_5e2b_cond,
MUX_uxn_opcodes_h_l814_c32_5e2b_iftrue,
MUX_uxn_opcodes_h_l814_c32_5e2b_iffalse,
MUX_uxn_opcodes_h_l814_c32_5e2b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l816_c11_4d74
BIN_OP_EQ_uxn_opcodes_h_l816_c11_4d74 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l816_c11_4d74_left,
BIN_OP_EQ_uxn_opcodes_h_l816_c11_4d74_right,
BIN_OP_EQ_uxn_opcodes_h_l816_c11_4d74_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_c410
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_c410 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_c410_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_c410_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_c410_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_c410_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_c410
result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_c410 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_c410_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_c410_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_c410_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_c410_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_c410
result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_c410 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_c410_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_c410_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_c410_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_c410_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_c410
result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_c410 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_c410_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_c410_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_c410_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_c410_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l816_c7_c410
result_stack_value_MUX_uxn_opcodes_h_l816_c7_c410 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l816_c7_c410_cond,
result_stack_value_MUX_uxn_opcodes_h_l816_c7_c410_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l816_c7_c410_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l816_c7_c410_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l820_c24_8b0a
BIN_OP_XOR_uxn_opcodes_h_l820_c24_8b0a : entity work.BIN_OP_XOR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l820_c24_8b0a_left,
BIN_OP_XOR_uxn_opcodes_h_l820_c24_8b0a_right,
BIN_OP_XOR_uxn_opcodes_h_l820_c24_8b0a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l822_c11_1abe
BIN_OP_EQ_uxn_opcodes_h_l822_c11_1abe : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l822_c11_1abe_left,
BIN_OP_EQ_uxn_opcodes_h_l822_c11_1abe_right,
BIN_OP_EQ_uxn_opcodes_h_l822_c11_1abe_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_fd56
result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_fd56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_fd56_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_fd56_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_fd56_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_fd56_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_fd56
result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_fd56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_fd56_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_fd56_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_fd56_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_fd56_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l789_c6_eec7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_e948_return_output,
 n8_MUX_uxn_opcodes_h_l789_c2_8543_return_output,
 t8_MUX_uxn_opcodes_h_l789_c2_8543_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_8543_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_8543_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l789_c2_8543_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_8543_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_8543_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_8543_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_8543_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_8543_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l797_c11_d84b_return_output,
 n8_MUX_uxn_opcodes_h_l797_c7_02b4_return_output,
 t8_MUX_uxn_opcodes_h_l797_c7_02b4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_02b4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_02b4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_02b4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_02b4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l797_c7_02b4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_02b4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_02b4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l801_c11_47bf_return_output,
 n8_MUX_uxn_opcodes_h_l801_c7_72fd_return_output,
 t8_MUX_uxn_opcodes_h_l801_c7_72fd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_72fd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_72fd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_72fd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_72fd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l801_c7_72fd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_72fd_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_72fd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l806_c11_fbe9_return_output,
 n8_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l810_c11_1772_return_output,
 n8_MUX_uxn_opcodes_h_l810_c7_9226_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_9226_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_9226_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_9226_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_9226_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l810_c7_9226_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_9226_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_9226_return_output,
 BIN_OP_AND_uxn_opcodes_h_l814_c32_4821_return_output,
 BIN_OP_GT_uxn_opcodes_h_l814_c32_a5a9_return_output,
 MUX_uxn_opcodes_h_l814_c32_5e2b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l816_c11_4d74_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_c410_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_c410_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_c410_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_c410_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l816_c7_c410_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l820_c24_8b0a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l822_c11_1abe_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_fd56_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_fd56_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_eec7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_eec7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_eec7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_e948_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_e948_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_e948_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_e948_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l789_c2_8543_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l789_c2_8543_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l797_c7_02b4_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l789_c2_8543_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l789_c2_8543_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l789_c2_8543_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l789_c2_8543_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l797_c7_02b4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l789_c2_8543_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l789_c2_8543_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_8543_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_8543_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_02b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_8543_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_8543_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_8543_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_8543_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_02b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_8543_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_8543_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l789_c2_8543_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l789_c2_8543_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l797_c7_02b4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l789_c2_8543_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l789_c2_8543_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_8543_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_8543_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l789_c2_8543_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_8543_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_8543_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_8543_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_8543_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_02b4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_8543_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_8543_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_8543_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_8543_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_02b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_8543_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_8543_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_8543_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l793_c3_a999 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_8543_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_02b4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_8543_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_8543_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_8543_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_8543_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_02b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_8543_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_8543_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l790_c3_fa1d_uxn_opcodes_h_l790_c3_fa1d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_d84b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_d84b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_d84b_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l801_c7_72fd_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l797_c7_02b4_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l801_c7_72fd_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l797_c7_02b4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l799_c3_cbe6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_72fd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_02b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_72fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_02b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_72fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_02b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_72fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_02b4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_72fd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l797_c7_02b4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_72fd_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_02b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_72fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_02b4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_47bf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_47bf_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_47bf_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l801_c7_72fd_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l801_c7_72fd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l804_c3_efcf : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_72fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_72fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_72fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_72fd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_72fd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_72fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_72fd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_fbe9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_fbe9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_fbe9_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l806_c7_fd9f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l806_c7_fd9f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l810_c7_9226_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l806_c7_fd9f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_fd9f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l808_c3_15c2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_fd9f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_9226_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_fd9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_fd9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_fd9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_9226_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_fd9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_fd9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_fd9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_9226_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_fd9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_fd9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_fd9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_9226_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_fd9f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l806_c7_fd9f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l806_c7_fd9f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c7_9226_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l806_c7_fd9f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_fd9f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_fd9f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_9226_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_fd9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_fd9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_fd9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_9226_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_fd9f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_1772_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_1772_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_1772_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l810_c7_9226_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l810_c7_9226_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l810_c7_9226_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_9226_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_9226_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_c410_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_9226_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_9226_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_9226_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_c410_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_9226_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_9226_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_9226_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_c410_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_9226_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_9226_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_9226_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_c410_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_9226_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c7_9226_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c7_9226_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_c410_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c7_9226_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_9226_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_9226_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_9226_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_9226_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_9226_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l810_c7_9226_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_9226_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l814_c32_5e2b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l814_c32_5e2b_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l814_c32_5e2b_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l814_c32_4821_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l814_c32_4821_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l814_c32_4821_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l814_c32_a5a9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l814_c32_a5a9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l814_c32_a5a9_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l814_c32_5e2b_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_4d74_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_4d74_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_4d74_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_c410_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l819_c3_fa68 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_c410_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_c410_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_c410_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_c410_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_fd56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_c410_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_c410_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_c410_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_fd56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_c410_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_c410_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_c410_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_c410_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_c410_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_c410_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_c410_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l820_c24_8b0a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l820_c24_8b0a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l820_c24_8b0a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_1abe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_1abe_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_1abe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_fd56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_fd56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_fd56_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_fd56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_fd56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_fd56_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l797_l789_l816_l810_l806_l801_DUPLICATE_096b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l797_l789_l810_l806_l801_DUPLICATE_fbad_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l797_l789_l816_l806_l801_DUPLICATE_eaaf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l797_l822_l816_l810_l806_l801_DUPLICATE_8a05_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l797_l822_l810_l806_l801_DUPLICATE_2b03_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l810_l816_DUPLICATE_7e38_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l827_l785_DUPLICATE_b375_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_1abe_right := to_unsigned(6, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l814_c32_5e2b_iffalse := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_AND_uxn_opcodes_h_l814_c32_4821_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_fbe9_right := to_unsigned(3, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_8543_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l793_c3_a999 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_8543_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l793_c3_a999;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_d84b_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_c410_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_eec7_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_4d74_right := to_unsigned(5, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_8543_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_c410_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_e948_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_8543_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l814_c32_a5a9_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l819_c3_fa68 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_c410_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l819_c3_fa68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_47bf_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_fd56_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l804_c3_efcf := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l804_c3_efcf;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l808_c3_15c2 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_fd9f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l808_c3_15c2;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_9226_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_fd56_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l799_c3_cbe6 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l799_c3_cbe6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_1772_right := to_unsigned(4, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_fd9f_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l814_c32_5e2b_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_9226_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_8543_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_e948_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l814_c32_4821_left := VAR_ins;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l820_c24_8b0a_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l789_c2_8543_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l806_c7_fd9f_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l810_c7_9226_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_eec7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_d84b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_47bf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_fbe9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_1772_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_4d74_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_1abe_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l810_c7_9226_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l820_c24_8b0a_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l789_c2_8543_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l797_l822_l810_l806_l801_DUPLICATE_2b03 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l797_l822_l810_l806_l801_DUPLICATE_2b03_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l806_c11_fbe9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l806_c11_fbe9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_fbe9_left;
     BIN_OP_EQ_uxn_opcodes_h_l806_c11_fbe9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_fbe9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_fbe9_return_output := BIN_OP_EQ_uxn_opcodes_h_l806_c11_fbe9_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l810_l816_DUPLICATE_7e38 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l810_l816_DUPLICATE_7e38_return_output := result.stack_address_sp_offset;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l789_c2_8543] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l789_c2_8543_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l816_c11_4d74] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l816_c11_4d74_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_4d74_left;
     BIN_OP_EQ_uxn_opcodes_h_l816_c11_4d74_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_4d74_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_4d74_return_output := BIN_OP_EQ_uxn_opcodes_h_l816_c11_4d74_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l797_l789_l816_l806_l801_DUPLICATE_eaaf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l797_l789_l816_l806_l801_DUPLICATE_eaaf_return_output := result.is_sp_shift;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l797_l789_l810_l806_l801_DUPLICATE_fbad LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l797_l789_l810_l806_l801_DUPLICATE_fbad_return_output := result.sp_relative_shift;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l810_c7_9226] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l810_c7_9226_return_output := result.is_stack_read;

     -- BIN_OP_AND[uxn_opcodes_h_l814_c32_4821] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l814_c32_4821_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l814_c32_4821_left;
     BIN_OP_AND_uxn_opcodes_h_l814_c32_4821_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l814_c32_4821_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l814_c32_4821_return_output := BIN_OP_AND_uxn_opcodes_h_l814_c32_4821_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l797_l822_l816_l810_l806_l801_DUPLICATE_8a05 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l797_l822_l816_l810_l806_l801_DUPLICATE_8a05_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l789_c6_eec7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l789_c6_eec7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_eec7_left;
     BIN_OP_EQ_uxn_opcodes_h_l789_c6_eec7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_eec7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_eec7_return_output := BIN_OP_EQ_uxn_opcodes_h_l789_c6_eec7_return_output;

     -- BIN_OP_XOR[uxn_opcodes_h_l820_c24_8b0a] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l820_c24_8b0a_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l820_c24_8b0a_left;
     BIN_OP_XOR_uxn_opcodes_h_l820_c24_8b0a_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l820_c24_8b0a_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l820_c24_8b0a_return_output := BIN_OP_XOR_uxn_opcodes_h_l820_c24_8b0a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l822_c11_1abe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l822_c11_1abe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_1abe_left;
     BIN_OP_EQ_uxn_opcodes_h_l822_c11_1abe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_1abe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_1abe_return_output := BIN_OP_EQ_uxn_opcodes_h_l822_c11_1abe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l810_c11_1772] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l810_c11_1772_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_1772_left;
     BIN_OP_EQ_uxn_opcodes_h_l810_c11_1772_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_1772_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_1772_return_output := BIN_OP_EQ_uxn_opcodes_h_l810_c11_1772_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l801_c11_47bf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l801_c11_47bf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_47bf_left;
     BIN_OP_EQ_uxn_opcodes_h_l801_c11_47bf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_47bf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_47bf_return_output := BIN_OP_EQ_uxn_opcodes_h_l801_c11_47bf_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l797_l789_l816_l810_l806_l801_DUPLICATE_096b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l797_l789_l816_l810_l806_l801_DUPLICATE_096b_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l797_c11_d84b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l797_c11_d84b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_d84b_left;
     BIN_OP_EQ_uxn_opcodes_h_l797_c11_d84b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_d84b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_d84b_return_output := BIN_OP_EQ_uxn_opcodes_h_l797_c11_d84b_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l814_c32_a5a9_left := VAR_BIN_OP_AND_uxn_opcodes_h_l814_c32_4821_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_e948_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_eec7_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l789_c2_8543_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_eec7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_8543_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_eec7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_8543_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_eec7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_8543_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_eec7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_8543_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_eec7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_8543_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_eec7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_8543_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_eec7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_8543_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_eec7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l789_c2_8543_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_eec7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l789_c2_8543_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_eec7_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l797_c7_02b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_d84b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_02b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_d84b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_02b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_d84b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_02b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_d84b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_02b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_d84b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_02b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_d84b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_02b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_d84b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l797_c7_02b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_d84b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l797_c7_02b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_d84b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l801_c7_72fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_47bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_72fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_47bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_72fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_47bf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_72fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_47bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_72fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_47bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_72fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_47bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_72fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_47bf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_72fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_47bf_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l801_c7_72fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_47bf_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l806_c7_fd9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_fbe9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_fd9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_fbe9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_fd9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_fbe9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_fd9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_fbe9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_fd9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_fbe9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_fd9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_fbe9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_fd9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_fbe9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l806_c7_fd9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_fbe9_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l810_c7_9226_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_1772_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_9226_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_1772_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_9226_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_1772_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_9226_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_1772_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_9226_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_1772_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_9226_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_1772_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_9226_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_1772_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c7_9226_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_1772_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_c410_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_4d74_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_c410_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_4d74_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_c410_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_4d74_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_c410_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_4d74_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_c410_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_4d74_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_fd56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_1abe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_fd56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_1abe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_c410_iftrue := VAR_BIN_OP_XOR_uxn_opcodes_h_l820_c24_8b0a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_8543_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l797_l789_l810_l806_l801_DUPLICATE_fbad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l797_l789_l810_l806_l801_DUPLICATE_fbad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l797_l789_l810_l806_l801_DUPLICATE_fbad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_fd9f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l797_l789_l810_l806_l801_DUPLICATE_fbad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_9226_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l797_l789_l810_l806_l801_DUPLICATE_fbad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l797_l822_l816_l810_l806_l801_DUPLICATE_8a05_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l797_l822_l816_l810_l806_l801_DUPLICATE_8a05_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_fd9f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l797_l822_l816_l810_l806_l801_DUPLICATE_8a05_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_9226_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l797_l822_l816_l810_l806_l801_DUPLICATE_8a05_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_c410_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l797_l822_l816_l810_l806_l801_DUPLICATE_8a05_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_fd56_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l797_l822_l816_l810_l806_l801_DUPLICATE_8a05_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_8543_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l797_l789_l816_l806_l801_DUPLICATE_eaaf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l797_l789_l816_l806_l801_DUPLICATE_eaaf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l797_l789_l816_l806_l801_DUPLICATE_eaaf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_fd9f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l797_l789_l816_l806_l801_DUPLICATE_eaaf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_c410_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l797_l789_l816_l806_l801_DUPLICATE_eaaf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l797_l822_l810_l806_l801_DUPLICATE_2b03_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l797_l822_l810_l806_l801_DUPLICATE_2b03_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_fd9f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l797_l822_l810_l806_l801_DUPLICATE_2b03_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_9226_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l797_l822_l810_l806_l801_DUPLICATE_2b03_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_fd56_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l797_l822_l810_l806_l801_DUPLICATE_2b03_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_9226_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l810_l816_DUPLICATE_7e38_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_c410_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l810_l816_DUPLICATE_7e38_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l789_c2_8543_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l797_l789_l816_l810_l806_l801_DUPLICATE_096b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l797_l789_l816_l810_l806_l801_DUPLICATE_096b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l797_l789_l816_l810_l806_l801_DUPLICATE_096b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l806_c7_fd9f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l797_l789_l816_l810_l806_l801_DUPLICATE_096b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c7_9226_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l797_l789_l816_l810_l806_l801_DUPLICATE_096b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_c410_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l797_l789_l816_l810_l806_l801_DUPLICATE_096b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_8543_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l789_c2_8543_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_9226_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l810_c7_9226_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l822_c7_fd56] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_fd56_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_fd56_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_fd56_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_fd56_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_fd56_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_fd56_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_fd56_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_fd56_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l822_c7_fd56] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_fd56_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_fd56_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_fd56_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_fd56_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_fd56_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_fd56_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_fd56_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_fd56_return_output;

     -- t8_MUX[uxn_opcodes_h_l801_c7_72fd] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l801_c7_72fd_cond <= VAR_t8_MUX_uxn_opcodes_h_l801_c7_72fd_cond;
     t8_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue;
     t8_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l801_c7_72fd_return_output := t8_MUX_uxn_opcodes_h_l801_c7_72fd_return_output;

     -- n8_MUX[uxn_opcodes_h_l810_c7_9226] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l810_c7_9226_cond <= VAR_n8_MUX_uxn_opcodes_h_l810_c7_9226_cond;
     n8_MUX_uxn_opcodes_h_l810_c7_9226_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l810_c7_9226_iftrue;
     n8_MUX_uxn_opcodes_h_l810_c7_9226_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l810_c7_9226_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l810_c7_9226_return_output := n8_MUX_uxn_opcodes_h_l810_c7_9226_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l789_c2_8543] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_8543_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_8543_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_8543_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_8543_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_8543_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_8543_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_8543_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_8543_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l816_c7_c410] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_c410_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_c410_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_c410_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_c410_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_c410_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_c410_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_c410_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_c410_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l816_c7_c410] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l816_c7_c410_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_c410_cond;
     result_stack_value_MUX_uxn_opcodes_h_l816_c7_c410_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_c410_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l816_c7_c410_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_c410_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_c410_return_output := result_stack_value_MUX_uxn_opcodes_h_l816_c7_c410_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l789_c1_e948] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_e948_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_e948_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_e948_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_e948_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_e948_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_e948_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_e948_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_e948_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l816_c7_c410] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_c410_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_c410_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_c410_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_c410_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_c410_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_c410_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_c410_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_c410_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l814_c32_a5a9] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l814_c32_a5a9_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l814_c32_a5a9_left;
     BIN_OP_GT_uxn_opcodes_h_l814_c32_a5a9_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l814_c32_a5a9_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l814_c32_a5a9_return_output := BIN_OP_GT_uxn_opcodes_h_l814_c32_a5a9_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l810_c7_9226] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_9226_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_9226_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_9226_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_9226_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_9226_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_9226_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_9226_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_9226_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l814_c32_5e2b_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l814_c32_a5a9_return_output;
     VAR_printf_uxn_opcodes_h_l790_c3_fa1d_uxn_opcodes_h_l790_c3_fa1d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_e948_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l806_c7_fd9f_iffalse := VAR_n8_MUX_uxn_opcodes_h_l810_c7_9226_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_c410_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_fd56_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_9226_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_c410_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_fd9f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l810_c7_9226_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_c410_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_fd56_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_9226_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_c410_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c7_9226_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_c410_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse := VAR_t8_MUX_uxn_opcodes_h_l801_c7_72fd_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l810_c7_9226] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l810_c7_9226_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c7_9226_cond;
     result_stack_value_MUX_uxn_opcodes_h_l810_c7_9226_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c7_9226_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l810_c7_9226_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c7_9226_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c7_9226_return_output := result_stack_value_MUX_uxn_opcodes_h_l810_c7_9226_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l810_c7_9226] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_9226_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_9226_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_9226_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_9226_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_9226_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_9226_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_9226_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_9226_return_output;

     -- printf_uxn_opcodes_h_l790_c3_fa1d[uxn_opcodes_h_l790_c3_fa1d] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l790_c3_fa1d_uxn_opcodes_h_l790_c3_fa1d_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l790_c3_fa1d_uxn_opcodes_h_l790_c3_fa1d_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n8_MUX[uxn_opcodes_h_l806_c7_fd9f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l806_c7_fd9f_cond <= VAR_n8_MUX_uxn_opcodes_h_l806_c7_fd9f_cond;
     n8_MUX_uxn_opcodes_h_l806_c7_fd9f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l806_c7_fd9f_iftrue;
     n8_MUX_uxn_opcodes_h_l806_c7_fd9f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l806_c7_fd9f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output := n8_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l806_c7_fd9f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_fd9f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_fd9f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_fd9f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_fd9f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_fd9f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_fd9f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output;

     -- MUX[uxn_opcodes_h_l814_c32_5e2b] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l814_c32_5e2b_cond <= VAR_MUX_uxn_opcodes_h_l814_c32_5e2b_cond;
     MUX_uxn_opcodes_h_l814_c32_5e2b_iftrue <= VAR_MUX_uxn_opcodes_h_l814_c32_5e2b_iftrue;
     MUX_uxn_opcodes_h_l814_c32_5e2b_iffalse <= VAR_MUX_uxn_opcodes_h_l814_c32_5e2b_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l814_c32_5e2b_return_output := MUX_uxn_opcodes_h_l814_c32_5e2b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l816_c7_c410] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_c410_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_c410_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_c410_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_c410_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_c410_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_c410_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_c410_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_c410_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l810_c7_9226] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_9226_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_9226_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_9226_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_9226_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_9226_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_9226_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_9226_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_9226_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l816_c7_c410] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_c410_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_c410_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_c410_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_c410_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_c410_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_c410_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_c410_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_c410_return_output;

     -- t8_MUX[uxn_opcodes_h_l797_c7_02b4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l797_c7_02b4_cond <= VAR_t8_MUX_uxn_opcodes_h_l797_c7_02b4_cond;
     t8_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue;
     t8_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l797_c7_02b4_return_output := t8_MUX_uxn_opcodes_h_l797_c7_02b4_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_9226_iftrue := VAR_MUX_uxn_opcodes_h_l814_c32_5e2b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse := VAR_n8_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_9226_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_c410_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_fd9f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_9226_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_9226_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_c410_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_fd9f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_9226_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l806_c7_fd9f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c7_9226_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l789_c2_8543_iffalse := VAR_t8_MUX_uxn_opcodes_h_l797_c7_02b4_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l806_c7_fd9f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_fd9f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_fd9f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_fd9f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_fd9f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_fd9f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_fd9f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l810_c7_9226] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_9226_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_9226_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_9226_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_9226_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_9226_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_9226_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_9226_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_9226_return_output;

     -- n8_MUX[uxn_opcodes_h_l801_c7_72fd] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l801_c7_72fd_cond <= VAR_n8_MUX_uxn_opcodes_h_l801_c7_72fd_cond;
     n8_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue;
     n8_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l801_c7_72fd_return_output := n8_MUX_uxn_opcodes_h_l801_c7_72fd_return_output;

     -- t8_MUX[uxn_opcodes_h_l789_c2_8543] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l789_c2_8543_cond <= VAR_t8_MUX_uxn_opcodes_h_l789_c2_8543_cond;
     t8_MUX_uxn_opcodes_h_l789_c2_8543_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l789_c2_8543_iftrue;
     t8_MUX_uxn_opcodes_h_l789_c2_8543_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l789_c2_8543_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l789_c2_8543_return_output := t8_MUX_uxn_opcodes_h_l789_c2_8543_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l806_c7_fd9f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_fd9f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_fd9f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_fd9f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_fd9f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_fd9f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_fd9f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l806_c7_fd9f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l806_c7_fd9f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l806_c7_fd9f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l806_c7_fd9f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l806_c7_fd9f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l806_c7_fd9f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l806_c7_fd9f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output := result_stack_value_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l801_c7_72fd] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_72fd_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_72fd_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_72fd_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_72fd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l810_c7_9226] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_9226_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_9226_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_9226_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_9226_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_9226_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_9226_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_9226_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_9226_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l810_c7_9226] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_9226_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_9226_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_9226_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_9226_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_9226_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_9226_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_9226_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_9226_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse := VAR_n8_MUX_uxn_opcodes_h_l801_c7_72fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_fd9f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_9226_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_72fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_fd9f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_9226_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_fd9f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_9226_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l789_c2_8543_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l797_c7_02b4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_02b4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_02b4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_02b4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_02b4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l806_c7_fd9f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_fd9f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_fd9f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_fd9f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_fd9f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_fd9f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_fd9f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l801_c7_72fd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_72fd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_72fd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_72fd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_72fd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l806_c7_fd9f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_fd9f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_fd9f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_fd9f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_fd9f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_fd9f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_fd9f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l801_c7_72fd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_72fd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_72fd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_72fd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_72fd_return_output;

     -- n8_MUX[uxn_opcodes_h_l797_c7_02b4] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l797_c7_02b4_cond <= VAR_n8_MUX_uxn_opcodes_h_l797_c7_02b4_cond;
     n8_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue;
     n8_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l797_c7_02b4_return_output := n8_MUX_uxn_opcodes_h_l797_c7_02b4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l801_c7_72fd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l801_c7_72fd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_72fd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_72fd_return_output := result_stack_value_MUX_uxn_opcodes_h_l801_c7_72fd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l806_c7_fd9f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_fd9f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_fd9f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_fd9f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_fd9f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_fd9f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_fd9f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l789_c2_8543_iffalse := VAR_n8_MUX_uxn_opcodes_h_l797_c7_02b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_72fd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_8543_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_02b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_fd9f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_72fd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_72fd_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l797_c7_02b4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l797_c7_02b4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l797_c7_02b4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l797_c7_02b4_return_output := result_stack_value_MUX_uxn_opcodes_h_l797_c7_02b4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l801_c7_72fd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_72fd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_72fd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_72fd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_72fd_return_output;

     -- n8_MUX[uxn_opcodes_h_l789_c2_8543] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l789_c2_8543_cond <= VAR_n8_MUX_uxn_opcodes_h_l789_c2_8543_cond;
     n8_MUX_uxn_opcodes_h_l789_c2_8543_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l789_c2_8543_iftrue;
     n8_MUX_uxn_opcodes_h_l789_c2_8543_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l789_c2_8543_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l789_c2_8543_return_output := n8_MUX_uxn_opcodes_h_l789_c2_8543_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l797_c7_02b4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_02b4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_02b4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_02b4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_02b4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l801_c7_72fd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_72fd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_72fd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_72fd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_72fd_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l789_c2_8543] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_8543_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_8543_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_8543_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_8543_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_8543_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_8543_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_8543_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_8543_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l797_c7_02b4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_02b4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_02b4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_02b4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_02b4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l801_c7_72fd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_72fd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_72fd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_72fd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_72fd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_72fd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_72fd_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l789_c2_8543_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_72fd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_8543_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_02b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_72fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_72fd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_8543_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_02b4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l789_c2_8543_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l797_c7_02b4_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l789_c2_8543] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l789_c2_8543_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l789_c2_8543_cond;
     result_stack_value_MUX_uxn_opcodes_h_l789_c2_8543_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l789_c2_8543_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l789_c2_8543_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l789_c2_8543_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l789_c2_8543_return_output := result_stack_value_MUX_uxn_opcodes_h_l789_c2_8543_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l797_c7_02b4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_02b4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_02b4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_02b4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_02b4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l797_c7_02b4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_02b4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_02b4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_02b4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_02b4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l797_c7_02b4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_02b4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_02b4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_02b4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_02b4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_02b4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_02b4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l789_c2_8543] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_8543_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_8543_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_8543_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_8543_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_8543_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_8543_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_8543_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_8543_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l789_c2_8543] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_8543_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_8543_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_8543_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_8543_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_8543_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_8543_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_8543_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_8543_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_8543_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_02b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_8543_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_02b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_8543_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_02b4_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l789_c2_8543] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_8543_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_8543_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_8543_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_8543_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_8543_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_8543_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_8543_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_8543_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l789_c2_8543] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_8543_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_8543_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_8543_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_8543_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_8543_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_8543_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_8543_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_8543_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l789_c2_8543] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_8543_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_8543_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_8543_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_8543_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_8543_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_8543_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_8543_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_8543_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l827_l785_DUPLICATE_b375 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l827_l785_DUPLICATE_b375_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_49dd(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_8543_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_8543_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l789_c2_8543_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c2_8543_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_8543_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_8543_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_8543_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_8543_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l827_l785_DUPLICATE_b375_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l827_l785_DUPLICATE_b375_return_output;
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
