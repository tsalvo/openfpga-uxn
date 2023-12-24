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
-- Submodules: 61
entity ldr2_0CLK_b7cf2331 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ldr2_0CLK_b7cf2331;
architecture arch of ldr2_0CLK_b7cf2331 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8_high : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8_low : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_tmp8_high : unsigned(7 downto 0);
signal REG_COMB_tmp8_low : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1655_c6_1fa0]
signal BIN_OP_EQ_uxn_opcodes_h_l1655_c6_1fa0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1655_c6_1fa0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1655_c6_1fa0_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1655_c2_64a8]
signal tmp8_low_MUX_uxn_opcodes_h_l1655_c2_64a8_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1655_c2_64a8]
signal tmp8_high_MUX_uxn_opcodes_h_l1655_c2_64a8_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1655_c2_64a8]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_64a8_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1655_c2_64a8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_64a8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1655_c2_64a8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_64a8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1655_c2_64a8]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_64a8_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1655_c2_64a8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_64a8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1655_c2_64a8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_64a8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1655_c2_64a8]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_64a8_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1655_c2_64a8]
signal result_u16_value_MUX_uxn_opcodes_h_l1655_c2_64a8_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1655_c2_64a8]
signal result_u8_value_MUX_uxn_opcodes_h_l1655_c2_64a8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1655_c2_64a8]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_64a8_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1655_c2_64a8]
signal t8_MUX_uxn_opcodes_h_l1655_c2_64a8_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1668_c11_d95b]
signal BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d95b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d95b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d95b_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1668_c7_ab60]
signal tmp8_low_MUX_uxn_opcodes_h_l1668_c7_ab60_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1668_c7_ab60]
signal tmp8_high_MUX_uxn_opcodes_h_l1668_c7_ab60_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1668_c7_ab60]
signal result_u16_value_MUX_uxn_opcodes_h_l1668_c7_ab60_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1668_c7_ab60]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_ab60_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1668_c7_ab60]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_ab60_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1668_c7_ab60]
signal result_u8_value_MUX_uxn_opcodes_h_l1668_c7_ab60_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1668_c7_ab60]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_ab60_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1668_c7_ab60]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_ab60_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1668_c7_ab60]
signal t8_MUX_uxn_opcodes_h_l1668_c7_ab60_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1669_c30_fab4]
signal sp_relative_shift_uxn_opcodes_h_l1669_c30_fab4_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1669_c30_fab4_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1669_c30_fab4_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1669_c30_fab4_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1671_c11_7040]
signal BIN_OP_EQ_uxn_opcodes_h_l1671_c11_7040_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1671_c11_7040_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1671_c11_7040_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1671_c7_5595]
signal tmp8_low_MUX_uxn_opcodes_h_l1671_c7_5595_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1671_c7_5595_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1671_c7_5595]
signal tmp8_high_MUX_uxn_opcodes_h_l1671_c7_5595_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1671_c7_5595_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1671_c7_5595]
signal result_u16_value_MUX_uxn_opcodes_h_l1671_c7_5595_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1671_c7_5595_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1671_c7_5595]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_5595_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_5595_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1671_c7_5595]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_5595_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_5595_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1671_c7_5595]
signal result_u8_value_MUX_uxn_opcodes_h_l1671_c7_5595_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1671_c7_5595_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1671_c7_5595]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_5595_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_5595_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1671_c7_5595]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_5595_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_5595_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1671_c7_5595]
signal t8_MUX_uxn_opcodes_h_l1671_c7_5595_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1671_c7_5595_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1674_c22_c84b]
signal BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_c84b_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_c84b_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_c84b_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1676_c11_5893]
signal BIN_OP_EQ_uxn_opcodes_h_l1676_c11_5893_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1676_c11_5893_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1676_c11_5893_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1676_c7_cf4a]
signal tmp8_low_MUX_uxn_opcodes_h_l1676_c7_cf4a_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1676_c7_cf4a_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1676_c7_cf4a_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1676_c7_cf4a_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1676_c7_cf4a]
signal tmp8_high_MUX_uxn_opcodes_h_l1676_c7_cf4a_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1676_c7_cf4a_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1676_c7_cf4a_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1676_c7_cf4a_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1676_c7_cf4a]
signal result_u16_value_MUX_uxn_opcodes_h_l1676_c7_cf4a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1676_c7_cf4a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1676_c7_cf4a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1676_c7_cf4a_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1676_c7_cf4a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_cf4a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_cf4a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_cf4a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_cf4a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1676_c7_cf4a]
signal result_u8_value_MUX_uxn_opcodes_h_l1676_c7_cf4a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1676_c7_cf4a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1676_c7_cf4a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1676_c7_cf4a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1676_c7_cf4a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_cf4a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_cf4a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_cf4a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_cf4a_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1676_c7_cf4a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_cf4a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_cf4a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_cf4a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_cf4a_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1677_c22_7b21]
signal BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_7b21_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_7b21_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_7b21_return_output : signed(17 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1677_c22_843e]
signal BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_843e_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_843e_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_843e_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1679_c11_cda4]
signal BIN_OP_EQ_uxn_opcodes_h_l1679_c11_cda4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1679_c11_cda4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1679_c11_cda4_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1679_c7_6871]
signal tmp8_low_MUX_uxn_opcodes_h_l1679_c7_6871_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1679_c7_6871_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1679_c7_6871_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1679_c7_6871_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1679_c7_6871]
signal tmp8_high_MUX_uxn_opcodes_h_l1679_c7_6871_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1679_c7_6871_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1679_c7_6871_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1679_c7_6871_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1679_c7_6871]
signal result_u8_value_MUX_uxn_opcodes_h_l1679_c7_6871_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1679_c7_6871_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1679_c7_6871_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1679_c7_6871_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1679_c7_6871]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_6871_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_6871_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_6871_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_6871_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1679_c7_6871]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_6871_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_6871_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_6871_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_6871_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1679_c7_6871]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_6871_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_6871_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_6871_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_6871_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1685_c11_7c6d]
signal BIN_OP_EQ_uxn_opcodes_h_l1685_c11_7c6d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1685_c11_7c6d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1685_c11_7c6d_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1685_c7_b7ea]
signal tmp8_low_MUX_uxn_opcodes_h_l1685_c7_b7ea_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1685_c7_b7ea_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1685_c7_b7ea_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1685_c7_b7ea_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1685_c7_b7ea]
signal result_u8_value_MUX_uxn_opcodes_h_l1685_c7_b7ea_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1685_c7_b7ea_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1685_c7_b7ea_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1685_c7_b7ea_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1685_c7_b7ea]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_b7ea_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_b7ea_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_b7ea_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_b7ea_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1685_c7_b7ea]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_b7ea_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_b7ea_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_b7ea_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_b7ea_return_output : unsigned(3 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1655_c6_1fa0
BIN_OP_EQ_uxn_opcodes_h_l1655_c6_1fa0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1655_c6_1fa0_left,
BIN_OP_EQ_uxn_opcodes_h_l1655_c6_1fa0_right,
BIN_OP_EQ_uxn_opcodes_h_l1655_c6_1fa0_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1655_c2_64a8
tmp8_low_MUX_uxn_opcodes_h_l1655_c2_64a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1655_c2_64a8_cond,
tmp8_low_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1655_c2_64a8
tmp8_high_MUX_uxn_opcodes_h_l1655_c2_64a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1655_c2_64a8_cond,
tmp8_high_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_64a8
result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_64a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_64a8_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_64a8
result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_64a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_64a8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_64a8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_64a8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_64a8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_64a8
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_64a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_64a8_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_64a8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_64a8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_64a8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_64a8
result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_64a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_64a8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_64a8
result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_64a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_64a8_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1655_c2_64a8
result_u16_value_MUX_uxn_opcodes_h_l1655_c2_64a8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1655_c2_64a8_cond,
result_u16_value_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1655_c2_64a8
result_u8_value_MUX_uxn_opcodes_h_l1655_c2_64a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1655_c2_64a8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_64a8
result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_64a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_64a8_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output);

-- t8_MUX_uxn_opcodes_h_l1655_c2_64a8
t8_MUX_uxn_opcodes_h_l1655_c2_64a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1655_c2_64a8_cond,
t8_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue,
t8_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse,
t8_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d95b
BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d95b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d95b_left,
BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d95b_right,
BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d95b_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1668_c7_ab60
tmp8_low_MUX_uxn_opcodes_h_l1668_c7_ab60 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1668_c7_ab60_cond,
tmp8_low_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1668_c7_ab60
tmp8_high_MUX_uxn_opcodes_h_l1668_c7_ab60 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1668_c7_ab60_cond,
tmp8_high_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1668_c7_ab60
result_u16_value_MUX_uxn_opcodes_h_l1668_c7_ab60 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1668_c7_ab60_cond,
result_u16_value_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_ab60
result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_ab60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_ab60_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_ab60
result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_ab60 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_ab60_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1668_c7_ab60
result_u8_value_MUX_uxn_opcodes_h_l1668_c7_ab60 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1668_c7_ab60_cond,
result_u8_value_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_ab60
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_ab60 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_ab60_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_ab60
result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_ab60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_ab60_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output);

-- t8_MUX_uxn_opcodes_h_l1668_c7_ab60
t8_MUX_uxn_opcodes_h_l1668_c7_ab60 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1668_c7_ab60_cond,
t8_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue,
t8_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse,
t8_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1669_c30_fab4
sp_relative_shift_uxn_opcodes_h_l1669_c30_fab4 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1669_c30_fab4_ins,
sp_relative_shift_uxn_opcodes_h_l1669_c30_fab4_x,
sp_relative_shift_uxn_opcodes_h_l1669_c30_fab4_y,
sp_relative_shift_uxn_opcodes_h_l1669_c30_fab4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1671_c11_7040
BIN_OP_EQ_uxn_opcodes_h_l1671_c11_7040 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1671_c11_7040_left,
BIN_OP_EQ_uxn_opcodes_h_l1671_c11_7040_right,
BIN_OP_EQ_uxn_opcodes_h_l1671_c11_7040_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1671_c7_5595
tmp8_low_MUX_uxn_opcodes_h_l1671_c7_5595 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1671_c7_5595_cond,
tmp8_low_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1671_c7_5595_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1671_c7_5595
tmp8_high_MUX_uxn_opcodes_h_l1671_c7_5595 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1671_c7_5595_cond,
tmp8_high_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1671_c7_5595_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1671_c7_5595
result_u16_value_MUX_uxn_opcodes_h_l1671_c7_5595 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1671_c7_5595_cond,
result_u16_value_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1671_c7_5595_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_5595
result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_5595 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_5595_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_5595_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_5595
result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_5595 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_5595_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_5595_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1671_c7_5595
result_u8_value_MUX_uxn_opcodes_h_l1671_c7_5595 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1671_c7_5595_cond,
result_u8_value_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1671_c7_5595_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_5595
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_5595 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_5595_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_5595_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_5595
result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_5595 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_5595_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_5595_return_output);

-- t8_MUX_uxn_opcodes_h_l1671_c7_5595
t8_MUX_uxn_opcodes_h_l1671_c7_5595 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1671_c7_5595_cond,
t8_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue,
t8_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse,
t8_MUX_uxn_opcodes_h_l1671_c7_5595_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_c84b
BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_c84b : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_c84b_left,
BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_c84b_right,
BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_c84b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1676_c11_5893
BIN_OP_EQ_uxn_opcodes_h_l1676_c11_5893 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1676_c11_5893_left,
BIN_OP_EQ_uxn_opcodes_h_l1676_c11_5893_right,
BIN_OP_EQ_uxn_opcodes_h_l1676_c11_5893_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1676_c7_cf4a
tmp8_low_MUX_uxn_opcodes_h_l1676_c7_cf4a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1676_c7_cf4a_cond,
tmp8_low_MUX_uxn_opcodes_h_l1676_c7_cf4a_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1676_c7_cf4a_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1676_c7_cf4a_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1676_c7_cf4a
tmp8_high_MUX_uxn_opcodes_h_l1676_c7_cf4a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1676_c7_cf4a_cond,
tmp8_high_MUX_uxn_opcodes_h_l1676_c7_cf4a_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1676_c7_cf4a_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1676_c7_cf4a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1676_c7_cf4a
result_u16_value_MUX_uxn_opcodes_h_l1676_c7_cf4a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1676_c7_cf4a_cond,
result_u16_value_MUX_uxn_opcodes_h_l1676_c7_cf4a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1676_c7_cf4a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1676_c7_cf4a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_cf4a
result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_cf4a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_cf4a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_cf4a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_cf4a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_cf4a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1676_c7_cf4a
result_u8_value_MUX_uxn_opcodes_h_l1676_c7_cf4a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1676_c7_cf4a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1676_c7_cf4a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1676_c7_cf4a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1676_c7_cf4a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_cf4a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_cf4a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_cf4a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_cf4a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_cf4a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_cf4a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_cf4a
result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_cf4a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_cf4a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_cf4a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_cf4a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_cf4a_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_7b21
BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_7b21 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_7b21_left,
BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_7b21_right,
BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_7b21_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_843e
BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_843e : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_843e_left,
BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_843e_right,
BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_843e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1679_c11_cda4
BIN_OP_EQ_uxn_opcodes_h_l1679_c11_cda4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1679_c11_cda4_left,
BIN_OP_EQ_uxn_opcodes_h_l1679_c11_cda4_right,
BIN_OP_EQ_uxn_opcodes_h_l1679_c11_cda4_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1679_c7_6871
tmp8_low_MUX_uxn_opcodes_h_l1679_c7_6871 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1679_c7_6871_cond,
tmp8_low_MUX_uxn_opcodes_h_l1679_c7_6871_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1679_c7_6871_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1679_c7_6871_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1679_c7_6871
tmp8_high_MUX_uxn_opcodes_h_l1679_c7_6871 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1679_c7_6871_cond,
tmp8_high_MUX_uxn_opcodes_h_l1679_c7_6871_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1679_c7_6871_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1679_c7_6871_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1679_c7_6871
result_u8_value_MUX_uxn_opcodes_h_l1679_c7_6871 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1679_c7_6871_cond,
result_u8_value_MUX_uxn_opcodes_h_l1679_c7_6871_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1679_c7_6871_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1679_c7_6871_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_6871
result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_6871 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_6871_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_6871_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_6871_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_6871_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_6871
result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_6871 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_6871_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_6871_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_6871_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_6871_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_6871
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_6871 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_6871_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_6871_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_6871_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_6871_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1685_c11_7c6d
BIN_OP_EQ_uxn_opcodes_h_l1685_c11_7c6d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1685_c11_7c6d_left,
BIN_OP_EQ_uxn_opcodes_h_l1685_c11_7c6d_right,
BIN_OP_EQ_uxn_opcodes_h_l1685_c11_7c6d_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1685_c7_b7ea
tmp8_low_MUX_uxn_opcodes_h_l1685_c7_b7ea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1685_c7_b7ea_cond,
tmp8_low_MUX_uxn_opcodes_h_l1685_c7_b7ea_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1685_c7_b7ea_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1685_c7_b7ea_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1685_c7_b7ea
result_u8_value_MUX_uxn_opcodes_h_l1685_c7_b7ea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1685_c7_b7ea_cond,
result_u8_value_MUX_uxn_opcodes_h_l1685_c7_b7ea_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1685_c7_b7ea_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1685_c7_b7ea_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_b7ea
result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_b7ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_b7ea_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_b7ea_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_b7ea_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_b7ea_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_b7ea
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_b7ea : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_b7ea_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_b7ea_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_b7ea_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_b7ea_return_output);



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
 tmp8_high,
 tmp8_low,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1655_c6_1fa0_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output,
 t8_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d95b_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output,
 t8_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output,
 sp_relative_shift_uxn_opcodes_h_l1669_c30_fab4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1671_c11_7040_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1671_c7_5595_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1671_c7_5595_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1671_c7_5595_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_5595_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_5595_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1671_c7_5595_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_5595_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_5595_return_output,
 t8_MUX_uxn_opcodes_h_l1671_c7_5595_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_c84b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1676_c11_5893_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1676_c7_cf4a_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1676_c7_cf4a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1676_c7_cf4a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_cf4a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1676_c7_cf4a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_cf4a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_cf4a_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_7b21_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_843e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1679_c11_cda4_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1679_c7_6871_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1679_c7_6871_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1679_c7_6871_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_6871_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_6871_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_6871_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1685_c11_7c6d_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1685_c7_b7ea_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1685_c7_b7ea_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_b7ea_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_b7ea_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_1fa0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_1fa0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_1fa0_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c2_64a8_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c2_64a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1655_c2_64a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_64a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_64a8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1660_c3_0404 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_64a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1655_c2_64a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_64a8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1665_c3_7a91 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_64a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_64a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1655_c2_64a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_64a8_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c2_64a8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c2_64a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1655_c2_64a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_64a8_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1655_c2_64a8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d95b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d95b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d95b_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1671_c7_5595_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_ab60_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1671_c7_5595_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1668_c7_ab60_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1671_c7_5595_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1668_c7_ab60_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_5595_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_ab60_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_5595_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_ab60_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1671_c7_5595_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_ab60_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_5595_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_ab60_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_5595_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_ab60_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1671_c7_5595_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1668_c7_ab60_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1669_c30_fab4_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1669_c30_fab4_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1669_c30_fab4_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1669_c30_fab4_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1671_c11_7040_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1671_c11_7040_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1671_c11_7040_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1676_c7_cf4a_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1671_c7_5595_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1676_c7_cf4a_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1671_c7_5595_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1674_c3_d1d7 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1676_c7_cf4a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1671_c7_5595_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_cf4a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_5595_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1673_c3_959c : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1671_c7_5595_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_5595_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1676_c7_cf4a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1671_c7_5595_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_cf4a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_5595_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_cf4a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_5595_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1671_c7_5595_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_c84b_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1674_c27_3ee5_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_c84b_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_c84b_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_5893_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_5893_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_5893_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1676_c7_cf4a_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1676_c7_cf4a_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1679_c7_6871_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1676_c7_cf4a_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1676_c7_cf4a_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1676_c7_cf4a_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1679_c7_6871_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1676_c7_cf4a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1676_c7_cf4a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1677_c3_8634 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1676_c7_cf4a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1676_c7_cf4a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_cf4a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_cf4a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_6871_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_cf4a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1676_c7_cf4a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1676_c7_cf4a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1679_c7_6871_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1676_c7_cf4a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_cf4a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_cf4a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_6871_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_cf4a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_cf4a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_cf4a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_6871_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_cf4a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_7b21_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1677_c27_e585_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_7b21_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_7b21_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_843e_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_843e_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_843e_return_output : signed(18 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_cda4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_cda4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_cda4_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1679_c7_6871_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1679_c7_6871_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1685_c7_b7ea_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1679_c7_6871_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1679_c7_6871_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1679_c7_6871_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1679_c7_6871_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1679_c7_6871_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1679_c7_6871_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1685_c7_b7ea_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1679_c7_6871_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_6871_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_6871_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_b7ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_6871_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_6871_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_6871_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_6871_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_6871_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1682_c3_4a50 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_6871_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_b7ea_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_6871_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_7c6d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_7c6d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_7c6d_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1685_c7_b7ea_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1685_c7_b7ea_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1685_c7_b7ea_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1685_c7_b7ea_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1685_c7_b7ea_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1685_c7_b7ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_b7ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_b7ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_b7ea_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_b7ea_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1687_c3_fc88 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_b7ea_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_b7ea_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1655_l1676_l1668_DUPLICATE_c305_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1655_l1685_l1676_l1671_l1668_DUPLICATE_9477_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1685_l1679_l1676_l1671_l1668_DUPLICATE_f43b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1685_l1676_l1668_l1671_DUPLICATE_ccb1_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1676_l1668_l1679_l1671_DUPLICATE_49d2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_42c1_uxn_opcodes_h_l1692_l1651_DUPLICATE_8c84_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_tmp8_high : unsigned(7 downto 0);
variable REG_VAR_tmp8_low : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_tmp8_high := tmp8_high;
  REG_VAR_tmp8_low := tmp8_low;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1673_c3_959c := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1673_c3_959c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_cda4_right := to_unsigned(4, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_b7ea_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1669_c30_fab4_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1687_c3_fc88 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_b7ea_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1687_c3_fc88;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1660_c3_0404 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1660_c3_0404;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1665_c3_7a91 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1665_c3_7a91;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d95b_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1669_c30_fab4_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_843e_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_7c6d_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1671_c11_7040_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_6871_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_1fa0_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1682_c3_4a50 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_6871_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1682_c3_4a50;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_5893_right := to_unsigned(3, 2);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1669_c30_fab4_ins := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_c84b_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_7b21_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_1fa0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d95b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1671_c11_7040_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_5893_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_cda4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_7c6d_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1679_c7_6871_iftrue := VAR_previous_ram_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1685_c7_b7ea_iftrue := VAR_previous_ram_read;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1679_c7_6871_iftrue := VAR_previous_ram_read;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1685_c7_b7ea_iftrue := VAR_previous_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse := t8;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1676_c7_cf4a_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1679_c7_6871_iffalse := tmp8_high;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1676_c7_cf4a_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1679_c7_6871_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1685_c7_b7ea_iffalse := tmp8_low;
     -- BIN_OP_EQ[uxn_opcodes_h_l1671_c11_7040] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1671_c11_7040_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1671_c11_7040_left;
     BIN_OP_EQ_uxn_opcodes_h_l1671_c11_7040_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1671_c11_7040_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1671_c11_7040_return_output := BIN_OP_EQ_uxn_opcodes_h_l1671_c11_7040_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1676_c11_5893] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1676_c11_5893_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_5893_left;
     BIN_OP_EQ_uxn_opcodes_h_l1676_c11_5893_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_5893_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_5893_return_output := BIN_OP_EQ_uxn_opcodes_h_l1676_c11_5893_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1685_c11_7c6d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1685_c11_7c6d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_7c6d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1685_c11_7c6d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_7c6d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_7c6d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1685_c11_7c6d_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1677_c27_e585] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1677_c27_e585_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1655_c2_64a8] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1655_c2_64a8_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1685_l1679_l1676_l1671_l1668_DUPLICATE_f43b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1685_l1679_l1676_l1671_l1668_DUPLICATE_f43b_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1676_l1668_l1679_l1671_DUPLICATE_49d2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1676_l1668_l1679_l1671_DUPLICATE_49d2_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1679_c11_cda4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1679_c11_cda4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_cda4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1679_c11_cda4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_cda4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_cda4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1679_c11_cda4_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1655_l1685_l1676_l1671_l1668_DUPLICATE_9477 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1655_l1685_l1676_l1671_l1668_DUPLICATE_9477_return_output := result.u8_value;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1685_l1676_l1668_l1671_DUPLICATE_ccb1 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1685_l1676_l1668_l1671_DUPLICATE_ccb1_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1655_l1676_l1668_DUPLICATE_c305 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1655_l1676_l1668_DUPLICATE_c305_return_output := result.u16_value;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l1671_c7_5595] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1671_c7_5595_return_output := result.sp_relative_shift;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1655_c2_64a8] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1655_c2_64a8_return_output := result.is_ram_write;

     -- sp_relative_shift[uxn_opcodes_h_l1669_c30_fab4] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1669_c30_fab4_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1669_c30_fab4_ins;
     sp_relative_shift_uxn_opcodes_h_l1669_c30_fab4_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1669_c30_fab4_x;
     sp_relative_shift_uxn_opcodes_h_l1669_c30_fab4_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1669_c30_fab4_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1669_c30_fab4_return_output := sp_relative_shift_uxn_opcodes_h_l1669_c30_fab4_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1655_c2_64a8] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1655_c2_64a8_return_output := result.is_pc_updated;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1674_c27_3ee5] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1674_c27_3ee5_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1655_c2_64a8] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1655_c2_64a8_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1655_c6_1fa0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1655_c6_1fa0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_1fa0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1655_c6_1fa0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_1fa0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_1fa0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1655_c6_1fa0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1668_c11_d95b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d95b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d95b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d95b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d95b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d95b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d95b_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_64a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_1fa0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_64a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_1fa0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_64a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_1fa0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_64a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_1fa0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_64a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_1fa0_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_64a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_1fa0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_64a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_1fa0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_64a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_1fa0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c2_64a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_1fa0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c2_64a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_1fa0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1655_c2_64a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_1fa0_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c2_64a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_1fa0_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c2_64a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_1fa0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_ab60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d95b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_ab60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d95b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_ab60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d95b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_ab60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d95b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1668_c7_ab60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d95b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_ab60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d95b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1668_c7_ab60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d95b_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1668_c7_ab60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d95b_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_ab60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d95b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_5595_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1671_c11_7040_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_5595_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1671_c11_7040_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_5595_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1671_c11_7040_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_5595_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1671_c11_7040_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1671_c7_5595_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1671_c11_7040_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1671_c7_5595_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1671_c11_7040_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1671_c7_5595_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1671_c11_7040_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1671_c7_5595_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1671_c11_7040_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1671_c7_5595_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1671_c11_7040_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_cf4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_5893_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_cf4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_5893_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_cf4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_5893_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1676_c7_cf4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_5893_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1676_c7_cf4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_5893_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1676_c7_cf4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_5893_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1676_c7_cf4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_5893_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_6871_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_cda4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_6871_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_cda4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_6871_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_cda4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1679_c7_6871_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_cda4_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1679_c7_6871_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_cda4_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1679_c7_6871_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_cda4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_b7ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_7c6d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_b7ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_7c6d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1685_c7_b7ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_7c6d_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1685_c7_b7ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_7c6d_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_c84b_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1674_c27_3ee5_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_7b21_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1677_c27_e585_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1655_l1676_l1668_DUPLICATE_c305_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1655_l1676_l1668_DUPLICATE_c305_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1676_c7_cf4a_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1655_l1676_l1668_DUPLICATE_c305_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1685_l1679_l1676_l1671_l1668_DUPLICATE_f43b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1685_l1679_l1676_l1671_l1668_DUPLICATE_f43b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_cf4a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1685_l1679_l1676_l1671_l1668_DUPLICATE_f43b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_6871_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1685_l1679_l1676_l1671_l1668_DUPLICATE_f43b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_b7ea_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1685_l1679_l1676_l1671_l1668_DUPLICATE_f43b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1676_l1668_l1679_l1671_DUPLICATE_49d2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1676_l1668_l1679_l1671_DUPLICATE_49d2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_cf4a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1676_l1668_l1679_l1671_DUPLICATE_49d2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_6871_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1676_l1668_l1679_l1671_DUPLICATE_49d2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1685_l1676_l1668_l1671_DUPLICATE_ccb1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1685_l1676_l1668_l1671_DUPLICATE_ccb1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_cf4a_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1685_l1676_l1668_l1671_DUPLICATE_ccb1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_b7ea_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1685_l1676_l1668_l1671_DUPLICATE_ccb1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1655_l1685_l1676_l1671_l1668_DUPLICATE_9477_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1655_l1685_l1676_l1671_l1668_DUPLICATE_9477_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1655_l1685_l1676_l1671_l1668_DUPLICATE_9477_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1676_c7_cf4a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1655_l1685_l1676_l1671_l1668_DUPLICATE_9477_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1685_c7_b7ea_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1655_l1685_l1676_l1671_l1668_DUPLICATE_9477_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1655_c2_64a8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1655_c2_64a8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1655_c2_64a8_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1655_c2_64a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1671_c7_5595_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1669_c30_fab4_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1655_c2_64a8] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_64a8_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_64a8_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1671_c7_5595] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_5595_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_5595_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_5595_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_5595_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1655_c2_64a8] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_64a8_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_64a8_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1685_c7_b7ea] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1685_c7_b7ea_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1685_c7_b7ea_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1685_c7_b7ea_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1685_c7_b7ea_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1685_c7_b7ea_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1685_c7_b7ea_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1685_c7_b7ea_return_output := tmp8_low_MUX_uxn_opcodes_h_l1685_c7_b7ea_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1685_c7_b7ea] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_b7ea_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_b7ea_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_b7ea_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_b7ea_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_b7ea_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_b7ea_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_b7ea_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_b7ea_return_output;

     -- t8_MUX[uxn_opcodes_h_l1671_c7_5595] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1671_c7_5595_cond <= VAR_t8_MUX_uxn_opcodes_h_l1671_c7_5595_cond;
     t8_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue;
     t8_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1671_c7_5595_return_output := t8_MUX_uxn_opcodes_h_l1671_c7_5595_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1685_c7_b7ea] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1685_c7_b7ea_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1685_c7_b7ea_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1685_c7_b7ea_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1685_c7_b7ea_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1685_c7_b7ea_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1685_c7_b7ea_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1685_c7_b7ea_return_output := result_u8_value_MUX_uxn_opcodes_h_l1685_c7_b7ea_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1655_c2_64a8] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_64a8_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_64a8_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1679_c7_6871] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_6871_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_6871_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_6871_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_6871_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_6871_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_6871_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_6871_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_6871_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1677_c22_7b21] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_7b21_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_7b21_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_7b21_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_7b21_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_7b21_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_7b21_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1679_c7_6871] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1679_c7_6871_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1679_c7_6871_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1679_c7_6871_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1679_c7_6871_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1679_c7_6871_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1679_c7_6871_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1679_c7_6871_return_output := tmp8_high_MUX_uxn_opcodes_h_l1679_c7_6871_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1685_c7_b7ea] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_b7ea_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_b7ea_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_b7ea_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_b7ea_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_b7ea_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_b7ea_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_b7ea_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_b7ea_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1655_c2_64a8] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_64a8_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_64a8_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1674_c22_c84b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_c84b_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_c84b_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_c84b_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_c84b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_c84b_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_c84b_return_output;

     -- Submodule level 2
     VAR_result_u16_value_uxn_opcodes_h_l1674_c3_d1d7 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_c84b_return_output)),16);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_843e_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_7b21_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_6871_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_b7ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_cf4a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_6871_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_5595_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_6871_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_b7ea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1679_c7_6871_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1685_c7_b7ea_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1671_c7_5595_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1676_c7_cf4a_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1679_c7_6871_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1679_c7_6871_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1685_c7_b7ea_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1674_c3_d1d7;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1668_c7_ab60] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_ab60_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_ab60_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output;

     -- t8_MUX[uxn_opcodes_h_l1668_c7_ab60] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1668_c7_ab60_cond <= VAR_t8_MUX_uxn_opcodes_h_l1668_c7_ab60_cond;
     t8_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue;
     t8_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output := t8_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1676_c7_cf4a] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1676_c7_cf4a_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1676_c7_cf4a_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1676_c7_cf4a_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1676_c7_cf4a_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1676_c7_cf4a_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1676_c7_cf4a_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1676_c7_cf4a_return_output := tmp8_high_MUX_uxn_opcodes_h_l1676_c7_cf4a_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1677_c22_843e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_843e_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_843e_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_843e_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_843e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_843e_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_843e_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1679_c7_6871] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1679_c7_6871_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1679_c7_6871_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1679_c7_6871_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1679_c7_6871_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1679_c7_6871_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1679_c7_6871_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1679_c7_6871_return_output := tmp8_low_MUX_uxn_opcodes_h_l1679_c7_6871_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1679_c7_6871] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_6871_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_6871_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_6871_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_6871_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_6871_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_6871_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_6871_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_6871_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1679_c7_6871] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_6871_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_6871_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_6871_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_6871_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_6871_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_6871_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_6871_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_6871_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1676_c7_cf4a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_cf4a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_cf4a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_cf4a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_cf4a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_cf4a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_cf4a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_cf4a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_cf4a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1679_c7_6871] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1679_c7_6871_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1679_c7_6871_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1679_c7_6871_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1679_c7_6871_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1679_c7_6871_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1679_c7_6871_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1679_c7_6871_return_output := result_u8_value_MUX_uxn_opcodes_h_l1679_c7_6871_return_output;

     -- Submodule level 3
     VAR_result_u16_value_uxn_opcodes_h_l1677_c3_8634 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_843e_return_output)),16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_cf4a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_6871_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_cf4a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_cf4a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_6871_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1676_c7_cf4a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1679_c7_6871_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1676_c7_cf4a_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1676_c7_cf4a_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1679_c7_6871_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1676_c7_cf4a_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1677_c3_8634;
     -- result_u16_value_MUX[uxn_opcodes_h_l1676_c7_cf4a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1676_c7_cf4a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1676_c7_cf4a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1676_c7_cf4a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1676_c7_cf4a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1676_c7_cf4a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1676_c7_cf4a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1676_c7_cf4a_return_output := result_u16_value_MUX_uxn_opcodes_h_l1676_c7_cf4a_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1671_c7_5595] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1671_c7_5595_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1671_c7_5595_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1671_c7_5595_return_output := tmp8_high_MUX_uxn_opcodes_h_l1671_c7_5595_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1676_c7_cf4a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1676_c7_cf4a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1676_c7_cf4a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1676_c7_cf4a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1676_c7_cf4a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1676_c7_cf4a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1676_c7_cf4a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1676_c7_cf4a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1676_c7_cf4a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1676_c7_cf4a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_cf4a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_cf4a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_cf4a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_cf4a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_cf4a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_cf4a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_cf4a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_cf4a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1676_c7_cf4a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_cf4a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_cf4a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_cf4a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_cf4a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_cf4a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_cf4a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_cf4a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_cf4a_return_output;

     -- t8_MUX[uxn_opcodes_h_l1655_c2_64a8] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1655_c2_64a8_cond <= VAR_t8_MUX_uxn_opcodes_h_l1655_c2_64a8_cond;
     t8_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue;
     t8_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output := t8_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1676_c7_cf4a] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1676_c7_cf4a_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1676_c7_cf4a_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1676_c7_cf4a_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1676_c7_cf4a_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1676_c7_cf4a_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1676_c7_cf4a_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1676_c7_cf4a_return_output := tmp8_low_MUX_uxn_opcodes_h_l1676_c7_cf4a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1671_c7_5595] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_5595_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_5595_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_5595_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_5595_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1655_c2_64a8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_64a8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_64a8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_cf4a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_5595_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_cf4a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1676_c7_cf4a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1676_c7_cf4a_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1671_c7_5595_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1676_c7_cf4a_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1671_c7_5595] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_5595_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_5595_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_5595_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_5595_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1668_c7_ab60] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_ab60_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_ab60_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1668_c7_ab60] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1668_c7_ab60_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1668_c7_ab60_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output := tmp8_high_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1671_c7_5595] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_5595_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_5595_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_5595_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_5595_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1671_c7_5595] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1671_c7_5595_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1671_c7_5595_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1671_c7_5595_return_output := result_u8_value_MUX_uxn_opcodes_h_l1671_c7_5595_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1671_c7_5595] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1671_c7_5595_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1671_c7_5595_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1671_c7_5595_return_output := result_u16_value_MUX_uxn_opcodes_h_l1671_c7_5595_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1671_c7_5595] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1671_c7_5595_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1671_c7_5595_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1671_c7_5595_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1671_c7_5595_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1671_c7_5595_return_output := tmp8_low_MUX_uxn_opcodes_h_l1671_c7_5595_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_5595_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_5595_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1671_c7_5595_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1671_c7_5595_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1671_c7_5595_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1668_c7_ab60] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_ab60_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_ab60_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1668_c7_ab60] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1668_c7_ab60_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_ab60_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output := tmp8_low_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1655_c2_64a8] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1655_c2_64a8_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c2_64a8_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output := tmp8_high_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1668_c7_ab60] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1668_c7_ab60_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_ab60_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output := result_u8_value_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1668_c7_ab60] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_ab60_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_ab60_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1668_c7_ab60] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1668_c7_ab60_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1668_c7_ab60_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1668_c7_ab60_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1668_c7_ab60_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output := result_u16_value_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1655_c2_64a8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_64a8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_64a8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output;
     REG_VAR_tmp8_high := VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_ab60_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1655_c2_64a8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_64a8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_64a8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1655_c2_64a8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_64a8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_64a8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1655_c2_64a8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1655_c2_64a8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c2_64a8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1655_c2_64a8] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1655_c2_64a8_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c2_64a8_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output := result_u16_value_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1655_c2_64a8] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1655_c2_64a8_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c2_64a8_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c2_64a8_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c2_64a8_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output := tmp8_low_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output;

     -- Submodule level 7
     REG_VAR_tmp8_low := VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_42c1_uxn_opcodes_h_l1692_l1651_DUPLICATE_8c84 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_42c1_uxn_opcodes_h_l1692_l1651_DUPLICATE_8c84_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_42c1(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_64a8_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_42c1_uxn_opcodes_h_l1692_l1651_DUPLICATE_8c84_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_42c1_uxn_opcodes_h_l1692_l1651_DUPLICATE_8c84_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_tmp8_high <= REG_VAR_tmp8_high;
REG_COMB_tmp8_low <= REG_VAR_tmp8_low;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     tmp8_high <= REG_COMB_tmp8_high;
     tmp8_low <= REG_COMB_tmp8_low;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
