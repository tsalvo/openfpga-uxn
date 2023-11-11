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
-- Submodules: 66
entity jsr_0CLK_4f993427 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jsr_0CLK_4f993427;
architecture arch of jsr_0CLK_4f993427 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l712_c6_fec8]
signal BIN_OP_EQ_uxn_opcodes_h_l712_c6_fec8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l712_c6_fec8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l712_c6_fec8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l712_c1_ff0d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_ff0d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_ff0d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_ff0d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_ff0d_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l712_c2_dff4]
signal t8_MUX_uxn_opcodes_h_l712_c2_dff4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l712_c2_dff4_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l712_c2_dff4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_dff4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_dff4_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l712_c2_dff4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_dff4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_dff4_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l712_c2_dff4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_dff4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_dff4_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l712_c2_dff4]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_dff4_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_dff4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l712_c2_dff4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_dff4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_dff4_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l712_c2_dff4]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_dff4_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_dff4_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l712_c2_dff4]
signal result_u16_value_MUX_uxn_opcodes_h_l712_c2_dff4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l712_c2_dff4_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l712_c2_dff4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_dff4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_dff4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l712_c2_dff4]
signal result_u8_value_MUX_uxn_opcodes_h_l712_c2_dff4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l712_c2_dff4_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l713_c3_4f39[uxn_opcodes_h_l713_c3_4f39]
signal printf_uxn_opcodes_h_l713_c3_4f39_uxn_opcodes_h_l713_c3_4f39_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l717_c11_9cc0]
signal BIN_OP_EQ_uxn_opcodes_h_l717_c11_9cc0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l717_c11_9cc0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l717_c11_9cc0_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l717_c7_55c9]
signal t8_MUX_uxn_opcodes_h_l717_c7_55c9_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l717_c7_55c9_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l717_c7_55c9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_55c9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_55c9_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l717_c7_55c9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_55c9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_55c9_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l717_c7_55c9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_55c9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_55c9_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l717_c7_55c9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_55c9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_55c9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l717_c7_55c9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_55c9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_55c9_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l717_c7_55c9]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_55c9_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_55c9_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l717_c7_55c9]
signal result_u16_value_MUX_uxn_opcodes_h_l717_c7_55c9_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l717_c7_55c9_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l717_c7_55c9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_55c9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_55c9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l717_c7_55c9]
signal result_u8_value_MUX_uxn_opcodes_h_l717_c7_55c9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l717_c7_55c9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l720_c11_f12b]
signal BIN_OP_EQ_uxn_opcodes_h_l720_c11_f12b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l720_c11_f12b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l720_c11_f12b_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l720_c7_bcfd]
signal t8_MUX_uxn_opcodes_h_l720_c7_bcfd_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l720_c7_bcfd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_bcfd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l720_c7_bcfd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_bcfd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l720_c7_bcfd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_bcfd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l720_c7_bcfd]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_bcfd_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l720_c7_bcfd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_bcfd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l720_c7_bcfd]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_bcfd_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l720_c7_bcfd]
signal result_u16_value_MUX_uxn_opcodes_h_l720_c7_bcfd_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l720_c7_bcfd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_bcfd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l720_c7_bcfd]
signal result_u8_value_MUX_uxn_opcodes_h_l720_c7_bcfd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l723_c30_1de2]
signal sp_relative_shift_uxn_opcodes_h_l723_c30_1de2_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l723_c30_1de2_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l723_c30_1de2_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l723_c30_1de2_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l725_c11_c171]
signal BIN_OP_EQ_uxn_opcodes_h_l725_c11_c171_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l725_c11_c171_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l725_c11_c171_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l725_c7_a176]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_a176_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_a176_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_a176_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_a176_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l725_c7_a176]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_a176_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_a176_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_a176_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_a176_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l725_c7_a176]
signal result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_a176_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_a176_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_a176_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_a176_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l725_c7_a176]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_a176_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_a176_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_a176_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_a176_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l725_c7_a176]
signal result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_a176_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_a176_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_a176_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_a176_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l725_c7_a176]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_a176_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_a176_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_a176_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_a176_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l725_c7_a176]
signal result_u16_value_MUX_uxn_opcodes_h_l725_c7_a176_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l725_c7_a176_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l725_c7_a176_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l725_c7_a176_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l725_c7_a176]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_a176_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_a176_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_a176_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_a176_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l725_c7_a176]
signal result_u8_value_MUX_uxn_opcodes_h_l725_c7_a176_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l725_c7_a176_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l725_c7_a176_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l725_c7_a176_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l732_c11_8fc2]
signal BIN_OP_EQ_uxn_opcodes_h_l732_c11_8fc2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l732_c11_8fc2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l732_c11_8fc2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l732_c7_d93f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_d93f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_d93f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_d93f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_d93f_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l732_c7_d93f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_d93f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_d93f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_d93f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_d93f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l732_c7_d93f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_d93f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_d93f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_d93f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_d93f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l732_c7_d93f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_d93f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_d93f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_d93f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_d93f_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l732_c7_d93f]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_d93f_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_d93f_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_d93f_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_d93f_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l732_c7_d93f]
signal result_u16_value_MUX_uxn_opcodes_h_l732_c7_d93f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l732_c7_d93f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l732_c7_d93f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l732_c7_d93f_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l732_c7_d93f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_d93f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_d93f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_d93f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_d93f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l732_c7_d93f]
signal result_u8_value_MUX_uxn_opcodes_h_l732_c7_d93f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l732_c7_d93f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l732_c7_d93f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l732_c7_d93f_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l735_c31_c30f]
signal CONST_SR_8_uxn_opcodes_h_l735_c31_c30f_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l735_c31_c30f_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l737_c22_5313]
signal BIN_OP_PLUS_uxn_opcodes_h_l737_c22_5313_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l737_c22_5313_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l737_c22_5313_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l739_c11_bc08]
signal BIN_OP_EQ_uxn_opcodes_h_l739_c11_bc08_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l739_c11_bc08_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l739_c11_bc08_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l739_c7_c7d8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_c7d8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_c7d8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_c7d8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_c7d8_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l739_c7_c7d8]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_c7d8_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_c7d8_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_c7d8_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_c7d8_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l739_c7_c7d8]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_c7d8_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_c7d8_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_c7d8_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_c7d8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l739_c7_c7d8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_c7d8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_c7d8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_c7d8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_c7d8_return_output : unsigned(0 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_7c3b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.u16_value := ref_toks_7;
      base.is_sp_shift := ref_toks_8;
      base.u8_value := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l712_c6_fec8
BIN_OP_EQ_uxn_opcodes_h_l712_c6_fec8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l712_c6_fec8_left,
BIN_OP_EQ_uxn_opcodes_h_l712_c6_fec8_right,
BIN_OP_EQ_uxn_opcodes_h_l712_c6_fec8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_ff0d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_ff0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_ff0d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_ff0d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_ff0d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_ff0d_return_output);

-- t8_MUX_uxn_opcodes_h_l712_c2_dff4
t8_MUX_uxn_opcodes_h_l712_c2_dff4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l712_c2_dff4_cond,
t8_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue,
t8_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse,
t8_MUX_uxn_opcodes_h_l712_c2_dff4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_dff4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_dff4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_dff4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_dff4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_dff4
result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_dff4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_dff4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_dff4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_dff4
result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_dff4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_dff4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_dff4_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_dff4
result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_dff4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_dff4_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_dff4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_dff4
result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_dff4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_dff4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_dff4_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_dff4
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_dff4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_dff4_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_dff4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l712_c2_dff4
result_u16_value_MUX_uxn_opcodes_h_l712_c2_dff4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l712_c2_dff4_cond,
result_u16_value_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l712_c2_dff4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_dff4
result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_dff4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_dff4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_dff4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l712_c2_dff4
result_u8_value_MUX_uxn_opcodes_h_l712_c2_dff4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l712_c2_dff4_cond,
result_u8_value_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l712_c2_dff4_return_output);

-- printf_uxn_opcodes_h_l713_c3_4f39_uxn_opcodes_h_l713_c3_4f39
printf_uxn_opcodes_h_l713_c3_4f39_uxn_opcodes_h_l713_c3_4f39 : entity work.printf_uxn_opcodes_h_l713_c3_4f39_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l713_c3_4f39_uxn_opcodes_h_l713_c3_4f39_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l717_c11_9cc0
BIN_OP_EQ_uxn_opcodes_h_l717_c11_9cc0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l717_c11_9cc0_left,
BIN_OP_EQ_uxn_opcodes_h_l717_c11_9cc0_right,
BIN_OP_EQ_uxn_opcodes_h_l717_c11_9cc0_return_output);

-- t8_MUX_uxn_opcodes_h_l717_c7_55c9
t8_MUX_uxn_opcodes_h_l717_c7_55c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l717_c7_55c9_cond,
t8_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue,
t8_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse,
t8_MUX_uxn_opcodes_h_l717_c7_55c9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_55c9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_55c9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_55c9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_55c9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_55c9
result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_55c9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_55c9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_55c9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_55c9
result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_55c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_55c9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_55c9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_55c9
result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_55c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_55c9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_55c9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_55c9
result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_55c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_55c9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_55c9_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_55c9
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_55c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_55c9_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_55c9_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l717_c7_55c9
result_u16_value_MUX_uxn_opcodes_h_l717_c7_55c9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l717_c7_55c9_cond,
result_u16_value_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l717_c7_55c9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_55c9
result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_55c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_55c9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_55c9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l717_c7_55c9
result_u8_value_MUX_uxn_opcodes_h_l717_c7_55c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l717_c7_55c9_cond,
result_u8_value_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l717_c7_55c9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l720_c11_f12b
BIN_OP_EQ_uxn_opcodes_h_l720_c11_f12b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l720_c11_f12b_left,
BIN_OP_EQ_uxn_opcodes_h_l720_c11_f12b_right,
BIN_OP_EQ_uxn_opcodes_h_l720_c11_f12b_return_output);

-- t8_MUX_uxn_opcodes_h_l720_c7_bcfd
t8_MUX_uxn_opcodes_h_l720_c7_bcfd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l720_c7_bcfd_cond,
t8_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue,
t8_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse,
t8_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_bcfd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_bcfd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_bcfd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_bcfd
result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_bcfd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_bcfd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_bcfd
result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_bcfd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_bcfd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_bcfd
result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_bcfd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_bcfd_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_bcfd
result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_bcfd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_bcfd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_bcfd
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_bcfd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_bcfd_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l720_c7_bcfd
result_u16_value_MUX_uxn_opcodes_h_l720_c7_bcfd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l720_c7_bcfd_cond,
result_u16_value_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_bcfd
result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_bcfd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_bcfd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l720_c7_bcfd
result_u8_value_MUX_uxn_opcodes_h_l720_c7_bcfd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l720_c7_bcfd_cond,
result_u8_value_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output);

-- sp_relative_shift_uxn_opcodes_h_l723_c30_1de2
sp_relative_shift_uxn_opcodes_h_l723_c30_1de2 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l723_c30_1de2_ins,
sp_relative_shift_uxn_opcodes_h_l723_c30_1de2_x,
sp_relative_shift_uxn_opcodes_h_l723_c30_1de2_y,
sp_relative_shift_uxn_opcodes_h_l723_c30_1de2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l725_c11_c171
BIN_OP_EQ_uxn_opcodes_h_l725_c11_c171 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l725_c11_c171_left,
BIN_OP_EQ_uxn_opcodes_h_l725_c11_c171_right,
BIN_OP_EQ_uxn_opcodes_h_l725_c11_c171_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_a176
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_a176 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_a176_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_a176_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_a176_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_a176_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_a176
result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_a176 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_a176_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_a176_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_a176_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_a176_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_a176
result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_a176 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_a176_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_a176_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_a176_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_a176_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_a176
result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_a176 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_a176_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_a176_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_a176_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_a176_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_a176
result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_a176 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_a176_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_a176_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_a176_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_a176_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_a176
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_a176 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_a176_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_a176_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_a176_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_a176_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l725_c7_a176
result_u16_value_MUX_uxn_opcodes_h_l725_c7_a176 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l725_c7_a176_cond,
result_u16_value_MUX_uxn_opcodes_h_l725_c7_a176_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l725_c7_a176_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l725_c7_a176_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_a176
result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_a176 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_a176_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_a176_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_a176_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_a176_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l725_c7_a176
result_u8_value_MUX_uxn_opcodes_h_l725_c7_a176 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l725_c7_a176_cond,
result_u8_value_MUX_uxn_opcodes_h_l725_c7_a176_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l725_c7_a176_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l725_c7_a176_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l732_c11_8fc2
BIN_OP_EQ_uxn_opcodes_h_l732_c11_8fc2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l732_c11_8fc2_left,
BIN_OP_EQ_uxn_opcodes_h_l732_c11_8fc2_right,
BIN_OP_EQ_uxn_opcodes_h_l732_c11_8fc2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_d93f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_d93f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_d93f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_d93f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_d93f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_d93f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_d93f
result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_d93f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_d93f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_d93f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_d93f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_d93f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_d93f
result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_d93f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_d93f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_d93f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_d93f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_d93f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_d93f
result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_d93f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_d93f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_d93f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_d93f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_d93f_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_d93f
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_d93f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_d93f_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_d93f_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_d93f_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_d93f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l732_c7_d93f
result_u16_value_MUX_uxn_opcodes_h_l732_c7_d93f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l732_c7_d93f_cond,
result_u16_value_MUX_uxn_opcodes_h_l732_c7_d93f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l732_c7_d93f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l732_c7_d93f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_d93f
result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_d93f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_d93f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_d93f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_d93f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_d93f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l732_c7_d93f
result_u8_value_MUX_uxn_opcodes_h_l732_c7_d93f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l732_c7_d93f_cond,
result_u8_value_MUX_uxn_opcodes_h_l732_c7_d93f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l732_c7_d93f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l732_c7_d93f_return_output);

-- CONST_SR_8_uxn_opcodes_h_l735_c31_c30f
CONST_SR_8_uxn_opcodes_h_l735_c31_c30f : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l735_c31_c30f_x,
CONST_SR_8_uxn_opcodes_h_l735_c31_c30f_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l737_c22_5313
BIN_OP_PLUS_uxn_opcodes_h_l737_c22_5313 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l737_c22_5313_left,
BIN_OP_PLUS_uxn_opcodes_h_l737_c22_5313_right,
BIN_OP_PLUS_uxn_opcodes_h_l737_c22_5313_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l739_c11_bc08
BIN_OP_EQ_uxn_opcodes_h_l739_c11_bc08 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l739_c11_bc08_left,
BIN_OP_EQ_uxn_opcodes_h_l739_c11_bc08_right,
BIN_OP_EQ_uxn_opcodes_h_l739_c11_bc08_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_c7d8
result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_c7d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_c7d8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_c7d8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_c7d8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_c7d8_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_c7d8
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_c7d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_c7d8_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_c7d8_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_c7d8_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_c7d8_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_c7d8
result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_c7d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_c7d8_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_c7d8_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_c7d8_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_c7d8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_c7d8
result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_c7d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_c7d8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_c7d8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_c7d8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_c7d8_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 -- Registers
 t8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l712_c6_fec8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_ff0d_return_output,
 t8_MUX_uxn_opcodes_h_l712_c2_dff4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_dff4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_dff4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_dff4_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_dff4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_dff4_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_dff4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l712_c2_dff4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_dff4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l712_c2_dff4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l717_c11_9cc0_return_output,
 t8_MUX_uxn_opcodes_h_l717_c7_55c9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_55c9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_55c9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_55c9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_55c9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_55c9_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_55c9_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l717_c7_55c9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_55c9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l717_c7_55c9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l720_c11_f12b_return_output,
 t8_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output,
 sp_relative_shift_uxn_opcodes_h_l723_c30_1de2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l725_c11_c171_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_a176_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_a176_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_a176_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_a176_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_a176_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_a176_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l725_c7_a176_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_a176_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l725_c7_a176_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l732_c11_8fc2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_d93f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_d93f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_d93f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_d93f_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_d93f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l732_c7_d93f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_d93f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l732_c7_d93f_return_output,
 CONST_SR_8_uxn_opcodes_h_l735_c31_c30f_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l737_c22_5313_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l739_c11_bc08_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_c7d8_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_c7d8_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_c7d8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_c7d8_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_fec8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_fec8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_fec8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_ff0d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_ff0d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_ff0d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_ff0d_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l717_c7_55c9_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l712_c2_dff4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l712_c2_dff4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l714_c3_d92a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_55c9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_dff4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_dff4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_55c9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_dff4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_dff4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_55c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_dff4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_dff4_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_55c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_dff4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_dff4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_55c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_dff4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_dff4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_55c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_dff4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_dff4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_55c9_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l712_c2_dff4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l712_c2_dff4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_55c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_dff4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_dff4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l717_c7_55c9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l712_c2_dff4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l712_c2_dff4_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l713_c3_4f39_uxn_opcodes_h_l713_c3_4f39_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_9cc0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_9cc0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_9cc0_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l717_c7_55c9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l718_c3_f2d0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_55c9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_55c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_55c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_55c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_55c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_55c9_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_55c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_55c9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l717_c7_55c9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_f12b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_f12b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_f12b_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l720_c7_bcfd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_a176_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_bcfd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_a176_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_bcfd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_a176_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_bcfd_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_a176_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_bcfd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_a176_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_bcfd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_a176_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_bcfd_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l725_c7_a176_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l720_c7_bcfd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_a176_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_bcfd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l725_c7_a176_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l720_c7_bcfd_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l723_c30_1de2_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l723_c30_1de2_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l723_c30_1de2_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l723_c30_1de2_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_c171_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_c171_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_c171_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_a176_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l729_c3_187f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_a176_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_d93f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_a176_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_a176_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l727_c3_c6c1 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_a176_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_a176_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_a176_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_a176_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_d93f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_a176_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_a176_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_a176_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_d93f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_a176_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_a176_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_a176_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_d93f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_a176_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_a176_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_a176_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_d93f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_a176_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l725_c7_a176_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l725_c7_a176_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l732_c7_d93f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l725_c7_a176_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_a176_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_a176_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_d93f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_a176_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l725_c7_a176_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l725_c7_a176_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l732_c7_d93f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l725_c7_a176_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l730_c21_04eb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_8fc2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_8fc2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_8fc2_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_d93f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l734_c3_3ad7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_d93f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_d93f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_d93f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_d93f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_c7d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_d93f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_d93f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_d93f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_c7d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_d93f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_d93f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_d93f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_c7d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_d93f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_d93f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_d93f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_c7d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_d93f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l732_c7_d93f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l737_c3_45a2 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l732_c7_d93f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l732_c7_d93f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_d93f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_d93f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_d93f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l732_c7_d93f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l732_c7_d93f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l732_c7_d93f_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l735_c31_c30f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l735_c31_c30f_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l735_c21_fcc2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l737_c22_5313_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l737_c27_8724_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l737_c22_5313_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l737_c22_5313_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_bc08_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_bc08_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_bc08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_c7d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_c7d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_c7d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_c7d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_c7d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_c7d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_c7d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_c7d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_c7d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_c7d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_c7d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_c7d8_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l712_l725_l717_DUPLICATE_2d7f_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l725_l720_l717_l712_l739_DUPLICATE_1c5b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l732_l720_l717_l712_l739_DUPLICATE_69aa_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l732_l720_l717_l712_l739_DUPLICATE_860c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l732_l725_l720_l717_l712_DUPLICATE_83a6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l732_l712_l725_l717_DUPLICATE_6b0b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l732_l720_l712_l717_DUPLICATE_5db1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l732_l725_l720_l717_l739_DUPLICATE_956a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l732_l720_DUPLICATE_2c54_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7c3b_uxn_opcodes_h_l746_l708_DUPLICATE_f83d_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_c7d8_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l723_c30_1de2_y := resize(to_signed(-1, 2), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_9cc0_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_f12b_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_c7d8_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_d93f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_8fc2_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_c7d8_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_c7d8_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l723_c30_1de2_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_c171_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_a176_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_ff0d_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l734_c3_3ad7 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_d93f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l734_c3_3ad7;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l718_c3_f2d0 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l718_c3_f2d0;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_bc08_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l729_c3_187f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_a176_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l729_c3_187f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l714_c3_d92a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l714_c3_d92a;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l727_c3_c6c1 := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_a176_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l727_c3_c6c1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_fec8_right := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_a176_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_d93f_iftrue := to_unsigned(1, 1);

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

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_ff0d_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l723_c30_1de2_ins := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l737_c22_5313_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_CONST_SR_8_uxn_opcodes_h_l735_c31_c30f_x := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_fec8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_9cc0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_f12b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_c171_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_8fc2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_bc08_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l732_l720_l717_l712_l739_DUPLICATE_860c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l732_l720_l717_l712_l739_DUPLICATE_860c_return_output := result.is_stack_index_flipped;

     -- sp_relative_shift[uxn_opcodes_h_l723_c30_1de2] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l723_c30_1de2_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l723_c30_1de2_ins;
     sp_relative_shift_uxn_opcodes_h_l723_c30_1de2_x <= VAR_sp_relative_shift_uxn_opcodes_h_l723_c30_1de2_x;
     sp_relative_shift_uxn_opcodes_h_l723_c30_1de2_y <= VAR_sp_relative_shift_uxn_opcodes_h_l723_c30_1de2_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l723_c30_1de2_return_output := sp_relative_shift_uxn_opcodes_h_l723_c30_1de2_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l730_c21_04eb] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l730_c21_04eb_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_pc);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l732_l712_l725_l717_DUPLICATE_6b0b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l732_l712_l725_l717_DUPLICATE_6b0b_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l717_c11_9cc0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l717_c11_9cc0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_9cc0_left;
     BIN_OP_EQ_uxn_opcodes_h_l717_c11_9cc0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_9cc0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_9cc0_return_output := BIN_OP_EQ_uxn_opcodes_h_l717_c11_9cc0_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l737_c27_8724] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l737_c27_8724_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l712_l725_l717_DUPLICATE_2d7f LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l712_l725_l717_DUPLICATE_2d7f_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l725_l720_l717_l712_l739_DUPLICATE_1c5b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l725_l720_l717_l712_l739_DUPLICATE_1c5b_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l732_l720_DUPLICATE_2c54 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l732_l720_DUPLICATE_2c54_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l732_l725_l720_l717_l712_DUPLICATE_83a6 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l732_l725_l720_l717_l712_DUPLICATE_83a6_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l720_c11_f12b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l720_c11_f12b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_f12b_left;
     BIN_OP_EQ_uxn_opcodes_h_l720_c11_f12b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_f12b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_f12b_return_output := BIN_OP_EQ_uxn_opcodes_h_l720_c11_f12b_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l732_l720_l712_l717_DUPLICATE_5db1 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l732_l720_l712_l717_DUPLICATE_5db1_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l732_l720_l717_l712_l739_DUPLICATE_69aa LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l732_l720_l717_l712_l739_DUPLICATE_69aa_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l732_l725_l720_l717_l739_DUPLICATE_956a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l732_l725_l720_l717_l739_DUPLICATE_956a_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l712_c6_fec8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l712_c6_fec8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_fec8_left;
     BIN_OP_EQ_uxn_opcodes_h_l712_c6_fec8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_fec8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_fec8_return_output := BIN_OP_EQ_uxn_opcodes_h_l712_c6_fec8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l725_c11_c171] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l725_c11_c171_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_c171_left;
     BIN_OP_EQ_uxn_opcodes_h_l725_c11_c171_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_c171_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_c171_return_output := BIN_OP_EQ_uxn_opcodes_h_l725_c11_c171_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l735_c31_c30f] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l735_c31_c30f_x <= VAR_CONST_SR_8_uxn_opcodes_h_l735_c31_c30f_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l735_c31_c30f_return_output := CONST_SR_8_uxn_opcodes_h_l735_c31_c30f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l732_c11_8fc2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l732_c11_8fc2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_8fc2_left;
     BIN_OP_EQ_uxn_opcodes_h_l732_c11_8fc2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_8fc2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_8fc2_return_output := BIN_OP_EQ_uxn_opcodes_h_l732_c11_8fc2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l739_c11_bc08] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l739_c11_bc08_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_bc08_left;
     BIN_OP_EQ_uxn_opcodes_h_l739_c11_bc08_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_bc08_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_bc08_return_output := BIN_OP_EQ_uxn_opcodes_h_l739_c11_bc08_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_ff0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_fec8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_dff4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_fec8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_dff4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_fec8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_dff4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_fec8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_dff4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_fec8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_dff4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_fec8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_dff4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_fec8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_dff4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_fec8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l712_c2_dff4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_fec8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l712_c2_dff4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_fec8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l712_c2_dff4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_fec8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_55c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_9cc0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_55c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_9cc0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_55c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_9cc0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_55c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_9cc0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_55c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_9cc0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_55c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_9cc0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_55c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_9cc0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_55c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_9cc0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l717_c7_55c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_9cc0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l717_c7_55c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_9cc0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_bcfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_f12b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_bcfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_f12b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_bcfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_f12b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_bcfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_f12b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_bcfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_f12b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_bcfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_f12b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_bcfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_f12b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l720_c7_bcfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_f12b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l720_c7_bcfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_f12b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l720_c7_bcfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_f12b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_a176_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_c171_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_a176_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_c171_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_a176_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_c171_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_a176_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_c171_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_a176_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_c171_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_a176_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_c171_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_a176_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_c171_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l725_c7_a176_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_c171_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l725_c7_a176_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_c171_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_d93f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_8fc2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_d93f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_8fc2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_d93f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_8fc2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_d93f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_8fc2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_d93f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_8fc2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_d93f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_8fc2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l732_c7_d93f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_8fc2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l732_c7_d93f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_8fc2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_c7d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_bc08_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_c7d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_bc08_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_c7d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_bc08_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_c7d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_bc08_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l737_c22_5313_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l737_c27_8724_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l725_c7_a176_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l730_c21_04eb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l712_l725_l717_DUPLICATE_2d7f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l712_l725_l717_DUPLICATE_2d7f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_a176_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l712_l725_l717_DUPLICATE_2d7f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l732_l725_l720_l717_l712_DUPLICATE_83a6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l732_l725_l720_l717_l712_DUPLICATE_83a6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l732_l725_l720_l717_l712_DUPLICATE_83a6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l725_c7_a176_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l732_l725_l720_l717_l712_DUPLICATE_83a6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l732_c7_d93f_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l732_l725_l720_l717_l712_DUPLICATE_83a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l732_l725_l720_l717_l739_DUPLICATE_956a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l732_l725_l720_l717_l739_DUPLICATE_956a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_a176_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l732_l725_l720_l717_l739_DUPLICATE_956a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_d93f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l732_l725_l720_l717_l739_DUPLICATE_956a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_c7d8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l732_l725_l720_l717_l739_DUPLICATE_956a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l725_l720_l717_l712_l739_DUPLICATE_1c5b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l725_l720_l717_l712_l739_DUPLICATE_1c5b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l725_l720_l717_l712_l739_DUPLICATE_1c5b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_a176_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l725_l720_l717_l712_l739_DUPLICATE_1c5b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_c7d8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l725_l720_l717_l712_l739_DUPLICATE_1c5b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l732_l712_l725_l717_DUPLICATE_6b0b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l732_l712_l725_l717_DUPLICATE_6b0b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_a176_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l732_l712_l725_l717_DUPLICATE_6b0b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_d93f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l732_l712_l725_l717_DUPLICATE_6b0b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l732_l720_l717_l712_l739_DUPLICATE_860c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l732_l720_l717_l712_l739_DUPLICATE_860c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l732_l720_l717_l712_l739_DUPLICATE_860c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_d93f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l732_l720_l717_l712_l739_DUPLICATE_860c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_c7d8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l732_l720_l717_l712_l739_DUPLICATE_860c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l732_l720_l717_l712_l739_DUPLICATE_69aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l732_l720_l717_l712_l739_DUPLICATE_69aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l732_l720_l717_l712_l739_DUPLICATE_69aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_d93f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l732_l720_l717_l712_l739_DUPLICATE_69aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_c7d8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l732_l720_l717_l712_l739_DUPLICATE_69aa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l732_l720_DUPLICATE_2c54_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_d93f_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l732_l720_DUPLICATE_2c54_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l732_l720_l712_l717_DUPLICATE_5db1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l732_l720_l712_l717_DUPLICATE_5db1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l732_l720_l712_l717_DUPLICATE_5db1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l732_c7_d93f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l732_l720_l712_l717_DUPLICATE_5db1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l723_c30_1de2_return_output;
     -- t8_MUX[uxn_opcodes_h_l720_c7_bcfd] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l720_c7_bcfd_cond <= VAR_t8_MUX_uxn_opcodes_h_l720_c7_bcfd_cond;
     t8_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue;
     t8_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output := t8_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l739_c7_c7d8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_c7d8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_c7d8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_c7d8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_c7d8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_c7d8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_c7d8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_c7d8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_c7d8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l732_c7_d93f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_d93f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_d93f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_d93f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_d93f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_d93f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_d93f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_d93f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_d93f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l739_c7_c7d8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_c7d8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_c7d8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_c7d8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_c7d8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_c7d8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_c7d8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_c7d8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_c7d8_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l739_c7_c7d8] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_c7d8_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_c7d8_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_c7d8_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_c7d8_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_c7d8_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_c7d8_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_c7d8_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_c7d8_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l735_c21_fcc2] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l735_c21_fcc2_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l735_c31_c30f_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l725_c7_a176] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_a176_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_a176_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_a176_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_a176_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_a176_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_a176_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_a176_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_a176_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l739_c7_c7d8] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_c7d8_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_c7d8_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_c7d8_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_c7d8_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_c7d8_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_c7d8_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_c7d8_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_c7d8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l732_c7_d93f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_d93f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_d93f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_d93f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_d93f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_d93f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_d93f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_d93f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_d93f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l712_c1_ff0d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_ff0d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_ff0d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_ff0d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_ff0d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_ff0d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_ff0d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_ff0d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_ff0d_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l737_c22_5313] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l737_c22_5313_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l737_c22_5313_left;
     BIN_OP_PLUS_uxn_opcodes_h_l737_c22_5313_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l737_c22_5313_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l737_c22_5313_return_output := BIN_OP_PLUS_uxn_opcodes_h_l737_c22_5313_return_output;

     -- Submodule level 2
     VAR_result_u16_value_uxn_opcodes_h_l737_c3_45a2 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l737_c22_5313_return_output)),16);
     VAR_result_u8_value_MUX_uxn_opcodes_h_l732_c7_d93f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l735_c21_fcc2_return_output;
     VAR_printf_uxn_opcodes_h_l713_c3_4f39_uxn_opcodes_h_l713_c3_4f39_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_ff0d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_d93f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_c7d8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_d93f_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_c7d8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_a176_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_d93f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_d93f_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_c7d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_d93f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_c7d8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_a176_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_a176_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_d93f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse := VAR_t8_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l732_c7_d93f_iftrue := VAR_result_u16_value_uxn_opcodes_h_l737_c3_45a2;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l725_c7_a176] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_a176_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_a176_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_a176_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_a176_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_a176_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_a176_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_a176_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_a176_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l732_c7_d93f] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_d93f_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_d93f_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_d93f_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_d93f_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_d93f_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_d93f_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_d93f_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_d93f_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l732_c7_d93f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l732_c7_d93f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l732_c7_d93f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l732_c7_d93f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l732_c7_d93f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l732_c7_d93f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l732_c7_d93f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l732_c7_d93f_return_output := result_u16_value_MUX_uxn_opcodes_h_l732_c7_d93f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l720_c7_bcfd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_bcfd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_bcfd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l732_c7_d93f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_d93f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_d93f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_d93f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_d93f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_d93f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_d93f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_d93f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_d93f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l732_c7_d93f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_d93f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_d93f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_d93f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_d93f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_d93f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_d93f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_d93f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_d93f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l732_c7_d93f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l732_c7_d93f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l732_c7_d93f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l732_c7_d93f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l732_c7_d93f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l732_c7_d93f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l732_c7_d93f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l732_c7_d93f_return_output := result_u8_value_MUX_uxn_opcodes_h_l732_c7_d93f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l732_c7_d93f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_d93f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_d93f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_d93f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_d93f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_d93f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_d93f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_d93f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_d93f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l725_c7_a176] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_a176_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_a176_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_a176_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_a176_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_a176_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_a176_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_a176_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_a176_return_output;

     -- t8_MUX[uxn_opcodes_h_l717_c7_55c9] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l717_c7_55c9_cond <= VAR_t8_MUX_uxn_opcodes_h_l717_c7_55c9_cond;
     t8_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue;
     t8_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l717_c7_55c9_return_output := t8_MUX_uxn_opcodes_h_l717_c7_55c9_return_output;

     -- printf_uxn_opcodes_h_l713_c3_4f39[uxn_opcodes_h_l713_c3_4f39] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l713_c3_4f39_uxn_opcodes_h_l713_c3_4f39_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l713_c3_4f39_uxn_opcodes_h_l713_c3_4f39_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_a176_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_d93f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_a176_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_d93f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_a176_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_a176_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_d93f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_a176_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_d93f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_a176_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l725_c7_a176_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l732_c7_d93f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l725_c7_a176_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l732_c7_d93f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse := VAR_t8_MUX_uxn_opcodes_h_l717_c7_55c9_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l725_c7_a176] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_a176_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_a176_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_a176_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_a176_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_a176_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_a176_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_a176_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_a176_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l725_c7_a176] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_a176_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_a176_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_a176_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_a176_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_a176_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_a176_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_a176_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_a176_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l725_c7_a176] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_a176_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_a176_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_a176_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_a176_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_a176_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_a176_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_a176_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_a176_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l725_c7_a176] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l725_c7_a176_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l725_c7_a176_cond;
     result_u16_value_MUX_uxn_opcodes_h_l725_c7_a176_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l725_c7_a176_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l725_c7_a176_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l725_c7_a176_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l725_c7_a176_return_output := result_u16_value_MUX_uxn_opcodes_h_l725_c7_a176_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l720_c7_bcfd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_bcfd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_bcfd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output;

     -- t8_MUX[uxn_opcodes_h_l712_c2_dff4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l712_c2_dff4_cond <= VAR_t8_MUX_uxn_opcodes_h_l712_c2_dff4_cond;
     t8_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue;
     t8_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l712_c2_dff4_return_output := t8_MUX_uxn_opcodes_h_l712_c2_dff4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l717_c7_55c9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_55c9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_55c9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_55c9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_55c9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l725_c7_a176] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_a176_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_a176_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_a176_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_a176_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_a176_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_a176_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_a176_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_a176_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l725_c7_a176] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l725_c7_a176_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l725_c7_a176_cond;
     result_u8_value_MUX_uxn_opcodes_h_l725_c7_a176_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l725_c7_a176_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l725_c7_a176_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l725_c7_a176_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l725_c7_a176_return_output := result_u8_value_MUX_uxn_opcodes_h_l725_c7_a176_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l720_c7_bcfd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_bcfd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_bcfd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_a176_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_a176_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_a176_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_a176_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_55c9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l725_c7_a176_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l725_c7_a176_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l712_c2_dff4_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l712_c2_dff4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_dff4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_dff4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_dff4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_dff4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l717_c7_55c9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_55c9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_55c9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_55c9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_55c9_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l720_c7_bcfd] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_bcfd_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_bcfd_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l720_c7_bcfd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_bcfd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_bcfd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l720_c7_bcfd] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l720_c7_bcfd_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l720_c7_bcfd_cond;
     result_u16_value_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output := result_u16_value_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l720_c7_bcfd] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_bcfd_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_bcfd_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l720_c7_bcfd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l720_c7_bcfd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l720_c7_bcfd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output := result_u8_value_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l720_c7_bcfd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_bcfd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_bcfd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_bcfd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_bcfd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l717_c7_55c9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_55c9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_55c9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_55c9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_55c9_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_55c9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_55c9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l720_c7_bcfd_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l717_c7_55c9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l717_c7_55c9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l717_c7_55c9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l717_c7_55c9_return_output := result_u8_value_MUX_uxn_opcodes_h_l717_c7_55c9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l712_c2_dff4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_dff4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_dff4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_dff4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_dff4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l712_c2_dff4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_dff4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_dff4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_dff4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_dff4_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l717_c7_55c9] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l717_c7_55c9_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_55c9_cond;
     result_u16_value_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_55c9_return_output := result_u16_value_MUX_uxn_opcodes_h_l717_c7_55c9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l717_c7_55c9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_55c9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_55c9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_55c9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_55c9_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l717_c7_55c9] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_55c9_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_55c9_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_55c9_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_55c9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l717_c7_55c9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_55c9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_55c9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_55c9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_55c9_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l717_c7_55c9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_55c9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_55c9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_55c9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_55c9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_55c9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_55c9_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_55c9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_55c9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_55c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_55c9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_55c9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l717_c7_55c9_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l712_c2_dff4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_dff4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_dff4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_dff4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_dff4_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l712_c2_dff4] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_dff4_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_dff4_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_dff4_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_dff4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l712_c2_dff4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_dff4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_dff4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_dff4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_dff4_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l712_c2_dff4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l712_c2_dff4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l712_c2_dff4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l712_c2_dff4_return_output := result_u16_value_MUX_uxn_opcodes_h_l712_c2_dff4_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l712_c2_dff4] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_dff4_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_dff4_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_dff4_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_dff4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l712_c2_dff4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l712_c2_dff4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l712_c2_dff4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l712_c2_dff4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l712_c2_dff4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l712_c2_dff4_return_output := result_u8_value_MUX_uxn_opcodes_h_l712_c2_dff4_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_7c3b_uxn_opcodes_h_l746_l708_DUPLICATE_f83d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7c3b_uxn_opcodes_h_l746_l708_DUPLICATE_f83d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_7c3b(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_dff4_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_dff4_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_dff4_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_dff4_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_dff4_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_dff4_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l712_c2_dff4_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_dff4_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l712_c2_dff4_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7c3b_uxn_opcodes_h_l746_l708_DUPLICATE_f83d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7c3b_uxn_opcodes_h_l746_l708_DUPLICATE_f83d_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
