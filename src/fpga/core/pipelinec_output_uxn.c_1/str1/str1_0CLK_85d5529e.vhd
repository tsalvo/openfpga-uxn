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
-- BIN_OP_EQ[uxn_opcodes_h_l1683_c6_d517]
signal BIN_OP_EQ_uxn_opcodes_h_l1683_c6_d517_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1683_c6_d517_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1683_c6_d517_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1683_c2_9345]
signal n8_MUX_uxn_opcodes_h_l1683_c2_9345_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1683_c2_9345_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1683_c2_9345]
signal t8_MUX_uxn_opcodes_h_l1683_c2_9345_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1683_c2_9345_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1683_c2_9345]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9345_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9345_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1683_c2_9345]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9345_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9345_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1683_c2_9345]
signal result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9345_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9345_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1683_c2_9345]
signal result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9345_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9345_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1683_c2_9345]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9345_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9345_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1683_c2_9345]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9345_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9345_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1683_c2_9345]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9345_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9345_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1683_c2_9345]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9345_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9345_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1683_c2_9345]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9345_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9345_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1683_c2_9345]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9345_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9345_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1696_c11_cc89]
signal BIN_OP_EQ_uxn_opcodes_h_l1696_c11_cc89_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1696_c11_cc89_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1696_c11_cc89_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1696_c7_e01b]
signal n8_MUX_uxn_opcodes_h_l1696_c7_e01b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1696_c7_e01b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1696_c7_e01b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1696_c7_e01b]
signal t8_MUX_uxn_opcodes_h_l1696_c7_e01b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1696_c7_e01b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1696_c7_e01b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1696_c7_e01b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_e01b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_e01b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_e01b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1696_c7_e01b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_e01b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_e01b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_e01b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1696_c7_e01b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_e01b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_e01b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_e01b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1696_c7_e01b]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_e01b_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_e01b_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_e01b_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1696_c7_e01b]
signal result_u16_value_MUX_uxn_opcodes_h_l1696_c7_e01b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1696_c7_e01b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1696_c7_e01b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1696_c7_e01b]
signal result_u8_value_MUX_uxn_opcodes_h_l1696_c7_e01b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1696_c7_e01b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1696_c7_e01b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1699_c11_bbd3]
signal BIN_OP_EQ_uxn_opcodes_h_l1699_c11_bbd3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1699_c11_bbd3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1699_c11_bbd3_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1699_c7_b92a]
signal n8_MUX_uxn_opcodes_h_l1699_c7_b92a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1699_c7_b92a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1699_c7_b92a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1699_c7_b92a_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1699_c7_b92a]
signal t8_MUX_uxn_opcodes_h_l1699_c7_b92a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1699_c7_b92a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1699_c7_b92a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1699_c7_b92a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1699_c7_b92a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_b92a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_b92a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_b92a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_b92a_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1699_c7_b92a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_b92a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_b92a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_b92a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_b92a_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1699_c7_b92a]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_b92a_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_b92a_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_b92a_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_b92a_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1699_c7_b92a]
signal result_u16_value_MUX_uxn_opcodes_h_l1699_c7_b92a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1699_c7_b92a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1699_c7_b92a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1699_c7_b92a_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1699_c7_b92a]
signal result_u8_value_MUX_uxn_opcodes_h_l1699_c7_b92a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1699_c7_b92a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1699_c7_b92a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1699_c7_b92a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1702_c11_6201]
signal BIN_OP_EQ_uxn_opcodes_h_l1702_c11_6201_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1702_c11_6201_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1702_c11_6201_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1702_c7_b058]
signal n8_MUX_uxn_opcodes_h_l1702_c7_b058_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1702_c7_b058_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1702_c7_b058_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1702_c7_b058_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1702_c7_b058]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_b058_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_b058_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_b058_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_b058_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1702_c7_b058]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_b058_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_b058_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_b058_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_b058_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1702_c7_b058]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_b058_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_b058_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_b058_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_b058_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1702_c7_b058]
signal result_u16_value_MUX_uxn_opcodes_h_l1702_c7_b058_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1702_c7_b058_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1702_c7_b058_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1702_c7_b058_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1702_c7_b058]
signal result_u8_value_MUX_uxn_opcodes_h_l1702_c7_b058_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1702_c7_b058_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1702_c7_b058_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1702_c7_b058_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1704_c30_00d0]
signal sp_relative_shift_uxn_opcodes_h_l1704_c30_00d0_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1704_c30_00d0_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1704_c30_00d0_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1704_c30_00d0_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1706_c22_ba47]
signal BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_ba47_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_ba47_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_ba47_return_output : signed(17 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_7557( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_vram_write := ref_toks_6;
      base.is_stack_index_flipped := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_ram_write := ref_toks_9;
      base.is_stack_write := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1683_c6_d517
BIN_OP_EQ_uxn_opcodes_h_l1683_c6_d517 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1683_c6_d517_left,
BIN_OP_EQ_uxn_opcodes_h_l1683_c6_d517_right,
BIN_OP_EQ_uxn_opcodes_h_l1683_c6_d517_return_output);

-- n8_MUX_uxn_opcodes_h_l1683_c2_9345
n8_MUX_uxn_opcodes_h_l1683_c2_9345 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1683_c2_9345_cond,
n8_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue,
n8_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse,
n8_MUX_uxn_opcodes_h_l1683_c2_9345_return_output);

-- t8_MUX_uxn_opcodes_h_l1683_c2_9345
t8_MUX_uxn_opcodes_h_l1683_c2_9345 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1683_c2_9345_cond,
t8_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue,
t8_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse,
t8_MUX_uxn_opcodes_h_l1683_c2_9345_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9345
result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9345 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9345_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9345_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9345
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9345 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9345_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9345_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9345
result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9345 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9345_cond,
result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9345_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9345
result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9345 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9345_cond,
result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9345_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9345
result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9345 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9345_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9345_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9345
result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9345 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9345_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9345_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9345
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9345 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9345_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9345_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9345
result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9345 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9345_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9345_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9345
result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9345 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9345_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9345_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9345
result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9345 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9345_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9345_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1696_c11_cc89
BIN_OP_EQ_uxn_opcodes_h_l1696_c11_cc89 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1696_c11_cc89_left,
BIN_OP_EQ_uxn_opcodes_h_l1696_c11_cc89_right,
BIN_OP_EQ_uxn_opcodes_h_l1696_c11_cc89_return_output);

-- n8_MUX_uxn_opcodes_h_l1696_c7_e01b
n8_MUX_uxn_opcodes_h_l1696_c7_e01b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1696_c7_e01b_cond,
n8_MUX_uxn_opcodes_h_l1696_c7_e01b_iftrue,
n8_MUX_uxn_opcodes_h_l1696_c7_e01b_iffalse,
n8_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output);

-- t8_MUX_uxn_opcodes_h_l1696_c7_e01b
t8_MUX_uxn_opcodes_h_l1696_c7_e01b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1696_c7_e01b_cond,
t8_MUX_uxn_opcodes_h_l1696_c7_e01b_iftrue,
t8_MUX_uxn_opcodes_h_l1696_c7_e01b_iffalse,
t8_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_e01b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_e01b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_e01b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_e01b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_e01b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_e01b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_e01b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_e01b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_e01b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_e01b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_e01b
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_e01b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_e01b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_e01b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_e01b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_e01b
result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_e01b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_e01b_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_e01b_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_e01b_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1696_c7_e01b
result_u16_value_MUX_uxn_opcodes_h_l1696_c7_e01b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1696_c7_e01b_cond,
result_u16_value_MUX_uxn_opcodes_h_l1696_c7_e01b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1696_c7_e01b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1696_c7_e01b
result_u8_value_MUX_uxn_opcodes_h_l1696_c7_e01b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1696_c7_e01b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1696_c7_e01b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1696_c7_e01b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1699_c11_bbd3
BIN_OP_EQ_uxn_opcodes_h_l1699_c11_bbd3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1699_c11_bbd3_left,
BIN_OP_EQ_uxn_opcodes_h_l1699_c11_bbd3_right,
BIN_OP_EQ_uxn_opcodes_h_l1699_c11_bbd3_return_output);

-- n8_MUX_uxn_opcodes_h_l1699_c7_b92a
n8_MUX_uxn_opcodes_h_l1699_c7_b92a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1699_c7_b92a_cond,
n8_MUX_uxn_opcodes_h_l1699_c7_b92a_iftrue,
n8_MUX_uxn_opcodes_h_l1699_c7_b92a_iffalse,
n8_MUX_uxn_opcodes_h_l1699_c7_b92a_return_output);

-- t8_MUX_uxn_opcodes_h_l1699_c7_b92a
t8_MUX_uxn_opcodes_h_l1699_c7_b92a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1699_c7_b92a_cond,
t8_MUX_uxn_opcodes_h_l1699_c7_b92a_iftrue,
t8_MUX_uxn_opcodes_h_l1699_c7_b92a_iffalse,
t8_MUX_uxn_opcodes_h_l1699_c7_b92a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_b92a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_b92a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_b92a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_b92a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_b92a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_b92a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_b92a
result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_b92a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_b92a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_b92a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_b92a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_b92a_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_b92a
result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_b92a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_b92a_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_b92a_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_b92a_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_b92a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1699_c7_b92a
result_u16_value_MUX_uxn_opcodes_h_l1699_c7_b92a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1699_c7_b92a_cond,
result_u16_value_MUX_uxn_opcodes_h_l1699_c7_b92a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1699_c7_b92a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1699_c7_b92a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1699_c7_b92a
result_u8_value_MUX_uxn_opcodes_h_l1699_c7_b92a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1699_c7_b92a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1699_c7_b92a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1699_c7_b92a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1699_c7_b92a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1702_c11_6201
BIN_OP_EQ_uxn_opcodes_h_l1702_c11_6201 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1702_c11_6201_left,
BIN_OP_EQ_uxn_opcodes_h_l1702_c11_6201_right,
BIN_OP_EQ_uxn_opcodes_h_l1702_c11_6201_return_output);

-- n8_MUX_uxn_opcodes_h_l1702_c7_b058
n8_MUX_uxn_opcodes_h_l1702_c7_b058 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1702_c7_b058_cond,
n8_MUX_uxn_opcodes_h_l1702_c7_b058_iftrue,
n8_MUX_uxn_opcodes_h_l1702_c7_b058_iffalse,
n8_MUX_uxn_opcodes_h_l1702_c7_b058_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_b058
result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_b058 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_b058_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_b058_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_b058_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_b058_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_b058
result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_b058 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_b058_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_b058_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_b058_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_b058_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_b058
result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_b058 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_b058_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_b058_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_b058_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_b058_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1702_c7_b058
result_u16_value_MUX_uxn_opcodes_h_l1702_c7_b058 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1702_c7_b058_cond,
result_u16_value_MUX_uxn_opcodes_h_l1702_c7_b058_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1702_c7_b058_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1702_c7_b058_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1702_c7_b058
result_u8_value_MUX_uxn_opcodes_h_l1702_c7_b058 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1702_c7_b058_cond,
result_u8_value_MUX_uxn_opcodes_h_l1702_c7_b058_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1702_c7_b058_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1702_c7_b058_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1704_c30_00d0
sp_relative_shift_uxn_opcodes_h_l1704_c30_00d0 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1704_c30_00d0_ins,
sp_relative_shift_uxn_opcodes_h_l1704_c30_00d0_x,
sp_relative_shift_uxn_opcodes_h_l1704_c30_00d0_y,
sp_relative_shift_uxn_opcodes_h_l1704_c30_00d0_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_ba47
BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_ba47 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_ba47_left,
BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_ba47_right,
BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_ba47_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1683_c6_d517_return_output,
 n8_MUX_uxn_opcodes_h_l1683_c2_9345_return_output,
 t8_MUX_uxn_opcodes_h_l1683_c2_9345_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9345_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9345_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9345_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9345_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9345_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9345_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9345_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9345_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9345_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9345_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1696_c11_cc89_return_output,
 n8_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output,
 t8_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1699_c11_bbd3_return_output,
 n8_MUX_uxn_opcodes_h_l1699_c7_b92a_return_output,
 t8_MUX_uxn_opcodes_h_l1699_c7_b92a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_b92a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_b92a_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_b92a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1699_c7_b92a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1699_c7_b92a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1702_c11_6201_return_output,
 n8_MUX_uxn_opcodes_h_l1702_c7_b058_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_b058_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_b058_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_b058_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1702_c7_b058_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1702_c7_b058_return_output,
 sp_relative_shift_uxn_opcodes_h_l1704_c30_00d0_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_ba47_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_d517_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_d517_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_d517_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1683_c2_9345_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1683_c2_9345_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1683_c2_9345_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1683_c2_9345_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1688_c3_a351 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9345_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9345_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1693_c3_9efb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9345_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9345_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9345_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9345_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9345_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9345_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9345_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9345_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1683_c2_9345_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9345_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9345_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1683_c2_9345_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9345_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9345_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1683_c2_9345_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9345_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9345_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9345_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9345_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1683_c2_9345_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9345_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9345_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_cc89_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_cc89_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_cc89_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1696_c7_e01b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1696_c7_e01b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1699_c7_b92a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1696_c7_e01b_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1696_c7_e01b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1696_c7_e01b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1699_c7_b92a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1696_c7_e01b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_e01b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1697_c3_a364 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_e01b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1696_c7_e01b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_e01b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_e01b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_e01b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_b92a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_e01b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_e01b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_e01b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_b92a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_e01b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_e01b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_e01b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_b92a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_e01b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_e01b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_e01b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c7_b92a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_e01b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_e01b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_e01b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c7_b92a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_e01b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_bbd3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_bbd3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_bbd3_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1699_c7_b92a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1699_c7_b92a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1702_c7_b058_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1699_c7_b92a_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1699_c7_b92a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1699_c7_b92a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1699_c7_b92a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_b92a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_b92a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_b058_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_b92a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_b92a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_b92a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_b058_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_b92a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_b92a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_b92a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_b058_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_b92a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c7_b92a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c7_b92a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1702_c7_b058_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c7_b92a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c7_b92a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c7_b92a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1702_c7_b058_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c7_b92a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_6201_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_6201_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_6201_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1702_c7_b058_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1702_c7_b058_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1702_c7_b058_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_b058_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_b058_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_b058_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_b058_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_b058_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_b058_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_b058_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_b058_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_b058_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1702_c7_b058_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1706_c3_bd86 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1702_c7_b058_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1702_c7_b058_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1702_c7_b058_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1702_c7_b058_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1702_c7_b058_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1704_c30_00d0_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1704_c30_00d0_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1704_c30_00d0_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1704_c30_00d0_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_ba47_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1706_c27_9c03_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_ba47_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_ba47_return_output : signed(17 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1699_l1683_l1702_l1696_DUPLICATE_0b4f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1699_l1683_l1702_l1696_DUPLICATE_5e70_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1699_l1702_l1696_DUPLICATE_af38_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1699_l1702_l1696_DUPLICATE_8c55_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1699_l1702_l1696_DUPLICATE_baed_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7557_uxn_opcodes_h_l1711_l1679_DUPLICATE_8ac4_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_6201_right := to_unsigned(3, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1697_c3_a364 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_e01b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1697_c3_a364;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_d517_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1704_c30_00d0_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1704_c30_00d0_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1688_c3_a351 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1688_c3_a351;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_cc89_right := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_b058_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1693_c3_9efb := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1693_c3_9efb;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_b058_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_bbd3_right := to_unsigned(2, 2);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1704_c30_00d0_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1696_c7_e01b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1699_c7_b92a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1702_c7_b058_iffalse := n8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_ba47_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_d517_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_cc89_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_bbd3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_6201_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1702_c7_b058_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1702_c7_b058_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1699_c7_b92a_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1696_c7_e01b_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1699_c7_b92a_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1702_c11_6201] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1702_c11_6201_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_6201_left;
     BIN_OP_EQ_uxn_opcodes_h_l1702_c11_6201_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_6201_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_6201_return_output := BIN_OP_EQ_uxn_opcodes_h_l1702_c11_6201_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1699_l1702_l1696_DUPLICATE_af38 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1699_l1702_l1696_DUPLICATE_af38_return_output := result.sp_relative_shift;

     -- sp_relative_shift[uxn_opcodes_h_l1704_c30_00d0] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1704_c30_00d0_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1704_c30_00d0_ins;
     sp_relative_shift_uxn_opcodes_h_l1704_c30_00d0_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1704_c30_00d0_x;
     sp_relative_shift_uxn_opcodes_h_l1704_c30_00d0_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1704_c30_00d0_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1704_c30_00d0_return_output := sp_relative_shift_uxn_opcodes_h_l1704_c30_00d0_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1683_c2_9345] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1683_c2_9345_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1699_l1683_l1702_l1696_DUPLICATE_5e70 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1699_l1683_l1702_l1696_DUPLICATE_5e70_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1699_l1702_l1696_DUPLICATE_baed LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1699_l1702_l1696_DUPLICATE_baed_return_output := result.is_ram_write;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l1683_c2_9345] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1683_c2_9345_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1699_l1683_l1702_l1696_DUPLICATE_0b4f LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1699_l1683_l1702_l1696_DUPLICATE_0b4f_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1699_l1702_l1696_DUPLICATE_8c55 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1699_l1702_l1696_DUPLICATE_8c55_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1696_c11_cc89] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1696_c11_cc89_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_cc89_left;
     BIN_OP_EQ_uxn_opcodes_h_l1696_c11_cc89_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_cc89_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_cc89_return_output := BIN_OP_EQ_uxn_opcodes_h_l1696_c11_cc89_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1706_c27_9c03] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1706_c27_9c03_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1696_c7_e01b] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1696_c7_e01b_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1699_c11_bbd3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1699_c11_bbd3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_bbd3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1699_c11_bbd3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_bbd3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_bbd3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1699_c11_bbd3_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1683_c2_9345] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1683_c2_9345_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1683_c6_d517] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1683_c6_d517_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_d517_left;
     BIN_OP_EQ_uxn_opcodes_h_l1683_c6_d517_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_d517_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_d517_return_output := BIN_OP_EQ_uxn_opcodes_h_l1683_c6_d517_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1683_c2_9345] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1683_c2_9345_return_output := result.is_pc_updated;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l1683_c2_9345_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_d517_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9345_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_d517_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9345_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_d517_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9345_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_d517_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9345_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_d517_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9345_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_d517_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9345_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_d517_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9345_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_d517_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9345_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_d517_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9345_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_d517_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9345_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_d517_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1683_c2_9345_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c6_d517_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1696_c7_e01b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_cc89_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_e01b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_cc89_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_e01b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_cc89_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_e01b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_cc89_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_e01b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_cc89_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_e01b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_cc89_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_e01b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_cc89_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1696_c7_e01b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_cc89_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1699_c7_b92a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_bbd3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_b92a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_bbd3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_b92a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_bbd3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_b92a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_bbd3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c7_b92a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_bbd3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c7_b92a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_bbd3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1699_c7_b92a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_bbd3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1702_c7_b058_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_6201_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_b058_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_6201_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_b058_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_6201_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_b058_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_6201_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1702_c7_b058_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_6201_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1702_c7_b058_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1702_c11_6201_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_ba47_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1706_c27_9c03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_e01b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1699_l1702_l1696_DUPLICATE_af38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_b92a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1699_l1702_l1696_DUPLICATE_af38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_b058_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1699_l1702_l1696_DUPLICATE_af38_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1699_l1683_l1702_l1696_DUPLICATE_0b4f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_e01b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1699_l1683_l1702_l1696_DUPLICATE_0b4f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c7_b92a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1699_l1683_l1702_l1696_DUPLICATE_0b4f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1702_c7_b058_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1699_l1683_l1702_l1696_DUPLICATE_0b4f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_e01b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1699_l1702_l1696_DUPLICATE_8c55_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_b92a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1699_l1702_l1696_DUPLICATE_8c55_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_b058_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1699_l1702_l1696_DUPLICATE_8c55_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_e01b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1699_l1702_l1696_DUPLICATE_baed_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_b92a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1699_l1702_l1696_DUPLICATE_baed_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_b058_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1699_l1702_l1696_DUPLICATE_baed_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1699_l1683_l1702_l1696_DUPLICATE_5e70_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_e01b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1699_l1683_l1702_l1696_DUPLICATE_5e70_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c7_b92a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1699_l1683_l1702_l1696_DUPLICATE_5e70_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1702_c7_b058_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1699_l1683_l1702_l1696_DUPLICATE_5e70_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1683_c2_9345_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1683_c2_9345_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1683_c2_9345_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1683_c2_9345_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_e01b_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1696_c7_e01b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_b058_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1704_c30_00d0_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1702_c7_b058] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_b058_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_b058_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_b058_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_b058_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_b058_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_b058_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_b058_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_b058_return_output;

     -- n8_MUX[uxn_opcodes_h_l1702_c7_b058] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1702_c7_b058_cond <= VAR_n8_MUX_uxn_opcodes_h_l1702_c7_b058_cond;
     n8_MUX_uxn_opcodes_h_l1702_c7_b058_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1702_c7_b058_iftrue;
     n8_MUX_uxn_opcodes_h_l1702_c7_b058_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1702_c7_b058_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1702_c7_b058_return_output := n8_MUX_uxn_opcodes_h_l1702_c7_b058_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1683_c2_9345] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9345_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9345_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9345_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9345_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1702_c7_b058] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_b058_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_b058_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_b058_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_b058_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_b058_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_b058_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_b058_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_b058_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1696_c7_e01b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_e01b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_e01b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_e01b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_e01b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_e01b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_e01b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1702_c7_b058] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1702_c7_b058_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1702_c7_b058_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1702_c7_b058_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1702_c7_b058_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1702_c7_b058_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1702_c7_b058_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1702_c7_b058_return_output := result_u8_value_MUX_uxn_opcodes_h_l1702_c7_b058_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1683_c2_9345] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9345_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9345_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9345_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9345_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1683_c2_9345] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9345_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9345_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9345_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9345_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1706_c22_ba47] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_ba47_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_ba47_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_ba47_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_ba47_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_ba47_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_ba47_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1683_c2_9345] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9345_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9345_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9345_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9345_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1702_c7_b058] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_b058_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_b058_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_b058_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_b058_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_b058_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_b058_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_b058_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_b058_return_output;

     -- t8_MUX[uxn_opcodes_h_l1699_c7_b92a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1699_c7_b92a_cond <= VAR_t8_MUX_uxn_opcodes_h_l1699_c7_b92a_cond;
     t8_MUX_uxn_opcodes_h_l1699_c7_b92a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1699_c7_b92a_iftrue;
     t8_MUX_uxn_opcodes_h_l1699_c7_b92a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1699_c7_b92a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1699_c7_b92a_return_output := t8_MUX_uxn_opcodes_h_l1699_c7_b92a_return_output;

     -- Submodule level 2
     VAR_result_u16_value_uxn_opcodes_h_l1706_c3_bd86 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1706_c22_ba47_return_output)),16);
     VAR_n8_MUX_uxn_opcodes_h_l1699_c7_b92a_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1702_c7_b058_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_b92a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1702_c7_b058_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_b92a_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1702_c7_b058_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_b92a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1702_c7_b058_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c7_b92a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1702_c7_b058_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1696_c7_e01b_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1699_c7_b92a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1702_c7_b058_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1706_c3_bd86;
     -- result_u16_value_MUX[uxn_opcodes_h_l1702_c7_b058] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1702_c7_b058_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1702_c7_b058_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1702_c7_b058_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1702_c7_b058_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1702_c7_b058_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1702_c7_b058_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1702_c7_b058_return_output := result_u16_value_MUX_uxn_opcodes_h_l1702_c7_b058_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1699_c7_b92a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_b92a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_b92a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_b92a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_b92a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_b92a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_b92a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_b92a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_b92a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1683_c2_9345] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9345_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9345_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9345_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9345_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1699_c7_b92a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_b92a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_b92a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_b92a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_b92a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_b92a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_b92a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_b92a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_b92a_return_output;

     -- t8_MUX[uxn_opcodes_h_l1696_c7_e01b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1696_c7_e01b_cond <= VAR_t8_MUX_uxn_opcodes_h_l1696_c7_e01b_cond;
     t8_MUX_uxn_opcodes_h_l1696_c7_e01b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1696_c7_e01b_iftrue;
     t8_MUX_uxn_opcodes_h_l1696_c7_e01b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1696_c7_e01b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output := t8_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1699_c7_b92a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1699_c7_b92a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c7_b92a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1699_c7_b92a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c7_b92a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1699_c7_b92a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c7_b92a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c7_b92a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1699_c7_b92a_return_output;

     -- n8_MUX[uxn_opcodes_h_l1699_c7_b92a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1699_c7_b92a_cond <= VAR_n8_MUX_uxn_opcodes_h_l1699_c7_b92a_cond;
     n8_MUX_uxn_opcodes_h_l1699_c7_b92a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1699_c7_b92a_iftrue;
     n8_MUX_uxn_opcodes_h_l1699_c7_b92a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1699_c7_b92a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1699_c7_b92a_return_output := n8_MUX_uxn_opcodes_h_l1699_c7_b92a_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1699_c7_b92a] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_b92a_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_b92a_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_b92a_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_b92a_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_b92a_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_b92a_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_b92a_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_b92a_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l1696_c7_e01b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1699_c7_b92a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_e01b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_b92a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_e01b_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_b92a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_e01b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_b92a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c7_b92a_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1702_c7_b058_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_e01b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c7_b92a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1696_c7_e01b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1696_c7_e01b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_e01b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1696_c7_e01b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_e01b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1696_c7_e01b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_e01b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output;

     -- t8_MUX[uxn_opcodes_h_l1683_c2_9345] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1683_c2_9345_cond <= VAR_t8_MUX_uxn_opcodes_h_l1683_c2_9345_cond;
     t8_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue;
     t8_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1683_c2_9345_return_output := t8_MUX_uxn_opcodes_h_l1683_c2_9345_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1696_c7_e01b] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_e01b_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_e01b_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_e01b_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_e01b_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_e01b_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_e01b_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output;

     -- n8_MUX[uxn_opcodes_h_l1696_c7_e01b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1696_c7_e01b_cond <= VAR_n8_MUX_uxn_opcodes_h_l1696_c7_e01b_cond;
     n8_MUX_uxn_opcodes_h_l1696_c7_e01b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1696_c7_e01b_iftrue;
     n8_MUX_uxn_opcodes_h_l1696_c7_e01b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1696_c7_e01b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output := n8_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1696_c7_e01b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_e01b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_e01b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_e01b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_e01b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_e01b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_e01b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1696_c7_e01b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_e01b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_e01b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_e01b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_e01b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_e01b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_e01b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1699_c7_b92a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1699_c7_b92a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c7_b92a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1699_c7_b92a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c7_b92a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1699_c7_b92a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c7_b92a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c7_b92a_return_output := result_u16_value_MUX_uxn_opcodes_h_l1699_c7_b92a_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_e01b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c7_b92a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1683_c2_9345_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1683_c2_9345] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9345_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9345_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9345_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9345_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1683_c2_9345] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9345_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9345_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9345_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9345_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1683_c2_9345] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9345_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9345_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9345_return_output := result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9345_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1683_c2_9345] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9345_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9345_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9345_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9345_return_output;

     -- n8_MUX[uxn_opcodes_h_l1683_c2_9345] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1683_c2_9345_cond <= VAR_n8_MUX_uxn_opcodes_h_l1683_c2_9345_cond;
     n8_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue;
     n8_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1683_c2_9345_return_output := n8_MUX_uxn_opcodes_h_l1683_c2_9345_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1696_c7_e01b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1696_c7_e01b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_e01b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1696_c7_e01b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_e01b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1696_c7_e01b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_e01b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output := result_u16_value_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1683_c2_9345_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_e01b_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1683_c2_9345] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9345_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9345_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9345_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9345_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9345_return_output := result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9345_return_output;

     -- Submodule level 6
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_7557_uxn_opcodes_h_l1711_l1679_DUPLICATE_8ac4 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7557_uxn_opcodes_h_l1711_l1679_DUPLICATE_8ac4_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_7557(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c2_9345_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c2_9345_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c2_9345_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c2_9345_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c2_9345_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1683_c2_9345_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1683_c2_9345_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1683_c2_9345_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1683_c2_9345_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c2_9345_return_output);

     -- Submodule level 7
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7557_uxn_opcodes_h_l1711_l1679_DUPLICATE_8ac4_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7557_uxn_opcodes_h_l1711_l1679_DUPLICATE_8ac4_return_output;
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
