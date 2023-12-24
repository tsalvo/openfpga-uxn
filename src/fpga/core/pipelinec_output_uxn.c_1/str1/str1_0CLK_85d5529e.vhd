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
-- BIN_OP_EQ[uxn_opcodes_h_l1699_c6_2d16]
signal BIN_OP_EQ_uxn_opcodes_h_l1699_c6_2d16_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1699_c6_2d16_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1699_c6_2d16_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1699_c2_082c]
signal n8_MUX_uxn_opcodes_h_l1699_c2_082c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1699_c2_082c_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1699_c2_082c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_082c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_082c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1699_c2_082c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_082c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_082c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1699_c2_082c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_082c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_082c_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1699_c2_082c]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_082c_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_082c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1699_c2_082c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_082c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_082c_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1699_c2_082c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_082c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_082c_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1699_c2_082c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_082c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_082c_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1699_c2_082c]
signal result_u16_value_MUX_uxn_opcodes_h_l1699_c2_082c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1699_c2_082c_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1699_c2_082c]
signal result_u8_value_MUX_uxn_opcodes_h_l1699_c2_082c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1699_c2_082c_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1699_c2_082c]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_082c_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_082c_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1699_c2_082c]
signal t8_MUX_uxn_opcodes_h_l1699_c2_082c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1699_c2_082c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1712_c11_077f]
signal BIN_OP_EQ_uxn_opcodes_h_l1712_c11_077f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1712_c11_077f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1712_c11_077f_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1712_c7_000d]
signal n8_MUX_uxn_opcodes_h_l1712_c7_000d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1712_c7_000d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1712_c7_000d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1712_c7_000d_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1712_c7_000d]
signal result_u16_value_MUX_uxn_opcodes_h_l1712_c7_000d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1712_c7_000d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1712_c7_000d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1712_c7_000d_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1712_c7_000d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_000d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_000d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_000d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_000d_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1712_c7_000d]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_000d_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_000d_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_000d_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_000d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1712_c7_000d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_000d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_000d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_000d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_000d_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1712_c7_000d]
signal result_u8_value_MUX_uxn_opcodes_h_l1712_c7_000d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1712_c7_000d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1712_c7_000d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1712_c7_000d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1712_c7_000d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_000d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_000d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_000d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_000d_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l1712_c7_000d]
signal t8_MUX_uxn_opcodes_h_l1712_c7_000d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1712_c7_000d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1712_c7_000d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1712_c7_000d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1715_c11_46c4]
signal BIN_OP_EQ_uxn_opcodes_h_l1715_c11_46c4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1715_c11_46c4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1715_c11_46c4_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1715_c7_a41e]
signal n8_MUX_uxn_opcodes_h_l1715_c7_a41e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1715_c7_a41e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1715_c7_a41e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1715_c7_a41e_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1715_c7_a41e]
signal result_u16_value_MUX_uxn_opcodes_h_l1715_c7_a41e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1715_c7_a41e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1715_c7_a41e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1715_c7_a41e_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1715_c7_a41e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_a41e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_a41e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_a41e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_a41e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1715_c7_a41e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_a41e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_a41e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_a41e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_a41e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1715_c7_a41e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_a41e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_a41e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_a41e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_a41e_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1715_c7_a41e]
signal result_u8_value_MUX_uxn_opcodes_h_l1715_c7_a41e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1715_c7_a41e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1715_c7_a41e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1715_c7_a41e_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1715_c7_a41e]
signal t8_MUX_uxn_opcodes_h_l1715_c7_a41e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1715_c7_a41e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1715_c7_a41e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1715_c7_a41e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1718_c11_d67d]
signal BIN_OP_EQ_uxn_opcodes_h_l1718_c11_d67d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1718_c11_d67d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1718_c11_d67d_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1718_c7_ddb0]
signal n8_MUX_uxn_opcodes_h_l1718_c7_ddb0_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1718_c7_ddb0_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1718_c7_ddb0_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1718_c7_ddb0_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1718_c7_ddb0]
signal result_u16_value_MUX_uxn_opcodes_h_l1718_c7_ddb0_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1718_c7_ddb0_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1718_c7_ddb0_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1718_c7_ddb0_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1718_c7_ddb0]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_ddb0_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_ddb0_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_ddb0_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_ddb0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1718_c7_ddb0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_ddb0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_ddb0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_ddb0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_ddb0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1718_c7_ddb0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_ddb0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_ddb0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_ddb0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_ddb0_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1718_c7_ddb0]
signal result_u8_value_MUX_uxn_opcodes_h_l1718_c7_ddb0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1718_c7_ddb0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1718_c7_ddb0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1718_c7_ddb0_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1720_c30_2829]
signal sp_relative_shift_uxn_opcodes_h_l1720_c30_2829_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1720_c30_2829_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1720_c30_2829_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1720_c30_2829_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1722_c22_a94b]
signal BIN_OP_PLUS_uxn_opcodes_h_l1722_c22_a94b_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1722_c22_a94b_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1722_c22_a94b_return_output : signed(17 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_42c1( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
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
      base.is_ram_write := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.u16_value := ref_toks_8;
      base.u8_value := ref_toks_9;
      base.is_vram_write := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1699_c6_2d16
BIN_OP_EQ_uxn_opcodes_h_l1699_c6_2d16 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1699_c6_2d16_left,
BIN_OP_EQ_uxn_opcodes_h_l1699_c6_2d16_right,
BIN_OP_EQ_uxn_opcodes_h_l1699_c6_2d16_return_output);

-- n8_MUX_uxn_opcodes_h_l1699_c2_082c
n8_MUX_uxn_opcodes_h_l1699_c2_082c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1699_c2_082c_cond,
n8_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue,
n8_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse,
n8_MUX_uxn_opcodes_h_l1699_c2_082c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_082c
result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_082c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_082c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_082c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_082c
result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_082c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_082c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_082c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_082c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_082c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_082c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_082c_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_082c
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_082c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_082c_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_082c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_082c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_082c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_082c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_082c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_082c
result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_082c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_082c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_082c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_082c
result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_082c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_082c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_082c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1699_c2_082c
result_u16_value_MUX_uxn_opcodes_h_l1699_c2_082c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1699_c2_082c_cond,
result_u16_value_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1699_c2_082c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1699_c2_082c
result_u8_value_MUX_uxn_opcodes_h_l1699_c2_082c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1699_c2_082c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1699_c2_082c_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_082c
result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_082c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_082c_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_082c_return_output);

-- t8_MUX_uxn_opcodes_h_l1699_c2_082c
t8_MUX_uxn_opcodes_h_l1699_c2_082c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1699_c2_082c_cond,
t8_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue,
t8_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse,
t8_MUX_uxn_opcodes_h_l1699_c2_082c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1712_c11_077f
BIN_OP_EQ_uxn_opcodes_h_l1712_c11_077f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1712_c11_077f_left,
BIN_OP_EQ_uxn_opcodes_h_l1712_c11_077f_right,
BIN_OP_EQ_uxn_opcodes_h_l1712_c11_077f_return_output);

-- n8_MUX_uxn_opcodes_h_l1712_c7_000d
n8_MUX_uxn_opcodes_h_l1712_c7_000d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1712_c7_000d_cond,
n8_MUX_uxn_opcodes_h_l1712_c7_000d_iftrue,
n8_MUX_uxn_opcodes_h_l1712_c7_000d_iffalse,
n8_MUX_uxn_opcodes_h_l1712_c7_000d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1712_c7_000d
result_u16_value_MUX_uxn_opcodes_h_l1712_c7_000d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1712_c7_000d_cond,
result_u16_value_MUX_uxn_opcodes_h_l1712_c7_000d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1712_c7_000d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1712_c7_000d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_000d
result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_000d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_000d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_000d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_000d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_000d_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_000d
result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_000d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_000d_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_000d_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_000d_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_000d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_000d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_000d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_000d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_000d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_000d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_000d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1712_c7_000d
result_u8_value_MUX_uxn_opcodes_h_l1712_c7_000d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1712_c7_000d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1712_c7_000d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1712_c7_000d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1712_c7_000d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_000d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_000d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_000d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_000d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_000d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_000d_return_output);

-- t8_MUX_uxn_opcodes_h_l1712_c7_000d
t8_MUX_uxn_opcodes_h_l1712_c7_000d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1712_c7_000d_cond,
t8_MUX_uxn_opcodes_h_l1712_c7_000d_iftrue,
t8_MUX_uxn_opcodes_h_l1712_c7_000d_iffalse,
t8_MUX_uxn_opcodes_h_l1712_c7_000d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1715_c11_46c4
BIN_OP_EQ_uxn_opcodes_h_l1715_c11_46c4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1715_c11_46c4_left,
BIN_OP_EQ_uxn_opcodes_h_l1715_c11_46c4_right,
BIN_OP_EQ_uxn_opcodes_h_l1715_c11_46c4_return_output);

-- n8_MUX_uxn_opcodes_h_l1715_c7_a41e
n8_MUX_uxn_opcodes_h_l1715_c7_a41e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1715_c7_a41e_cond,
n8_MUX_uxn_opcodes_h_l1715_c7_a41e_iftrue,
n8_MUX_uxn_opcodes_h_l1715_c7_a41e_iffalse,
n8_MUX_uxn_opcodes_h_l1715_c7_a41e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1715_c7_a41e
result_u16_value_MUX_uxn_opcodes_h_l1715_c7_a41e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1715_c7_a41e_cond,
result_u16_value_MUX_uxn_opcodes_h_l1715_c7_a41e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1715_c7_a41e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1715_c7_a41e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_a41e
result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_a41e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_a41e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_a41e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_a41e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_a41e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_a41e
result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_a41e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_a41e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_a41e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_a41e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_a41e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_a41e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_a41e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_a41e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_a41e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_a41e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_a41e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1715_c7_a41e
result_u8_value_MUX_uxn_opcodes_h_l1715_c7_a41e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1715_c7_a41e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1715_c7_a41e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1715_c7_a41e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1715_c7_a41e_return_output);

-- t8_MUX_uxn_opcodes_h_l1715_c7_a41e
t8_MUX_uxn_opcodes_h_l1715_c7_a41e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1715_c7_a41e_cond,
t8_MUX_uxn_opcodes_h_l1715_c7_a41e_iftrue,
t8_MUX_uxn_opcodes_h_l1715_c7_a41e_iffalse,
t8_MUX_uxn_opcodes_h_l1715_c7_a41e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1718_c11_d67d
BIN_OP_EQ_uxn_opcodes_h_l1718_c11_d67d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1718_c11_d67d_left,
BIN_OP_EQ_uxn_opcodes_h_l1718_c11_d67d_right,
BIN_OP_EQ_uxn_opcodes_h_l1718_c11_d67d_return_output);

-- n8_MUX_uxn_opcodes_h_l1718_c7_ddb0
n8_MUX_uxn_opcodes_h_l1718_c7_ddb0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1718_c7_ddb0_cond,
n8_MUX_uxn_opcodes_h_l1718_c7_ddb0_iftrue,
n8_MUX_uxn_opcodes_h_l1718_c7_ddb0_iffalse,
n8_MUX_uxn_opcodes_h_l1718_c7_ddb0_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1718_c7_ddb0
result_u16_value_MUX_uxn_opcodes_h_l1718_c7_ddb0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1718_c7_ddb0_cond,
result_u16_value_MUX_uxn_opcodes_h_l1718_c7_ddb0_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1718_c7_ddb0_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1718_c7_ddb0_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_ddb0
result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_ddb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_ddb0_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_ddb0_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_ddb0_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_ddb0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_ddb0
result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_ddb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_ddb0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_ddb0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_ddb0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_ddb0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_ddb0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_ddb0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_ddb0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_ddb0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_ddb0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_ddb0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1718_c7_ddb0
result_u8_value_MUX_uxn_opcodes_h_l1718_c7_ddb0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1718_c7_ddb0_cond,
result_u8_value_MUX_uxn_opcodes_h_l1718_c7_ddb0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1718_c7_ddb0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1718_c7_ddb0_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1720_c30_2829
sp_relative_shift_uxn_opcodes_h_l1720_c30_2829 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1720_c30_2829_ins,
sp_relative_shift_uxn_opcodes_h_l1720_c30_2829_x,
sp_relative_shift_uxn_opcodes_h_l1720_c30_2829_y,
sp_relative_shift_uxn_opcodes_h_l1720_c30_2829_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1722_c22_a94b
BIN_OP_PLUS_uxn_opcodes_h_l1722_c22_a94b : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1722_c22_a94b_left,
BIN_OP_PLUS_uxn_opcodes_h_l1722_c22_a94b_right,
BIN_OP_PLUS_uxn_opcodes_h_l1722_c22_a94b_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1699_c6_2d16_return_output,
 n8_MUX_uxn_opcodes_h_l1699_c2_082c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_082c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_082c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_082c_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_082c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_082c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_082c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_082c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1699_c2_082c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1699_c2_082c_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_082c_return_output,
 t8_MUX_uxn_opcodes_h_l1699_c2_082c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1712_c11_077f_return_output,
 n8_MUX_uxn_opcodes_h_l1712_c7_000d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1712_c7_000d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_000d_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_000d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_000d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1712_c7_000d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_000d_return_output,
 t8_MUX_uxn_opcodes_h_l1712_c7_000d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1715_c11_46c4_return_output,
 n8_MUX_uxn_opcodes_h_l1715_c7_a41e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1715_c7_a41e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_a41e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_a41e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_a41e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1715_c7_a41e_return_output,
 t8_MUX_uxn_opcodes_h_l1715_c7_a41e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1718_c11_d67d_return_output,
 n8_MUX_uxn_opcodes_h_l1718_c7_ddb0_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1718_c7_ddb0_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_ddb0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_ddb0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_ddb0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1718_c7_ddb0_return_output,
 sp_relative_shift_uxn_opcodes_h_l1720_c30_2829_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1722_c22_a94b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c6_2d16_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c6_2d16_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c6_2d16_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1712_c7_000d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1699_c2_082c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1699_c2_082c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_000d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_082c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_082c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_000d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_082c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_082c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1704_c3_faa1 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_000d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_082c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_082c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1699_c2_082c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_082c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_082c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1709_c3_ce8b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_000d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_082c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_082c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1699_c2_082c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_082c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_082c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1699_c2_082c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_082c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_082c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1712_c7_000d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c2_082c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c2_082c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1712_c7_000d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c2_082c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c2_082c_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1699_c2_082c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_082c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_082c_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1712_c7_000d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1699_c2_082c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1699_c2_082c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1712_c11_077f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1712_c11_077f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1712_c11_077f_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1712_c7_000d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1712_c7_000d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1715_c7_a41e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1712_c7_000d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1712_c7_000d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1712_c7_000d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1715_c7_a41e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1712_c7_000d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_000d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_000d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_a41e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_000d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_000d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_000d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_a41e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_000d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_000d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_000d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_a41e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_000d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1712_c7_000d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1712_c7_000d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1715_c7_a41e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1712_c7_000d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_000d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1713_c3_c122 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_000d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1712_c7_000d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_000d_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1712_c7_000d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1712_c7_000d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1715_c7_a41e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1712_c7_000d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1715_c11_46c4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1715_c11_46c4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1715_c11_46c4_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1715_c7_a41e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1715_c7_a41e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1718_c7_ddb0_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1715_c7_a41e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1715_c7_a41e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1715_c7_a41e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c7_ddb0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1715_c7_a41e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_a41e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_a41e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_ddb0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_a41e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_a41e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_a41e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_ddb0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_a41e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_a41e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_a41e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_ddb0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_a41e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1715_c7_a41e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1715_c7_a41e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c7_ddb0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1715_c7_a41e_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1715_c7_a41e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1715_c7_a41e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1715_c7_a41e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c11_d67d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c11_d67d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c11_d67d_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1718_c7_ddb0_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1718_c7_ddb0_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1718_c7_ddb0_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c7_ddb0_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1722_c3_45d8 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c7_ddb0_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c7_ddb0_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_ddb0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_ddb0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_ddb0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_ddb0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_ddb0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_ddb0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_ddb0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_ddb0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_ddb0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c7_ddb0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c7_ddb0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c7_ddb0_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1720_c30_2829_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1720_c30_2829_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1720_c30_2829_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1720_c30_2829_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1722_c22_a94b_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1722_c27_8bfb_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1722_c22_a94b_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1722_c22_a94b_return_output : signed(17 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1715_l1699_l1718_l1712_DUPLICATE_c6b0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1715_l1699_l1718_l1712_DUPLICATE_1467_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1715_l1718_l1712_DUPLICATE_6a0e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1715_l1718_l1712_DUPLICATE_aa87_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1715_l1718_l1712_DUPLICATE_12cb_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_42c1_uxn_opcodes_h_l1727_l1695_DUPLICATE_61b9_return_output : opcode_result_t;
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
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1713_c3_c122 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_000d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1713_c3_c122;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_ddb0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1715_c11_46c4_right := to_unsigned(2, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1720_c30_2829_y := resize(to_signed(-2, 3), 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l1720_c30_2829_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c6_2d16_right := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c11_d67d_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_ddb0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1712_c11_077f_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1709_c3_ce8b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1709_c3_ce8b;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1704_c3_faa1 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1704_c3_faa1;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1720_c30_2829_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1712_c7_000d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1715_c7_a41e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1718_c7_ddb0_iffalse := n8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1722_c22_a94b_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c6_2d16_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1712_c11_077f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1715_c11_46c4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c11_d67d_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1718_c7_ddb0_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c7_ddb0_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1715_c7_a41e_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1712_c7_000d_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1715_c7_a41e_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1699_c6_2d16] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1699_c6_2d16_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c6_2d16_left;
     BIN_OP_EQ_uxn_opcodes_h_l1699_c6_2d16_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c6_2d16_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c6_2d16_return_output := BIN_OP_EQ_uxn_opcodes_h_l1699_c6_2d16_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1699_c2_082c] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1699_c2_082c_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1712_c11_077f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1712_c11_077f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1712_c11_077f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1712_c11_077f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1712_c11_077f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1712_c11_077f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1712_c11_077f_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1722_c27_8bfb] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1722_c27_8bfb_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1712_c7_000d] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1712_c7_000d_return_output := result.stack_address_sp_offset;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l1699_c2_082c] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1699_c2_082c_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1715_l1699_l1718_l1712_DUPLICATE_1467 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1715_l1699_l1718_l1712_DUPLICATE_1467_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1715_c11_46c4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1715_c11_46c4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1715_c11_46c4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1715_c11_46c4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1715_c11_46c4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1715_c11_46c4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1715_c11_46c4_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1715_l1699_l1718_l1712_DUPLICATE_c6b0 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1715_l1699_l1718_l1712_DUPLICATE_c6b0_return_output := result.u16_value;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1699_c2_082c] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1699_c2_082c_return_output := result.is_pc_updated;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1715_l1718_l1712_DUPLICATE_12cb LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1715_l1718_l1712_DUPLICATE_12cb_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1718_c11_d67d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1718_c11_d67d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c11_d67d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1718_c11_d67d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c11_d67d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c11_d67d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1718_c11_d67d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1715_l1718_l1712_DUPLICATE_6a0e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1715_l1718_l1712_DUPLICATE_6a0e_return_output := result.is_opc_done;

     -- sp_relative_shift[uxn_opcodes_h_l1720_c30_2829] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1720_c30_2829_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1720_c30_2829_ins;
     sp_relative_shift_uxn_opcodes_h_l1720_c30_2829_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1720_c30_2829_x;
     sp_relative_shift_uxn_opcodes_h_l1720_c30_2829_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1720_c30_2829_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1720_c30_2829_return_output := sp_relative_shift_uxn_opcodes_h_l1720_c30_2829_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1715_l1718_l1712_DUPLICATE_aa87 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1715_l1718_l1712_DUPLICATE_aa87_return_output := result.is_ram_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1699_c2_082c] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1699_c2_082c_return_output := result.is_vram_write;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l1699_c2_082c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c6_2d16_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_082c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c6_2d16_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_082c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c6_2d16_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_082c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c6_2d16_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_082c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c6_2d16_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_082c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c6_2d16_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_082c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c6_2d16_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_082c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c6_2d16_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_082c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c6_2d16_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c2_082c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c6_2d16_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c2_082c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c6_2d16_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1699_c2_082c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c6_2d16_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1712_c7_000d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1712_c11_077f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_000d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1712_c11_077f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_000d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1712_c11_077f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_000d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1712_c11_077f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_000d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1712_c11_077f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1712_c7_000d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1712_c11_077f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1712_c7_000d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1712_c11_077f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1712_c7_000d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1712_c11_077f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1715_c7_a41e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1715_c11_46c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_a41e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1715_c11_46c4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_a41e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1715_c11_46c4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_a41e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1715_c11_46c4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1715_c7_a41e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1715_c11_46c4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1715_c7_a41e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1715_c11_46c4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1715_c7_a41e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1715_c11_46c4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1718_c7_ddb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c11_d67d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_ddb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c11_d67d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_ddb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c11_d67d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_ddb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c11_d67d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c7_ddb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c11_d67d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c7_ddb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c11_d67d_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1722_c22_a94b_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1722_c27_8bfb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_000d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1715_l1718_l1712_DUPLICATE_12cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_a41e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1715_l1718_l1712_DUPLICATE_12cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_ddb0_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1715_l1718_l1712_DUPLICATE_12cb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1715_l1699_l1718_l1712_DUPLICATE_c6b0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1712_c7_000d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1715_l1699_l1718_l1712_DUPLICATE_c6b0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1715_c7_a41e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1715_l1699_l1718_l1712_DUPLICATE_c6b0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c7_ddb0_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1715_l1699_l1718_l1712_DUPLICATE_c6b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_000d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1715_l1718_l1712_DUPLICATE_6a0e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_a41e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1715_l1718_l1712_DUPLICATE_6a0e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_ddb0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1715_l1718_l1712_DUPLICATE_6a0e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_000d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1715_l1718_l1712_DUPLICATE_aa87_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_a41e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1715_l1718_l1712_DUPLICATE_aa87_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_ddb0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1715_l1718_l1712_DUPLICATE_aa87_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1715_l1699_l1718_l1712_DUPLICATE_1467_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1712_c7_000d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1715_l1699_l1718_l1712_DUPLICATE_1467_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1715_c7_a41e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1715_l1699_l1718_l1712_DUPLICATE_1467_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c7_ddb0_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1715_l1699_l1718_l1712_DUPLICATE_1467_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1699_c2_082c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1699_c2_082c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1699_c2_082c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1699_c2_082c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_000d_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1712_c7_000d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_ddb0_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1720_c30_2829_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l1699_c2_082c] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_082c_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_082c_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_082c_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_082c_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1699_c2_082c] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_082c_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_082c_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_082c_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_082c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1712_c7_000d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_000d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_000d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_000d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_000d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_000d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_000d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_000d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_000d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1718_c7_ddb0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_ddb0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_ddb0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_ddb0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_ddb0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_ddb0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_ddb0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_ddb0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_ddb0_return_output;

     -- n8_MUX[uxn_opcodes_h_l1718_c7_ddb0] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1718_c7_ddb0_cond <= VAR_n8_MUX_uxn_opcodes_h_l1718_c7_ddb0_cond;
     n8_MUX_uxn_opcodes_h_l1718_c7_ddb0_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1718_c7_ddb0_iftrue;
     n8_MUX_uxn_opcodes_h_l1718_c7_ddb0_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1718_c7_ddb0_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1718_c7_ddb0_return_output := n8_MUX_uxn_opcodes_h_l1718_c7_ddb0_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1699_c2_082c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_082c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_082c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_082c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_082c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1718_c7_ddb0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1718_c7_ddb0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c7_ddb0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1718_c7_ddb0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c7_ddb0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1718_c7_ddb0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c7_ddb0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c7_ddb0_return_output := result_u8_value_MUX_uxn_opcodes_h_l1718_c7_ddb0_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1718_c7_ddb0] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_ddb0_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_ddb0_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_ddb0_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_ddb0_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_ddb0_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_ddb0_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_ddb0_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_ddb0_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1722_c22_a94b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1722_c22_a94b_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1722_c22_a94b_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1722_c22_a94b_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1722_c22_a94b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1722_c22_a94b_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1722_c22_a94b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1699_c2_082c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_082c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_082c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_082c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_082c_return_output;

     -- t8_MUX[uxn_opcodes_h_l1715_c7_a41e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1715_c7_a41e_cond <= VAR_t8_MUX_uxn_opcodes_h_l1715_c7_a41e_cond;
     t8_MUX_uxn_opcodes_h_l1715_c7_a41e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1715_c7_a41e_iftrue;
     t8_MUX_uxn_opcodes_h_l1715_c7_a41e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1715_c7_a41e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1715_c7_a41e_return_output := t8_MUX_uxn_opcodes_h_l1715_c7_a41e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1718_c7_ddb0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_ddb0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_ddb0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_ddb0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_ddb0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_ddb0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_ddb0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_ddb0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_ddb0_return_output;

     -- Submodule level 2
     VAR_result_u16_value_uxn_opcodes_h_l1722_c3_45d8 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1722_c22_a94b_return_output)),16);
     VAR_n8_MUX_uxn_opcodes_h_l1715_c7_a41e_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1718_c7_ddb0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_a41e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_ddb0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_a41e_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_ddb0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_a41e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_ddb0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_000d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1715_c7_a41e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c7_ddb0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1712_c7_000d_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1715_c7_a41e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c7_ddb0_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1722_c3_45d8;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1699_c2_082c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_082c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_082c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_082c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_082c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1715_c7_a41e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_a41e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_a41e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_a41e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_a41e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_a41e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_a41e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_a41e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_a41e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1715_c7_a41e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_a41e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_a41e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_a41e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_a41e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_a41e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_a41e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_a41e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_a41e_return_output;

     -- n8_MUX[uxn_opcodes_h_l1715_c7_a41e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1715_c7_a41e_cond <= VAR_n8_MUX_uxn_opcodes_h_l1715_c7_a41e_cond;
     n8_MUX_uxn_opcodes_h_l1715_c7_a41e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1715_c7_a41e_iftrue;
     n8_MUX_uxn_opcodes_h_l1715_c7_a41e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1715_c7_a41e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1715_c7_a41e_return_output := n8_MUX_uxn_opcodes_h_l1715_c7_a41e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1715_c7_a41e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1715_c7_a41e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1715_c7_a41e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1715_c7_a41e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1715_c7_a41e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1715_c7_a41e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1715_c7_a41e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1715_c7_a41e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1715_c7_a41e_return_output;

     -- t8_MUX[uxn_opcodes_h_l1712_c7_000d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1712_c7_000d_cond <= VAR_t8_MUX_uxn_opcodes_h_l1712_c7_000d_cond;
     t8_MUX_uxn_opcodes_h_l1712_c7_000d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1712_c7_000d_iftrue;
     t8_MUX_uxn_opcodes_h_l1712_c7_000d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1712_c7_000d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1712_c7_000d_return_output := t8_MUX_uxn_opcodes_h_l1712_c7_000d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1718_c7_ddb0] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1718_c7_ddb0_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c7_ddb0_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1718_c7_ddb0_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c7_ddb0_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1718_c7_ddb0_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c7_ddb0_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c7_ddb0_return_output := result_u16_value_MUX_uxn_opcodes_h_l1718_c7_ddb0_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1715_c7_a41e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_a41e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_a41e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_a41e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_a41e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_a41e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_a41e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_a41e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_a41e_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l1712_c7_000d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1715_c7_a41e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_000d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_a41e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_000d_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_a41e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_000d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_a41e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1715_c7_a41e_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c7_ddb0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1712_c7_000d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1715_c7_a41e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1712_c7_000d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1712_c7_000d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1712_c7_000d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1712_c7_000d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1712_c7_000d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1712_c7_000d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1712_c7_000d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1712_c7_000d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1712_c7_000d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1712_c7_000d_return_output;

     -- n8_MUX[uxn_opcodes_h_l1712_c7_000d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1712_c7_000d_cond <= VAR_n8_MUX_uxn_opcodes_h_l1712_c7_000d_cond;
     n8_MUX_uxn_opcodes_h_l1712_c7_000d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1712_c7_000d_iftrue;
     n8_MUX_uxn_opcodes_h_l1712_c7_000d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1712_c7_000d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1712_c7_000d_return_output := n8_MUX_uxn_opcodes_h_l1712_c7_000d_return_output;

     -- t8_MUX[uxn_opcodes_h_l1699_c2_082c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1699_c2_082c_cond <= VAR_t8_MUX_uxn_opcodes_h_l1699_c2_082c_cond;
     t8_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue;
     t8_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1699_c2_082c_return_output := t8_MUX_uxn_opcodes_h_l1699_c2_082c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1712_c7_000d] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_000d_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_000d_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_000d_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_000d_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_000d_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_000d_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_000d_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_000d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1712_c7_000d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_000d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_000d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_000d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_000d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_000d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_000d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_000d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_000d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1712_c7_000d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_000d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_000d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_000d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_000d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_000d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_000d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_000d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_000d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1715_c7_a41e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1715_c7_a41e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1715_c7_a41e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1715_c7_a41e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1715_c7_a41e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1715_c7_a41e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1715_c7_a41e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1715_c7_a41e_return_output := result_u16_value_MUX_uxn_opcodes_h_l1715_c7_a41e_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1712_c7_000d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_000d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_000d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_000d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1712_c7_000d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1715_c7_a41e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1712_c7_000d_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1699_c2_082c_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1699_c2_082c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_082c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_082c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_082c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_082c_return_output;

     -- n8_MUX[uxn_opcodes_h_l1699_c2_082c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1699_c2_082c_cond <= VAR_n8_MUX_uxn_opcodes_h_l1699_c2_082c_cond;
     n8_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue;
     n8_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1699_c2_082c_return_output := n8_MUX_uxn_opcodes_h_l1699_c2_082c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1712_c7_000d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1712_c7_000d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1712_c7_000d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1712_c7_000d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1712_c7_000d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1712_c7_000d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1712_c7_000d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1712_c7_000d_return_output := result_u16_value_MUX_uxn_opcodes_h_l1712_c7_000d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1699_c2_082c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_082c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_082c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_082c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_082c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1699_c2_082c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_082c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_082c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_082c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_082c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1699_c2_082c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1699_c2_082c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c2_082c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c2_082c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1699_c2_082c_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1699_c2_082c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1712_c7_000d_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1699_c2_082c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1699_c2_082c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c2_082c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c2_082c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c2_082c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c2_082c_return_output := result_u16_value_MUX_uxn_opcodes_h_l1699_c2_082c_return_output;

     -- Submodule level 6
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_42c1_uxn_opcodes_h_l1727_l1695_DUPLICATE_61b9 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_42c1_uxn_opcodes_h_l1727_l1695_DUPLICATE_61b9_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_42c1(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_082c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_082c_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_082c_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_082c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_082c_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_082c_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_082c_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c2_082c_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c2_082c_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_082c_return_output);

     -- Submodule level 7
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_42c1_uxn_opcodes_h_l1727_l1695_DUPLICATE_61b9_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_42c1_uxn_opcodes_h_l1727_l1695_DUPLICATE_61b9_return_output;
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
