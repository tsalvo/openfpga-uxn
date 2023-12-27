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
-- Submodules: 40
entity stz_0CLK_bacf6a1d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end stz_0CLK_bacf6a1d;
architecture arch of stz_0CLK_bacf6a1d is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1521_c6_8299]
signal BIN_OP_EQ_uxn_opcodes_h_l1521_c6_8299_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1521_c6_8299_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1521_c6_8299_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1521_c2_91e8]
signal n8_MUX_uxn_opcodes_h_l1521_c2_91e8_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1521_c2_91e8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_91e8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1521_c2_91e8]
signal result_u8_value_MUX_uxn_opcodes_h_l1521_c2_91e8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1521_c2_91e8]
signal result_u16_value_MUX_uxn_opcodes_h_l1521_c2_91e8_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1521_c2_91e8]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_91e8_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1521_c2_91e8]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_91e8_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1521_c2_91e8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_91e8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1521_c2_91e8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_91e8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1521_c2_91e8]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_91e8_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1521_c2_91e8]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_91e8_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1521_c2_91e8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_91e8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1521_c2_91e8]
signal t8_MUX_uxn_opcodes_h_l1521_c2_91e8_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1534_c11_0f97]
signal BIN_OP_EQ_uxn_opcodes_h_l1534_c11_0f97_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1534_c11_0f97_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1534_c11_0f97_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1534_c7_08c2]
signal n8_MUX_uxn_opcodes_h_l1534_c7_08c2_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1534_c7_08c2_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1534_c7_08c2_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1534_c7_08c2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_08c2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_08c2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_08c2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1534_c7_08c2]
signal result_u8_value_MUX_uxn_opcodes_h_l1534_c7_08c2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1534_c7_08c2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1534_c7_08c2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1534_c7_08c2]
signal result_u16_value_MUX_uxn_opcodes_h_l1534_c7_08c2_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1534_c7_08c2_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1534_c7_08c2_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1534_c7_08c2]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_08c2_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_08c2_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_08c2_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1534_c7_08c2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_08c2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_08c2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_08c2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1534_c7_08c2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_08c2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_08c2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_08c2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1534_c7_08c2]
signal t8_MUX_uxn_opcodes_h_l1534_c7_08c2_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1534_c7_08c2_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1534_c7_08c2_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1537_c11_9f8a]
signal BIN_OP_EQ_uxn_opcodes_h_l1537_c11_9f8a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1537_c11_9f8a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1537_c11_9f8a_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1537_c7_0435]
signal n8_MUX_uxn_opcodes_h_l1537_c7_0435_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1537_c7_0435_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1537_c7_0435_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1537_c7_0435_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1537_c7_0435]
signal result_u8_value_MUX_uxn_opcodes_h_l1537_c7_0435_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1537_c7_0435_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1537_c7_0435_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1537_c7_0435_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1537_c7_0435]
signal result_u16_value_MUX_uxn_opcodes_h_l1537_c7_0435_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1537_c7_0435_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1537_c7_0435_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1537_c7_0435_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1537_c7_0435]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_0435_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_0435_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_0435_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_0435_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1537_c7_0435]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_0435_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_0435_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_0435_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_0435_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1537_c7_0435]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_0435_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_0435_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_0435_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_0435_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1537_c7_0435]
signal t8_MUX_uxn_opcodes_h_l1537_c7_0435_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1537_c7_0435_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1537_c7_0435_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1537_c7_0435_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1540_c11_2675]
signal BIN_OP_EQ_uxn_opcodes_h_l1540_c11_2675_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1540_c11_2675_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1540_c11_2675_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1540_c7_5cbe]
signal n8_MUX_uxn_opcodes_h_l1540_c7_5cbe_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1540_c7_5cbe_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1540_c7_5cbe_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1540_c7_5cbe_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1540_c7_5cbe]
signal result_u8_value_MUX_uxn_opcodes_h_l1540_c7_5cbe_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1540_c7_5cbe_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1540_c7_5cbe_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1540_c7_5cbe_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1540_c7_5cbe]
signal result_u16_value_MUX_uxn_opcodes_h_l1540_c7_5cbe_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1540_c7_5cbe_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1540_c7_5cbe_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1540_c7_5cbe_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1540_c7_5cbe]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_5cbe_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_5cbe_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_5cbe_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_5cbe_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1540_c7_5cbe]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_5cbe_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_5cbe_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_5cbe_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_5cbe_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1540_c7_5cbe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_5cbe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_5cbe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_5cbe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_5cbe_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1542_c30_c469]
signal sp_relative_shift_uxn_opcodes_h_l1542_c30_c469_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1542_c30_c469_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1542_c30_c469_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1542_c30_c469_return_output : signed(3 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_e393( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_ram_write := ref_toks_4;
      base.is_stack_index_flipped := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_vram_write := ref_toks_8;
      base.is_pc_updated := ref_toks_9;
      base.is_opc_done := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1521_c6_8299
BIN_OP_EQ_uxn_opcodes_h_l1521_c6_8299 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1521_c6_8299_left,
BIN_OP_EQ_uxn_opcodes_h_l1521_c6_8299_right,
BIN_OP_EQ_uxn_opcodes_h_l1521_c6_8299_return_output);

-- n8_MUX_uxn_opcodes_h_l1521_c2_91e8
n8_MUX_uxn_opcodes_h_l1521_c2_91e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1521_c2_91e8_cond,
n8_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue,
n8_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse,
n8_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_91e8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_91e8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_91e8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1521_c2_91e8
result_u8_value_MUX_uxn_opcodes_h_l1521_c2_91e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1521_c2_91e8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1521_c2_91e8
result_u16_value_MUX_uxn_opcodes_h_l1521_c2_91e8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1521_c2_91e8_cond,
result_u16_value_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_91e8
result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_91e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_91e8_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_91e8
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_91e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_91e8_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_91e8
result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_91e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_91e8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_91e8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_91e8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_91e8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_91e8
result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_91e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_91e8_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_91e8
result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_91e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_91e8_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_91e8
result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_91e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_91e8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output);

-- t8_MUX_uxn_opcodes_h_l1521_c2_91e8
t8_MUX_uxn_opcodes_h_l1521_c2_91e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1521_c2_91e8_cond,
t8_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue,
t8_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse,
t8_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1534_c11_0f97
BIN_OP_EQ_uxn_opcodes_h_l1534_c11_0f97 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1534_c11_0f97_left,
BIN_OP_EQ_uxn_opcodes_h_l1534_c11_0f97_right,
BIN_OP_EQ_uxn_opcodes_h_l1534_c11_0f97_return_output);

-- n8_MUX_uxn_opcodes_h_l1534_c7_08c2
n8_MUX_uxn_opcodes_h_l1534_c7_08c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1534_c7_08c2_cond,
n8_MUX_uxn_opcodes_h_l1534_c7_08c2_iftrue,
n8_MUX_uxn_opcodes_h_l1534_c7_08c2_iffalse,
n8_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_08c2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_08c2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_08c2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_08c2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_08c2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1534_c7_08c2
result_u8_value_MUX_uxn_opcodes_h_l1534_c7_08c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1534_c7_08c2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1534_c7_08c2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1534_c7_08c2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1534_c7_08c2
result_u16_value_MUX_uxn_opcodes_h_l1534_c7_08c2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1534_c7_08c2_cond,
result_u16_value_MUX_uxn_opcodes_h_l1534_c7_08c2_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1534_c7_08c2_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_08c2
result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_08c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_08c2_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_08c2_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_08c2_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_08c2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_08c2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_08c2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_08c2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_08c2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_08c2
result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_08c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_08c2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_08c2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_08c2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output);

-- t8_MUX_uxn_opcodes_h_l1534_c7_08c2
t8_MUX_uxn_opcodes_h_l1534_c7_08c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1534_c7_08c2_cond,
t8_MUX_uxn_opcodes_h_l1534_c7_08c2_iftrue,
t8_MUX_uxn_opcodes_h_l1534_c7_08c2_iffalse,
t8_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1537_c11_9f8a
BIN_OP_EQ_uxn_opcodes_h_l1537_c11_9f8a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1537_c11_9f8a_left,
BIN_OP_EQ_uxn_opcodes_h_l1537_c11_9f8a_right,
BIN_OP_EQ_uxn_opcodes_h_l1537_c11_9f8a_return_output);

-- n8_MUX_uxn_opcodes_h_l1537_c7_0435
n8_MUX_uxn_opcodes_h_l1537_c7_0435 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1537_c7_0435_cond,
n8_MUX_uxn_opcodes_h_l1537_c7_0435_iftrue,
n8_MUX_uxn_opcodes_h_l1537_c7_0435_iffalse,
n8_MUX_uxn_opcodes_h_l1537_c7_0435_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1537_c7_0435
result_u8_value_MUX_uxn_opcodes_h_l1537_c7_0435 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1537_c7_0435_cond,
result_u8_value_MUX_uxn_opcodes_h_l1537_c7_0435_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1537_c7_0435_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1537_c7_0435_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1537_c7_0435
result_u16_value_MUX_uxn_opcodes_h_l1537_c7_0435 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1537_c7_0435_cond,
result_u16_value_MUX_uxn_opcodes_h_l1537_c7_0435_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1537_c7_0435_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1537_c7_0435_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_0435
result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_0435 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_0435_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_0435_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_0435_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_0435_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_0435
result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_0435 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_0435_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_0435_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_0435_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_0435_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_0435
result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_0435 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_0435_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_0435_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_0435_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_0435_return_output);

-- t8_MUX_uxn_opcodes_h_l1537_c7_0435
t8_MUX_uxn_opcodes_h_l1537_c7_0435 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1537_c7_0435_cond,
t8_MUX_uxn_opcodes_h_l1537_c7_0435_iftrue,
t8_MUX_uxn_opcodes_h_l1537_c7_0435_iffalse,
t8_MUX_uxn_opcodes_h_l1537_c7_0435_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1540_c11_2675
BIN_OP_EQ_uxn_opcodes_h_l1540_c11_2675 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1540_c11_2675_left,
BIN_OP_EQ_uxn_opcodes_h_l1540_c11_2675_right,
BIN_OP_EQ_uxn_opcodes_h_l1540_c11_2675_return_output);

-- n8_MUX_uxn_opcodes_h_l1540_c7_5cbe
n8_MUX_uxn_opcodes_h_l1540_c7_5cbe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1540_c7_5cbe_cond,
n8_MUX_uxn_opcodes_h_l1540_c7_5cbe_iftrue,
n8_MUX_uxn_opcodes_h_l1540_c7_5cbe_iffalse,
n8_MUX_uxn_opcodes_h_l1540_c7_5cbe_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1540_c7_5cbe
result_u8_value_MUX_uxn_opcodes_h_l1540_c7_5cbe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1540_c7_5cbe_cond,
result_u8_value_MUX_uxn_opcodes_h_l1540_c7_5cbe_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1540_c7_5cbe_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1540_c7_5cbe_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1540_c7_5cbe
result_u16_value_MUX_uxn_opcodes_h_l1540_c7_5cbe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1540_c7_5cbe_cond,
result_u16_value_MUX_uxn_opcodes_h_l1540_c7_5cbe_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1540_c7_5cbe_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1540_c7_5cbe_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_5cbe
result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_5cbe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_5cbe_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_5cbe_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_5cbe_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_5cbe_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_5cbe
result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_5cbe : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_5cbe_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_5cbe_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_5cbe_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_5cbe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_5cbe
result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_5cbe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_5cbe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_5cbe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_5cbe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_5cbe_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1542_c30_c469
sp_relative_shift_uxn_opcodes_h_l1542_c30_c469 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1542_c30_c469_ins,
sp_relative_shift_uxn_opcodes_h_l1542_c30_c469_x,
sp_relative_shift_uxn_opcodes_h_l1542_c30_c469_y,
sp_relative_shift_uxn_opcodes_h_l1542_c30_c469_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1521_c6_8299_return_output,
 n8_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output,
 t8_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1534_c11_0f97_return_output,
 n8_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output,
 t8_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1537_c11_9f8a_return_output,
 n8_MUX_uxn_opcodes_h_l1537_c7_0435_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1537_c7_0435_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1537_c7_0435_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_0435_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_0435_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_0435_return_output,
 t8_MUX_uxn_opcodes_h_l1537_c7_0435_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1540_c11_2675_return_output,
 n8_MUX_uxn_opcodes_h_l1540_c7_5cbe_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1540_c7_5cbe_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1540_c7_5cbe_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_5cbe_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_5cbe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_5cbe_return_output,
 sp_relative_shift_uxn_opcodes_h_l1542_c30_c469_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_8299_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_8299_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_8299_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1521_c2_91e8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1531_c3_b802 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_91e8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1521_c2_91e8_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1521_c2_91e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_91e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1521_c2_91e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_91e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1521_c2_91e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_91e8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1526_c3_ec94 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_91e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1521_c2_91e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_91e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1521_c2_91e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_91e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_91e8_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1521_c2_91e8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c11_0f97_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c11_0f97_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c11_0f97_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1534_c7_08c2_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1534_c7_08c2_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1537_c7_0435_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1534_c7_08c2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_08c2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1535_c3_de2f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_08c2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1534_c7_08c2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_08c2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1534_c7_08c2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1534_c7_08c2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1537_c7_0435_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1534_c7_08c2_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1534_c7_08c2_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1534_c7_08c2_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1537_c7_0435_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1534_c7_08c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_08c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_08c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_0435_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_08c2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_08c2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_08c2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_0435_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_08c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_08c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_08c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_0435_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_08c2_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1534_c7_08c2_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1534_c7_08c2_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1537_c7_0435_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1534_c7_08c2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_9f8a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_9f8a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_9f8a_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1537_c7_0435_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1537_c7_0435_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1540_c7_5cbe_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1537_c7_0435_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1537_c7_0435_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1537_c7_0435_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1540_c7_5cbe_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1537_c7_0435_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1537_c7_0435_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1537_c7_0435_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1540_c7_5cbe_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1537_c7_0435_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_0435_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_0435_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_5cbe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_0435_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_0435_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_0435_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_5cbe_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_0435_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_0435_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_0435_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_5cbe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_0435_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1537_c7_0435_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1537_c7_0435_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1537_c7_0435_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_2675_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_2675_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_2675_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1540_c7_5cbe_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1540_c7_5cbe_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1540_c7_5cbe_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1540_c7_5cbe_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1540_c7_5cbe_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1540_c7_5cbe_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1540_c7_5cbe_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1540_c7_5cbe_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1540_c7_5cbe_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_5cbe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_5cbe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_5cbe_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_5cbe_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_5cbe_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_5cbe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_5cbe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_5cbe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_5cbe_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1542_c30_c469_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1542_c30_c469_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1542_c30_c469_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1542_c30_c469_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1544_c22_3101_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1537_l1521_l1540_l1534_DUPLICATE_9dc6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1537_l1521_l1540_l1534_DUPLICATE_cdcb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1537_l1540_l1534_DUPLICATE_5f9c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1537_l1540_l1534_DUPLICATE_2486_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1537_l1540_l1534_DUPLICATE_1f7a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e393_uxn_opcodes_h_l1549_l1517_DUPLICATE_420c_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_9f8a_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_2675_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_5cbe_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1542_c30_c469_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_5cbe_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1535_c3_de2f := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_08c2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1535_c3_de2f;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1526_c3_ec94 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1526_c3_ec94;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_8299_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c11_0f97_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1531_c3_b802 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1531_c3_b802;
     VAR_sp_relative_shift_uxn_opcodes_h_l1542_c30_c469_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_previous_stack_read := previous_stack_read;

     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l1542_c30_c469_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1534_c7_08c2_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1537_c7_0435_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1540_c7_5cbe_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_8299_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c11_0f97_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_9f8a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_2675_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1540_c7_5cbe_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1540_c7_5cbe_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1537_c7_0435_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1534_c7_08c2_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1537_c7_0435_iffalse := t8;
     -- sp_relative_shift[uxn_opcodes_h_l1542_c30_c469] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1542_c30_c469_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1542_c30_c469_ins;
     sp_relative_shift_uxn_opcodes_h_l1542_c30_c469_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1542_c30_c469_x;
     sp_relative_shift_uxn_opcodes_h_l1542_c30_c469_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1542_c30_c469_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1542_c30_c469_return_output := sp_relative_shift_uxn_opcodes_h_l1542_c30_c469_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1540_c11_2675] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1540_c11_2675_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_2675_left;
     BIN_OP_EQ_uxn_opcodes_h_l1540_c11_2675_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_2675_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_2675_return_output := BIN_OP_EQ_uxn_opcodes_h_l1540_c11_2675_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1534_c11_0f97] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1534_c11_0f97_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c11_0f97_left;
     BIN_OP_EQ_uxn_opcodes_h_l1534_c11_0f97_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c11_0f97_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c11_0f97_return_output := BIN_OP_EQ_uxn_opcodes_h_l1534_c11_0f97_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1537_l1540_l1534_DUPLICATE_5f9c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1537_l1540_l1534_DUPLICATE_5f9c_return_output := result.is_ram_write;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1534_c7_08c2] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1534_c7_08c2_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1537_l1521_l1540_l1534_DUPLICATE_cdcb LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1537_l1521_l1540_l1534_DUPLICATE_cdcb_return_output := result.u16_value;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l1521_c2_91e8] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1521_c2_91e8_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1537_l1521_l1540_l1534_DUPLICATE_9dc6 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1537_l1521_l1540_l1534_DUPLICATE_9dc6_return_output := result.u8_value;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1544_c22_3101] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1544_c22_3101_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1537_l1540_l1534_DUPLICATE_1f7a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1537_l1540_l1534_DUPLICATE_1f7a_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1521_c6_8299] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1521_c6_8299_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_8299_left;
     BIN_OP_EQ_uxn_opcodes_h_l1521_c6_8299_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_8299_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_8299_return_output := BIN_OP_EQ_uxn_opcodes_h_l1521_c6_8299_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1521_c2_91e8] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1521_c2_91e8_return_output := result.is_vram_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1521_c2_91e8] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1521_c2_91e8_return_output := result.is_pc_updated;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1521_c2_91e8] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1521_c2_91e8_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1537_l1540_l1534_DUPLICATE_2486 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1537_l1540_l1534_DUPLICATE_2486_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1537_c11_9f8a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1537_c11_9f8a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_9f8a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1537_c11_9f8a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_9f8a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_9f8a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1537_c11_9f8a_return_output;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l1521_c2_91e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_8299_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_91e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_8299_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_91e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_8299_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_91e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_8299_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_91e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_8299_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_91e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_8299_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_91e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_8299_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_91e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_8299_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_91e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_8299_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1521_c2_91e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_8299_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1521_c2_91e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_8299_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1521_c2_91e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_8299_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1534_c7_08c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c11_0f97_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_08c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c11_0f97_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_08c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c11_0f97_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_08c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c11_0f97_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_08c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c11_0f97_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1534_c7_08c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c11_0f97_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1534_c7_08c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c11_0f97_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1534_c7_08c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c11_0f97_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1537_c7_0435_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_9f8a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_0435_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_9f8a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_0435_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_9f8a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_0435_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_9f8a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1537_c7_0435_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_9f8a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1537_c7_0435_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_9f8a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1537_c7_0435_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_9f8a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1540_c7_5cbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_2675_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_5cbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_2675_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_5cbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_2675_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_5cbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_2675_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1540_c7_5cbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_2675_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1540_c7_5cbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_2675_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1540_c7_5cbe_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1544_c22_3101_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_08c2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1537_l1540_l1534_DUPLICATE_2486_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_0435_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1537_l1540_l1534_DUPLICATE_2486_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_5cbe_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1537_l1540_l1534_DUPLICATE_2486_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1537_l1521_l1540_l1534_DUPLICATE_cdcb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1534_c7_08c2_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1537_l1521_l1540_l1534_DUPLICATE_cdcb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1537_c7_0435_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1537_l1521_l1540_l1534_DUPLICATE_cdcb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1540_c7_5cbe_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1537_l1521_l1540_l1534_DUPLICATE_cdcb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_08c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1537_l1540_l1534_DUPLICATE_1f7a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_0435_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1537_l1540_l1534_DUPLICATE_1f7a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_5cbe_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1537_l1540_l1534_DUPLICATE_1f7a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_08c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1537_l1540_l1534_DUPLICATE_5f9c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_0435_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1537_l1540_l1534_DUPLICATE_5f9c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_5cbe_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1537_l1540_l1534_DUPLICATE_5f9c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1537_l1521_l1540_l1534_DUPLICATE_9dc6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1534_c7_08c2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1537_l1521_l1540_l1534_DUPLICATE_9dc6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1537_c7_0435_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1537_l1521_l1540_l1534_DUPLICATE_9dc6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1540_c7_5cbe_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1537_l1521_l1540_l1534_DUPLICATE_9dc6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1521_c2_91e8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1521_c2_91e8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1521_c2_91e8_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1521_c2_91e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_08c2_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1534_c7_08c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_5cbe_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1542_c30_c469_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1521_c2_91e8] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_91e8_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_91e8_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1521_c2_91e8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_91e8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_91e8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1521_c2_91e8] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_91e8_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_91e8_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1540_c7_5cbe] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1540_c7_5cbe_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1540_c7_5cbe_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1540_c7_5cbe_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1540_c7_5cbe_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1540_c7_5cbe_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1540_c7_5cbe_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1540_c7_5cbe_return_output := result_u8_value_MUX_uxn_opcodes_h_l1540_c7_5cbe_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1540_c7_5cbe] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1540_c7_5cbe_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1540_c7_5cbe_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1540_c7_5cbe_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1540_c7_5cbe_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1540_c7_5cbe_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1540_c7_5cbe_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1540_c7_5cbe_return_output := result_u16_value_MUX_uxn_opcodes_h_l1540_c7_5cbe_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1540_c7_5cbe] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_5cbe_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_5cbe_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_5cbe_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_5cbe_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_5cbe_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_5cbe_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_5cbe_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_5cbe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1540_c7_5cbe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_5cbe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_5cbe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_5cbe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_5cbe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_5cbe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_5cbe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_5cbe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_5cbe_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1534_c7_08c2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_08c2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_08c2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_08c2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_08c2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_08c2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_08c2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output;

     -- n8_MUX[uxn_opcodes_h_l1540_c7_5cbe] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1540_c7_5cbe_cond <= VAR_n8_MUX_uxn_opcodes_h_l1540_c7_5cbe_cond;
     n8_MUX_uxn_opcodes_h_l1540_c7_5cbe_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1540_c7_5cbe_iftrue;
     n8_MUX_uxn_opcodes_h_l1540_c7_5cbe_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1540_c7_5cbe_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1540_c7_5cbe_return_output := n8_MUX_uxn_opcodes_h_l1540_c7_5cbe_return_output;

     -- t8_MUX[uxn_opcodes_h_l1537_c7_0435] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1537_c7_0435_cond <= VAR_t8_MUX_uxn_opcodes_h_l1537_c7_0435_cond;
     t8_MUX_uxn_opcodes_h_l1537_c7_0435_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1537_c7_0435_iftrue;
     t8_MUX_uxn_opcodes_h_l1537_c7_0435_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1537_c7_0435_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1537_c7_0435_return_output := t8_MUX_uxn_opcodes_h_l1537_c7_0435_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1521_c2_91e8] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_91e8_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_91e8_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1540_c7_5cbe] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_5cbe_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_5cbe_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_5cbe_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_5cbe_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_5cbe_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_5cbe_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_5cbe_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_5cbe_return_output;

     -- Submodule level 2
     VAR_n8_MUX_uxn_opcodes_h_l1537_c7_0435_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1540_c7_5cbe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_0435_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_5cbe_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_0435_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_5cbe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_0435_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_5cbe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1537_c7_0435_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1540_c7_5cbe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1537_c7_0435_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1540_c7_5cbe_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1534_c7_08c2_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1537_c7_0435_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1537_c7_0435] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1537_c7_0435_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1537_c7_0435_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1537_c7_0435_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1537_c7_0435_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1537_c7_0435_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1537_c7_0435_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1537_c7_0435_return_output := result_u8_value_MUX_uxn_opcodes_h_l1537_c7_0435_return_output;

     -- t8_MUX[uxn_opcodes_h_l1534_c7_08c2] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1534_c7_08c2_cond <= VAR_t8_MUX_uxn_opcodes_h_l1534_c7_08c2_cond;
     t8_MUX_uxn_opcodes_h_l1534_c7_08c2_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1534_c7_08c2_iftrue;
     t8_MUX_uxn_opcodes_h_l1534_c7_08c2_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1534_c7_08c2_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output := t8_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1537_c7_0435] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_0435_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_0435_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_0435_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_0435_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_0435_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_0435_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_0435_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_0435_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1537_c7_0435] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_0435_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_0435_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_0435_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_0435_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_0435_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_0435_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_0435_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_0435_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1521_c2_91e8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_91e8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_91e8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1537_c7_0435] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_0435_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_0435_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_0435_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_0435_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_0435_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_0435_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_0435_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_0435_return_output;

     -- n8_MUX[uxn_opcodes_h_l1537_c7_0435] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1537_c7_0435_cond <= VAR_n8_MUX_uxn_opcodes_h_l1537_c7_0435_cond;
     n8_MUX_uxn_opcodes_h_l1537_c7_0435_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1537_c7_0435_iftrue;
     n8_MUX_uxn_opcodes_h_l1537_c7_0435_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1537_c7_0435_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1537_c7_0435_return_output := n8_MUX_uxn_opcodes_h_l1537_c7_0435_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1537_c7_0435] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1537_c7_0435_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1537_c7_0435_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1537_c7_0435_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1537_c7_0435_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1537_c7_0435_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1537_c7_0435_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1537_c7_0435_return_output := result_u16_value_MUX_uxn_opcodes_h_l1537_c7_0435_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l1534_c7_08c2_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1537_c7_0435_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_08c2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_0435_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_08c2_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_0435_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_08c2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_0435_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1534_c7_08c2_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1537_c7_0435_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1534_c7_08c2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1537_c7_0435_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1534_c7_08c2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_08c2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_08c2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_08c2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_08c2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_08c2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_08c2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1534_c7_08c2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1534_c7_08c2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1534_c7_08c2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1534_c7_08c2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1534_c7_08c2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1534_c7_08c2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1534_c7_08c2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output;

     -- n8_MUX[uxn_opcodes_h_l1534_c7_08c2] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1534_c7_08c2_cond <= VAR_n8_MUX_uxn_opcodes_h_l1534_c7_08c2_cond;
     n8_MUX_uxn_opcodes_h_l1534_c7_08c2_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1534_c7_08c2_iftrue;
     n8_MUX_uxn_opcodes_h_l1534_c7_08c2_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1534_c7_08c2_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output := n8_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1534_c7_08c2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_08c2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_08c2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_08c2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_08c2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_08c2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_08c2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output;

     -- t8_MUX[uxn_opcodes_h_l1521_c2_91e8] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1521_c2_91e8_cond <= VAR_t8_MUX_uxn_opcodes_h_l1521_c2_91e8_cond;
     t8_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue;
     t8_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output := t8_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1534_c7_08c2] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1534_c7_08c2_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1534_c7_08c2_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1534_c7_08c2_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1534_c7_08c2_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1534_c7_08c2_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1534_c7_08c2_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output := result_u16_value_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1534_c7_08c2] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_08c2_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_08c2_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_08c2_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_08c2_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_08c2_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_08c2_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1534_c7_08c2_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1521_c2_91e8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_91e8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_91e8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1521_c2_91e8] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_91e8_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_91e8_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1521_c2_91e8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1521_c2_91e8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1521_c2_91e8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1521_c2_91e8] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1521_c2_91e8_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1521_c2_91e8_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output := result_u16_value_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1521_c2_91e8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_91e8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_91e8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output;

     -- n8_MUX[uxn_opcodes_h_l1521_c2_91e8] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1521_c2_91e8_cond <= VAR_n8_MUX_uxn_opcodes_h_l1521_c2_91e8_cond;
     n8_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1521_c2_91e8_iftrue;
     n8_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1521_c2_91e8_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output := n8_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e393_uxn_opcodes_h_l1549_l1517_DUPLICATE_420c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e393_uxn_opcodes_h_l1549_l1517_DUPLICATE_420c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e393(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_91e8_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e393_uxn_opcodes_h_l1549_l1517_DUPLICATE_420c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e393_uxn_opcodes_h_l1549_l1517_DUPLICATE_420c_return_output;
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
