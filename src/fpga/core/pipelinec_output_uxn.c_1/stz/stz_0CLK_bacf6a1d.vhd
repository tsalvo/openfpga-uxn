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
-- BIN_OP_EQ[uxn_opcodes_h_l1521_c6_1508]
signal BIN_OP_EQ_uxn_opcodes_h_l1521_c6_1508_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1521_c6_1508_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1521_c6_1508_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1521_c2_48b4]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_48b4_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1521_c2_48b4]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_48b4_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1521_c2_48b4]
signal result_u8_value_MUX_uxn_opcodes_h_l1521_c2_48b4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1521_c2_48b4]
signal result_u16_value_MUX_uxn_opcodes_h_l1521_c2_48b4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1521_c2_48b4]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_48b4_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1521_c2_48b4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_48b4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1521_c2_48b4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_48b4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1521_c2_48b4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_48b4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1521_c2_48b4]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_48b4_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1521_c2_48b4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_48b4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1521_c2_48b4]
signal n8_MUX_uxn_opcodes_h_l1521_c2_48b4_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1521_c2_48b4]
signal t8_MUX_uxn_opcodes_h_l1521_c2_48b4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1534_c11_74a5]
signal BIN_OP_EQ_uxn_opcodes_h_l1534_c11_74a5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1534_c11_74a5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1534_c11_74a5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1534_c7_9de3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_9de3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_9de3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_9de3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1534_c7_9de3]
signal result_u8_value_MUX_uxn_opcodes_h_l1534_c7_9de3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1534_c7_9de3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1534_c7_9de3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1534_c7_9de3]
signal result_u16_value_MUX_uxn_opcodes_h_l1534_c7_9de3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1534_c7_9de3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1534_c7_9de3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1534_c7_9de3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_9de3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_9de3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_9de3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1534_c7_9de3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_9de3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_9de3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_9de3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1534_c7_9de3]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_9de3_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_9de3_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_9de3_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1534_c7_9de3]
signal n8_MUX_uxn_opcodes_h_l1534_c7_9de3_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1534_c7_9de3_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1534_c7_9de3_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1534_c7_9de3]
signal t8_MUX_uxn_opcodes_h_l1534_c7_9de3_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1534_c7_9de3_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1534_c7_9de3_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1537_c11_28d3]
signal BIN_OP_EQ_uxn_opcodes_h_l1537_c11_28d3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1537_c11_28d3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1537_c11_28d3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1537_c7_61dc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_61dc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_61dc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_61dc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_61dc_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1537_c7_61dc]
signal result_u8_value_MUX_uxn_opcodes_h_l1537_c7_61dc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1537_c7_61dc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1537_c7_61dc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1537_c7_61dc_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1537_c7_61dc]
signal result_u16_value_MUX_uxn_opcodes_h_l1537_c7_61dc_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1537_c7_61dc_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1537_c7_61dc_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1537_c7_61dc_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1537_c7_61dc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_61dc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_61dc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_61dc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_61dc_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1537_c7_61dc]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_61dc_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_61dc_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_61dc_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_61dc_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1537_c7_61dc]
signal n8_MUX_uxn_opcodes_h_l1537_c7_61dc_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1537_c7_61dc_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1537_c7_61dc_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1537_c7_61dc_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1537_c7_61dc]
signal t8_MUX_uxn_opcodes_h_l1537_c7_61dc_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1537_c7_61dc_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1537_c7_61dc_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1537_c7_61dc_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1540_c11_c2a4]
signal BIN_OP_EQ_uxn_opcodes_h_l1540_c11_c2a4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1540_c11_c2a4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1540_c11_c2a4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1540_c7_98af]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_98af_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_98af_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_98af_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_98af_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1540_c7_98af]
signal result_u8_value_MUX_uxn_opcodes_h_l1540_c7_98af_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1540_c7_98af_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1540_c7_98af_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1540_c7_98af_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1540_c7_98af]
signal result_u16_value_MUX_uxn_opcodes_h_l1540_c7_98af_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1540_c7_98af_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1540_c7_98af_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1540_c7_98af_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1540_c7_98af]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_98af_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_98af_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_98af_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_98af_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1540_c7_98af]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_98af_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_98af_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_98af_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_98af_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1540_c7_98af]
signal n8_MUX_uxn_opcodes_h_l1540_c7_98af_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1540_c7_98af_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1540_c7_98af_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1540_c7_98af_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1542_c30_a326]
signal sp_relative_shift_uxn_opcodes_h_l1542_c30_a326_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1542_c30_a326_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1542_c30_a326_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1542_c30_a326_return_output : signed(3 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_500b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_pc_updated := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.u16_value := ref_toks_4;
      base.is_ram_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_stack_write := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_stack_index_flipped := ref_toks_9;
      base.is_opc_done := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1521_c6_1508
BIN_OP_EQ_uxn_opcodes_h_l1521_c6_1508 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1521_c6_1508_left,
BIN_OP_EQ_uxn_opcodes_h_l1521_c6_1508_right,
BIN_OP_EQ_uxn_opcodes_h_l1521_c6_1508_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_48b4
result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_48b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_48b4_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_48b4
result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_48b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_48b4_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1521_c2_48b4
result_u8_value_MUX_uxn_opcodes_h_l1521_c2_48b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1521_c2_48b4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1521_c2_48b4
result_u16_value_MUX_uxn_opcodes_h_l1521_c2_48b4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1521_c2_48b4_cond,
result_u16_value_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_48b4
result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_48b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_48b4_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_48b4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_48b4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_48b4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_48b4
result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_48b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_48b4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_48b4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_48b4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_48b4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_48b4
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_48b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_48b4_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_48b4
result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_48b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_48b4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output);

-- n8_MUX_uxn_opcodes_h_l1521_c2_48b4
n8_MUX_uxn_opcodes_h_l1521_c2_48b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1521_c2_48b4_cond,
n8_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue,
n8_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse,
n8_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output);

-- t8_MUX_uxn_opcodes_h_l1521_c2_48b4
t8_MUX_uxn_opcodes_h_l1521_c2_48b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1521_c2_48b4_cond,
t8_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue,
t8_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse,
t8_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1534_c11_74a5
BIN_OP_EQ_uxn_opcodes_h_l1534_c11_74a5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1534_c11_74a5_left,
BIN_OP_EQ_uxn_opcodes_h_l1534_c11_74a5_right,
BIN_OP_EQ_uxn_opcodes_h_l1534_c11_74a5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_9de3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_9de3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_9de3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_9de3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_9de3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1534_c7_9de3
result_u8_value_MUX_uxn_opcodes_h_l1534_c7_9de3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1534_c7_9de3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1534_c7_9de3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1534_c7_9de3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1534_c7_9de3
result_u16_value_MUX_uxn_opcodes_h_l1534_c7_9de3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1534_c7_9de3_cond,
result_u16_value_MUX_uxn_opcodes_h_l1534_c7_9de3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1534_c7_9de3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_9de3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_9de3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_9de3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_9de3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_9de3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_9de3
result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_9de3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_9de3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_9de3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_9de3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_9de3
result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_9de3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_9de3_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_9de3_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_9de3_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output);

-- n8_MUX_uxn_opcodes_h_l1534_c7_9de3
n8_MUX_uxn_opcodes_h_l1534_c7_9de3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1534_c7_9de3_cond,
n8_MUX_uxn_opcodes_h_l1534_c7_9de3_iftrue,
n8_MUX_uxn_opcodes_h_l1534_c7_9de3_iffalse,
n8_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output);

-- t8_MUX_uxn_opcodes_h_l1534_c7_9de3
t8_MUX_uxn_opcodes_h_l1534_c7_9de3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1534_c7_9de3_cond,
t8_MUX_uxn_opcodes_h_l1534_c7_9de3_iftrue,
t8_MUX_uxn_opcodes_h_l1534_c7_9de3_iffalse,
t8_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1537_c11_28d3
BIN_OP_EQ_uxn_opcodes_h_l1537_c11_28d3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1537_c11_28d3_left,
BIN_OP_EQ_uxn_opcodes_h_l1537_c11_28d3_right,
BIN_OP_EQ_uxn_opcodes_h_l1537_c11_28d3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_61dc
result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_61dc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_61dc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_61dc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_61dc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_61dc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1537_c7_61dc
result_u8_value_MUX_uxn_opcodes_h_l1537_c7_61dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1537_c7_61dc_cond,
result_u8_value_MUX_uxn_opcodes_h_l1537_c7_61dc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1537_c7_61dc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1537_c7_61dc_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1537_c7_61dc
result_u16_value_MUX_uxn_opcodes_h_l1537_c7_61dc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1537_c7_61dc_cond,
result_u16_value_MUX_uxn_opcodes_h_l1537_c7_61dc_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1537_c7_61dc_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1537_c7_61dc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_61dc
result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_61dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_61dc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_61dc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_61dc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_61dc_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_61dc
result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_61dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_61dc_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_61dc_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_61dc_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_61dc_return_output);

-- n8_MUX_uxn_opcodes_h_l1537_c7_61dc
n8_MUX_uxn_opcodes_h_l1537_c7_61dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1537_c7_61dc_cond,
n8_MUX_uxn_opcodes_h_l1537_c7_61dc_iftrue,
n8_MUX_uxn_opcodes_h_l1537_c7_61dc_iffalse,
n8_MUX_uxn_opcodes_h_l1537_c7_61dc_return_output);

-- t8_MUX_uxn_opcodes_h_l1537_c7_61dc
t8_MUX_uxn_opcodes_h_l1537_c7_61dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1537_c7_61dc_cond,
t8_MUX_uxn_opcodes_h_l1537_c7_61dc_iftrue,
t8_MUX_uxn_opcodes_h_l1537_c7_61dc_iffalse,
t8_MUX_uxn_opcodes_h_l1537_c7_61dc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1540_c11_c2a4
BIN_OP_EQ_uxn_opcodes_h_l1540_c11_c2a4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1540_c11_c2a4_left,
BIN_OP_EQ_uxn_opcodes_h_l1540_c11_c2a4_right,
BIN_OP_EQ_uxn_opcodes_h_l1540_c11_c2a4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_98af
result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_98af : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_98af_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_98af_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_98af_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_98af_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1540_c7_98af
result_u8_value_MUX_uxn_opcodes_h_l1540_c7_98af : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1540_c7_98af_cond,
result_u8_value_MUX_uxn_opcodes_h_l1540_c7_98af_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1540_c7_98af_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1540_c7_98af_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1540_c7_98af
result_u16_value_MUX_uxn_opcodes_h_l1540_c7_98af : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1540_c7_98af_cond,
result_u16_value_MUX_uxn_opcodes_h_l1540_c7_98af_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1540_c7_98af_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1540_c7_98af_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_98af
result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_98af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_98af_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_98af_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_98af_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_98af_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_98af
result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_98af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_98af_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_98af_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_98af_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_98af_return_output);

-- n8_MUX_uxn_opcodes_h_l1540_c7_98af
n8_MUX_uxn_opcodes_h_l1540_c7_98af : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1540_c7_98af_cond,
n8_MUX_uxn_opcodes_h_l1540_c7_98af_iftrue,
n8_MUX_uxn_opcodes_h_l1540_c7_98af_iffalse,
n8_MUX_uxn_opcodes_h_l1540_c7_98af_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1542_c30_a326
sp_relative_shift_uxn_opcodes_h_l1542_c30_a326 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1542_c30_a326_ins,
sp_relative_shift_uxn_opcodes_h_l1542_c30_a326_x,
sp_relative_shift_uxn_opcodes_h_l1542_c30_a326_y,
sp_relative_shift_uxn_opcodes_h_l1542_c30_a326_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1521_c6_1508_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output,
 n8_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output,
 t8_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1534_c11_74a5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output,
 n8_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output,
 t8_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1537_c11_28d3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_61dc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1537_c7_61dc_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1537_c7_61dc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_61dc_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_61dc_return_output,
 n8_MUX_uxn_opcodes_h_l1537_c7_61dc_return_output,
 t8_MUX_uxn_opcodes_h_l1537_c7_61dc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1540_c11_c2a4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_98af_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1540_c7_98af_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1540_c7_98af_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_98af_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_98af_return_output,
 n8_MUX_uxn_opcodes_h_l1540_c7_98af_return_output,
 sp_relative_shift_uxn_opcodes_h_l1542_c30_a326_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_1508_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_1508_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_1508_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1521_c2_48b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_48b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1521_c2_48b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_48b4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1521_c2_48b4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1521_c2_48b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_48b4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1526_c3_8dfb : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_48b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1521_c2_48b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_48b4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1531_c3_6416 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_48b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1521_c2_48b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_48b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_48b4_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1521_c2_48b4_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1521_c2_48b4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c11_74a5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c11_74a5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c11_74a5_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_9de3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_9de3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_61dc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_9de3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1534_c7_9de3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1534_c7_9de3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1537_c7_61dc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1534_c7_9de3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1534_c7_9de3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1534_c7_9de3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1537_c7_61dc_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1534_c7_9de3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_9de3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1535_c3_abda : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_9de3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1534_c7_9de3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_9de3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_9de3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_9de3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_61dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_9de3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_9de3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_9de3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_61dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_9de3_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1534_c7_9de3_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1534_c7_9de3_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1537_c7_61dc_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1534_c7_9de3_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1534_c7_9de3_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1534_c7_9de3_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1537_c7_61dc_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1534_c7_9de3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_28d3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_28d3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_28d3_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_61dc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_61dc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_98af_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_61dc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1537_c7_61dc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1537_c7_61dc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1540_c7_98af_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1537_c7_61dc_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1537_c7_61dc_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1537_c7_61dc_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1540_c7_98af_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1537_c7_61dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_61dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_61dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_98af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_61dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_61dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_61dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_98af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_61dc_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1537_c7_61dc_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1537_c7_61dc_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1540_c7_98af_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1537_c7_61dc_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1537_c7_61dc_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1537_c7_61dc_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1537_c7_61dc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_c2a4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_c2a4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_c2a4_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_98af_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_98af_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_98af_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1540_c7_98af_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1540_c7_98af_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1540_c7_98af_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1540_c7_98af_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1540_c7_98af_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1540_c7_98af_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_98af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_98af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_98af_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_98af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_98af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_98af_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1540_c7_98af_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1540_c7_98af_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1540_c7_98af_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1542_c30_a326_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1542_c30_a326_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1542_c30_a326_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1542_c30_a326_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1544_c22_3e90_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1537_l1521_l1540_l1534_DUPLICATE_d0d9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1537_l1521_l1540_l1534_DUPLICATE_707e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1537_l1540_l1534_DUPLICATE_a568_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1537_l1540_l1534_DUPLICATE_5fa0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1537_l1540_l1534_DUPLICATE_4fdd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_500b_uxn_opcodes_h_l1549_l1517_DUPLICATE_ed60_return_output : opcode_result_t;
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
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_1508_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1535_c3_abda := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_9de3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1535_c3_abda;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_98af_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_28d3_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_c2a4_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1542_c30_a326_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1531_c3_6416 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1531_c3_6416;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1526_c3_8dfb := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1526_c3_8dfb;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_98af_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1542_c30_a326_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c11_74a5_right := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1542_c30_a326_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1534_c7_9de3_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1537_c7_61dc_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1540_c7_98af_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_1508_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c11_74a5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_28d3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_c2a4_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1540_c7_98af_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1540_c7_98af_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1537_c7_61dc_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1534_c7_9de3_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1537_c7_61dc_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1521_c6_1508] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1521_c6_1508_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_1508_left;
     BIN_OP_EQ_uxn_opcodes_h_l1521_c6_1508_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_1508_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_1508_return_output := BIN_OP_EQ_uxn_opcodes_h_l1521_c6_1508_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1544_c22_3e90] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1544_c22_3e90_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1537_l1540_l1534_DUPLICATE_a568 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1537_l1540_l1534_DUPLICATE_a568_return_output := result.sp_relative_shift;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1521_c2_48b4] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1521_c2_48b4_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1537_c11_28d3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1537_c11_28d3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_28d3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1537_c11_28d3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_28d3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_28d3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1537_c11_28d3_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l1521_c2_48b4] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1521_c2_48b4_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1537_l1521_l1540_l1534_DUPLICATE_d0d9 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1537_l1521_l1540_l1534_DUPLICATE_d0d9_return_output := result.u8_value;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1521_c2_48b4] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1521_c2_48b4_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1537_l1540_l1534_DUPLICATE_4fdd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1537_l1540_l1534_DUPLICATE_4fdd_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1534_c11_74a5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1534_c11_74a5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c11_74a5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1534_c11_74a5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c11_74a5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c11_74a5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1534_c11_74a5_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1534_c7_9de3] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1534_c7_9de3_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1537_l1540_l1534_DUPLICATE_5fa0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1537_l1540_l1534_DUPLICATE_5fa0_return_output := result.is_opc_done;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1521_c2_48b4] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1521_c2_48b4_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1537_l1521_l1540_l1534_DUPLICATE_707e LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1537_l1521_l1540_l1534_DUPLICATE_707e_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1540_c11_c2a4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1540_c11_c2a4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_c2a4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1540_c11_c2a4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_c2a4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_c2a4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1540_c11_c2a4_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1542_c30_a326] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1542_c30_a326_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1542_c30_a326_ins;
     sp_relative_shift_uxn_opcodes_h_l1542_c30_a326_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1542_c30_a326_x;
     sp_relative_shift_uxn_opcodes_h_l1542_c30_a326_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1542_c30_a326_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1542_c30_a326_return_output := sp_relative_shift_uxn_opcodes_h_l1542_c30_a326_return_output;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l1521_c2_48b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_1508_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_48b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_1508_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_48b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_1508_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_48b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_1508_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_48b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_1508_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_48b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_1508_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_48b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_1508_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_48b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_1508_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_48b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_1508_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1521_c2_48b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_1508_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1521_c2_48b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_1508_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1521_c2_48b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_1508_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1534_c7_9de3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c11_74a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_9de3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c11_74a5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_9de3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c11_74a5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_9de3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c11_74a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_9de3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c11_74a5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1534_c7_9de3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c11_74a5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1534_c7_9de3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c11_74a5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1534_c7_9de3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c11_74a5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1537_c7_61dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_28d3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_61dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_28d3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_61dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_28d3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_61dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_28d3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1537_c7_61dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_28d3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1537_c7_61dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_28d3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1537_c7_61dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_28d3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1540_c7_98af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_c2a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_98af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_c2a4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_98af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_c2a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_98af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_c2a4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1540_c7_98af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_c2a4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1540_c7_98af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_c2a4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1540_c7_98af_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1544_c22_3e90_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_9de3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1537_l1540_l1534_DUPLICATE_a568_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_61dc_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1537_l1540_l1534_DUPLICATE_a568_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_98af_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1537_l1540_l1534_DUPLICATE_a568_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1537_l1521_l1540_l1534_DUPLICATE_707e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1534_c7_9de3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1537_l1521_l1540_l1534_DUPLICATE_707e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1537_c7_61dc_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1537_l1521_l1540_l1534_DUPLICATE_707e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1540_c7_98af_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1537_l1521_l1540_l1534_DUPLICATE_707e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_9de3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1537_l1540_l1534_DUPLICATE_5fa0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_61dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1537_l1540_l1534_DUPLICATE_5fa0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_98af_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1537_l1540_l1534_DUPLICATE_5fa0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_9de3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1537_l1540_l1534_DUPLICATE_4fdd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_61dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1537_l1540_l1534_DUPLICATE_4fdd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_98af_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1537_l1540_l1534_DUPLICATE_4fdd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1537_l1521_l1540_l1534_DUPLICATE_d0d9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1534_c7_9de3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1537_l1521_l1540_l1534_DUPLICATE_d0d9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1537_c7_61dc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1537_l1521_l1540_l1534_DUPLICATE_d0d9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1540_c7_98af_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1537_l1521_l1540_l1534_DUPLICATE_d0d9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1521_c2_48b4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1521_c2_48b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1521_c2_48b4_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1521_c2_48b4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_9de3_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1534_c7_9de3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_98af_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1542_c30_a326_return_output;
     -- t8_MUX[uxn_opcodes_h_l1537_c7_61dc] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1537_c7_61dc_cond <= VAR_t8_MUX_uxn_opcodes_h_l1537_c7_61dc_cond;
     t8_MUX_uxn_opcodes_h_l1537_c7_61dc_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1537_c7_61dc_iftrue;
     t8_MUX_uxn_opcodes_h_l1537_c7_61dc_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1537_c7_61dc_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1537_c7_61dc_return_output := t8_MUX_uxn_opcodes_h_l1537_c7_61dc_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1540_c7_98af] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1540_c7_98af_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1540_c7_98af_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1540_c7_98af_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1540_c7_98af_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1540_c7_98af_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1540_c7_98af_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1540_c7_98af_return_output := result_u16_value_MUX_uxn_opcodes_h_l1540_c7_98af_return_output;

     -- n8_MUX[uxn_opcodes_h_l1540_c7_98af] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1540_c7_98af_cond <= VAR_n8_MUX_uxn_opcodes_h_l1540_c7_98af_cond;
     n8_MUX_uxn_opcodes_h_l1540_c7_98af_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1540_c7_98af_iftrue;
     n8_MUX_uxn_opcodes_h_l1540_c7_98af_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1540_c7_98af_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1540_c7_98af_return_output := n8_MUX_uxn_opcodes_h_l1540_c7_98af_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1521_c2_48b4] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_48b4_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_48b4_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1540_c7_98af] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1540_c7_98af_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1540_c7_98af_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1540_c7_98af_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1540_c7_98af_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1540_c7_98af_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1540_c7_98af_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1540_c7_98af_return_output := result_u8_value_MUX_uxn_opcodes_h_l1540_c7_98af_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1540_c7_98af] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_98af_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_98af_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_98af_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_98af_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_98af_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_98af_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_98af_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_98af_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1540_c7_98af] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_98af_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_98af_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_98af_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_98af_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_98af_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_98af_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_98af_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_98af_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1540_c7_98af] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_98af_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_98af_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_98af_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_98af_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_98af_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_98af_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_98af_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_98af_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1521_c2_48b4] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_48b4_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_48b4_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1521_c2_48b4] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_48b4_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_48b4_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1534_c7_9de3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_9de3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_9de3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_9de3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_9de3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_9de3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_9de3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1521_c2_48b4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_48b4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_48b4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output;

     -- Submodule level 2
     VAR_n8_MUX_uxn_opcodes_h_l1537_c7_61dc_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1540_c7_98af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_61dc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_98af_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_61dc_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_98af_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_61dc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_98af_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1537_c7_61dc_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1540_c7_98af_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1537_c7_61dc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1540_c7_98af_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1534_c7_9de3_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1537_c7_61dc_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1537_c7_61dc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_61dc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_61dc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_61dc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_61dc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_61dc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_61dc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_61dc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_61dc_return_output;

     -- t8_MUX[uxn_opcodes_h_l1534_c7_9de3] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1534_c7_9de3_cond <= VAR_t8_MUX_uxn_opcodes_h_l1534_c7_9de3_cond;
     t8_MUX_uxn_opcodes_h_l1534_c7_9de3_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1534_c7_9de3_iftrue;
     t8_MUX_uxn_opcodes_h_l1534_c7_9de3_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1534_c7_9de3_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output := t8_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1537_c7_61dc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_61dc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_61dc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_61dc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_61dc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_61dc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_61dc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_61dc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_61dc_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1537_c7_61dc] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_61dc_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_61dc_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_61dc_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_61dc_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_61dc_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_61dc_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_61dc_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_61dc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1521_c2_48b4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_48b4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_48b4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1537_c7_61dc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1537_c7_61dc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1537_c7_61dc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1537_c7_61dc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1537_c7_61dc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1537_c7_61dc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1537_c7_61dc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1537_c7_61dc_return_output := result_u8_value_MUX_uxn_opcodes_h_l1537_c7_61dc_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1537_c7_61dc] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1537_c7_61dc_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1537_c7_61dc_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1537_c7_61dc_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1537_c7_61dc_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1537_c7_61dc_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1537_c7_61dc_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1537_c7_61dc_return_output := result_u16_value_MUX_uxn_opcodes_h_l1537_c7_61dc_return_output;

     -- n8_MUX[uxn_opcodes_h_l1537_c7_61dc] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1537_c7_61dc_cond <= VAR_n8_MUX_uxn_opcodes_h_l1537_c7_61dc_cond;
     n8_MUX_uxn_opcodes_h_l1537_c7_61dc_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1537_c7_61dc_iftrue;
     n8_MUX_uxn_opcodes_h_l1537_c7_61dc_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1537_c7_61dc_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1537_c7_61dc_return_output := n8_MUX_uxn_opcodes_h_l1537_c7_61dc_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l1534_c7_9de3_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1537_c7_61dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_9de3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_61dc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_9de3_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_61dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_9de3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_61dc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1534_c7_9de3_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1537_c7_61dc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1534_c7_9de3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1537_c7_61dc_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1534_c7_9de3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1534_c7_9de3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1534_c7_9de3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1534_c7_9de3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1534_c7_9de3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1534_c7_9de3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1534_c7_9de3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output := result_u16_value_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1534_c7_9de3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_9de3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_9de3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_9de3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_9de3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_9de3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_9de3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1534_c7_9de3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1534_c7_9de3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1534_c7_9de3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1534_c7_9de3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1534_c7_9de3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1534_c7_9de3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1534_c7_9de3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output;

     -- t8_MUX[uxn_opcodes_h_l1521_c2_48b4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1521_c2_48b4_cond <= VAR_t8_MUX_uxn_opcodes_h_l1521_c2_48b4_cond;
     t8_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue;
     t8_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output := t8_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1534_c7_9de3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_9de3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_9de3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_9de3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_9de3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_9de3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_9de3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1534_c7_9de3] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_9de3_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_9de3_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_9de3_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_9de3_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_9de3_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_9de3_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output;

     -- n8_MUX[uxn_opcodes_h_l1534_c7_9de3] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1534_c7_9de3_cond <= VAR_n8_MUX_uxn_opcodes_h_l1534_c7_9de3_cond;
     n8_MUX_uxn_opcodes_h_l1534_c7_9de3_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1534_c7_9de3_iftrue;
     n8_MUX_uxn_opcodes_h_l1534_c7_9de3_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1534_c7_9de3_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output := n8_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1534_c7_9de3_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output;
     -- n8_MUX[uxn_opcodes_h_l1521_c2_48b4] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1521_c2_48b4_cond <= VAR_n8_MUX_uxn_opcodes_h_l1521_c2_48b4_cond;
     n8_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue;
     n8_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output := n8_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1521_c2_48b4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1521_c2_48b4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1521_c2_48b4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output := result_u16_value_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1521_c2_48b4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_48b4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_48b4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1521_c2_48b4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1521_c2_48b4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1521_c2_48b4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1521_c2_48b4] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_48b4_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_48b4_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1521_c2_48b4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_48b4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_48b4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_48b4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_48b4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_500b_uxn_opcodes_h_l1549_l1517_DUPLICATE_ed60 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_500b_uxn_opcodes_h_l1549_l1517_DUPLICATE_ed60_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_500b(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_48b4_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_500b_uxn_opcodes_h_l1549_l1517_DUPLICATE_ed60_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_500b_uxn_opcodes_h_l1549_l1517_DUPLICATE_ed60_return_output;
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
