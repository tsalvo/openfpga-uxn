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
-- BIN_OP_EQ[uxn_opcodes_h_l1683_c6_3cac]
signal BIN_OP_EQ_uxn_opcodes_h_l1683_c6_3cac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1683_c6_3cac_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1683_c6_3cac_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1683_c2_ee70]
signal n8_MUX_uxn_opcodes_h_l1683_c2_ee70_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1683_c2_ee70]
signal result_u16_value_MUX_uxn_opcodes_h_l1683_c2_ee70_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1683_c2_ee70]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_ee70_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1683_c2_ee70]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_ee70_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1683_c2_ee70]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_ee70_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1683_c2_ee70]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_ee70_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1683_c2_ee70]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_ee70_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1683_c2_ee70]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_ee70_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1683_c2_ee70]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_ee70_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1683_c2_ee70]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_ee70_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1683_c2_ee70]
signal result_u8_value_MUX_uxn_opcodes_h_l1683_c2_ee70_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1683_c2_ee70]
signal t8_MUX_uxn_opcodes_h_l1683_c2_ee70_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1696_c11_1474]
signal BIN_OP_EQ_uxn_opcodes_h_l1696_c11_1474_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1696_c11_1474_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1696_c11_1474_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1696_c7_2fa4]
signal n8_MUX_uxn_opcodes_h_l1696_c7_2fa4_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1696_c7_2fa4_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1696_c7_2fa4_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1696_c7_2fa4]
signal result_u16_value_MUX_uxn_opcodes_h_l1696_c7_2fa4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1696_c7_2fa4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1696_c7_2fa4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1696_c7_2fa4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_2fa4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_2fa4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_2fa4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1696_c7_2fa4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_2fa4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_2fa4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_2fa4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1696_c7_2fa4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_2fa4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_2fa4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_2fa4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1696_c7_2fa4]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_2fa4_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_2fa4_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_2fa4_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1696_c7_2fa4]
signal result_u8_value_MUX_uxn_opcodes_h_l1696_c7_2fa4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1696_c7_2fa4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1696_c7_2fa4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1696_c7_2fa4]
signal t8_MUX_uxn_opcodes_h_l1696_c7_2fa4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1696_c7_2fa4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1696_c7_2fa4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1699_c11_d812]
signal BIN_OP_EQ_uxn_opcodes_h_l1699_c11_d812_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1699_c11_d812_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1699_c11_d812_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1699_c7_7cda]
signal n8_MUX_uxn_opcodes_h_l1699_c7_7cda_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1699_c7_7cda_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1699_c7_7cda_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1699_c7_7cda_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1699_c7_7cda]
signal result_u16_value_MUX_uxn_opcodes_h_l1699_c7_7cda_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1699_c7_7cda_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1699_c7_7cda_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1699_c7_7cda_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1699_c7_7cda]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7cda_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7cda_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7cda_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7cda_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1699_c7_7cda]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7cda_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7cda_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7cda_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7cda_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1699_c7_7cda]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_7cda_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_7cda_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_7cda_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_7cda_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1699_c7_7cda]
signal result_u8_value_MUX_uxn_opcodes_h_l1699_c7_7cda_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1699_c7_7cda_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1699_c7_7cda_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1699_c7_7cda_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1699_c7_7cda]
signal t8_MUX_uxn_opcodes_h_l1699_c7_7cda_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1699_c7_7cda_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1699_c7_7cda_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1699_c7_7cda_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1702_c11_fad6]
signal BIN_OP_EQ_uxn_opcodes_h_l1702_c11_fad6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1702_c11_fad6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1702_c11_fad6_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1702_c7_9ab4]
signal n8_MUX_uxn_opcodes_h_l1702_c7_9ab4_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1702_c7_9ab4_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1702_c7_9ab4_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1702_c7_9ab4_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1702_c7_9ab4]
signal result_u16_value_MUX_uxn_opcodes_h_l1702_c7_9ab4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1702_c7_9ab4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1702_c7_9ab4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1702_c7_9ab4_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1702_c7_9ab4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_9ab4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_9ab4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_9ab4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_9ab4_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1702_c7_9ab4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_9ab4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_9ab4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_9ab4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_9ab4_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1702_c7_9ab4]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_9ab4_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_9ab4_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_9ab4_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_9ab4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1702_c7_9ab4]
signal result_u8_value_MUX_uxn_opcodes_h_l1702_c7_9ab4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1702_c7_9ab4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1702_c7_9ab4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1702_c7_9ab4_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1704_c30_f2ee]
signal sp_relative_shift_uxn_opcodes_h_l1704_c30_f2ee_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1704_c30_f2ee_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1704_c30_f2ee_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1704_c30_f2ee_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1706_c22_dca4]
signal BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_dca4_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_dca4_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_dca4_return_output : signed(17 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_a906( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u16_value := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_vram_write := ref_toks_8;
      base.is_pc_updated := ref_toks_9;
      base.u8_value := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1683_c6_3cac
BIN_OP_EQ_uxn_opcodes_h_l1683_c6_3cac : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1683_c6_3cac_left,
BIN_OP_EQ_uxn_opcodes_h_l1683_c6_3cac_right,
BIN_OP_EQ_uxn_opcodes_h_l1683_c6_3cac_return_output);

-- n8_MUX_uxn_opcodes_h_l1683_c2_ee70
n8_MUX_uxn_opcodes_h_l1683_c2_ee70 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1683_c2_ee70_cond,
n8_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue,
n8_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse,
n8_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1683_c2_ee70
result_u16_value_MUX_uxn_opcodes_h_l1683_c2_ee70 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1683_c2_ee70_cond,
result_u16_value_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_ee70
result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_ee70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_ee70_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_ee70
result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_ee70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_ee70_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_ee70
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_ee70 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_ee70_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_ee70
result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_ee70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_ee70_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_ee70
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_ee70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_ee70_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_ee70
result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_ee70 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_ee70_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_ee70
result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_ee70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_ee70_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_ee70
result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_ee70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_ee70_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1683_c2_ee70
result_u8_value_MUX_uxn_opcodes_h_l1683_c2_ee70 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1683_c2_ee70_cond,
result_u8_value_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output);

-- t8_MUX_uxn_opcodes_h_l1683_c2_ee70
t8_MUX_uxn_opcodes_h_l1683_c2_ee70 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1683_c2_ee70_cond,
t8_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue,
t8_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse,
t8_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1696_c11_1474
BIN_OP_EQ_uxn_opcodes_h_l1696_c11_1474 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1696_c11_1474_left,
BIN_OP_EQ_uxn_opcodes_h_l1696_c11_1474_right,
BIN_OP_EQ_uxn_opcodes_h_l1696_c11_1474_return_output);

-- n8_MUX_uxn_opcodes_h_l1696_c7_2fa4
n8_MUX_uxn_opcodes_h_l1696_c7_2fa4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1696_c7_2fa4_cond,
n8_MUX_uxn_opcodes_h_l1696_c7_2fa4_iftrue,
n8_MUX_uxn_opcodes_h_l1696_c7_2fa4_iffalse,
n8_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1696_c7_2fa4
result_u16_value_MUX_uxn_opcodes_h_l1696_c7_2fa4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1696_c7_2fa4_cond,
result_u16_value_MUX_uxn_opcodes_h_l1696_c7_2fa4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1696_c7_2fa4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_2fa4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_2fa4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_2fa4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_2fa4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_2fa4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_2fa4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_2fa4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_2fa4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_2fa4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_2fa4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_2fa4
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_2fa4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_2fa4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_2fa4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_2fa4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_2fa4
result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_2fa4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_2fa4_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_2fa4_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_2fa4_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1696_c7_2fa4
result_u8_value_MUX_uxn_opcodes_h_l1696_c7_2fa4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1696_c7_2fa4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1696_c7_2fa4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1696_c7_2fa4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output);

-- t8_MUX_uxn_opcodes_h_l1696_c7_2fa4
t8_MUX_uxn_opcodes_h_l1696_c7_2fa4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1696_c7_2fa4_cond,
t8_MUX_uxn_opcodes_h_l1696_c7_2fa4_iftrue,
t8_MUX_uxn_opcodes_h_l1696_c7_2fa4_iffalse,
t8_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1699_c11_d812
BIN_OP_EQ_uxn_opcodes_h_l1699_c11_d812 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1699_c11_d812_left,
BIN_OP_EQ_uxn_opcodes_h_l1699_c11_d812_right,
BIN_OP_EQ_uxn_opcodes_h_l1699_c11_d812_return_output);

-- n8_MUX_uxn_opcodes_h_l1699_c7_7cda
n8_MUX_uxn_opcodes_h_l1699_c7_7cda : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1699_c7_7cda_cond,
n8_MUX_uxn_opcodes_h_l1699_c7_7cda_iftrue,
n8_MUX_uxn_opcodes_h_l1699_c7_7cda_iffalse,
n8_MUX_uxn_opcodes_h_l1699_c7_7cda_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1699_c7_7cda
result_u16_value_MUX_uxn_opcodes_h_l1699_c7_7cda : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1699_c7_7cda_cond,
result_u16_value_MUX_uxn_opcodes_h_l1699_c7_7cda_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1699_c7_7cda_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1699_c7_7cda_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7cda
result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7cda : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7cda_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7cda_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7cda_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7cda_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7cda
result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7cda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7cda_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7cda_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7cda_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7cda_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_7cda
result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_7cda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_7cda_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_7cda_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_7cda_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_7cda_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1699_c7_7cda
result_u8_value_MUX_uxn_opcodes_h_l1699_c7_7cda : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1699_c7_7cda_cond,
result_u8_value_MUX_uxn_opcodes_h_l1699_c7_7cda_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1699_c7_7cda_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1699_c7_7cda_return_output);

-- t8_MUX_uxn_opcodes_h_l1699_c7_7cda
t8_MUX_uxn_opcodes_h_l1699_c7_7cda : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1699_c7_7cda_cond,
t8_MUX_uxn_opcodes_h_l1699_c7_7cda_iftrue,
t8_MUX_uxn_opcodes_h_l1699_c7_7cda_iffalse,
t8_MUX_uxn_opcodes_h_l1699_c7_7cda_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1702_c11_fad6
BIN_OP_EQ_uxn_opcodes_h_l1702_c11_fad6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1702_c11_fad6_left,
BIN_OP_EQ_uxn_opcodes_h_l1702_c11_fad6_right,
BIN_OP_EQ_uxn_opcodes_h_l1702_c11_fad6_return_output);

-- n8_MUX_uxn_opcodes_h_l1702_c7_9ab4
n8_MUX_uxn_opcodes_h_l1702_c7_9ab4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1702_c7_9ab4_cond,
n8_MUX_uxn_opcodes_h_l1702_c7_9ab4_iftrue,
n8_MUX_uxn_opcodes_h_l1702_c7_9ab4_iffalse,
n8_MUX_uxn_opcodes_h_l1702_c7_9ab4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1702_c7_9ab4
result_u16_value_MUX_uxn_opcodes_h_l1702_c7_9ab4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1702_c7_9ab4_cond,
result_u16_value_MUX_uxn_opcodes_h_l1702_c7_9ab4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1702_c7_9ab4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1702_c7_9ab4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_9ab4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_9ab4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_9ab4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_9ab4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_9ab4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_9ab4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_9ab4
result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_9ab4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_9ab4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_9ab4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_9ab4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_9ab4_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_9ab4
result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_9ab4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_9ab4_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_9ab4_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_9ab4_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_9ab4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1702_c7_9ab4
result_u8_value_MUX_uxn_opcodes_h_l1702_c7_9ab4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1702_c7_9ab4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1702_c7_9ab4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1702_c7_9ab4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1702_c7_9ab4_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1704_c30_f2ee
sp_relative_shift_uxn_opcodes_h_l1704_c30_f2ee : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1704_c30_f2ee_ins,
sp_relative_shift_uxn_opcodes_h_l1704_c30_f2ee_x,
sp_relative_shift_uxn_opcodes_h_l1704_c30_f2ee_y,
sp_relative_shift_uxn_opcodes_h_l1704_c30_f2ee_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_dca4
BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_dca4 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_dca4_left,
BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_dca4_right,
BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_dca4_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1683_c6_3cac_return_output,
 n8_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output,
 t8_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1696_c11_1474_return_output,
 n8_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output,
 t8_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1699_c11_d812_return_output,
 n8_MUX_uxn_opcodes_h_l1699_c7_7cda_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1699_c7_7cda_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7cda_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7cda_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_7cda_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1699_c7_7cda_return_output,
 t8_MUX_uxn_opcodes_h_l1699_c7_7cda_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1702_c11_fad6_return_output,
 n8_MUX_uxn_opcodes_h_l1702_c7_9ab4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1702_c7_9ab4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_9ab4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_9ab4_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_9ab4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1702_c7_9ab4_return_output,
 sp_relative_shift_uxn_opcodes_h_l1704_c30_f2ee_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_dca4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_3cac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_3cac_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_3cac_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1683_c2_ee70_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c2_ee70_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_ee70_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_ee70_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1693_c3_6e37 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_ee70_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1683_c2_ee70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_ee70_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1683_c2_ee70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_ee70_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1688_c3_5d2e : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_ee70_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1683_c2_ee70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_ee70_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1683_c2_ee70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_ee70_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c2_ee70_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1683_c2_ee70_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_1474_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_1474_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_1474_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1696_c7_2fa4_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1696_c7_2fa4_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1699_c7_7cda_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1696_c7_2fa4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_2fa4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_2fa4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c7_7cda_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_2fa4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_2fa4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_2fa4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7cda_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_2fa4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_2fa4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1697_c3_e8ba : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_2fa4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1696_c7_2fa4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_2fa4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_2fa4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_2fa4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7cda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_2fa4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_2fa4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_2fa4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_7cda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_2fa4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_2fa4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_2fa4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c7_7cda_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_2fa4_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1696_c7_2fa4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1696_c7_2fa4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1699_c7_7cda_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1696_c7_2fa4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_d812_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_d812_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_d812_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1699_c7_7cda_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1699_c7_7cda_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1702_c7_9ab4_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1699_c7_7cda_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c7_7cda_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c7_7cda_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1702_c7_9ab4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c7_7cda_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7cda_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7cda_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_9ab4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7cda_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7cda_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7cda_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_9ab4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7cda_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_7cda_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_7cda_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_9ab4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_7cda_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c7_7cda_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c7_7cda_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1702_c7_9ab4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c7_7cda_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1699_c7_7cda_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1699_c7_7cda_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1699_c7_7cda_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_fad6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_fad6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_fad6_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1702_c7_9ab4_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1702_c7_9ab4_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1702_c7_9ab4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1702_c7_9ab4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1706_c3_aedd : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1702_c7_9ab4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1702_c7_9ab4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_9ab4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_9ab4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_9ab4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_9ab4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_9ab4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_9ab4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_9ab4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_9ab4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_9ab4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1702_c7_9ab4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1702_c7_9ab4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1702_c7_9ab4_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1704_c30_f2ee_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1704_c30_f2ee_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1704_c30_f2ee_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1704_c30_f2ee_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_dca4_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1706_c27_a5bd_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_dca4_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_dca4_return_output : signed(17 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1696_l1699_l1683_l1702_DUPLICATE_bfb5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1696_l1699_l1683_l1702_DUPLICATE_302e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1696_l1699_l1702_DUPLICATE_0211_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1696_l1699_l1702_DUPLICATE_4d93_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1696_l1699_l1702_DUPLICATE_c53d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a906_uxn_opcodes_h_l1711_l1679_DUPLICATE_1b09_return_output : opcode_result_t;
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
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1704_c30_f2ee_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_9ab4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_d812_right := to_unsigned(2, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1688_c3_5d2e := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1688_c3_5d2e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_3cac_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_1474_right := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_9ab4_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1704_c30_f2ee_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_fad6_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1693_c3_6e37 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1693_c3_6e37;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1697_c3_e8ba := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_2fa4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1697_c3_e8ba;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1704_c30_f2ee_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1696_c7_2fa4_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1699_c7_7cda_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1702_c7_9ab4_iffalse := n8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_dca4_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_3cac_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_1474_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_d812_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_fad6_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1702_c7_9ab4_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1702_c7_9ab4_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1699_c7_7cda_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1696_c7_2fa4_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1699_c7_7cda_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1699_c11_d812] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1699_c11_d812_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_d812_left;
     BIN_OP_EQ_uxn_opcodes_h_l1699_c11_d812_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_d812_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_d812_return_output := BIN_OP_EQ_uxn_opcodes_h_l1699_c11_d812_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1696_l1699_l1702_DUPLICATE_c53d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1696_l1699_l1702_DUPLICATE_c53d_return_output := result.is_ram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1696_l1699_l1702_DUPLICATE_0211 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1696_l1699_l1702_DUPLICATE_0211_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1696_l1699_l1702_DUPLICATE_4d93 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1696_l1699_l1702_DUPLICATE_4d93_return_output := result.is_opc_done;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1683_c2_ee70] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1683_c2_ee70_return_output := result.is_pc_updated;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l1683_c2_ee70] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1683_c2_ee70_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1683_c6_3cac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1683_c6_3cac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_3cac_left;
     BIN_OP_EQ_uxn_opcodes_h_l1683_c6_3cac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_3cac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_3cac_return_output := BIN_OP_EQ_uxn_opcodes_h_l1683_c6_3cac_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1696_c11_1474] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1696_c11_1474_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_1474_left;
     BIN_OP_EQ_uxn_opcodes_h_l1696_c11_1474_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_1474_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_1474_return_output := BIN_OP_EQ_uxn_opcodes_h_l1696_c11_1474_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1683_c2_ee70] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1683_c2_ee70_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1696_l1699_l1683_l1702_DUPLICATE_302e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1696_l1699_l1683_l1702_DUPLICATE_302e_return_output := result.u8_value;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1696_c7_2fa4] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1696_c7_2fa4_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1696_l1699_l1683_l1702_DUPLICATE_bfb5 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1696_l1699_l1683_l1702_DUPLICATE_bfb5_return_output := result.u16_value;

     -- sp_relative_shift[uxn_opcodes_h_l1704_c30_f2ee] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1704_c30_f2ee_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1704_c30_f2ee_ins;
     sp_relative_shift_uxn_opcodes_h_l1704_c30_f2ee_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1704_c30_f2ee_x;
     sp_relative_shift_uxn_opcodes_h_l1704_c30_f2ee_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1704_c30_f2ee_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1704_c30_f2ee_return_output := sp_relative_shift_uxn_opcodes_h_l1704_c30_f2ee_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1706_c27_a5bd] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1706_c27_a5bd_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1683_c2_ee70] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1683_c2_ee70_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1702_c11_fad6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1702_c11_fad6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_fad6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1702_c11_fad6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_fad6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_fad6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1702_c11_fad6_return_output;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l1683_c2_ee70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_3cac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_ee70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_3cac_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_ee70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_3cac_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_ee70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_3cac_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_ee70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_3cac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_ee70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_3cac_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_ee70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_3cac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_ee70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_3cac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_ee70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_3cac_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c2_ee70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_3cac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c2_ee70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_3cac_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1683_c2_ee70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_3cac_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1696_c7_2fa4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_1474_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_2fa4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_1474_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_2fa4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_1474_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_2fa4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_1474_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_2fa4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_1474_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_2fa4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_1474_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_2fa4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_1474_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1696_c7_2fa4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_1474_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1699_c7_7cda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_d812_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7cda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_d812_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_7cda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_d812_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7cda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_d812_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c7_7cda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_d812_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c7_7cda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_d812_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1699_c7_7cda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_d812_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1702_c7_9ab4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_fad6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_9ab4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_fad6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_9ab4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_fad6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_9ab4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_fad6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1702_c7_9ab4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_fad6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1702_c7_9ab4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_fad6_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_dca4_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1706_c27_a5bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_2fa4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1696_l1699_l1702_DUPLICATE_0211_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7cda_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1696_l1699_l1702_DUPLICATE_0211_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_9ab4_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1696_l1699_l1702_DUPLICATE_0211_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1696_l1699_l1683_l1702_DUPLICATE_bfb5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_2fa4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1696_l1699_l1683_l1702_DUPLICATE_bfb5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c7_7cda_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1696_l1699_l1683_l1702_DUPLICATE_bfb5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1702_c7_9ab4_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1696_l1699_l1683_l1702_DUPLICATE_bfb5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_2fa4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1696_l1699_l1702_DUPLICATE_4d93_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7cda_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1696_l1699_l1702_DUPLICATE_4d93_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_9ab4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1696_l1699_l1702_DUPLICATE_4d93_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_2fa4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1696_l1699_l1702_DUPLICATE_c53d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_7cda_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1696_l1699_l1702_DUPLICATE_c53d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_9ab4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1696_l1699_l1702_DUPLICATE_c53d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1696_l1699_l1683_l1702_DUPLICATE_302e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_2fa4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1696_l1699_l1683_l1702_DUPLICATE_302e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c7_7cda_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1696_l1699_l1683_l1702_DUPLICATE_302e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1702_c7_9ab4_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1696_l1699_l1683_l1702_DUPLICATE_302e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1683_c2_ee70_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1683_c2_ee70_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1683_c2_ee70_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1683_c2_ee70_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_2fa4_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1696_c7_2fa4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_9ab4_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1704_c30_f2ee_return_output;
     -- t8_MUX[uxn_opcodes_h_l1699_c7_7cda] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1699_c7_7cda_cond <= VAR_t8_MUX_uxn_opcodes_h_l1699_c7_7cda_cond;
     t8_MUX_uxn_opcodes_h_l1699_c7_7cda_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1699_c7_7cda_iftrue;
     t8_MUX_uxn_opcodes_h_l1699_c7_7cda_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1699_c7_7cda_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1699_c7_7cda_return_output := t8_MUX_uxn_opcodes_h_l1699_c7_7cda_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1683_c2_ee70] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_ee70_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_ee70_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1696_c7_2fa4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_2fa4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_2fa4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_2fa4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_2fa4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_2fa4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_2fa4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1683_c2_ee70] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_ee70_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_ee70_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output;

     -- n8_MUX[uxn_opcodes_h_l1702_c7_9ab4] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1702_c7_9ab4_cond <= VAR_n8_MUX_uxn_opcodes_h_l1702_c7_9ab4_cond;
     n8_MUX_uxn_opcodes_h_l1702_c7_9ab4_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1702_c7_9ab4_iftrue;
     n8_MUX_uxn_opcodes_h_l1702_c7_9ab4_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1702_c7_9ab4_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1702_c7_9ab4_return_output := n8_MUX_uxn_opcodes_h_l1702_c7_9ab4_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1683_c2_ee70] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_ee70_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_ee70_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1702_c7_9ab4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_9ab4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_9ab4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_9ab4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_9ab4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_9ab4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_9ab4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_9ab4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_9ab4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1702_c7_9ab4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1702_c7_9ab4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1702_c7_9ab4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1702_c7_9ab4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1702_c7_9ab4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1702_c7_9ab4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1702_c7_9ab4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1702_c7_9ab4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1702_c7_9ab4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1702_c7_9ab4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_9ab4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_9ab4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_9ab4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_9ab4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_9ab4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_9ab4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_9ab4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_9ab4_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1683_c2_ee70] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_ee70_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_ee70_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1702_c7_9ab4] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_9ab4_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_9ab4_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_9ab4_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_9ab4_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_9ab4_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_9ab4_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_9ab4_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_9ab4_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1706_c22_dca4] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_dca4_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_dca4_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_dca4_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_dca4_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_dca4_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_dca4_return_output;

     -- Submodule level 2
     VAR_result_u16_value_uxn_opcodes_h_l1706_c3_aedd := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_dca4_return_output)),16);
     VAR_n8_MUX_uxn_opcodes_h_l1699_c7_7cda_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1702_c7_9ab4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7cda_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_9ab4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_7cda_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_9ab4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7cda_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_9ab4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c7_7cda_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1702_c7_9ab4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1696_c7_2fa4_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1699_c7_7cda_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1702_c7_9ab4_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1706_c3_aedd;
     -- t8_MUX[uxn_opcodes_h_l1696_c7_2fa4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1696_c7_2fa4_cond <= VAR_t8_MUX_uxn_opcodes_h_l1696_c7_2fa4_cond;
     t8_MUX_uxn_opcodes_h_l1696_c7_2fa4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1696_c7_2fa4_iftrue;
     t8_MUX_uxn_opcodes_h_l1696_c7_2fa4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1696_c7_2fa4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output := t8_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1699_c7_7cda] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_7cda_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_7cda_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_7cda_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_7cda_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_7cda_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_7cda_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_7cda_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_7cda_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1683_c2_ee70] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_ee70_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_ee70_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output;

     -- n8_MUX[uxn_opcodes_h_l1699_c7_7cda] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1699_c7_7cda_cond <= VAR_n8_MUX_uxn_opcodes_h_l1699_c7_7cda_cond;
     n8_MUX_uxn_opcodes_h_l1699_c7_7cda_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1699_c7_7cda_iftrue;
     n8_MUX_uxn_opcodes_h_l1699_c7_7cda_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1699_c7_7cda_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1699_c7_7cda_return_output := n8_MUX_uxn_opcodes_h_l1699_c7_7cda_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1699_c7_7cda] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7cda_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7cda_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7cda_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7cda_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7cda_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7cda_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7cda_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7cda_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1699_c7_7cda] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7cda_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7cda_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7cda_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7cda_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7cda_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7cda_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7cda_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7cda_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1702_c7_9ab4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1702_c7_9ab4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1702_c7_9ab4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1702_c7_9ab4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1702_c7_9ab4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1702_c7_9ab4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1702_c7_9ab4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1702_c7_9ab4_return_output := result_u16_value_MUX_uxn_opcodes_h_l1702_c7_9ab4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1699_c7_7cda] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1699_c7_7cda_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c7_7cda_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1699_c7_7cda_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c7_7cda_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1699_c7_7cda_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c7_7cda_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c7_7cda_return_output := result_u8_value_MUX_uxn_opcodes_h_l1699_c7_7cda_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l1696_c7_2fa4_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1699_c7_7cda_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_2fa4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_7cda_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_2fa4_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_7cda_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_2fa4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_7cda_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c7_7cda_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1702_c7_9ab4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_2fa4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c7_7cda_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output;
     -- t8_MUX[uxn_opcodes_h_l1683_c2_ee70] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1683_c2_ee70_cond <= VAR_t8_MUX_uxn_opcodes_h_l1683_c2_ee70_cond;
     t8_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue;
     t8_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output := t8_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1696_c7_2fa4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_2fa4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_2fa4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_2fa4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_2fa4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_2fa4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_2fa4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1696_c7_2fa4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_2fa4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_2fa4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_2fa4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_2fa4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_2fa4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_2fa4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1696_c7_2fa4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1696_c7_2fa4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_2fa4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1696_c7_2fa4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_2fa4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1696_c7_2fa4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_2fa4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output;

     -- n8_MUX[uxn_opcodes_h_l1696_c7_2fa4] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1696_c7_2fa4_cond <= VAR_n8_MUX_uxn_opcodes_h_l1696_c7_2fa4_cond;
     n8_MUX_uxn_opcodes_h_l1696_c7_2fa4_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1696_c7_2fa4_iftrue;
     n8_MUX_uxn_opcodes_h_l1696_c7_2fa4_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1696_c7_2fa4_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output := n8_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1696_c7_2fa4] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_2fa4_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_2fa4_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_2fa4_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_2fa4_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_2fa4_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_2fa4_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1699_c7_7cda] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1699_c7_7cda_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c7_7cda_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1699_c7_7cda_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c7_7cda_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1699_c7_7cda_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c7_7cda_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c7_7cda_return_output := result_u16_value_MUX_uxn_opcodes_h_l1699_c7_7cda_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_2fa4_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c7_7cda_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1683_c2_ee70] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1683_c2_ee70_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c2_ee70_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output := result_u8_value_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1683_c2_ee70] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_ee70_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_ee70_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1696_c7_2fa4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1696_c7_2fa4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_2fa4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1696_c7_2fa4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_2fa4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1696_c7_2fa4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_2fa4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output := result_u16_value_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1683_c2_ee70] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_ee70_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_ee70_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output;

     -- n8_MUX[uxn_opcodes_h_l1683_c2_ee70] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1683_c2_ee70_cond <= VAR_n8_MUX_uxn_opcodes_h_l1683_c2_ee70_cond;
     n8_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue;
     n8_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output := n8_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1683_c2_ee70] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_ee70_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_ee70_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_2fa4_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1683_c2_ee70] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1683_c2_ee70_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c2_ee70_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c2_ee70_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c2_ee70_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output := result_u16_value_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output;

     -- Submodule level 6
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a906_uxn_opcodes_h_l1711_l1679_DUPLICATE_1b09 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a906_uxn_opcodes_h_l1711_l1679_DUPLICATE_1b09_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a906(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c2_ee70_return_output);

     -- Submodule level 7
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a906_uxn_opcodes_h_l1711_l1679_DUPLICATE_1b09_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a906_uxn_opcodes_h_l1711_l1679_DUPLICATE_1b09_return_output;
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
