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
-- -- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 97
entity jsr2_0CLK_85c87c86 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jsr2_0CLK_85c87c86;
architecture arch of jsr2_0CLK_85c87c86 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l814_c6_4923]
signal BIN_OP_EQ_uxn_opcodes_h_l814_c6_4923_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l814_c6_4923_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l814_c6_4923_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l814_c2_0672]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_0672_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_0672_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_0672_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_0672_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l814_c2_0672]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_0672_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_0672_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_0672_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_0672_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l814_c2_0672]
signal result_pc_MUX_uxn_opcodes_h_l814_c2_0672_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l814_c2_0672_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l814_c2_0672_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l814_c2_0672_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l814_c2_0672]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_0672_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_0672_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_0672_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_0672_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l814_c2_0672]
signal result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_0672_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_0672_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_0672_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_0672_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l814_c2_0672]
signal result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_0672_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_0672_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_0672_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_0672_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l814_c2_0672]
signal result_stack_value_MUX_uxn_opcodes_h_l814_c2_0672_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l814_c2_0672_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l814_c2_0672_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l814_c2_0672_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l814_c2_0672]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_0672_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_0672_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_0672_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_0672_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l814_c2_0672]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_0672_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_0672_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_0672_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_0672_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l814_c2_0672]
signal t16_MUX_uxn_opcodes_h_l814_c2_0672_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l814_c2_0672_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l814_c2_0672_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l814_c2_0672_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l819_c11_9c70]
signal BIN_OP_EQ_uxn_opcodes_h_l819_c11_9c70_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l819_c11_9c70_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l819_c11_9c70_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l819_c7_9532]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9532_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9532_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9532_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9532_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l819_c7_9532]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9532_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9532_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9532_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9532_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l819_c7_9532]
signal result_pc_MUX_uxn_opcodes_h_l819_c7_9532_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l819_c7_9532_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l819_c7_9532_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l819_c7_9532_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l819_c7_9532]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_9532_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_9532_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_9532_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_9532_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l819_c7_9532]
signal result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_9532_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_9532_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_9532_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_9532_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l819_c7_9532]
signal result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9532_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9532_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9532_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9532_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l819_c7_9532]
signal result_stack_value_MUX_uxn_opcodes_h_l819_c7_9532_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l819_c7_9532_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l819_c7_9532_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l819_c7_9532_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l819_c7_9532]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9532_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9532_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9532_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9532_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l819_c7_9532]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_9532_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_9532_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_9532_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_9532_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l819_c7_9532]
signal t16_MUX_uxn_opcodes_h_l819_c7_9532_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l819_c7_9532_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l819_c7_9532_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l819_c7_9532_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l822_c11_0517]
signal BIN_OP_EQ_uxn_opcodes_h_l822_c11_0517_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l822_c11_0517_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l822_c11_0517_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l822_c7_1523]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_1523_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_1523_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_1523_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_1523_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l822_c7_1523]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_1523_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_1523_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_1523_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_1523_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l822_c7_1523]
signal result_pc_MUX_uxn_opcodes_h_l822_c7_1523_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l822_c7_1523_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l822_c7_1523_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l822_c7_1523_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l822_c7_1523]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_1523_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_1523_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_1523_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_1523_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l822_c7_1523]
signal result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_1523_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_1523_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_1523_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_1523_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l822_c7_1523]
signal result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_1523_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_1523_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_1523_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_1523_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l822_c7_1523]
signal result_stack_value_MUX_uxn_opcodes_h_l822_c7_1523_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l822_c7_1523_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l822_c7_1523_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l822_c7_1523_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l822_c7_1523]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_1523_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_1523_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_1523_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_1523_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l822_c7_1523]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_1523_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_1523_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_1523_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_1523_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l822_c7_1523]
signal t16_MUX_uxn_opcodes_h_l822_c7_1523_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l822_c7_1523_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l822_c7_1523_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l822_c7_1523_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l824_c3_9945]
signal CONST_SL_8_uxn_opcodes_h_l824_c3_9945_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l824_c3_9945_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l827_c11_3b3b]
signal BIN_OP_EQ_uxn_opcodes_h_l827_c11_3b3b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l827_c11_3b3b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l827_c11_3b3b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l827_c7_1cc0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_1cc0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l827_c7_1cc0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_1cc0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l827_c7_1cc0]
signal result_pc_MUX_uxn_opcodes_h_l827_c7_1cc0_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l827_c7_1cc0]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_1cc0_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l827_c7_1cc0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_1cc0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l827_c7_1cc0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_1cc0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l827_c7_1cc0]
signal result_stack_value_MUX_uxn_opcodes_h_l827_c7_1cc0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l827_c7_1cc0]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_1cc0_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l827_c7_1cc0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_1cc0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l827_c7_1cc0]
signal t16_MUX_uxn_opcodes_h_l827_c7_1cc0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l830_c11_9aec]
signal BIN_OP_EQ_uxn_opcodes_h_l830_c11_9aec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l830_c11_9aec_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l830_c11_9aec_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l830_c7_7bbf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_7bbf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l830_c7_7bbf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_7bbf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l830_c7_7bbf]
signal result_pc_MUX_uxn_opcodes_h_l830_c7_7bbf_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l830_c7_7bbf]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_7bbf_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l830_c7_7bbf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_7bbf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l830_c7_7bbf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_7bbf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l830_c7_7bbf]
signal result_stack_value_MUX_uxn_opcodes_h_l830_c7_7bbf_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l830_c7_7bbf]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_7bbf_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l830_c7_7bbf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_7bbf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l830_c7_7bbf]
signal t16_MUX_uxn_opcodes_h_l830_c7_7bbf_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l831_c3_9da4]
signal BIN_OP_OR_uxn_opcodes_h_l831_c3_9da4_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l831_c3_9da4_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l831_c3_9da4_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l833_c32_9641]
signal BIN_OP_AND_uxn_opcodes_h_l833_c32_9641_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l833_c32_9641_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l833_c32_9641_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l833_c32_91c8]
signal BIN_OP_GT_uxn_opcodes_h_l833_c32_91c8_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l833_c32_91c8_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l833_c32_91c8_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l833_c32_a983]
signal MUX_uxn_opcodes_h_l833_c32_a983_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l833_c32_a983_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l833_c32_a983_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l833_c32_a983_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l835_c11_80ac]
signal BIN_OP_EQ_uxn_opcodes_h_l835_c11_80ac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l835_c11_80ac_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l835_c11_80ac_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l835_c7_3e8c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3e8c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l835_c7_3e8c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3e8c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l835_c7_3e8c]
signal result_pc_MUX_uxn_opcodes_h_l835_c7_3e8c_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l835_c7_3e8c]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_3e8c_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l835_c7_3e8c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3e8c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l835_c7_3e8c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3e8c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l835_c7_3e8c]
signal result_stack_value_MUX_uxn_opcodes_h_l835_c7_3e8c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l835_c7_3e8c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_3e8c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l835_c7_3e8c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3e8c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l839_c11_ee47]
signal BIN_OP_EQ_uxn_opcodes_h_l839_c11_ee47_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l839_c11_ee47_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l839_c11_ee47_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l839_c7_974e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_974e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_974e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_974e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_974e_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l839_c7_974e]
signal result_pc_MUX_uxn_opcodes_h_l839_c7_974e_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l839_c7_974e_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l839_c7_974e_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l839_c7_974e_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l839_c7_974e]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_974e_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_974e_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_974e_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_974e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l839_c7_974e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_974e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_974e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_974e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_974e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l839_c7_974e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_974e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_974e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_974e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_974e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l839_c7_974e]
signal result_stack_value_MUX_uxn_opcodes_h_l839_c7_974e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l839_c7_974e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l839_c7_974e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l839_c7_974e_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l839_c7_974e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_974e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_974e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_974e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_974e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l839_c7_974e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_974e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_974e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_974e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_974e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l845_c11_a712]
signal BIN_OP_EQ_uxn_opcodes_h_l845_c11_a712_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l845_c11_a712_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l845_c11_a712_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l845_c7_5b95]
signal result_stack_value_MUX_uxn_opcodes_h_l845_c7_5b95_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l845_c7_5b95_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l845_c7_5b95_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l845_c7_5b95_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l845_c7_5b95]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_5b95_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_5b95_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_5b95_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_5b95_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l845_c7_5b95]
signal result_pc_MUX_uxn_opcodes_h_l845_c7_5b95_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l845_c7_5b95_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l845_c7_5b95_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l845_c7_5b95_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l845_c7_5b95]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_5b95_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_5b95_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_5b95_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_5b95_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l845_c7_5b95]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_5b95_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_5b95_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_5b95_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_5b95_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l845_c7_5b95]
signal result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_5b95_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_5b95_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_5b95_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_5b95_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l845_c7_5b95]
signal result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_5b95_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_5b95_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_5b95_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_5b95_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l847_c34_e008]
signal CONST_SR_8_uxn_opcodes_h_l847_c34_e008_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l847_c34_e008_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l851_c11_92eb]
signal BIN_OP_EQ_uxn_opcodes_h_l851_c11_92eb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l851_c11_92eb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l851_c11_92eb_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l851_c7_dbdc]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_dbdc_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_dbdc_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_dbdc_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_dbdc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l851_c7_dbdc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_dbdc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_dbdc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_dbdc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_dbdc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l851_c7_dbdc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_dbdc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_dbdc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_dbdc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_dbdc_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l851_c7_dbdc]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_dbdc_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_dbdc_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_dbdc_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_dbdc_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_2401( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
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
      base.sp_relative_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.pc := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_value := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_sp_shift := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l814_c6_4923
BIN_OP_EQ_uxn_opcodes_h_l814_c6_4923 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l814_c6_4923_left,
BIN_OP_EQ_uxn_opcodes_h_l814_c6_4923_right,
BIN_OP_EQ_uxn_opcodes_h_l814_c6_4923_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_0672
result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_0672 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_0672_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_0672_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_0672_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_0672_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_0672
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_0672 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_0672_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_0672_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_0672_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_0672_return_output);

-- result_pc_MUX_uxn_opcodes_h_l814_c2_0672
result_pc_MUX_uxn_opcodes_h_l814_c2_0672 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l814_c2_0672_cond,
result_pc_MUX_uxn_opcodes_h_l814_c2_0672_iftrue,
result_pc_MUX_uxn_opcodes_h_l814_c2_0672_iffalse,
result_pc_MUX_uxn_opcodes_h_l814_c2_0672_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_0672
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_0672 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_0672_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_0672_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_0672_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_0672_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_0672
result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_0672 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_0672_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_0672_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_0672_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_0672_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_0672
result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_0672 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_0672_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_0672_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_0672_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_0672_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l814_c2_0672
result_stack_value_MUX_uxn_opcodes_h_l814_c2_0672 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l814_c2_0672_cond,
result_stack_value_MUX_uxn_opcodes_h_l814_c2_0672_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l814_c2_0672_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l814_c2_0672_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_0672
result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_0672 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_0672_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_0672_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_0672_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_0672_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_0672
result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_0672 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_0672_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_0672_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_0672_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_0672_return_output);

-- t16_MUX_uxn_opcodes_h_l814_c2_0672
t16_MUX_uxn_opcodes_h_l814_c2_0672 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l814_c2_0672_cond,
t16_MUX_uxn_opcodes_h_l814_c2_0672_iftrue,
t16_MUX_uxn_opcodes_h_l814_c2_0672_iffalse,
t16_MUX_uxn_opcodes_h_l814_c2_0672_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l819_c11_9c70
BIN_OP_EQ_uxn_opcodes_h_l819_c11_9c70 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l819_c11_9c70_left,
BIN_OP_EQ_uxn_opcodes_h_l819_c11_9c70_right,
BIN_OP_EQ_uxn_opcodes_h_l819_c11_9c70_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9532
result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9532 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9532_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9532_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9532_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9532_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9532
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9532 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9532_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9532_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9532_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9532_return_output);

-- result_pc_MUX_uxn_opcodes_h_l819_c7_9532
result_pc_MUX_uxn_opcodes_h_l819_c7_9532 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l819_c7_9532_cond,
result_pc_MUX_uxn_opcodes_h_l819_c7_9532_iftrue,
result_pc_MUX_uxn_opcodes_h_l819_c7_9532_iffalse,
result_pc_MUX_uxn_opcodes_h_l819_c7_9532_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_9532
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_9532 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_9532_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_9532_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_9532_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_9532_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_9532
result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_9532 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_9532_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_9532_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_9532_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_9532_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9532
result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9532 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9532_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9532_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9532_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9532_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l819_c7_9532
result_stack_value_MUX_uxn_opcodes_h_l819_c7_9532 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l819_c7_9532_cond,
result_stack_value_MUX_uxn_opcodes_h_l819_c7_9532_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l819_c7_9532_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l819_c7_9532_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9532
result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9532 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9532_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9532_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9532_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9532_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_9532
result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_9532 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_9532_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_9532_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_9532_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_9532_return_output);

-- t16_MUX_uxn_opcodes_h_l819_c7_9532
t16_MUX_uxn_opcodes_h_l819_c7_9532 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l819_c7_9532_cond,
t16_MUX_uxn_opcodes_h_l819_c7_9532_iftrue,
t16_MUX_uxn_opcodes_h_l819_c7_9532_iffalse,
t16_MUX_uxn_opcodes_h_l819_c7_9532_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l822_c11_0517
BIN_OP_EQ_uxn_opcodes_h_l822_c11_0517 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l822_c11_0517_left,
BIN_OP_EQ_uxn_opcodes_h_l822_c11_0517_right,
BIN_OP_EQ_uxn_opcodes_h_l822_c11_0517_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_1523
result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_1523 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_1523_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_1523_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_1523_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_1523_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_1523
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_1523 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_1523_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_1523_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_1523_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_1523_return_output);

-- result_pc_MUX_uxn_opcodes_h_l822_c7_1523
result_pc_MUX_uxn_opcodes_h_l822_c7_1523 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l822_c7_1523_cond,
result_pc_MUX_uxn_opcodes_h_l822_c7_1523_iftrue,
result_pc_MUX_uxn_opcodes_h_l822_c7_1523_iffalse,
result_pc_MUX_uxn_opcodes_h_l822_c7_1523_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_1523
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_1523 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_1523_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_1523_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_1523_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_1523_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_1523
result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_1523 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_1523_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_1523_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_1523_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_1523_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_1523
result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_1523 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_1523_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_1523_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_1523_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_1523_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l822_c7_1523
result_stack_value_MUX_uxn_opcodes_h_l822_c7_1523 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l822_c7_1523_cond,
result_stack_value_MUX_uxn_opcodes_h_l822_c7_1523_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l822_c7_1523_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l822_c7_1523_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_1523
result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_1523 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_1523_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_1523_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_1523_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_1523_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_1523
result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_1523 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_1523_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_1523_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_1523_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_1523_return_output);

-- t16_MUX_uxn_opcodes_h_l822_c7_1523
t16_MUX_uxn_opcodes_h_l822_c7_1523 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l822_c7_1523_cond,
t16_MUX_uxn_opcodes_h_l822_c7_1523_iftrue,
t16_MUX_uxn_opcodes_h_l822_c7_1523_iffalse,
t16_MUX_uxn_opcodes_h_l822_c7_1523_return_output);

-- CONST_SL_8_uxn_opcodes_h_l824_c3_9945
CONST_SL_8_uxn_opcodes_h_l824_c3_9945 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l824_c3_9945_x,
CONST_SL_8_uxn_opcodes_h_l824_c3_9945_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l827_c11_3b3b
BIN_OP_EQ_uxn_opcodes_h_l827_c11_3b3b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l827_c11_3b3b_left,
BIN_OP_EQ_uxn_opcodes_h_l827_c11_3b3b_right,
BIN_OP_EQ_uxn_opcodes_h_l827_c11_3b3b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_1cc0
result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_1cc0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_1cc0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_1cc0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_1cc0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_1cc0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output);

-- result_pc_MUX_uxn_opcodes_h_l827_c7_1cc0
result_pc_MUX_uxn_opcodes_h_l827_c7_1cc0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l827_c7_1cc0_cond,
result_pc_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue,
result_pc_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse,
result_pc_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_1cc0
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_1cc0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_1cc0_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_1cc0
result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_1cc0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_1cc0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_1cc0
result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_1cc0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_1cc0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l827_c7_1cc0
result_stack_value_MUX_uxn_opcodes_h_l827_c7_1cc0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l827_c7_1cc0_cond,
result_stack_value_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_1cc0
result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_1cc0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_1cc0_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_1cc0
result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_1cc0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_1cc0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output);

-- t16_MUX_uxn_opcodes_h_l827_c7_1cc0
t16_MUX_uxn_opcodes_h_l827_c7_1cc0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l827_c7_1cc0_cond,
t16_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue,
t16_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse,
t16_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l830_c11_9aec
BIN_OP_EQ_uxn_opcodes_h_l830_c11_9aec : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l830_c11_9aec_left,
BIN_OP_EQ_uxn_opcodes_h_l830_c11_9aec_right,
BIN_OP_EQ_uxn_opcodes_h_l830_c11_9aec_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_7bbf
result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_7bbf : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_7bbf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_7bbf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_7bbf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_7bbf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output);

-- result_pc_MUX_uxn_opcodes_h_l830_c7_7bbf
result_pc_MUX_uxn_opcodes_h_l830_c7_7bbf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l830_c7_7bbf_cond,
result_pc_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue,
result_pc_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse,
result_pc_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_7bbf
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_7bbf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_7bbf_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_7bbf
result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_7bbf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_7bbf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_7bbf
result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_7bbf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_7bbf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l830_c7_7bbf
result_stack_value_MUX_uxn_opcodes_h_l830_c7_7bbf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l830_c7_7bbf_cond,
result_stack_value_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_7bbf
result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_7bbf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_7bbf_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_7bbf
result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_7bbf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_7bbf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output);

-- t16_MUX_uxn_opcodes_h_l830_c7_7bbf
t16_MUX_uxn_opcodes_h_l830_c7_7bbf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l830_c7_7bbf_cond,
t16_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue,
t16_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse,
t16_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l831_c3_9da4
BIN_OP_OR_uxn_opcodes_h_l831_c3_9da4 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l831_c3_9da4_left,
BIN_OP_OR_uxn_opcodes_h_l831_c3_9da4_right,
BIN_OP_OR_uxn_opcodes_h_l831_c3_9da4_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l833_c32_9641
BIN_OP_AND_uxn_opcodes_h_l833_c32_9641 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l833_c32_9641_left,
BIN_OP_AND_uxn_opcodes_h_l833_c32_9641_right,
BIN_OP_AND_uxn_opcodes_h_l833_c32_9641_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l833_c32_91c8
BIN_OP_GT_uxn_opcodes_h_l833_c32_91c8 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l833_c32_91c8_left,
BIN_OP_GT_uxn_opcodes_h_l833_c32_91c8_right,
BIN_OP_GT_uxn_opcodes_h_l833_c32_91c8_return_output);

-- MUX_uxn_opcodes_h_l833_c32_a983
MUX_uxn_opcodes_h_l833_c32_a983 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l833_c32_a983_cond,
MUX_uxn_opcodes_h_l833_c32_a983_iftrue,
MUX_uxn_opcodes_h_l833_c32_a983_iffalse,
MUX_uxn_opcodes_h_l833_c32_a983_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l835_c11_80ac
BIN_OP_EQ_uxn_opcodes_h_l835_c11_80ac : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l835_c11_80ac_left,
BIN_OP_EQ_uxn_opcodes_h_l835_c11_80ac_right,
BIN_OP_EQ_uxn_opcodes_h_l835_c11_80ac_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3e8c
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3e8c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3e8c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3e8c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3e8c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3e8c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output);

-- result_pc_MUX_uxn_opcodes_h_l835_c7_3e8c
result_pc_MUX_uxn_opcodes_h_l835_c7_3e8c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l835_c7_3e8c_cond,
result_pc_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue,
result_pc_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse,
result_pc_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_3e8c
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_3e8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_3e8c_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3e8c
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3e8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3e8c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3e8c
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3e8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3e8c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l835_c7_3e8c
result_stack_value_MUX_uxn_opcodes_h_l835_c7_3e8c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l835_c7_3e8c_cond,
result_stack_value_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_3e8c
result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_3e8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_3e8c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3e8c
result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3e8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3e8c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l839_c11_ee47
BIN_OP_EQ_uxn_opcodes_h_l839_c11_ee47 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l839_c11_ee47_left,
BIN_OP_EQ_uxn_opcodes_h_l839_c11_ee47_right,
BIN_OP_EQ_uxn_opcodes_h_l839_c11_ee47_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_974e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_974e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_974e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_974e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_974e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_974e_return_output);

-- result_pc_MUX_uxn_opcodes_h_l839_c7_974e
result_pc_MUX_uxn_opcodes_h_l839_c7_974e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l839_c7_974e_cond,
result_pc_MUX_uxn_opcodes_h_l839_c7_974e_iftrue,
result_pc_MUX_uxn_opcodes_h_l839_c7_974e_iffalse,
result_pc_MUX_uxn_opcodes_h_l839_c7_974e_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_974e
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_974e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_974e_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_974e_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_974e_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_974e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_974e
result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_974e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_974e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_974e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_974e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_974e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_974e
result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_974e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_974e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_974e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_974e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_974e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l839_c7_974e
result_stack_value_MUX_uxn_opcodes_h_l839_c7_974e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l839_c7_974e_cond,
result_stack_value_MUX_uxn_opcodes_h_l839_c7_974e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l839_c7_974e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l839_c7_974e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_974e
result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_974e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_974e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_974e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_974e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_974e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_974e
result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_974e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_974e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_974e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_974e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_974e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l845_c11_a712
BIN_OP_EQ_uxn_opcodes_h_l845_c11_a712 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l845_c11_a712_left,
BIN_OP_EQ_uxn_opcodes_h_l845_c11_a712_right,
BIN_OP_EQ_uxn_opcodes_h_l845_c11_a712_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l845_c7_5b95
result_stack_value_MUX_uxn_opcodes_h_l845_c7_5b95 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l845_c7_5b95_cond,
result_stack_value_MUX_uxn_opcodes_h_l845_c7_5b95_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l845_c7_5b95_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l845_c7_5b95_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_5b95
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_5b95 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_5b95_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_5b95_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_5b95_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_5b95_return_output);

-- result_pc_MUX_uxn_opcodes_h_l845_c7_5b95
result_pc_MUX_uxn_opcodes_h_l845_c7_5b95 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l845_c7_5b95_cond,
result_pc_MUX_uxn_opcodes_h_l845_c7_5b95_iftrue,
result_pc_MUX_uxn_opcodes_h_l845_c7_5b95_iffalse,
result_pc_MUX_uxn_opcodes_h_l845_c7_5b95_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_5b95
result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_5b95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_5b95_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_5b95_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_5b95_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_5b95_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_5b95
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_5b95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_5b95_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_5b95_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_5b95_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_5b95_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_5b95
result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_5b95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_5b95_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_5b95_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_5b95_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_5b95_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_5b95
result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_5b95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_5b95_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_5b95_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_5b95_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_5b95_return_output);

-- CONST_SR_8_uxn_opcodes_h_l847_c34_e008
CONST_SR_8_uxn_opcodes_h_l847_c34_e008 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l847_c34_e008_x,
CONST_SR_8_uxn_opcodes_h_l847_c34_e008_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l851_c11_92eb
BIN_OP_EQ_uxn_opcodes_h_l851_c11_92eb : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l851_c11_92eb_left,
BIN_OP_EQ_uxn_opcodes_h_l851_c11_92eb_right,
BIN_OP_EQ_uxn_opcodes_h_l851_c11_92eb_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_dbdc
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_dbdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_dbdc_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_dbdc_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_dbdc_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_dbdc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_dbdc
result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_dbdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_dbdc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_dbdc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_dbdc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_dbdc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_dbdc
result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_dbdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_dbdc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_dbdc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_dbdc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_dbdc_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_dbdc
result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_dbdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_dbdc_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_dbdc_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_dbdc_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_dbdc_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 -- Registers
 t16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l814_c6_4923_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_0672_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_0672_return_output,
 result_pc_MUX_uxn_opcodes_h_l814_c2_0672_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_0672_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_0672_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_0672_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l814_c2_0672_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_0672_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_0672_return_output,
 t16_MUX_uxn_opcodes_h_l814_c2_0672_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l819_c11_9c70_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9532_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9532_return_output,
 result_pc_MUX_uxn_opcodes_h_l819_c7_9532_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_9532_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_9532_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9532_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l819_c7_9532_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9532_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_9532_return_output,
 t16_MUX_uxn_opcodes_h_l819_c7_9532_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l822_c11_0517_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_1523_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_1523_return_output,
 result_pc_MUX_uxn_opcodes_h_l822_c7_1523_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_1523_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_1523_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_1523_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l822_c7_1523_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_1523_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_1523_return_output,
 t16_MUX_uxn_opcodes_h_l822_c7_1523_return_output,
 CONST_SL_8_uxn_opcodes_h_l824_c3_9945_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l827_c11_3b3b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output,
 result_pc_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output,
 t16_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l830_c11_9aec_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output,
 result_pc_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output,
 t16_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output,
 BIN_OP_OR_uxn_opcodes_h_l831_c3_9da4_return_output,
 BIN_OP_AND_uxn_opcodes_h_l833_c32_9641_return_output,
 BIN_OP_GT_uxn_opcodes_h_l833_c32_91c8_return_output,
 MUX_uxn_opcodes_h_l833_c32_a983_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l835_c11_80ac_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output,
 result_pc_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l839_c11_ee47_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_974e_return_output,
 result_pc_MUX_uxn_opcodes_h_l839_c7_974e_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_974e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_974e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_974e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l839_c7_974e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_974e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_974e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l845_c11_a712_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l845_c7_5b95_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_5b95_return_output,
 result_pc_MUX_uxn_opcodes_h_l845_c7_5b95_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_5b95_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_5b95_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_5b95_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_5b95_return_output,
 CONST_SR_8_uxn_opcodes_h_l847_c34_e008_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l851_c11_92eb_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_dbdc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_dbdc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_dbdc_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_dbdc_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c6_4923_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c6_4923_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c6_4923_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_0672_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_0672_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9532_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_0672_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_0672_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_0672_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l816_c3_2bc2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_0672_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9532_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_0672_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_0672_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l814_c2_0672_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l814_c2_0672_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l819_c7_9532_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l814_c2_0672_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l814_c2_0672_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_0672_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_0672_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_9532_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_0672_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_0672_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_0672_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_0672_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_9532_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_0672_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_0672_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_0672_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_0672_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9532_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_0672_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_0672_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l814_c2_0672_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l814_c2_0672_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l819_c7_9532_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l814_c2_0672_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l814_c2_0672_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_0672_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_0672_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9532_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_0672_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_0672_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_0672_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_0672_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_9532_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_0672_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_0672_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l814_c2_0672_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l814_c2_0672_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l819_c7_9532_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l814_c2_0672_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l814_c2_0672_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_9c70_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_9c70_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_9c70_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9532_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9532_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_1523_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9532_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9532_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l820_c3_df01 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9532_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_1523_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9532_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l819_c7_9532_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l819_c7_9532_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l822_c7_1523_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l819_c7_9532_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_9532_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_9532_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_1523_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_9532_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_9532_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_9532_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_1523_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_9532_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9532_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9532_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_1523_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9532_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l819_c7_9532_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l819_c7_9532_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l822_c7_1523_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l819_c7_9532_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9532_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9532_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_1523_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9532_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_9532_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_9532_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_1523_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_9532_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l819_c7_9532_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l819_c7_9532_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l822_c7_1523_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l819_c7_9532_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_0517_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_0517_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_0517_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_1523_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_1523_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_1523_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_1523_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l825_c3_4814 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_1523_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_1523_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l822_c7_1523_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l822_c7_1523_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l822_c7_1523_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_1523_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_1523_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_1523_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_1523_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_1523_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_1523_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_1523_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_1523_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_1523_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l822_c7_1523_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l822_c7_1523_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l822_c7_1523_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_1523_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_1523_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_1523_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_1523_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_1523_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_1523_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l822_c7_1523_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l822_c7_1523_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l822_c7_1523_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l824_c3_9945_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l824_c3_9945_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l827_c11_3b3b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l827_c11_3b3b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l827_c11_3b3b_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_1cc0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l828_c3_fde4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_1cc0_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l827_c7_1cc0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_1cc0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_1cc0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_1cc0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l827_c7_1cc0_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_1cc0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_1cc0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l827_c7_1cc0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c11_9aec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c11_9aec_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c11_9aec_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_7bbf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_7bbf_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l830_c7_7bbf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_7bbf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_7bbf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_7bbf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l830_c7_7bbf_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_7bbf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_7bbf_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l830_c7_7bbf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l831_c3_9da4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l831_c3_9da4_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l831_c3_9da4_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l833_c32_a983_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l833_c32_a983_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l833_c32_a983_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l833_c32_9641_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l833_c32_9641_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l833_c32_9641_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l833_c32_91c8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l833_c32_91c8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l833_c32_91c8_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l833_c32_a983_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_80ac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_80ac_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_80ac_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l837_c3_fae4 : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3e8c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_974e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3e8c_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l839_c7_974e_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l835_c7_3e8c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_974e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_3e8c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_974e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3e8c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_974e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3e8c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l839_c7_974e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_3e8c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_974e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_3e8c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_974e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3e8c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l839_c11_ee47_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l839_c11_ee47_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l839_c11_ee47_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_974e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l842_c3_e7fb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_974e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_5b95_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_974e_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l839_c7_974e_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l839_c7_974e_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l845_c7_5b95_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l839_c7_974e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_974e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_974e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_5b95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_974e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_974e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_974e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_5b95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_974e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_974e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_974e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_5b95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_974e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l839_c7_974e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l839_c7_974e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l845_c7_5b95_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l839_c7_974e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_974e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_974e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_5b95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_974e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_974e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_974e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_974e_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l843_c24_fe22_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l845_c11_a712_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l845_c11_a712_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l845_c11_a712_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l845_c7_5b95_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l845_c7_5b95_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l845_c7_5b95_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_5b95_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l846_c3_9a9b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_5b95_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_5b95_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l845_c7_5b95_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l845_c7_5b95_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l845_c7_5b95_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_5b95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_5b95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_dbdc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_5b95_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_5b95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_5b95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_dbdc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_5b95_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_5b95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_5b95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_dbdc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_5b95_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_5b95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_5b95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_dbdc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_5b95_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l847_c34_e008_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l847_c34_e008_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l847_c24_35fe_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_92eb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_92eb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_92eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_dbdc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_dbdc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_dbdc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_dbdc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_dbdc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_dbdc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_dbdc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_dbdc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_dbdc_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_dbdc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_dbdc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_dbdc_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l814_l835_l822_l827_l819_DUPLICATE_1406_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l845_l814_l839_l835_l822_l830_l827_l819_DUPLICATE_18dc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l845_l814_l839_l851_l822_l830_l827_l819_DUPLICATE_93ec_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l845_l814_l835_l851_l822_l830_l827_l819_DUPLICATE_bcc9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l845_l814_l835_l822_l830_l827_l819_DUPLICATE_27da_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l814_l839_l835_l851_l822_l830_l827_l819_DUPLICATE_0b46_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l814_l839_l835_l822_l827_l819_DUPLICATE_7318_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l845_l839_l835_l851_l822_l830_l827_l819_DUPLICATE_b297_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l823_l831_DUPLICATE_6f3c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l830_l845_l835_DUPLICATE_c168_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2401_uxn_opcodes_h_l858_l810_DUPLICATE_5e2d_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_GT_uxn_opcodes_h_l833_c32_91c8_right := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_9c70_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l827_c11_3b3b_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_dbdc_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l842_c3_e7fb := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_974e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l842_c3_e7fb;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_974e_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l846_c3_9a9b := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_5b95_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l846_c3_9a9b;
     VAR_MUX_uxn_opcodes_h_l833_c32_a983_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_974e_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l825_c3_4814 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_1523_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l825_c3_4814;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_0517_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_dbdc_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l816_c3_2bc2 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_0672_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l816_c3_2bc2;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_5b95_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l833_c32_a983_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_dbdc_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l837_c3_fae4 := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l837_c3_fae4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l845_c11_a712_right := to_unsigned(7, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l833_c32_9641_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c6_4923_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_92eb_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_80ac_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c11_9aec_right := to_unsigned(4, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_dbdc_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l828_c3_fde4 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l828_c3_fde4;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_0672_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l820_c3_df01 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9532_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l820_c3_df01;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l839_c11_ee47_right := to_unsigned(6, 3);

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
     VAR_BIN_OP_AND_uxn_opcodes_h_l833_c32_9641_left := VAR_ins;
     VAR_CONST_SR_8_uxn_opcodes_h_l847_c34_e008_x := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c6_4923_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_9c70_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_0517_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l827_c11_3b3b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c11_9aec_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_80ac_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l839_c11_ee47_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l845_c11_a712_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_92eb_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l831_c3_9da4_left := t16;
     VAR_result_pc_MUX_uxn_opcodes_h_l845_c7_5b95_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l814_c2_0672_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l819_c7_9532_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse := t16;
     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l823_l831_DUPLICATE_6f3c LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l823_l831_DUPLICATE_6f3c_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l814_l839_l835_l822_l827_l819_DUPLICATE_7318 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l814_l839_l835_l822_l827_l819_DUPLICATE_7318_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l845_l839_l835_l851_l822_l830_l827_l819_DUPLICATE_b297 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l845_l839_l835_l851_l822_l830_l827_l819_DUPLICATE_b297_return_output := result.is_opc_done;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l814_l835_l822_l827_l819_DUPLICATE_1406 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l814_l835_l822_l827_l819_DUPLICATE_1406_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l814_l839_l835_l851_l822_l830_l827_l819_DUPLICATE_0b46 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l814_l839_l835_l851_l822_l830_l827_l819_DUPLICATE_0b46_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l827_c11_3b3b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l827_c11_3b3b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l827_c11_3b3b_left;
     BIN_OP_EQ_uxn_opcodes_h_l827_c11_3b3b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l827_c11_3b3b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l827_c11_3b3b_return_output := BIN_OP_EQ_uxn_opcodes_h_l827_c11_3b3b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l845_l814_l835_l851_l822_l830_l827_l819_DUPLICATE_bcc9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l845_l814_l835_l851_l822_l830_l827_l819_DUPLICATE_bcc9_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l851_c11_92eb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l851_c11_92eb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_92eb_left;
     BIN_OP_EQ_uxn_opcodes_h_l851_c11_92eb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_92eb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_92eb_return_output := BIN_OP_EQ_uxn_opcodes_h_l851_c11_92eb_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l830_l845_l835_DUPLICATE_c168 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l830_l845_l835_DUPLICATE_c168_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l830_c11_9aec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l830_c11_9aec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c11_9aec_left;
     BIN_OP_EQ_uxn_opcodes_h_l830_c11_9aec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c11_9aec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c11_9aec_return_output := BIN_OP_EQ_uxn_opcodes_h_l830_c11_9aec_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l835_c11_80ac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l835_c11_80ac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_80ac_left;
     BIN_OP_EQ_uxn_opcodes_h_l835_c11_80ac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_80ac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_80ac_return_output := BIN_OP_EQ_uxn_opcodes_h_l835_c11_80ac_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l845_l814_l835_l822_l830_l827_l819_DUPLICATE_27da LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l845_l814_l835_l822_l830_l827_l819_DUPLICATE_27da_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l819_c11_9c70] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l819_c11_9c70_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_9c70_left;
     BIN_OP_EQ_uxn_opcodes_h_l819_c11_9c70_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_9c70_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_9c70_return_output := BIN_OP_EQ_uxn_opcodes_h_l819_c11_9c70_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l845_l814_l839_l851_l822_l830_l827_l819_DUPLICATE_93ec LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l845_l814_l839_l851_l822_l830_l827_l819_DUPLICATE_93ec_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l814_c6_4923] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l814_c6_4923_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c6_4923_left;
     BIN_OP_EQ_uxn_opcodes_h_l814_c6_4923_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c6_4923_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c6_4923_return_output := BIN_OP_EQ_uxn_opcodes_h_l814_c6_4923_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l833_c32_9641] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l833_c32_9641_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l833_c32_9641_left;
     BIN_OP_AND_uxn_opcodes_h_l833_c32_9641_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l833_c32_9641_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l833_c32_9641_return_output := BIN_OP_AND_uxn_opcodes_h_l833_c32_9641_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l822_c11_0517] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l822_c11_0517_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_0517_left;
     BIN_OP_EQ_uxn_opcodes_h_l822_c11_0517_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_0517_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_0517_return_output := BIN_OP_EQ_uxn_opcodes_h_l822_c11_0517_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l847_c34_e008] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l847_c34_e008_x <= VAR_CONST_SR_8_uxn_opcodes_h_l847_c34_e008_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l847_c34_e008_return_output := CONST_SR_8_uxn_opcodes_h_l847_c34_e008_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l839_c11_ee47] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l839_c11_ee47_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l839_c11_ee47_left;
     BIN_OP_EQ_uxn_opcodes_h_l839_c11_ee47_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l839_c11_ee47_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l839_c11_ee47_return_output := BIN_OP_EQ_uxn_opcodes_h_l839_c11_ee47_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l843_c24_fe22] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l843_c24_fe22_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_pc);

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l845_l814_l839_l835_l822_l830_l827_l819_DUPLICATE_18dc LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l845_l814_l839_l835_l822_l830_l827_l819_DUPLICATE_18dc_return_output := result.pc;

     -- BIN_OP_EQ[uxn_opcodes_h_l845_c11_a712] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l845_c11_a712_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l845_c11_a712_left;
     BIN_OP_EQ_uxn_opcodes_h_l845_c11_a712_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l845_c11_a712_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l845_c11_a712_return_output := BIN_OP_EQ_uxn_opcodes_h_l845_c11_a712_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l833_c32_91c8_left := VAR_BIN_OP_AND_uxn_opcodes_h_l833_c32_9641_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_0672_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c6_4923_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_0672_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c6_4923_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_0672_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c6_4923_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_0672_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c6_4923_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_0672_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c6_4923_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l814_c2_0672_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c6_4923_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_0672_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c6_4923_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_0672_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c6_4923_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l814_c2_0672_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c6_4923_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l814_c2_0672_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c6_4923_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9532_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_9c70_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9532_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_9c70_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_9532_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_9c70_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_9532_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_9c70_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_9532_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_9c70_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l819_c7_9532_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_9c70_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9532_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_9c70_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9532_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_9c70_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l819_c7_9532_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_9c70_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l819_c7_9532_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_9c70_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_1523_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_0517_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_1523_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_0517_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_1523_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_0517_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_1523_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_0517_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_1523_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_0517_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l822_c7_1523_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_0517_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_1523_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_0517_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_1523_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_0517_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l822_c7_1523_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_0517_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l822_c7_1523_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_0517_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_1cc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l827_c11_3b3b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_1cc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l827_c11_3b3b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_1cc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l827_c11_3b3b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_1cc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l827_c11_3b3b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_1cc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l827_c11_3b3b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l827_c7_1cc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l827_c11_3b3b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_1cc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l827_c11_3b3b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_1cc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l827_c11_3b3b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l827_c7_1cc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l827_c11_3b3b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l827_c7_1cc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l827_c11_3b3b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_7bbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c11_9aec_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_7bbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c11_9aec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_7bbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c11_9aec_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_7bbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c11_9aec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_7bbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c11_9aec_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l830_c7_7bbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c11_9aec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_7bbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c11_9aec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_7bbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c11_9aec_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l830_c7_7bbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c11_9aec_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l830_c7_7bbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c11_9aec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3e8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_80ac_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_3e8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_80ac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3e8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_80ac_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_3e8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_80ac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3e8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_80ac_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l835_c7_3e8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_80ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3e8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_80ac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3e8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_80ac_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_3e8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_80ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_974e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l839_c11_ee47_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_974e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l839_c11_ee47_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_974e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l839_c11_ee47_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_974e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l839_c11_ee47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_974e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l839_c11_ee47_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l839_c7_974e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l839_c11_ee47_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_974e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l839_c11_ee47_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l839_c7_974e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l839_c11_ee47_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_5b95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l845_c11_a712_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_5b95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l845_c11_a712_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_5b95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l845_c11_a712_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_5b95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l845_c11_a712_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l845_c7_5b95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l845_c11_a712_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_5b95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l845_c11_a712_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l845_c7_5b95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l845_c11_a712_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_dbdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_92eb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_dbdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_92eb_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_dbdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_92eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_dbdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_92eb_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l831_c3_9da4_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l823_l831_DUPLICATE_6f3c_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l824_c3_9945_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l823_l831_DUPLICATE_6f3c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l839_c7_974e_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l843_c24_fe22_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_0672_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l814_l835_l822_l827_l819_DUPLICATE_1406_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9532_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l814_l835_l822_l827_l819_DUPLICATE_1406_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_1523_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l814_l835_l822_l827_l819_DUPLICATE_1406_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l814_l835_l822_l827_l819_DUPLICATE_1406_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l814_l835_l822_l827_l819_DUPLICATE_1406_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l814_c2_0672_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l845_l814_l839_l835_l822_l830_l827_l819_DUPLICATE_18dc_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l819_c7_9532_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l845_l814_l839_l835_l822_l830_l827_l819_DUPLICATE_18dc_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l822_c7_1523_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l845_l814_l839_l835_l822_l830_l827_l819_DUPLICATE_18dc_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l845_l814_l839_l835_l822_l830_l827_l819_DUPLICATE_18dc_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l845_l814_l839_l835_l822_l830_l827_l819_DUPLICATE_18dc_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l845_l814_l839_l835_l822_l830_l827_l819_DUPLICATE_18dc_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l839_c7_974e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l845_l814_l839_l835_l822_l830_l827_l819_DUPLICATE_18dc_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l845_c7_5b95_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l845_l814_l839_l835_l822_l830_l827_l819_DUPLICATE_18dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9532_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l845_l839_l835_l851_l822_l830_l827_l819_DUPLICATE_b297_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_1523_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l845_l839_l835_l851_l822_l830_l827_l819_DUPLICATE_b297_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l845_l839_l835_l851_l822_l830_l827_l819_DUPLICATE_b297_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l845_l839_l835_l851_l822_l830_l827_l819_DUPLICATE_b297_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l845_l839_l835_l851_l822_l830_l827_l819_DUPLICATE_b297_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_974e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l845_l839_l835_l851_l822_l830_l827_l819_DUPLICATE_b297_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_5b95_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l845_l839_l835_l851_l822_l830_l827_l819_DUPLICATE_b297_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_dbdc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l845_l839_l835_l851_l822_l830_l827_l819_DUPLICATE_b297_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_0672_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l814_l839_l835_l851_l822_l830_l827_l819_DUPLICATE_0b46_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9532_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l814_l839_l835_l851_l822_l830_l827_l819_DUPLICATE_0b46_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_1523_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l814_l839_l835_l851_l822_l830_l827_l819_DUPLICATE_0b46_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l814_l839_l835_l851_l822_l830_l827_l819_DUPLICATE_0b46_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l814_l839_l835_l851_l822_l830_l827_l819_DUPLICATE_0b46_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l814_l839_l835_l851_l822_l830_l827_l819_DUPLICATE_0b46_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_974e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l814_l839_l835_l851_l822_l830_l827_l819_DUPLICATE_0b46_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_dbdc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l814_l839_l835_l851_l822_l830_l827_l819_DUPLICATE_0b46_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_0672_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l814_l839_l835_l822_l827_l819_DUPLICATE_7318_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_9532_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l814_l839_l835_l822_l827_l819_DUPLICATE_7318_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_1523_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l814_l839_l835_l822_l827_l819_DUPLICATE_7318_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l814_l839_l835_l822_l827_l819_DUPLICATE_7318_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l814_l839_l835_l822_l827_l819_DUPLICATE_7318_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_974e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l814_l839_l835_l822_l827_l819_DUPLICATE_7318_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_0672_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l845_l814_l839_l851_l822_l830_l827_l819_DUPLICATE_93ec_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_9532_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l845_l814_l839_l851_l822_l830_l827_l819_DUPLICATE_93ec_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_1523_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l845_l814_l839_l851_l822_l830_l827_l819_DUPLICATE_93ec_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l845_l814_l839_l851_l822_l830_l827_l819_DUPLICATE_93ec_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l845_l814_l839_l851_l822_l830_l827_l819_DUPLICATE_93ec_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_974e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l845_l814_l839_l851_l822_l830_l827_l819_DUPLICATE_93ec_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_5b95_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l845_l814_l839_l851_l822_l830_l827_l819_DUPLICATE_93ec_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_dbdc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l845_l814_l839_l851_l822_l830_l827_l819_DUPLICATE_93ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_0672_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l845_l814_l835_l851_l822_l830_l827_l819_DUPLICATE_bcc9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_9532_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l845_l814_l835_l851_l822_l830_l827_l819_DUPLICATE_bcc9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_1523_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l845_l814_l835_l851_l822_l830_l827_l819_DUPLICATE_bcc9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l845_l814_l835_l851_l822_l830_l827_l819_DUPLICATE_bcc9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l845_l814_l835_l851_l822_l830_l827_l819_DUPLICATE_bcc9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l845_l814_l835_l851_l822_l830_l827_l819_DUPLICATE_bcc9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_5b95_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l845_l814_l835_l851_l822_l830_l827_l819_DUPLICATE_bcc9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_dbdc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l845_l814_l835_l851_l822_l830_l827_l819_DUPLICATE_bcc9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l830_l845_l835_DUPLICATE_c168_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l830_l845_l835_DUPLICATE_c168_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_5b95_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l830_l845_l835_DUPLICATE_c168_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l814_c2_0672_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l845_l814_l835_l822_l830_l827_l819_DUPLICATE_27da_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l819_c7_9532_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l845_l814_l835_l822_l830_l827_l819_DUPLICATE_27da_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l822_c7_1523_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l845_l814_l835_l822_l830_l827_l819_DUPLICATE_27da_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l845_l814_l835_l822_l830_l827_l819_DUPLICATE_27da_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l845_l814_l835_l822_l830_l827_l819_DUPLICATE_27da_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l845_l814_l835_l822_l830_l827_l819_DUPLICATE_27da_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l845_c7_5b95_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l845_l814_l835_l822_l830_l827_l819_DUPLICATE_27da_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l847_c24_35fe] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l847_c24_35fe_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l847_c34_e008_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l851_c7_dbdc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_dbdc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_dbdc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_dbdc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_dbdc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_dbdc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_dbdc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_dbdc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_dbdc_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l845_c7_5b95] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l845_c7_5b95_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l845_c7_5b95_cond;
     result_pc_MUX_uxn_opcodes_h_l845_c7_5b95_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l845_c7_5b95_iftrue;
     result_pc_MUX_uxn_opcodes_h_l845_c7_5b95_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l845_c7_5b95_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l845_c7_5b95_return_output := result_pc_MUX_uxn_opcodes_h_l845_c7_5b95_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l851_c7_dbdc] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_dbdc_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_dbdc_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_dbdc_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_dbdc_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_dbdc_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_dbdc_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_dbdc_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_dbdc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l845_c7_5b95] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_5b95_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_5b95_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_5b95_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_5b95_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_5b95_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_5b95_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_5b95_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_5b95_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l833_c32_91c8] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l833_c32_91c8_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l833_c32_91c8_left;
     BIN_OP_GT_uxn_opcodes_h_l833_c32_91c8_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l833_c32_91c8_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l833_c32_91c8_return_output := BIN_OP_GT_uxn_opcodes_h_l833_c32_91c8_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l831_c3_9da4] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l831_c3_9da4_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l831_c3_9da4_left;
     BIN_OP_OR_uxn_opcodes_h_l831_c3_9da4_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l831_c3_9da4_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l831_c3_9da4_return_output := BIN_OP_OR_uxn_opcodes_h_l831_c3_9da4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l835_c7_3e8c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3e8c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3e8c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l851_c7_dbdc] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_dbdc_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_dbdc_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_dbdc_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_dbdc_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_dbdc_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_dbdc_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_dbdc_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_dbdc_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l824_c3_9945] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l824_c3_9945_x <= VAR_CONST_SL_8_uxn_opcodes_h_l824_c3_9945_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l824_c3_9945_return_output := CONST_SL_8_uxn_opcodes_h_l824_c3_9945_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l851_c7_dbdc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_dbdc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_dbdc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_dbdc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_dbdc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_dbdc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_dbdc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_dbdc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_dbdc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l839_c7_974e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_974e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_974e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_974e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_974e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_974e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_974e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_974e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_974e_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l833_c32_a983_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l833_c32_91c8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l831_c3_9da4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l845_c7_5b95_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l847_c24_35fe_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l822_c7_1523_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l824_c3_9945_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_5b95_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_dbdc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_5b95_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_dbdc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_974e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_5b95_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_dbdc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_5b95_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_dbdc_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l839_c7_974e_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l845_c7_5b95_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_974e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_5b95_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l845_c7_5b95] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_5b95_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_5b95_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_5b95_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_5b95_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_5b95_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_5b95_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_5b95_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_5b95_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l835_c7_3e8c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3e8c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3e8c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output;

     -- t16_MUX[uxn_opcodes_h_l830_c7_7bbf] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l830_c7_7bbf_cond <= VAR_t16_MUX_uxn_opcodes_h_l830_c7_7bbf_cond;
     t16_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue;
     t16_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output := t16_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l845_c7_5b95] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_5b95_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_5b95_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_5b95_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_5b95_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_5b95_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_5b95_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_5b95_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_5b95_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l845_c7_5b95] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_5b95_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_5b95_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_5b95_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_5b95_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_5b95_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_5b95_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_5b95_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_5b95_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l839_c7_974e] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l839_c7_974e_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l839_c7_974e_cond;
     result_pc_MUX_uxn_opcodes_h_l839_c7_974e_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l839_c7_974e_iftrue;
     result_pc_MUX_uxn_opcodes_h_l839_c7_974e_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l839_c7_974e_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l839_c7_974e_return_output := result_pc_MUX_uxn_opcodes_h_l839_c7_974e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l839_c7_974e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_974e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_974e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_974e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_974e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_974e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_974e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_974e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_974e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l845_c7_5b95] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_5b95_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_5b95_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_5b95_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_5b95_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_5b95_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_5b95_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_5b95_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_5b95_return_output;

     -- MUX[uxn_opcodes_h_l833_c32_a983] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l833_c32_a983_cond <= VAR_MUX_uxn_opcodes_h_l833_c32_a983_cond;
     MUX_uxn_opcodes_h_l833_c32_a983_iftrue <= VAR_MUX_uxn_opcodes_h_l833_c32_a983_iftrue;
     MUX_uxn_opcodes_h_l833_c32_a983_iffalse <= VAR_MUX_uxn_opcodes_h_l833_c32_a983_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l833_c32_a983_return_output := MUX_uxn_opcodes_h_l833_c32_a983_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l845_c7_5b95] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l845_c7_5b95_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l845_c7_5b95_cond;
     result_stack_value_MUX_uxn_opcodes_h_l845_c7_5b95_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l845_c7_5b95_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l845_c7_5b95_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l845_c7_5b95_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l845_c7_5b95_return_output := result_stack_value_MUX_uxn_opcodes_h_l845_c7_5b95_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue := VAR_MUX_uxn_opcodes_h_l833_c32_a983_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_974e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_5b95_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_974e_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_5b95_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_974e_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_5b95_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_974e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_5b95_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l839_c7_974e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_974e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l839_c7_974e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l845_c7_5b95_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l839_c7_974e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_974e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_974e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_974e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_974e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_974e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_974e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_974e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_974e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l839_c7_974e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_974e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_974e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_974e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_974e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_974e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_974e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_974e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_974e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l835_c7_3e8c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3e8c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3e8c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l830_c7_7bbf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_7bbf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_7bbf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l830_c7_7bbf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_7bbf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_7bbf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l835_c7_3e8c] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l835_c7_3e8c_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l835_c7_3e8c_cond;
     result_pc_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue;
     result_pc_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output := result_pc_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l839_c7_974e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_974e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_974e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_974e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_974e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_974e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_974e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_974e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_974e_return_output;

     -- t16_MUX[uxn_opcodes_h_l827_c7_1cc0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l827_c7_1cc0_cond <= VAR_t16_MUX_uxn_opcodes_h_l827_c7_1cc0_cond;
     t16_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue;
     t16_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output := t16_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l839_c7_974e] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_974e_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_974e_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_974e_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_974e_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_974e_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_974e_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_974e_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_974e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l839_c7_974e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l839_c7_974e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l839_c7_974e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l839_c7_974e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l839_c7_974e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l839_c7_974e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l839_c7_974e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l839_c7_974e_return_output := result_stack_value_MUX_uxn_opcodes_h_l839_c7_974e_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_974e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_974e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_974e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_974e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l839_c7_974e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l822_c7_1523_iffalse := VAR_t16_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l835_c7_3e8c] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_3e8c_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_3e8c_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l835_c7_3e8c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_3e8c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_3e8c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l835_c7_3e8c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3e8c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3e8c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l830_c7_7bbf] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l830_c7_7bbf_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l830_c7_7bbf_cond;
     result_pc_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue;
     result_pc_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output := result_pc_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l835_c7_3e8c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l835_c7_3e8c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_3e8c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output := result_stack_value_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l827_c7_1cc0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_1cc0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_1cc0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l830_c7_7bbf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_7bbf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_7bbf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output;

     -- t16_MUX[uxn_opcodes_h_l822_c7_1523] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l822_c7_1523_cond <= VAR_t16_MUX_uxn_opcodes_h_l822_c7_1523_cond;
     t16_MUX_uxn_opcodes_h_l822_c7_1523_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l822_c7_1523_iftrue;
     t16_MUX_uxn_opcodes_h_l822_c7_1523_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l822_c7_1523_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l822_c7_1523_return_output := t16_MUX_uxn_opcodes_h_l822_c7_1523_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l835_c7_3e8c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3e8c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3e8c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3e8c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3e8c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l827_c7_1cc0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_1cc0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_1cc0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_1523_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_1523_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_3e8c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l819_c7_9532_iffalse := VAR_t16_MUX_uxn_opcodes_h_l822_c7_1523_return_output;
     -- t16_MUX[uxn_opcodes_h_l819_c7_9532] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l819_c7_9532_cond <= VAR_t16_MUX_uxn_opcodes_h_l819_c7_9532_cond;
     t16_MUX_uxn_opcodes_h_l819_c7_9532_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l819_c7_9532_iftrue;
     t16_MUX_uxn_opcodes_h_l819_c7_9532_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l819_c7_9532_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l819_c7_9532_return_output := t16_MUX_uxn_opcodes_h_l819_c7_9532_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l830_c7_7bbf] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_7bbf_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_7bbf_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l830_c7_7bbf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_7bbf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_7bbf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l827_c7_1cc0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_1cc0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_1cc0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l827_c7_1cc0] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l827_c7_1cc0_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l827_c7_1cc0_cond;
     result_pc_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue;
     result_pc_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output := result_pc_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l830_c7_7bbf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_7bbf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_7bbf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l822_c7_1523] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_1523_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_1523_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_1523_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_1523_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_1523_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_1523_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_1523_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_1523_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l822_c7_1523] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_1523_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_1523_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_1523_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_1523_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_1523_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_1523_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_1523_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_1523_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l830_c7_7bbf] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_7bbf_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_7bbf_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l830_c7_7bbf] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l830_c7_7bbf_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l830_c7_7bbf_cond;
     result_stack_value_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l830_c7_7bbf_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l830_c7_7bbf_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output := result_stack_value_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_9532_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_1523_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l822_c7_1523_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9532_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_1523_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_1523_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l830_c7_7bbf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l814_c2_0672_iffalse := VAR_t16_MUX_uxn_opcodes_h_l819_c7_9532_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l822_c7_1523] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_1523_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_1523_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_1523_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_1523_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_1523_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_1523_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_1523_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_1523_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l827_c7_1cc0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_1cc0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_1cc0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l819_c7_9532] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9532_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9532_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9532_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9532_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9532_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9532_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9532_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9532_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l827_c7_1cc0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_1cc0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_1cc0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l827_c7_1cc0] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_1cc0_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_1cc0_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output;

     -- t16_MUX[uxn_opcodes_h_l814_c2_0672] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l814_c2_0672_cond <= VAR_t16_MUX_uxn_opcodes_h_l814_c2_0672_cond;
     t16_MUX_uxn_opcodes_h_l814_c2_0672_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l814_c2_0672_iftrue;
     t16_MUX_uxn_opcodes_h_l814_c2_0672_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l814_c2_0672_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l814_c2_0672_return_output := t16_MUX_uxn_opcodes_h_l814_c2_0672_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l827_c7_1cc0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l827_c7_1cc0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l827_c7_1cc0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output := result_stack_value_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l819_c7_9532] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_9532_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_9532_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_9532_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_9532_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_9532_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_9532_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_9532_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_9532_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l827_c7_1cc0] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_1cc0_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_1cc0_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_1cc0_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_1cc0_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l822_c7_1523] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l822_c7_1523_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l822_c7_1523_cond;
     result_pc_MUX_uxn_opcodes_h_l822_c7_1523_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l822_c7_1523_iftrue;
     result_pc_MUX_uxn_opcodes_h_l822_c7_1523_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l822_c7_1523_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l822_c7_1523_return_output := result_pc_MUX_uxn_opcodes_h_l822_c7_1523_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_1523_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_1523_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_0672_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_9532_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_1523_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_1523_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l819_c7_9532_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l822_c7_1523_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_0672_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_9532_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9532_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_1523_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l822_c7_1523_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l827_c7_1cc0_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l814_c2_0672_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l822_c7_1523] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_1523_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_1523_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_1523_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_1523_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_1523_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_1523_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_1523_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_1523_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l814_c2_0672] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_0672_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_0672_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_0672_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_0672_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_0672_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_0672_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_0672_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_0672_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l819_c7_9532] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l819_c7_9532_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l819_c7_9532_cond;
     result_pc_MUX_uxn_opcodes_h_l819_c7_9532_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l819_c7_9532_iftrue;
     result_pc_MUX_uxn_opcodes_h_l819_c7_9532_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l819_c7_9532_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l819_c7_9532_return_output := result_pc_MUX_uxn_opcodes_h_l819_c7_9532_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l822_c7_1523] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_1523_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_1523_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_1523_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_1523_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_1523_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_1523_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_1523_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_1523_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l822_c7_1523] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_1523_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_1523_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_1523_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_1523_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_1523_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_1523_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_1523_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_1523_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l814_c2_0672] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_0672_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_0672_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_0672_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_0672_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_0672_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_0672_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_0672_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_0672_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l822_c7_1523] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l822_c7_1523_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l822_c7_1523_cond;
     result_stack_value_MUX_uxn_opcodes_h_l822_c7_1523_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l822_c7_1523_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l822_c7_1523_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l822_c7_1523_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l822_c7_1523_return_output := result_stack_value_MUX_uxn_opcodes_h_l822_c7_1523_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l819_c7_9532] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9532_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9532_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9532_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9532_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9532_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9532_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9532_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9532_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l822_c7_1523] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_1523_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_1523_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_1523_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_1523_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_1523_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_1523_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_1523_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_1523_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9532_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_1523_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9532_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_1523_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_9532_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_1523_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_9532_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_1523_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l814_c2_0672_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l819_c7_9532_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_0672_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_9532_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l819_c7_9532_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l822_c7_1523_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l814_c2_0672] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_0672_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_0672_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_0672_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_0672_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_0672_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_0672_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_0672_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_0672_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l819_c7_9532] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l819_c7_9532_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l819_c7_9532_cond;
     result_stack_value_MUX_uxn_opcodes_h_l819_c7_9532_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l819_c7_9532_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l819_c7_9532_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l819_c7_9532_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l819_c7_9532_return_output := result_stack_value_MUX_uxn_opcodes_h_l819_c7_9532_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l819_c7_9532] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_9532_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_9532_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_9532_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_9532_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_9532_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_9532_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_9532_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_9532_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l819_c7_9532] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_9532_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_9532_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_9532_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_9532_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_9532_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_9532_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_9532_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_9532_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l819_c7_9532] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9532_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9532_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9532_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9532_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9532_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9532_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9532_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9532_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l819_c7_9532] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9532_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9532_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9532_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9532_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9532_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9532_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9532_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9532_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l814_c2_0672] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l814_c2_0672_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l814_c2_0672_cond;
     result_pc_MUX_uxn_opcodes_h_l814_c2_0672_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l814_c2_0672_iftrue;
     result_pc_MUX_uxn_opcodes_h_l814_c2_0672_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l814_c2_0672_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l814_c2_0672_return_output := result_pc_MUX_uxn_opcodes_h_l814_c2_0672_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_0672_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_9532_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_0672_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_9532_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_0672_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_9532_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_0672_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_9532_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l814_c2_0672_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l819_c7_9532_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l814_c2_0672] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_0672_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_0672_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_0672_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_0672_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_0672_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_0672_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_0672_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_0672_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l814_c2_0672] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l814_c2_0672_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l814_c2_0672_cond;
     result_stack_value_MUX_uxn_opcodes_h_l814_c2_0672_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l814_c2_0672_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l814_c2_0672_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l814_c2_0672_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l814_c2_0672_return_output := result_stack_value_MUX_uxn_opcodes_h_l814_c2_0672_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l814_c2_0672] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_0672_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_0672_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_0672_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_0672_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_0672_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_0672_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_0672_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_0672_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l814_c2_0672] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_0672_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_0672_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_0672_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_0672_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_0672_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_0672_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_0672_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_0672_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l814_c2_0672] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_0672_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_0672_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_0672_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_0672_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_0672_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_0672_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_0672_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_0672_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_2401_uxn_opcodes_h_l858_l810_DUPLICATE_5e2d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2401_uxn_opcodes_h_l858_l810_DUPLICATE_5e2d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_2401(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_0672_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_0672_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l814_c2_0672_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_0672_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_0672_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_0672_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l814_c2_0672_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_0672_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_0672_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2401_uxn_opcodes_h_l858_l810_DUPLICATE_5e2d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2401_uxn_opcodes_h_l858_l810_DUPLICATE_5e2d_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
