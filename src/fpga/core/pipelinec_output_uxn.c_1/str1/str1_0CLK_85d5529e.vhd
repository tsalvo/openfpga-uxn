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
-- Submodules: 41
entity str1_0CLK_85d5529e is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end str1_0CLK_85d5529e;
architecture arch of str1_0CLK_85d5529e is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1683_c6_9ec0]
signal BIN_OP_EQ_uxn_opcodes_h_l1683_c6_9ec0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1683_c6_9ec0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1683_c6_9ec0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1683_c2_9d93]
signal result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9d93_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1683_c2_9d93]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9d93_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1683_c2_9d93]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9d93_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output : unsigned(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1683_c2_9d93]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9d93_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1683_c2_9d93]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9d93_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1683_c2_9d93]
signal result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9d93_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1683_c2_9d93]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9d93_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1683_c2_9d93]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9d93_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1683_c2_9d93]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9d93_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1683_c2_9d93]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9d93_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1683_c2_9d93]
signal t8_MUX_uxn_opcodes_h_l1683_c2_9d93_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1683_c2_9d93]
signal n8_MUX_uxn_opcodes_h_l1683_c2_9d93_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1696_c11_a4e9]
signal BIN_OP_EQ_uxn_opcodes_h_l1696_c11_a4e9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1696_c11_a4e9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1696_c11_a4e9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1696_c7_f68e]
signal result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f68e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f68e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f68e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1696_c7_f68e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f68e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f68e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f68e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1696_c7_f68e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_f68e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_f68e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_f68e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1696_c7_f68e]
signal result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f68e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f68e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f68e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1696_c7_f68e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_f68e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_f68e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_f68e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1696_c7_f68e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f68e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f68e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f68e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1696_c7_f68e]
signal t8_MUX_uxn_opcodes_h_l1696_c7_f68e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1696_c7_f68e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1696_c7_f68e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1696_c7_f68e]
signal n8_MUX_uxn_opcodes_h_l1696_c7_f68e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1696_c7_f68e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1696_c7_f68e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1699_c11_c0b8]
signal BIN_OP_EQ_uxn_opcodes_h_l1699_c11_c0b8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1699_c11_c0b8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1699_c11_c0b8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1699_c7_48dc]
signal result_u8_value_MUX_uxn_opcodes_h_l1699_c7_48dc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1699_c7_48dc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1699_c7_48dc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1699_c7_48dc_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1699_c7_48dc]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_48dc_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_48dc_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_48dc_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_48dc_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1699_c7_48dc]
signal result_u16_value_MUX_uxn_opcodes_h_l1699_c7_48dc_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1699_c7_48dc_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1699_c7_48dc_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1699_c7_48dc_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1699_c7_48dc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_48dc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_48dc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_48dc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_48dc_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1699_c7_48dc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_48dc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_48dc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_48dc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_48dc_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1699_c7_48dc]
signal t8_MUX_uxn_opcodes_h_l1699_c7_48dc_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1699_c7_48dc_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1699_c7_48dc_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1699_c7_48dc_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1699_c7_48dc]
signal n8_MUX_uxn_opcodes_h_l1699_c7_48dc_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1699_c7_48dc_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1699_c7_48dc_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1699_c7_48dc_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1702_c11_c0e7]
signal BIN_OP_EQ_uxn_opcodes_h_l1702_c11_c0e7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1702_c11_c0e7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1702_c11_c0e7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1702_c7_4b2f]
signal result_u8_value_MUX_uxn_opcodes_h_l1702_c7_4b2f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1702_c7_4b2f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1702_c7_4b2f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1702_c7_4b2f_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1702_c7_4b2f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_4b2f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_4b2f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_4b2f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_4b2f_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1702_c7_4b2f]
signal result_u16_value_MUX_uxn_opcodes_h_l1702_c7_4b2f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1702_c7_4b2f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1702_c7_4b2f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1702_c7_4b2f_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1702_c7_4b2f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4b2f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4b2f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4b2f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4b2f_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1702_c7_4b2f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4b2f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4b2f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4b2f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4b2f_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1702_c7_4b2f]
signal n8_MUX_uxn_opcodes_h_l1702_c7_4b2f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1702_c7_4b2f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1702_c7_4b2f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1702_c7_4b2f_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1704_c30_8aa8]
signal sp_relative_shift_uxn_opcodes_h_l1704_c30_8aa8_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1704_c30_8aa8_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1704_c30_8aa8_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1704_c30_8aa8_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1706_c22_a10c]
signal BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_a10c_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_a10c_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_a10c_return_output : signed(17 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_2c6d( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : signed;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.is_stack_index_flipped := ref_toks_5;
      base.u16_value := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.sp_relative_shift := ref_toks_9;
      base.is_opc_done := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1683_c6_9ec0
BIN_OP_EQ_uxn_opcodes_h_l1683_c6_9ec0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1683_c6_9ec0_left,
BIN_OP_EQ_uxn_opcodes_h_l1683_c6_9ec0_right,
BIN_OP_EQ_uxn_opcodes_h_l1683_c6_9ec0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9d93
result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9d93 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9d93_cond,
result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9d93
result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9d93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9d93_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9d93
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9d93 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9d93_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9d93
result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9d93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9d93_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9d93
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9d93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9d93_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9d93
result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9d93 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9d93_cond,
result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9d93
result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9d93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9d93_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9d93
result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9d93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9d93_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9d93
result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9d93 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9d93_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9d93
result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9d93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9d93_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output);

-- t8_MUX_uxn_opcodes_h_l1683_c2_9d93
t8_MUX_uxn_opcodes_h_l1683_c2_9d93 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1683_c2_9d93_cond,
t8_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue,
t8_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse,
t8_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output);

-- n8_MUX_uxn_opcodes_h_l1683_c2_9d93
n8_MUX_uxn_opcodes_h_l1683_c2_9d93 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1683_c2_9d93_cond,
n8_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue,
n8_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse,
n8_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1696_c11_a4e9
BIN_OP_EQ_uxn_opcodes_h_l1696_c11_a4e9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1696_c11_a4e9_left,
BIN_OP_EQ_uxn_opcodes_h_l1696_c11_a4e9_right,
BIN_OP_EQ_uxn_opcodes_h_l1696_c11_a4e9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f68e
result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f68e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f68e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f68e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f68e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f68e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f68e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f68e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f68e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f68e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_f68e
result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_f68e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_f68e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_f68e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_f68e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f68e
result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f68e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f68e_cond,
result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f68e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f68e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_f68e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_f68e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_f68e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_f68e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_f68e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f68e
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f68e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f68e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f68e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f68e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output);

-- t8_MUX_uxn_opcodes_h_l1696_c7_f68e
t8_MUX_uxn_opcodes_h_l1696_c7_f68e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1696_c7_f68e_cond,
t8_MUX_uxn_opcodes_h_l1696_c7_f68e_iftrue,
t8_MUX_uxn_opcodes_h_l1696_c7_f68e_iffalse,
t8_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output);

-- n8_MUX_uxn_opcodes_h_l1696_c7_f68e
n8_MUX_uxn_opcodes_h_l1696_c7_f68e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1696_c7_f68e_cond,
n8_MUX_uxn_opcodes_h_l1696_c7_f68e_iftrue,
n8_MUX_uxn_opcodes_h_l1696_c7_f68e_iffalse,
n8_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1699_c11_c0b8
BIN_OP_EQ_uxn_opcodes_h_l1699_c11_c0b8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1699_c11_c0b8_left,
BIN_OP_EQ_uxn_opcodes_h_l1699_c11_c0b8_right,
BIN_OP_EQ_uxn_opcodes_h_l1699_c11_c0b8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1699_c7_48dc
result_u8_value_MUX_uxn_opcodes_h_l1699_c7_48dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1699_c7_48dc_cond,
result_u8_value_MUX_uxn_opcodes_h_l1699_c7_48dc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1699_c7_48dc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1699_c7_48dc_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_48dc
result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_48dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_48dc_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_48dc_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_48dc_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_48dc_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1699_c7_48dc
result_u16_value_MUX_uxn_opcodes_h_l1699_c7_48dc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1699_c7_48dc_cond,
result_u16_value_MUX_uxn_opcodes_h_l1699_c7_48dc_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1699_c7_48dc_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1699_c7_48dc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_48dc
result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_48dc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_48dc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_48dc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_48dc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_48dc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_48dc
result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_48dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_48dc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_48dc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_48dc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_48dc_return_output);

-- t8_MUX_uxn_opcodes_h_l1699_c7_48dc
t8_MUX_uxn_opcodes_h_l1699_c7_48dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1699_c7_48dc_cond,
t8_MUX_uxn_opcodes_h_l1699_c7_48dc_iftrue,
t8_MUX_uxn_opcodes_h_l1699_c7_48dc_iffalse,
t8_MUX_uxn_opcodes_h_l1699_c7_48dc_return_output);

-- n8_MUX_uxn_opcodes_h_l1699_c7_48dc
n8_MUX_uxn_opcodes_h_l1699_c7_48dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1699_c7_48dc_cond,
n8_MUX_uxn_opcodes_h_l1699_c7_48dc_iftrue,
n8_MUX_uxn_opcodes_h_l1699_c7_48dc_iffalse,
n8_MUX_uxn_opcodes_h_l1699_c7_48dc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1702_c11_c0e7
BIN_OP_EQ_uxn_opcodes_h_l1702_c11_c0e7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1702_c11_c0e7_left,
BIN_OP_EQ_uxn_opcodes_h_l1702_c11_c0e7_right,
BIN_OP_EQ_uxn_opcodes_h_l1702_c11_c0e7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1702_c7_4b2f
result_u8_value_MUX_uxn_opcodes_h_l1702_c7_4b2f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1702_c7_4b2f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1702_c7_4b2f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1702_c7_4b2f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1702_c7_4b2f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_4b2f
result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_4b2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_4b2f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_4b2f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_4b2f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_4b2f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1702_c7_4b2f
result_u16_value_MUX_uxn_opcodes_h_l1702_c7_4b2f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1702_c7_4b2f_cond,
result_u16_value_MUX_uxn_opcodes_h_l1702_c7_4b2f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1702_c7_4b2f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1702_c7_4b2f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4b2f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4b2f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4b2f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4b2f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4b2f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4b2f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4b2f
result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4b2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4b2f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4b2f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4b2f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4b2f_return_output);

-- n8_MUX_uxn_opcodes_h_l1702_c7_4b2f
n8_MUX_uxn_opcodes_h_l1702_c7_4b2f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1702_c7_4b2f_cond,
n8_MUX_uxn_opcodes_h_l1702_c7_4b2f_iftrue,
n8_MUX_uxn_opcodes_h_l1702_c7_4b2f_iffalse,
n8_MUX_uxn_opcodes_h_l1702_c7_4b2f_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1704_c30_8aa8
sp_relative_shift_uxn_opcodes_h_l1704_c30_8aa8 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1704_c30_8aa8_ins,
sp_relative_shift_uxn_opcodes_h_l1704_c30_8aa8_x,
sp_relative_shift_uxn_opcodes_h_l1704_c30_8aa8_y,
sp_relative_shift_uxn_opcodes_h_l1704_c30_8aa8_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_a10c
BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_a10c : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_a10c_left,
BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_a10c_right,
BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_a10c_return_output);



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
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1683_c6_9ec0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output,
 t8_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output,
 n8_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1696_c11_a4e9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output,
 t8_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output,
 n8_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1699_c11_c0b8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1699_c7_48dc_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_48dc_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1699_c7_48dc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_48dc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_48dc_return_output,
 t8_MUX_uxn_opcodes_h_l1699_c7_48dc_return_output,
 n8_MUX_uxn_opcodes_h_l1699_c7_48dc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1702_c11_c0e7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1702_c7_4b2f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_4b2f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1702_c7_4b2f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4b2f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4b2f_return_output,
 n8_MUX_uxn_opcodes_h_l1702_c7_4b2f_return_output,
 sp_relative_shift_uxn_opcodes_h_l1704_c30_8aa8_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_a10c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_9ec0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_9ec0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_9ec0_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9d93_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1683_c2_9d93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9d93_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1693_c3_044a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9d93_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1683_c2_9d93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9d93_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1683_c2_9d93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9d93_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9d93_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1683_c2_9d93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9d93_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9d93_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1688_c3_8b15 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9d93_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9d93_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1683_c2_9d93_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1683_c2_9d93_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_a4e9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_a4e9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_a4e9_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f68e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f68e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c7_48dc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f68e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f68e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1697_c3_fbc6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f68e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1696_c7_f68e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f68e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_f68e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_f68e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_48dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_f68e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f68e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f68e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c7_48dc_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f68e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_f68e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_f68e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_48dc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_f68e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f68e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f68e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_48dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f68e_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1696_c7_f68e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1696_c7_f68e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1699_c7_48dc_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1696_c7_f68e_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1696_c7_f68e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1696_c7_f68e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1699_c7_48dc_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1696_c7_f68e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_c0b8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_c0b8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_c0b8_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c7_48dc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c7_48dc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1702_c7_4b2f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c7_48dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_48dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_48dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_4b2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_48dc_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c7_48dc_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c7_48dc_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1702_c7_4b2f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c7_48dc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_48dc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_48dc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4b2f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_48dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_48dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_48dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4b2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_48dc_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1699_c7_48dc_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1699_c7_48dc_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1699_c7_48dc_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1699_c7_48dc_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1699_c7_48dc_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1702_c7_4b2f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1699_c7_48dc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_c0e7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_c0e7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_c0e7_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1702_c7_4b2f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1702_c7_4b2f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1702_c7_4b2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_4b2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_4b2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_4b2f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1702_c7_4b2f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1706_c3_9f1e : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1702_c7_4b2f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1702_c7_4b2f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4b2f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4b2f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4b2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4b2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4b2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4b2f_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1702_c7_4b2f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1702_c7_4b2f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1702_c7_4b2f_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1704_c30_8aa8_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1704_c30_8aa8_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1704_c30_8aa8_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1704_c30_8aa8_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_a10c_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1706_c27_222e_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_a10c_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_a10c_return_output : signed(17 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1699_l1683_l1702_l1696_DUPLICATE_5370_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1699_l1683_l1702_l1696_DUPLICATE_3d1e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1699_l1702_l1696_DUPLICATE_11dd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1699_l1702_l1696_DUPLICATE_4e86_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1699_l1702_l1696_DUPLICATE_c7a0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2c6d_uxn_opcodes_h_l1711_l1679_DUPLICATE_0c08_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4b2f_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1704_c30_8aa8_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_4b2f_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1697_c3_fbc6 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f68e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1697_c3_fbc6;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1688_c3_8b15 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1688_c3_8b15;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_9ec0_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1693_c3_044a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1693_c3_044a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_a4e9_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_c0b8_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1704_c30_8aa8_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_c0e7_right := to_unsigned(3, 2);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1704_c30_8aa8_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1696_c7_f68e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1699_c7_48dc_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1702_c7_4b2f_iffalse := n8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_a10c_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_9ec0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_a4e9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_c0b8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_c0e7_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1702_c7_4b2f_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1702_c7_4b2f_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1699_c7_48dc_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1696_c7_f68e_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1699_c7_48dc_iffalse := t8;
     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1699_l1702_l1696_DUPLICATE_4e86 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1699_l1702_l1696_DUPLICATE_4e86_return_output := result.sp_relative_shift;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1683_c2_9d93] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1683_c2_9d93_return_output := result.is_vram_write;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1696_c7_f68e] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1696_c7_f68e_return_output := result.stack_address_sp_offset;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l1683_c2_9d93] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1683_c2_9d93_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1702_c11_c0e7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1702_c11_c0e7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_c0e7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1702_c11_c0e7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_c0e7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_c0e7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1702_c11_c0e7_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1699_l1683_l1702_l1696_DUPLICATE_5370 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1699_l1683_l1702_l1696_DUPLICATE_5370_return_output := result.u8_value;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1683_c2_9d93] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1683_c2_9d93_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1696_c11_a4e9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1696_c11_a4e9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_a4e9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1696_c11_a4e9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_a4e9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_a4e9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1696_c11_a4e9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1683_c6_9ec0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1683_c6_9ec0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_9ec0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1683_c6_9ec0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_9ec0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_9ec0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1683_c6_9ec0_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1699_l1683_l1702_l1696_DUPLICATE_3d1e LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1699_l1683_l1702_l1696_DUPLICATE_3d1e_return_output := result.u16_value;

     -- sp_relative_shift[uxn_opcodes_h_l1704_c30_8aa8] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1704_c30_8aa8_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1704_c30_8aa8_ins;
     sp_relative_shift_uxn_opcodes_h_l1704_c30_8aa8_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1704_c30_8aa8_x;
     sp_relative_shift_uxn_opcodes_h_l1704_c30_8aa8_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1704_c30_8aa8_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1704_c30_8aa8_return_output := sp_relative_shift_uxn_opcodes_h_l1704_c30_8aa8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1699_l1702_l1696_DUPLICATE_11dd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1699_l1702_l1696_DUPLICATE_11dd_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1699_l1702_l1696_DUPLICATE_c7a0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1699_l1702_l1696_DUPLICATE_c7a0_return_output := result.is_opc_done;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1706_c27_222e] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1706_c27_222e_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1683_c2_9d93] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1683_c2_9d93_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1699_c11_c0b8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1699_c11_c0b8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_c0b8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1699_c11_c0b8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_c0b8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_c0b8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1699_c11_c0b8_return_output;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l1683_c2_9d93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_9ec0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9d93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_9ec0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9d93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_9ec0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9d93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_9ec0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9d93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_9ec0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9d93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_9ec0_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9d93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_9ec0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9d93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_9ec0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9d93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_9ec0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9d93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_9ec0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9d93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_9ec0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1683_c2_9d93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_9ec0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1696_c7_f68e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_a4e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f68e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_a4e9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_f68e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_a4e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_f68e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_a4e9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f68e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_a4e9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f68e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_a4e9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f68e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_a4e9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1696_c7_f68e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_a4e9_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1699_c7_48dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_c0b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_48dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_c0b8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_48dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_c0b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_48dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_c0b8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c7_48dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_c0b8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c7_48dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_c0b8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1699_c7_48dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_c0b8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1702_c7_4b2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_c0e7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4b2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_c0e7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_4b2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_c0e7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4b2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_c0e7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1702_c7_4b2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_c0e7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1702_c7_4b2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_c0e7_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_a10c_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1706_c27_222e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_f68e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1699_l1702_l1696_DUPLICATE_4e86_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_48dc_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1699_l1702_l1696_DUPLICATE_4e86_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4b2f_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1699_l1702_l1696_DUPLICATE_4e86_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1699_l1683_l1702_l1696_DUPLICATE_3d1e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f68e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1699_l1683_l1702_l1696_DUPLICATE_3d1e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c7_48dc_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1699_l1683_l1702_l1696_DUPLICATE_3d1e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1702_c7_4b2f_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1699_l1683_l1702_l1696_DUPLICATE_3d1e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f68e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1699_l1702_l1696_DUPLICATE_c7a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_48dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1699_l1702_l1696_DUPLICATE_c7a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4b2f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1699_l1702_l1696_DUPLICATE_c7a0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_f68e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1699_l1702_l1696_DUPLICATE_11dd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_48dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1699_l1702_l1696_DUPLICATE_11dd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_4b2f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1699_l1702_l1696_DUPLICATE_11dd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1699_l1683_l1702_l1696_DUPLICATE_5370_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f68e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1699_l1683_l1702_l1696_DUPLICATE_5370_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c7_48dc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1699_l1683_l1702_l1696_DUPLICATE_5370_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1702_c7_4b2f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1699_l1683_l1702_l1696_DUPLICATE_5370_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1683_c2_9d93_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1683_c2_9d93_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1683_c2_9d93_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1683_c2_9d93_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f68e_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1696_c7_f68e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4b2f_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1704_c30_8aa8_return_output;
     -- t8_MUX[uxn_opcodes_h_l1699_c7_48dc] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1699_c7_48dc_cond <= VAR_t8_MUX_uxn_opcodes_h_l1699_c7_48dc_cond;
     t8_MUX_uxn_opcodes_h_l1699_c7_48dc_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1699_c7_48dc_iftrue;
     t8_MUX_uxn_opcodes_h_l1699_c7_48dc_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1699_c7_48dc_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1699_c7_48dc_return_output := t8_MUX_uxn_opcodes_h_l1699_c7_48dc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1702_c7_4b2f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4b2f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4b2f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4b2f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4b2f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4b2f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4b2f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4b2f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4b2f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1683_c2_9d93] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9d93_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9d93_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1706_c22_a10c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_a10c_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_a10c_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_a10c_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_a10c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_a10c_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_a10c_return_output;

     -- n8_MUX[uxn_opcodes_h_l1702_c7_4b2f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1702_c7_4b2f_cond <= VAR_n8_MUX_uxn_opcodes_h_l1702_c7_4b2f_cond;
     n8_MUX_uxn_opcodes_h_l1702_c7_4b2f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1702_c7_4b2f_iftrue;
     n8_MUX_uxn_opcodes_h_l1702_c7_4b2f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1702_c7_4b2f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1702_c7_4b2f_return_output := n8_MUX_uxn_opcodes_h_l1702_c7_4b2f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1702_c7_4b2f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1702_c7_4b2f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1702_c7_4b2f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1702_c7_4b2f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1702_c7_4b2f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1702_c7_4b2f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1702_c7_4b2f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1702_c7_4b2f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1702_c7_4b2f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1683_c2_9d93] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9d93_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9d93_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1702_c7_4b2f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_4b2f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_4b2f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_4b2f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_4b2f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_4b2f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_4b2f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_4b2f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_4b2f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1696_c7_f68e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f68e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f68e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f68e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f68e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f68e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f68e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1683_c2_9d93] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9d93_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9d93_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1683_c2_9d93] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9d93_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9d93_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1702_c7_4b2f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4b2f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4b2f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4b2f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4b2f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4b2f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4b2f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4b2f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4b2f_return_output;

     -- Submodule level 2
     VAR_result_u16_value_uxn_opcodes_h_l1706_c3_9f1e := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_a10c_return_output)),16);
     VAR_n8_MUX_uxn_opcodes_h_l1699_c7_48dc_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1702_c7_4b2f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_48dc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_4b2f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_48dc_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_4b2f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_48dc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_4b2f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c7_48dc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1702_c7_4b2f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1696_c7_f68e_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1699_c7_48dc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1702_c7_4b2f_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1706_c3_9f1e;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1699_c7_48dc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_48dc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_48dc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_48dc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_48dc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_48dc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_48dc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_48dc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_48dc_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1702_c7_4b2f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1702_c7_4b2f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1702_c7_4b2f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1702_c7_4b2f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1702_c7_4b2f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1702_c7_4b2f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1702_c7_4b2f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1702_c7_4b2f_return_output := result_u16_value_MUX_uxn_opcodes_h_l1702_c7_4b2f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1699_c7_48dc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_48dc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_48dc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_48dc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_48dc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_48dc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_48dc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_48dc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_48dc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1683_c2_9d93] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9d93_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9d93_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1699_c7_48dc] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_48dc_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_48dc_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_48dc_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_48dc_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_48dc_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_48dc_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_48dc_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_48dc_return_output;

     -- t8_MUX[uxn_opcodes_h_l1696_c7_f68e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1696_c7_f68e_cond <= VAR_t8_MUX_uxn_opcodes_h_l1696_c7_f68e_cond;
     t8_MUX_uxn_opcodes_h_l1696_c7_f68e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1696_c7_f68e_iftrue;
     t8_MUX_uxn_opcodes_h_l1696_c7_f68e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1696_c7_f68e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output := t8_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output;

     -- n8_MUX[uxn_opcodes_h_l1699_c7_48dc] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1699_c7_48dc_cond <= VAR_n8_MUX_uxn_opcodes_h_l1699_c7_48dc_cond;
     n8_MUX_uxn_opcodes_h_l1699_c7_48dc_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1699_c7_48dc_iftrue;
     n8_MUX_uxn_opcodes_h_l1699_c7_48dc_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1699_c7_48dc_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1699_c7_48dc_return_output := n8_MUX_uxn_opcodes_h_l1699_c7_48dc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1699_c7_48dc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1699_c7_48dc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c7_48dc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1699_c7_48dc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c7_48dc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1699_c7_48dc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c7_48dc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c7_48dc_return_output := result_u8_value_MUX_uxn_opcodes_h_l1699_c7_48dc_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l1696_c7_f68e_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1699_c7_48dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f68e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_48dc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_f68e_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_48dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_f68e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_48dc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c7_48dc_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1702_c7_4b2f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f68e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c7_48dc_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1696_c7_f68e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_f68e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_f68e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_f68e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_f68e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_f68e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_f68e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1696_c7_f68e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_f68e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_f68e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_f68e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_f68e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_f68e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_f68e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output;

     -- t8_MUX[uxn_opcodes_h_l1683_c2_9d93] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1683_c2_9d93_cond <= VAR_t8_MUX_uxn_opcodes_h_l1683_c2_9d93_cond;
     t8_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue;
     t8_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output := t8_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1696_c7_f68e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f68e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f68e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f68e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f68e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f68e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f68e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1696_c7_f68e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f68e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f68e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f68e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f68e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f68e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f68e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1699_c7_48dc] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1699_c7_48dc_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c7_48dc_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1699_c7_48dc_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c7_48dc_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1699_c7_48dc_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c7_48dc_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c7_48dc_return_output := result_u16_value_MUX_uxn_opcodes_h_l1699_c7_48dc_return_output;

     -- n8_MUX[uxn_opcodes_h_l1696_c7_f68e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1696_c7_f68e_cond <= VAR_n8_MUX_uxn_opcodes_h_l1696_c7_f68e_cond;
     n8_MUX_uxn_opcodes_h_l1696_c7_f68e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1696_c7_f68e_iftrue;
     n8_MUX_uxn_opcodes_h_l1696_c7_f68e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1696_c7_f68e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output := n8_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f68e_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c7_48dc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1683_c2_9d93] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9d93_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9d93_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output;

     -- n8_MUX[uxn_opcodes_h_l1683_c2_9d93] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1683_c2_9d93_cond <= VAR_n8_MUX_uxn_opcodes_h_l1683_c2_9d93_cond;
     n8_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue;
     n8_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output := n8_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1696_c7_f68e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f68e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f68e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f68e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f68e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f68e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f68e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output := result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1683_c2_9d93] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9d93_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9d93_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1683_c2_9d93] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9d93_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9d93_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output := result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1683_c2_9d93] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9d93_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9d93_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_f68e_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1683_c2_9d93] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9d93_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9d93_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9d93_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9d93_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output := result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output;

     -- Submodule level 6
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_2c6d_uxn_opcodes_h_l1711_l1679_DUPLICATE_0c08 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2c6d_uxn_opcodes_h_l1711_l1679_DUPLICATE_0c08_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_2c6d(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9d93_return_output);

     -- Submodule level 7
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2c6d_uxn_opcodes_h_l1711_l1679_DUPLICATE_0c08_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2c6d_uxn_opcodes_h_l1711_l1679_DUPLICATE_0c08_return_output;
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
