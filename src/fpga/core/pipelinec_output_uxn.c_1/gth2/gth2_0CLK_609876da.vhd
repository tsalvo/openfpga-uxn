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
-- Submodules: 58
entity gth2_0CLK_609876da is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end gth2_0CLK_609876da;
architecture arch of gth2_0CLK_609876da is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1861_c6_7fa4]
signal BIN_OP_EQ_uxn_opcodes_h_l1861_c6_7fa4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1861_c6_7fa4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1861_c6_7fa4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1861_c2_9393]
signal n16_MUX_uxn_opcodes_h_l1861_c2_9393_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1861_c2_9393_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1861_c2_9393]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_9393_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_9393_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1861_c2_9393]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_9393_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_9393_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1861_c2_9393]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_9393_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_9393_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1861_c2_9393]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_9393_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_9393_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1861_c2_9393]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_9393_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_9393_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1861_c2_9393]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_9393_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_9393_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1861_c2_9393]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_9393_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_9393_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1861_c2_9393]
signal result_u8_value_MUX_uxn_opcodes_h_l1861_c2_9393_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1861_c2_9393_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1861_c2_9393]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_9393_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_9393_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1861_c2_9393]
signal t16_MUX_uxn_opcodes_h_l1861_c2_9393_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1861_c2_9393_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1874_c11_4405]
signal BIN_OP_EQ_uxn_opcodes_h_l1874_c11_4405_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1874_c11_4405_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1874_c11_4405_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1874_c7_7f17]
signal n16_MUX_uxn_opcodes_h_l1874_c7_7f17_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1874_c7_7f17_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1874_c7_7f17_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1874_c7_7f17_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1874_c7_7f17]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7f17_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7f17_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7f17_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7f17_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1874_c7_7f17]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7f17_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7f17_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7f17_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7f17_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1874_c7_7f17]
signal result_u8_value_MUX_uxn_opcodes_h_l1874_c7_7f17_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1874_c7_7f17_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1874_c7_7f17_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1874_c7_7f17_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1874_c7_7f17]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7f17_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7f17_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7f17_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7f17_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1874_c7_7f17]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7f17_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7f17_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7f17_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7f17_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1874_c7_7f17]
signal t16_MUX_uxn_opcodes_h_l1874_c7_7f17_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1874_c7_7f17_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1874_c7_7f17_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1874_c7_7f17_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1877_c11_98d0]
signal BIN_OP_EQ_uxn_opcodes_h_l1877_c11_98d0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1877_c11_98d0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1877_c11_98d0_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1877_c7_c996]
signal n16_MUX_uxn_opcodes_h_l1877_c7_c996_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1877_c7_c996_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1877_c7_c996_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1877_c7_c996_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1877_c7_c996]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_c996_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_c996_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_c996_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_c996_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1877_c7_c996]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_c996_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_c996_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_c996_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_c996_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1877_c7_c996]
signal result_u8_value_MUX_uxn_opcodes_h_l1877_c7_c996_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1877_c7_c996_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1877_c7_c996_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1877_c7_c996_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1877_c7_c996]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_c996_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_c996_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_c996_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_c996_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1877_c7_c996]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_c996_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_c996_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_c996_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_c996_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1877_c7_c996]
signal t16_MUX_uxn_opcodes_h_l1877_c7_c996_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1877_c7_c996_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1877_c7_c996_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1877_c7_c996_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1882_c11_ceca]
signal BIN_OP_EQ_uxn_opcodes_h_l1882_c11_ceca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1882_c11_ceca_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1882_c11_ceca_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1882_c7_2bb6]
signal n16_MUX_uxn_opcodes_h_l1882_c7_2bb6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1882_c7_2bb6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1882_c7_2bb6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1882_c7_2bb6_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1882_c7_2bb6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2bb6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2bb6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2bb6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2bb6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1882_c7_2bb6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_2bb6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_2bb6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_2bb6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_2bb6_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1882_c7_2bb6]
signal result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2bb6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2bb6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2bb6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2bb6_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1882_c7_2bb6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2bb6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2bb6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2bb6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2bb6_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1882_c7_2bb6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2bb6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2bb6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2bb6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2bb6_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1882_c7_2bb6]
signal t16_MUX_uxn_opcodes_h_l1882_c7_2bb6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1882_c7_2bb6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1882_c7_2bb6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1882_c7_2bb6_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1883_c3_4d55]
signal BIN_OP_OR_uxn_opcodes_h_l1883_c3_4d55_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1883_c3_4d55_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1883_c3_4d55_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1886_c11_dbc0]
signal BIN_OP_EQ_uxn_opcodes_h_l1886_c11_dbc0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1886_c11_dbc0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1886_c11_dbc0_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1886_c7_6659]
signal n16_MUX_uxn_opcodes_h_l1886_c7_6659_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1886_c7_6659_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1886_c7_6659_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1886_c7_6659_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1886_c7_6659]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_6659_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_6659_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_6659_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_6659_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1886_c7_6659]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_6659_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_6659_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_6659_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_6659_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1886_c7_6659]
signal result_u8_value_MUX_uxn_opcodes_h_l1886_c7_6659_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1886_c7_6659_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1886_c7_6659_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1886_c7_6659_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1886_c7_6659]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_6659_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_6659_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_6659_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_6659_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1886_c7_6659]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_6659_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_6659_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_6659_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_6659_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1890_c11_a268]
signal BIN_OP_EQ_uxn_opcodes_h_l1890_c11_a268_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1890_c11_a268_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1890_c11_a268_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1890_c7_99ef]
signal n16_MUX_uxn_opcodes_h_l1890_c7_99ef_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1890_c7_99ef_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1890_c7_99ef_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1890_c7_99ef_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1890_c7_99ef]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_99ef_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_99ef_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_99ef_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_99ef_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1890_c7_99ef]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_99ef_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_99ef_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_99ef_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_99ef_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1890_c7_99ef]
signal result_u8_value_MUX_uxn_opcodes_h_l1890_c7_99ef_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1890_c7_99ef_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1890_c7_99ef_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1890_c7_99ef_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1890_c7_99ef]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_99ef_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_99ef_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_99ef_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_99ef_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1890_c7_99ef]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_99ef_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_99ef_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_99ef_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_99ef_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1891_c3_17c2]
signal BIN_OP_OR_uxn_opcodes_h_l1891_c3_17c2_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1891_c3_17c2_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1891_c3_17c2_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1892_c30_c1e2]
signal sp_relative_shift_uxn_opcodes_h_l1892_c30_c1e2_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1892_c30_c1e2_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1892_c30_c1e2_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1892_c30_c1e2_return_output : signed(3 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1895_c21_d364]
signal BIN_OP_GT_uxn_opcodes_h_l1895_c21_d364_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1895_c21_d364_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1895_c21_d364_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1895_c21_1cfa]
signal MUX_uxn_opcodes_h_l1895_c21_1cfa_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1895_c21_1cfa_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1895_c21_1cfa_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1895_c21_1cfa_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1888_DUPLICATE_4667
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1888_DUPLICATE_4667_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1888_DUPLICATE_4667_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_a47b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
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
      base.is_ram_write := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.u8_value := ref_toks_8;
      base.is_vram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1861_c6_7fa4
BIN_OP_EQ_uxn_opcodes_h_l1861_c6_7fa4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1861_c6_7fa4_left,
BIN_OP_EQ_uxn_opcodes_h_l1861_c6_7fa4_right,
BIN_OP_EQ_uxn_opcodes_h_l1861_c6_7fa4_return_output);

-- n16_MUX_uxn_opcodes_h_l1861_c2_9393
n16_MUX_uxn_opcodes_h_l1861_c2_9393 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1861_c2_9393_cond,
n16_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue,
n16_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse,
n16_MUX_uxn_opcodes_h_l1861_c2_9393_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_9393
result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_9393 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_9393_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_9393_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_9393
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_9393 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_9393_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_9393_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_9393
result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_9393 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_9393_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_9393_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_9393
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_9393 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_9393_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_9393_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_9393
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_9393 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_9393_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_9393_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_9393
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_9393 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_9393_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_9393_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_9393
result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_9393 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_9393_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_9393_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1861_c2_9393
result_u8_value_MUX_uxn_opcodes_h_l1861_c2_9393 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1861_c2_9393_cond,
result_u8_value_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1861_c2_9393_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_9393
result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_9393 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_9393_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_9393_return_output);

-- t16_MUX_uxn_opcodes_h_l1861_c2_9393
t16_MUX_uxn_opcodes_h_l1861_c2_9393 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1861_c2_9393_cond,
t16_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue,
t16_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse,
t16_MUX_uxn_opcodes_h_l1861_c2_9393_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1874_c11_4405
BIN_OP_EQ_uxn_opcodes_h_l1874_c11_4405 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1874_c11_4405_left,
BIN_OP_EQ_uxn_opcodes_h_l1874_c11_4405_right,
BIN_OP_EQ_uxn_opcodes_h_l1874_c11_4405_return_output);

-- n16_MUX_uxn_opcodes_h_l1874_c7_7f17
n16_MUX_uxn_opcodes_h_l1874_c7_7f17 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1874_c7_7f17_cond,
n16_MUX_uxn_opcodes_h_l1874_c7_7f17_iftrue,
n16_MUX_uxn_opcodes_h_l1874_c7_7f17_iffalse,
n16_MUX_uxn_opcodes_h_l1874_c7_7f17_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7f17
result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7f17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7f17_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7f17_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7f17_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7f17_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7f17
result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7f17 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7f17_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7f17_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7f17_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7f17_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1874_c7_7f17
result_u8_value_MUX_uxn_opcodes_h_l1874_c7_7f17 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1874_c7_7f17_cond,
result_u8_value_MUX_uxn_opcodes_h_l1874_c7_7f17_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1874_c7_7f17_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1874_c7_7f17_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7f17
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7f17 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7f17_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7f17_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7f17_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7f17_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7f17
result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7f17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7f17_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7f17_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7f17_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7f17_return_output);

-- t16_MUX_uxn_opcodes_h_l1874_c7_7f17
t16_MUX_uxn_opcodes_h_l1874_c7_7f17 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1874_c7_7f17_cond,
t16_MUX_uxn_opcodes_h_l1874_c7_7f17_iftrue,
t16_MUX_uxn_opcodes_h_l1874_c7_7f17_iffalse,
t16_MUX_uxn_opcodes_h_l1874_c7_7f17_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1877_c11_98d0
BIN_OP_EQ_uxn_opcodes_h_l1877_c11_98d0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1877_c11_98d0_left,
BIN_OP_EQ_uxn_opcodes_h_l1877_c11_98d0_right,
BIN_OP_EQ_uxn_opcodes_h_l1877_c11_98d0_return_output);

-- n16_MUX_uxn_opcodes_h_l1877_c7_c996
n16_MUX_uxn_opcodes_h_l1877_c7_c996 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1877_c7_c996_cond,
n16_MUX_uxn_opcodes_h_l1877_c7_c996_iftrue,
n16_MUX_uxn_opcodes_h_l1877_c7_c996_iffalse,
n16_MUX_uxn_opcodes_h_l1877_c7_c996_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_c996
result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_c996 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_c996_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_c996_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_c996_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_c996_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_c996
result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_c996 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_c996_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_c996_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_c996_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_c996_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1877_c7_c996
result_u8_value_MUX_uxn_opcodes_h_l1877_c7_c996 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1877_c7_c996_cond,
result_u8_value_MUX_uxn_opcodes_h_l1877_c7_c996_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1877_c7_c996_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1877_c7_c996_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_c996
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_c996 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_c996_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_c996_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_c996_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_c996_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_c996
result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_c996 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_c996_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_c996_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_c996_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_c996_return_output);

-- t16_MUX_uxn_opcodes_h_l1877_c7_c996
t16_MUX_uxn_opcodes_h_l1877_c7_c996 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1877_c7_c996_cond,
t16_MUX_uxn_opcodes_h_l1877_c7_c996_iftrue,
t16_MUX_uxn_opcodes_h_l1877_c7_c996_iffalse,
t16_MUX_uxn_opcodes_h_l1877_c7_c996_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1882_c11_ceca
BIN_OP_EQ_uxn_opcodes_h_l1882_c11_ceca : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1882_c11_ceca_left,
BIN_OP_EQ_uxn_opcodes_h_l1882_c11_ceca_right,
BIN_OP_EQ_uxn_opcodes_h_l1882_c11_ceca_return_output);

-- n16_MUX_uxn_opcodes_h_l1882_c7_2bb6
n16_MUX_uxn_opcodes_h_l1882_c7_2bb6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1882_c7_2bb6_cond,
n16_MUX_uxn_opcodes_h_l1882_c7_2bb6_iftrue,
n16_MUX_uxn_opcodes_h_l1882_c7_2bb6_iffalse,
n16_MUX_uxn_opcodes_h_l1882_c7_2bb6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2bb6
result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2bb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2bb6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2bb6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2bb6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2bb6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_2bb6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_2bb6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_2bb6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_2bb6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_2bb6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_2bb6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2bb6
result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2bb6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2bb6_cond,
result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2bb6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2bb6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2bb6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2bb6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2bb6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2bb6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2bb6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2bb6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2bb6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2bb6
result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2bb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2bb6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2bb6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2bb6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2bb6_return_output);

-- t16_MUX_uxn_opcodes_h_l1882_c7_2bb6
t16_MUX_uxn_opcodes_h_l1882_c7_2bb6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1882_c7_2bb6_cond,
t16_MUX_uxn_opcodes_h_l1882_c7_2bb6_iftrue,
t16_MUX_uxn_opcodes_h_l1882_c7_2bb6_iffalse,
t16_MUX_uxn_opcodes_h_l1882_c7_2bb6_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1883_c3_4d55
BIN_OP_OR_uxn_opcodes_h_l1883_c3_4d55 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1883_c3_4d55_left,
BIN_OP_OR_uxn_opcodes_h_l1883_c3_4d55_right,
BIN_OP_OR_uxn_opcodes_h_l1883_c3_4d55_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1886_c11_dbc0
BIN_OP_EQ_uxn_opcodes_h_l1886_c11_dbc0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1886_c11_dbc0_left,
BIN_OP_EQ_uxn_opcodes_h_l1886_c11_dbc0_right,
BIN_OP_EQ_uxn_opcodes_h_l1886_c11_dbc0_return_output);

-- n16_MUX_uxn_opcodes_h_l1886_c7_6659
n16_MUX_uxn_opcodes_h_l1886_c7_6659 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1886_c7_6659_cond,
n16_MUX_uxn_opcodes_h_l1886_c7_6659_iftrue,
n16_MUX_uxn_opcodes_h_l1886_c7_6659_iffalse,
n16_MUX_uxn_opcodes_h_l1886_c7_6659_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_6659
result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_6659 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_6659_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_6659_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_6659_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_6659_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_6659
result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_6659 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_6659_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_6659_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_6659_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_6659_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1886_c7_6659
result_u8_value_MUX_uxn_opcodes_h_l1886_c7_6659 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1886_c7_6659_cond,
result_u8_value_MUX_uxn_opcodes_h_l1886_c7_6659_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1886_c7_6659_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1886_c7_6659_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_6659
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_6659 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_6659_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_6659_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_6659_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_6659_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_6659
result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_6659 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_6659_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_6659_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_6659_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_6659_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1890_c11_a268
BIN_OP_EQ_uxn_opcodes_h_l1890_c11_a268 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1890_c11_a268_left,
BIN_OP_EQ_uxn_opcodes_h_l1890_c11_a268_right,
BIN_OP_EQ_uxn_opcodes_h_l1890_c11_a268_return_output);

-- n16_MUX_uxn_opcodes_h_l1890_c7_99ef
n16_MUX_uxn_opcodes_h_l1890_c7_99ef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1890_c7_99ef_cond,
n16_MUX_uxn_opcodes_h_l1890_c7_99ef_iftrue,
n16_MUX_uxn_opcodes_h_l1890_c7_99ef_iffalse,
n16_MUX_uxn_opcodes_h_l1890_c7_99ef_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_99ef
result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_99ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_99ef_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_99ef_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_99ef_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_99ef_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_99ef
result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_99ef : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_99ef_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_99ef_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_99ef_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_99ef_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1890_c7_99ef
result_u8_value_MUX_uxn_opcodes_h_l1890_c7_99ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1890_c7_99ef_cond,
result_u8_value_MUX_uxn_opcodes_h_l1890_c7_99ef_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1890_c7_99ef_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1890_c7_99ef_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_99ef
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_99ef : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_99ef_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_99ef_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_99ef_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_99ef_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_99ef
result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_99ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_99ef_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_99ef_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_99ef_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_99ef_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1891_c3_17c2
BIN_OP_OR_uxn_opcodes_h_l1891_c3_17c2 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1891_c3_17c2_left,
BIN_OP_OR_uxn_opcodes_h_l1891_c3_17c2_right,
BIN_OP_OR_uxn_opcodes_h_l1891_c3_17c2_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1892_c30_c1e2
sp_relative_shift_uxn_opcodes_h_l1892_c30_c1e2 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1892_c30_c1e2_ins,
sp_relative_shift_uxn_opcodes_h_l1892_c30_c1e2_x,
sp_relative_shift_uxn_opcodes_h_l1892_c30_c1e2_y,
sp_relative_shift_uxn_opcodes_h_l1892_c30_c1e2_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1895_c21_d364
BIN_OP_GT_uxn_opcodes_h_l1895_c21_d364 : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1895_c21_d364_left,
BIN_OP_GT_uxn_opcodes_h_l1895_c21_d364_right,
BIN_OP_GT_uxn_opcodes_h_l1895_c21_d364_return_output);

-- MUX_uxn_opcodes_h_l1895_c21_1cfa
MUX_uxn_opcodes_h_l1895_c21_1cfa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1895_c21_1cfa_cond,
MUX_uxn_opcodes_h_l1895_c21_1cfa_iftrue,
MUX_uxn_opcodes_h_l1895_c21_1cfa_iffalse,
MUX_uxn_opcodes_h_l1895_c21_1cfa_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1888_DUPLICATE_4667
CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1888_DUPLICATE_4667 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1888_DUPLICATE_4667_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1888_DUPLICATE_4667_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1861_c6_7fa4_return_output,
 n16_MUX_uxn_opcodes_h_l1861_c2_9393_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_9393_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_9393_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_9393_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_9393_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_9393_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_9393_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_9393_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1861_c2_9393_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_9393_return_output,
 t16_MUX_uxn_opcodes_h_l1861_c2_9393_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1874_c11_4405_return_output,
 n16_MUX_uxn_opcodes_h_l1874_c7_7f17_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7f17_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7f17_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1874_c7_7f17_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7f17_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7f17_return_output,
 t16_MUX_uxn_opcodes_h_l1874_c7_7f17_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1877_c11_98d0_return_output,
 n16_MUX_uxn_opcodes_h_l1877_c7_c996_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_c996_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_c996_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1877_c7_c996_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_c996_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_c996_return_output,
 t16_MUX_uxn_opcodes_h_l1877_c7_c996_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1882_c11_ceca_return_output,
 n16_MUX_uxn_opcodes_h_l1882_c7_2bb6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2bb6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_2bb6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2bb6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2bb6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2bb6_return_output,
 t16_MUX_uxn_opcodes_h_l1882_c7_2bb6_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1883_c3_4d55_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1886_c11_dbc0_return_output,
 n16_MUX_uxn_opcodes_h_l1886_c7_6659_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_6659_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_6659_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1886_c7_6659_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_6659_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_6659_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1890_c11_a268_return_output,
 n16_MUX_uxn_opcodes_h_l1890_c7_99ef_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_99ef_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_99ef_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1890_c7_99ef_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_99ef_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_99ef_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1891_c3_17c2_return_output,
 sp_relative_shift_uxn_opcodes_h_l1892_c30_c1e2_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1895_c21_d364_return_output,
 MUX_uxn_opcodes_h_l1895_c21_1cfa_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1888_DUPLICATE_4667_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c6_7fa4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c6_7fa4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c6_7fa4_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1874_c7_7f17_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1861_c2_9393_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1861_c2_9393_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1861_c2_9393_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_9393_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_9393_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7f17_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_9393_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_9393_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1866_c3_bb05 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7f17_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_9393_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_9393_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1861_c2_9393_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_9393_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_9393_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1871_c3_1ea0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7f17_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_9393_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_9393_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7f17_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_9393_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_9393_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1861_c2_9393_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_9393_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_9393_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_7f17_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c2_9393_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c2_9393_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1861_c2_9393_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_9393_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_9393_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1874_c7_7f17_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1861_c2_9393_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1861_c2_9393_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_4405_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_4405_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_4405_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1874_c7_7f17_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1874_c7_7f17_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1877_c7_c996_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1874_c7_7f17_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7f17_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7f17_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_c996_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7f17_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7f17_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7f17_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_c996_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7f17_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_7f17_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_7f17_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1877_c7_c996_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_7f17_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7f17_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1875_c3_50fa : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7f17_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_c996_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7f17_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7f17_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7f17_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_c996_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7f17_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1874_c7_7f17_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1874_c7_7f17_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1877_c7_c996_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1874_c7_7f17_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_98d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_98d0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_98d0_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1877_c7_c996_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1877_c7_c996_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1882_c7_2bb6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1877_c7_c996_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_c996_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_c996_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2bb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_c996_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_c996_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_c996_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_2bb6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_c996_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1877_c7_c996_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1877_c7_c996_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2bb6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1877_c7_c996_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_c996_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1880_c3_5c34 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_c996_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2bb6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_c996_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_c996_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_c996_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2bb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_c996_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1877_c7_c996_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1877_c7_c996_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1882_c7_2bb6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1877_c7_c996_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_ceca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_ceca_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_ceca_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1882_c7_2bb6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1882_c7_2bb6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1886_c7_6659_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1882_c7_2bb6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2bb6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2bb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_6659_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2bb6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_2bb6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_2bb6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_6659_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_2bb6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2bb6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2bb6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1886_c7_6659_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2bb6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2bb6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1884_c3_6c5b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2bb6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_6659_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2bb6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2bb6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2bb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_6659_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2bb6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1882_c7_2bb6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1882_c7_2bb6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1882_c7_2bb6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1883_c3_4d55_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1883_c3_4d55_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1883_c3_4d55_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_dbc0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_dbc0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_dbc0_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1886_c7_6659_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1886_c7_6659_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1890_c7_99ef_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1886_c7_6659_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_6659_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_6659_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_99ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_6659_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_6659_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_6659_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_99ef_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_6659_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1886_c7_6659_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1886_c7_6659_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1890_c7_99ef_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1886_c7_6659_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_6659_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_6659_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_99ef_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_6659_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_6659_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_6659_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_99ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_6659_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1890_c11_a268_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1890_c11_a268_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1890_c11_a268_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1890_c7_99ef_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1890_c7_99ef_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1890_c7_99ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_99ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_99ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_99ef_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_99ef_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_99ef_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_99ef_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1890_c7_99ef_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1890_c7_99ef_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1890_c7_99ef_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_99ef_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1894_c3_417d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_99ef_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_99ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_99ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_99ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_99ef_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1891_c3_17c2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1891_c3_17c2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1891_c3_17c2_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1892_c30_c1e2_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1892_c30_c1e2_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1892_c30_c1e2_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1892_c30_c1e2_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1895_c21_1cfa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1895_c21_d364_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1895_c21_d364_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1895_c21_d364_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1895_c21_1cfa_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1895_c21_1cfa_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1895_c21_1cfa_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1890_l1882_l1886_l1877_l1874_l1861_DUPLICATE_b3e9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1890_l1882_l1886_l1877_l1874_DUPLICATE_30f8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1890_l1882_l1886_l1877_l1874_DUPLICATE_0657_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1890_l1882_l1886_l1877_l1874_DUPLICATE_17f7_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1878_l1891_l1887_l1883_DUPLICATE_62b3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1888_DUPLICATE_4667_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1888_DUPLICATE_4667_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1886_l1890_DUPLICATE_95a3_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l1899_l1857_DUPLICATE_0778_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1895_c21_1cfa_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1894_c3_417d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_99ef_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1894_c3_417d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1875_c3_50fa := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7f17_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1875_c3_50fa;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1866_c3_bb05 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1866_c3_bb05;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_4405_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1871_c3_1ea0 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1871_c3_1ea0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c6_7fa4_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1890_c11_a268_right := to_unsigned(5, 3);
     VAR_MUX_uxn_opcodes_h_l1895_c21_1cfa_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_98d0_right := to_unsigned(2, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_99ef_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_99ef_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1884_c3_6c5b := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2bb6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1884_c3_6c5b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_dbc0_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1892_c30_c1e2_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1880_c3_5c34 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_c996_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1880_c3_5c34;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1892_c30_c1e2_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_ceca_right := to_unsigned(3, 2);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1892_c30_c1e2_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1891_c3_17c2_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1874_c7_7f17_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1877_c7_c996_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1882_c7_2bb6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1890_c7_99ef_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c6_7fa4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_4405_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_98d0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_ceca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_dbc0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1890_c11_a268_left := VAR_phase;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1895_c21_d364_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1883_c3_4d55_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1874_c7_7f17_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1882_c7_2bb6_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1890_l1882_l1886_l1877_l1874_DUPLICATE_17f7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1890_l1882_l1886_l1877_l1874_DUPLICATE_17f7_return_output := result.is_stack_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1861_c2_9393] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1861_c2_9393_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1890_c11_a268] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1890_c11_a268_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1890_c11_a268_left;
     BIN_OP_EQ_uxn_opcodes_h_l1890_c11_a268_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1890_c11_a268_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1890_c11_a268_return_output := BIN_OP_EQ_uxn_opcodes_h_l1890_c11_a268_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1861_c2_9393] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1861_c2_9393_return_output := result.is_stack_index_flipped;

     -- sp_relative_shift[uxn_opcodes_h_l1892_c30_c1e2] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1892_c30_c1e2_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1892_c30_c1e2_ins;
     sp_relative_shift_uxn_opcodes_h_l1892_c30_c1e2_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1892_c30_c1e2_x;
     sp_relative_shift_uxn_opcodes_h_l1892_c30_c1e2_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1892_c30_c1e2_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1892_c30_c1e2_return_output := sp_relative_shift_uxn_opcodes_h_l1892_c30_c1e2_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1861_c2_9393] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1861_c2_9393_return_output := result.is_pc_updated;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1890_l1882_l1886_l1877_l1874_DUPLICATE_0657 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1890_l1882_l1886_l1877_l1874_DUPLICATE_0657_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1890_l1882_l1886_l1877_l1874_DUPLICATE_30f8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1890_l1882_l1886_l1877_l1874_DUPLICATE_30f8_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1878_l1891_l1887_l1883_DUPLICATE_62b3 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1878_l1891_l1887_l1883_DUPLICATE_62b3_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1874_c11_4405] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1874_c11_4405_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_4405_left;
     BIN_OP_EQ_uxn_opcodes_h_l1874_c11_4405_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_4405_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_4405_return_output := BIN_OP_EQ_uxn_opcodes_h_l1874_c11_4405_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1882_c11_ceca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1882_c11_ceca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_ceca_left;
     BIN_OP_EQ_uxn_opcodes_h_l1882_c11_ceca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_ceca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_ceca_return_output := BIN_OP_EQ_uxn_opcodes_h_l1882_c11_ceca_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1861_c6_7fa4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1861_c6_7fa4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c6_7fa4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1861_c6_7fa4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c6_7fa4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c6_7fa4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1861_c6_7fa4_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1861_c2_9393] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1861_c2_9393_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1890_l1882_l1886_l1877_l1874_l1861_DUPLICATE_b3e9 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1890_l1882_l1886_l1877_l1874_l1861_DUPLICATE_b3e9_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1877_c11_98d0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1877_c11_98d0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_98d0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1877_c11_98d0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_98d0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_98d0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1877_c11_98d0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1886_c11_dbc0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1886_c11_dbc0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_dbc0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1886_c11_dbc0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_dbc0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_dbc0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1886_c11_dbc0_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1886_l1890_DUPLICATE_95a3 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1886_l1890_DUPLICATE_95a3_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1861_c2_9393_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c6_7fa4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_9393_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c6_7fa4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_9393_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c6_7fa4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_9393_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c6_7fa4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_9393_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c6_7fa4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_9393_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c6_7fa4_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_9393_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c6_7fa4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_9393_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c6_7fa4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_9393_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c6_7fa4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c2_9393_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c6_7fa4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1861_c2_9393_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c6_7fa4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1874_c7_7f17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_4405_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7f17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_4405_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7f17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_4405_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7f17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_4405_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7f17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_4405_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_7f17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_4405_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1874_c7_7f17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_4405_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1877_c7_c996_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_98d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_c996_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_98d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_c996_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_98d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_c996_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_98d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_c996_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_98d0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1877_c7_c996_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_98d0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1877_c7_c996_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_98d0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1882_c7_2bb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_ceca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2bb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_ceca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2bb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_ceca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_2bb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_ceca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2bb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_ceca_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2bb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_ceca_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1882_c7_2bb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_ceca_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1886_c7_6659_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_dbc0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_6659_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_dbc0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_6659_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_dbc0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_6659_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_dbc0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_6659_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_dbc0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1886_c7_6659_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_dbc0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1890_c7_99ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1890_c11_a268_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_99ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1890_c11_a268_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_99ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1890_c11_a268_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_99ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1890_c11_a268_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_99ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1890_c11_a268_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1890_c7_99ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1890_c11_a268_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1883_c3_4d55_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1878_l1891_l1887_l1883_DUPLICATE_62b3_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1891_c3_17c2_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1878_l1891_l1887_l1883_DUPLICATE_62b3_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1888_DUPLICATE_4667_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1878_l1891_l1887_l1883_DUPLICATE_62b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7f17_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1890_l1882_l1886_l1877_l1874_DUPLICATE_0657_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_c996_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1890_l1882_l1886_l1877_l1874_DUPLICATE_0657_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_2bb6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1890_l1882_l1886_l1877_l1874_DUPLICATE_0657_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_6659_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1890_l1882_l1886_l1877_l1874_DUPLICATE_0657_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_99ef_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1890_l1882_l1886_l1877_l1874_DUPLICATE_0657_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7f17_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1890_l1882_l1886_l1877_l1874_DUPLICATE_30f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_c996_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1890_l1882_l1886_l1877_l1874_DUPLICATE_30f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2bb6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1890_l1882_l1886_l1877_l1874_DUPLICATE_30f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_6659_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1890_l1882_l1886_l1877_l1874_DUPLICATE_30f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_99ef_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1890_l1882_l1886_l1877_l1874_DUPLICATE_30f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7f17_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1890_l1882_l1886_l1877_l1874_DUPLICATE_17f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_c996_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1890_l1882_l1886_l1877_l1874_DUPLICATE_17f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2bb6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1890_l1882_l1886_l1877_l1874_DUPLICATE_17f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_6659_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1890_l1882_l1886_l1877_l1874_DUPLICATE_17f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_99ef_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1890_l1882_l1886_l1877_l1874_DUPLICATE_17f7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_6659_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1886_l1890_DUPLICATE_95a3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_99ef_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1886_l1890_DUPLICATE_95a3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1890_l1882_l1886_l1877_l1874_l1861_DUPLICATE_b3e9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_7f17_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1890_l1882_l1886_l1877_l1874_l1861_DUPLICATE_b3e9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1877_c7_c996_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1890_l1882_l1886_l1877_l1874_l1861_DUPLICATE_b3e9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2bb6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1890_l1882_l1886_l1877_l1874_l1861_DUPLICATE_b3e9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1886_c7_6659_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1890_l1882_l1886_l1877_l1874_l1861_DUPLICATE_b3e9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1890_c7_99ef_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1890_l1882_l1886_l1877_l1874_l1861_DUPLICATE_b3e9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1861_c2_9393_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1861_c2_9393_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1861_c2_9393_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1861_c2_9393_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_99ef_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1892_c30_c1e2_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l1861_c2_9393] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_9393_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_9393_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_9393_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_9393_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1891_c3_17c2] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1891_c3_17c2_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1891_c3_17c2_left;
     BIN_OP_OR_uxn_opcodes_h_l1891_c3_17c2_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1891_c3_17c2_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1891_c3_17c2_return_output := BIN_OP_OR_uxn_opcodes_h_l1891_c3_17c2_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1861_c2_9393] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_9393_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_9393_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_9393_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_9393_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1890_c7_99ef] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_99ef_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_99ef_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_99ef_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_99ef_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_99ef_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_99ef_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_99ef_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_99ef_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1890_c7_99ef] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_99ef_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_99ef_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_99ef_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_99ef_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_99ef_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_99ef_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_99ef_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_99ef_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1861_c2_9393] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_9393_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_9393_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_9393_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_9393_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1890_c7_99ef] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_99ef_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_99ef_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_99ef_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_99ef_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_99ef_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_99ef_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_99ef_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_99ef_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1888_DUPLICATE_4667 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1888_DUPLICATE_4667_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1888_DUPLICATE_4667_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1888_DUPLICATE_4667_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1888_DUPLICATE_4667_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1883_c3_4d55] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1883_c3_4d55_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1883_c3_4d55_left;
     BIN_OP_OR_uxn_opcodes_h_l1883_c3_4d55_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1883_c3_4d55_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1883_c3_4d55_return_output := BIN_OP_OR_uxn_opcodes_h_l1883_c3_4d55_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1861_c2_9393] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_9393_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_9393_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_9393_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_9393_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1890_c7_99ef] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_99ef_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_99ef_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_99ef_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_99ef_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_99ef_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_99ef_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_99ef_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_99ef_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1882_c7_2bb6_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1883_c3_4d55_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1895_c21_d364_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1891_c3_17c2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1890_c7_99ef_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1891_c3_17c2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1886_c7_6659_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1888_DUPLICATE_4667_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1877_c7_c996_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1888_DUPLICATE_4667_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_6659_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_99ef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_6659_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_99ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_6659_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_99ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_6659_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_99ef_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1886_c7_6659] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_6659_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_6659_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_6659_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_6659_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_6659_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_6659_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_6659_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_6659_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1886_c7_6659] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_6659_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_6659_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_6659_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_6659_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_6659_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_6659_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_6659_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_6659_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1886_c7_6659] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_6659_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_6659_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_6659_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_6659_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_6659_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_6659_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_6659_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_6659_return_output;

     -- n16_MUX[uxn_opcodes_h_l1890_c7_99ef] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1890_c7_99ef_cond <= VAR_n16_MUX_uxn_opcodes_h_l1890_c7_99ef_cond;
     n16_MUX_uxn_opcodes_h_l1890_c7_99ef_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1890_c7_99ef_iftrue;
     n16_MUX_uxn_opcodes_h_l1890_c7_99ef_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1890_c7_99ef_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1890_c7_99ef_return_output := n16_MUX_uxn_opcodes_h_l1890_c7_99ef_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1886_c7_6659] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_6659_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_6659_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_6659_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_6659_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_6659_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_6659_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_6659_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_6659_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1895_c21_d364] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1895_c21_d364_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1895_c21_d364_left;
     BIN_OP_GT_uxn_opcodes_h_l1895_c21_d364_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1895_c21_d364_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1895_c21_d364_return_output := BIN_OP_GT_uxn_opcodes_h_l1895_c21_d364_return_output;

     -- t16_MUX[uxn_opcodes_h_l1882_c7_2bb6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1882_c7_2bb6_cond <= VAR_t16_MUX_uxn_opcodes_h_l1882_c7_2bb6_cond;
     t16_MUX_uxn_opcodes_h_l1882_c7_2bb6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1882_c7_2bb6_iftrue;
     t16_MUX_uxn_opcodes_h_l1882_c7_2bb6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1882_c7_2bb6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1882_c7_2bb6_return_output := t16_MUX_uxn_opcodes_h_l1882_c7_2bb6_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1895_c21_1cfa_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1895_c21_d364_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1886_c7_6659_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1890_c7_99ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2bb6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_6659_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2bb6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_6659_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_2bb6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_6659_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2bb6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_6659_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1877_c7_c996_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1882_c7_2bb6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1882_c7_2bb6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2bb6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2bb6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2bb6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2bb6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2bb6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2bb6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2bb6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2bb6_return_output;

     -- n16_MUX[uxn_opcodes_h_l1886_c7_6659] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1886_c7_6659_cond <= VAR_n16_MUX_uxn_opcodes_h_l1886_c7_6659_cond;
     n16_MUX_uxn_opcodes_h_l1886_c7_6659_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1886_c7_6659_iftrue;
     n16_MUX_uxn_opcodes_h_l1886_c7_6659_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1886_c7_6659_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1886_c7_6659_return_output := n16_MUX_uxn_opcodes_h_l1886_c7_6659_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1882_c7_2bb6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_2bb6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_2bb6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_2bb6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_2bb6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_2bb6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_2bb6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_2bb6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_2bb6_return_output;

     -- t16_MUX[uxn_opcodes_h_l1877_c7_c996] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1877_c7_c996_cond <= VAR_t16_MUX_uxn_opcodes_h_l1877_c7_c996_cond;
     t16_MUX_uxn_opcodes_h_l1877_c7_c996_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1877_c7_c996_iftrue;
     t16_MUX_uxn_opcodes_h_l1877_c7_c996_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1877_c7_c996_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1877_c7_c996_return_output := t16_MUX_uxn_opcodes_h_l1877_c7_c996_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1882_c7_2bb6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2bb6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2bb6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2bb6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2bb6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2bb6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2bb6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2bb6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2bb6_return_output;

     -- MUX[uxn_opcodes_h_l1895_c21_1cfa] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1895_c21_1cfa_cond <= VAR_MUX_uxn_opcodes_h_l1895_c21_1cfa_cond;
     MUX_uxn_opcodes_h_l1895_c21_1cfa_iftrue <= VAR_MUX_uxn_opcodes_h_l1895_c21_1cfa_iftrue;
     MUX_uxn_opcodes_h_l1895_c21_1cfa_iffalse <= VAR_MUX_uxn_opcodes_h_l1895_c21_1cfa_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1895_c21_1cfa_return_output := MUX_uxn_opcodes_h_l1895_c21_1cfa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1882_c7_2bb6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2bb6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2bb6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2bb6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2bb6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2bb6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2bb6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2bb6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2bb6_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1890_c7_99ef_iftrue := VAR_MUX_uxn_opcodes_h_l1895_c21_1cfa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1882_c7_2bb6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1886_c7_6659_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_c996_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2bb6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_c996_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2bb6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_c996_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_2bb6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_c996_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2bb6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1874_c7_7f17_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1877_c7_c996_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1877_c7_c996] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_c996_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_c996_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_c996_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_c996_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_c996_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_c996_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_c996_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_c996_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1877_c7_c996] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_c996_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_c996_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_c996_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_c996_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_c996_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_c996_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_c996_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_c996_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1877_c7_c996] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_c996_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_c996_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_c996_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_c996_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_c996_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_c996_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_c996_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_c996_return_output;

     -- n16_MUX[uxn_opcodes_h_l1882_c7_2bb6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1882_c7_2bb6_cond <= VAR_n16_MUX_uxn_opcodes_h_l1882_c7_2bb6_cond;
     n16_MUX_uxn_opcodes_h_l1882_c7_2bb6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1882_c7_2bb6_iftrue;
     n16_MUX_uxn_opcodes_h_l1882_c7_2bb6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1882_c7_2bb6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1882_c7_2bb6_return_output := n16_MUX_uxn_opcodes_h_l1882_c7_2bb6_return_output;

     -- t16_MUX[uxn_opcodes_h_l1874_c7_7f17] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1874_c7_7f17_cond <= VAR_t16_MUX_uxn_opcodes_h_l1874_c7_7f17_cond;
     t16_MUX_uxn_opcodes_h_l1874_c7_7f17_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1874_c7_7f17_iftrue;
     t16_MUX_uxn_opcodes_h_l1874_c7_7f17_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1874_c7_7f17_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1874_c7_7f17_return_output := t16_MUX_uxn_opcodes_h_l1874_c7_7f17_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1890_c7_99ef] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1890_c7_99ef_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1890_c7_99ef_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1890_c7_99ef_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1890_c7_99ef_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1890_c7_99ef_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1890_c7_99ef_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1890_c7_99ef_return_output := result_u8_value_MUX_uxn_opcodes_h_l1890_c7_99ef_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1877_c7_c996] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_c996_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_c996_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_c996_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_c996_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_c996_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_c996_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_c996_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_c996_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1877_c7_c996_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1882_c7_2bb6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7f17_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_c996_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7f17_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_c996_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7f17_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_c996_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7f17_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_c996_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1886_c7_6659_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1890_c7_99ef_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1874_c7_7f17_return_output;
     -- t16_MUX[uxn_opcodes_h_l1861_c2_9393] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1861_c2_9393_cond <= VAR_t16_MUX_uxn_opcodes_h_l1861_c2_9393_cond;
     t16_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue;
     t16_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1861_c2_9393_return_output := t16_MUX_uxn_opcodes_h_l1861_c2_9393_return_output;

     -- n16_MUX[uxn_opcodes_h_l1877_c7_c996] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1877_c7_c996_cond <= VAR_n16_MUX_uxn_opcodes_h_l1877_c7_c996_cond;
     n16_MUX_uxn_opcodes_h_l1877_c7_c996_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1877_c7_c996_iftrue;
     n16_MUX_uxn_opcodes_h_l1877_c7_c996_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1877_c7_c996_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1877_c7_c996_return_output := n16_MUX_uxn_opcodes_h_l1877_c7_c996_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1874_c7_7f17] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7f17_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7f17_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7f17_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7f17_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7f17_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7f17_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7f17_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7f17_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1886_c7_6659] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1886_c7_6659_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1886_c7_6659_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1886_c7_6659_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1886_c7_6659_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1886_c7_6659_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1886_c7_6659_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1886_c7_6659_return_output := result_u8_value_MUX_uxn_opcodes_h_l1886_c7_6659_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1874_c7_7f17] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7f17_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7f17_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7f17_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7f17_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7f17_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7f17_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7f17_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7f17_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1874_c7_7f17] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7f17_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7f17_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7f17_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7f17_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7f17_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7f17_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7f17_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7f17_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1874_c7_7f17] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7f17_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7f17_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7f17_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7f17_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7f17_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7f17_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7f17_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7f17_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1874_c7_7f17_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1877_c7_c996_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7f17_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_7f17_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7f17_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_7f17_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2bb6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1886_c7_6659_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1861_c2_9393_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1882_c7_2bb6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2bb6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2bb6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2bb6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2bb6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2bb6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2bb6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2bb6_return_output := result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2bb6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1861_c2_9393] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_9393_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_9393_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_9393_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_9393_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1861_c2_9393] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_9393_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_9393_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_9393_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_9393_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1861_c2_9393] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_9393_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_9393_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_9393_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_9393_return_output;

     -- n16_MUX[uxn_opcodes_h_l1874_c7_7f17] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1874_c7_7f17_cond <= VAR_n16_MUX_uxn_opcodes_h_l1874_c7_7f17_cond;
     n16_MUX_uxn_opcodes_h_l1874_c7_7f17_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1874_c7_7f17_iftrue;
     n16_MUX_uxn_opcodes_h_l1874_c7_7f17_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1874_c7_7f17_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1874_c7_7f17_return_output := n16_MUX_uxn_opcodes_h_l1874_c7_7f17_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1861_c2_9393] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_9393_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_9393_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_9393_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_9393_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1874_c7_7f17_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1877_c7_c996_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2bb6_return_output;
     -- n16_MUX[uxn_opcodes_h_l1861_c2_9393] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1861_c2_9393_cond <= VAR_n16_MUX_uxn_opcodes_h_l1861_c2_9393_cond;
     n16_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue;
     n16_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1861_c2_9393_return_output := n16_MUX_uxn_opcodes_h_l1861_c2_9393_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1877_c7_c996] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1877_c7_c996_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1877_c7_c996_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1877_c7_c996_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1877_c7_c996_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1877_c7_c996_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1877_c7_c996_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1877_c7_c996_return_output := result_u8_value_MUX_uxn_opcodes_h_l1877_c7_c996_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1861_c2_9393_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_7f17_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1877_c7_c996_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1874_c7_7f17] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1874_c7_7f17_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_7f17_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1874_c7_7f17_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_7f17_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1874_c7_7f17_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_7f17_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_7f17_return_output := result_u8_value_MUX_uxn_opcodes_h_l1874_c7_7f17_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_7f17_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1861_c2_9393] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1861_c2_9393_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c2_9393_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c2_9393_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c2_9393_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c2_9393_return_output := result_u8_value_MUX_uxn_opcodes_h_l1861_c2_9393_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l1899_l1857_DUPLICATE_0778 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l1899_l1857_DUPLICATE_0778_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a47b(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_9393_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_9393_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_9393_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_9393_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_9393_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_9393_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_9393_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c2_9393_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_9393_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l1899_l1857_DUPLICATE_0778_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l1899_l1857_DUPLICATE_0778_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
