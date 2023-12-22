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
-- BIN_OP_EQ[uxn_opcodes_h_l1656_c6_c35a]
signal BIN_OP_EQ_uxn_opcodes_h_l1656_c6_c35a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1656_c6_c35a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1656_c6_c35a_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1656_c2_e6ff]
signal t8_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1656_c2_e6ff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1656_c2_e6ff]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1656_c2_e6ff]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1656_c2_e6ff]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1656_c2_e6ff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1656_c2_e6ff]
signal result_u8_value_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1656_c2_e6ff]
signal result_u16_value_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1656_c2_e6ff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1656_c2_e6ff]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1656_c2_e6ff]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1656_c2_e6ff]
signal tmp8_low_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1656_c2_e6ff]
signal tmp8_high_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1669_c11_de1c]
signal BIN_OP_EQ_uxn_opcodes_h_l1669_c11_de1c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1669_c11_de1c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1669_c11_de1c_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1669_c7_55d9]
signal t8_MUX_uxn_opcodes_h_l1669_c7_55d9_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1669_c7_55d9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_55d9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1669_c7_55d9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_55d9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1669_c7_55d9]
signal result_u8_value_MUX_uxn_opcodes_h_l1669_c7_55d9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1669_c7_55d9]
signal result_u16_value_MUX_uxn_opcodes_h_l1669_c7_55d9_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1669_c7_55d9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_55d9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1669_c7_55d9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_55d9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output : signed(3 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1669_c7_55d9]
signal tmp8_low_MUX_uxn_opcodes_h_l1669_c7_55d9_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1669_c7_55d9]
signal tmp8_high_MUX_uxn_opcodes_h_l1669_c7_55d9_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1670_c30_38b3]
signal sp_relative_shift_uxn_opcodes_h_l1670_c30_38b3_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1670_c30_38b3_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1670_c30_38b3_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1670_c30_38b3_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1672_c11_e665]
signal BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e665_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e665_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e665_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1672_c7_5143]
signal t8_MUX_uxn_opcodes_h_l1672_c7_5143_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1672_c7_5143_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1672_c7_5143]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_5143_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_5143_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1672_c7_5143]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_5143_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_5143_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1672_c7_5143]
signal result_u8_value_MUX_uxn_opcodes_h_l1672_c7_5143_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1672_c7_5143_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1672_c7_5143]
signal result_u16_value_MUX_uxn_opcodes_h_l1672_c7_5143_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1672_c7_5143_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1672_c7_5143]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_5143_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_5143_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1672_c7_5143]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1672_c7_5143_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1672_c7_5143_return_output : signed(3 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1672_c7_5143]
signal tmp8_low_MUX_uxn_opcodes_h_l1672_c7_5143_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1672_c7_5143_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1672_c7_5143]
signal tmp8_high_MUX_uxn_opcodes_h_l1672_c7_5143_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1672_c7_5143_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1675_c22_9950]
signal BIN_OP_PLUS_uxn_opcodes_h_l1675_c22_9950_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1675_c22_9950_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1675_c22_9950_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1677_c11_fe32]
signal BIN_OP_EQ_uxn_opcodes_h_l1677_c11_fe32_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1677_c11_fe32_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1677_c11_fe32_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1677_c7_b8e9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_b8e9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_b8e9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_b8e9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_b8e9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1677_c7_b8e9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_b8e9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_b8e9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_b8e9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_b8e9_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1677_c7_b8e9]
signal result_u8_value_MUX_uxn_opcodes_h_l1677_c7_b8e9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1677_c7_b8e9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1677_c7_b8e9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1677_c7_b8e9_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1677_c7_b8e9]
signal result_u16_value_MUX_uxn_opcodes_h_l1677_c7_b8e9_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1677_c7_b8e9_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1677_c7_b8e9_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1677_c7_b8e9_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1677_c7_b8e9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_b8e9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_b8e9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_b8e9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_b8e9_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1677_c7_b8e9]
signal tmp8_low_MUX_uxn_opcodes_h_l1677_c7_b8e9_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1677_c7_b8e9_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1677_c7_b8e9_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1677_c7_b8e9_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1677_c7_b8e9]
signal tmp8_high_MUX_uxn_opcodes_h_l1677_c7_b8e9_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1677_c7_b8e9_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1677_c7_b8e9_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1677_c7_b8e9_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1678_c22_fda1]
signal BIN_OP_PLUS_uxn_opcodes_h_l1678_c22_fda1_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1678_c22_fda1_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1678_c22_fda1_return_output : signed(17 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1678_c22_5540]
signal BIN_OP_PLUS_uxn_opcodes_h_l1678_c22_5540_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1678_c22_5540_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1678_c22_5540_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1680_c11_4387]
signal BIN_OP_EQ_uxn_opcodes_h_l1680_c11_4387_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1680_c11_4387_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1680_c11_4387_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1680_c7_9625]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_9625_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_9625_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_9625_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_9625_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1680_c7_9625]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_9625_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_9625_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_9625_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_9625_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1680_c7_9625]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_9625_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_9625_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_9625_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_9625_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1680_c7_9625]
signal result_u8_value_MUX_uxn_opcodes_h_l1680_c7_9625_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1680_c7_9625_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1680_c7_9625_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1680_c7_9625_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1680_c7_9625]
signal tmp8_low_MUX_uxn_opcodes_h_l1680_c7_9625_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1680_c7_9625_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1680_c7_9625_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1680_c7_9625_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1680_c7_9625]
signal tmp8_high_MUX_uxn_opcodes_h_l1680_c7_9625_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1680_c7_9625_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1680_c7_9625_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1680_c7_9625_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1686_c11_9467]
signal BIN_OP_EQ_uxn_opcodes_h_l1686_c11_9467_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1686_c11_9467_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1686_c11_9467_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1686_c7_11e9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_11e9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_11e9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_11e9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_11e9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1686_c7_11e9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_11e9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_11e9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_11e9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_11e9_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1686_c7_11e9]
signal result_u8_value_MUX_uxn_opcodes_h_l1686_c7_11e9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1686_c7_11e9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1686_c7_11e9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1686_c7_11e9_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1686_c7_11e9]
signal tmp8_low_MUX_uxn_opcodes_h_l1686_c7_11e9_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1686_c7_11e9_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1686_c7_11e9_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1686_c7_11e9_return_output : unsigned(7 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_9f32( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.u8_value := ref_toks_6;
      base.u16_value := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.is_stack_index_flipped := ref_toks_9;
      base.is_pc_updated := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1656_c6_c35a
BIN_OP_EQ_uxn_opcodes_h_l1656_c6_c35a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1656_c6_c35a_left,
BIN_OP_EQ_uxn_opcodes_h_l1656_c6_c35a_right,
BIN_OP_EQ_uxn_opcodes_h_l1656_c6_c35a_return_output);

-- t8_MUX_uxn_opcodes_h_l1656_c2_e6ff
t8_MUX_uxn_opcodes_h_l1656_c2_e6ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond,
t8_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue,
t8_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse,
t8_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_e6ff
result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_e6ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff
result_is_vram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff
result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1656_c2_e6ff
result_is_stack_write_MUX_uxn_opcodes_h_l1656_c2_e6ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_e6ff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_e6ff : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1656_c2_e6ff
result_u8_value_MUX_uxn_opcodes_h_l1656_c2_e6ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond,
result_u8_value_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1656_c2_e6ff
result_u16_value_MUX_uxn_opcodes_h_l1656_c2_e6ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond,
result_u16_value_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_e6ff
result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_e6ff : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1656_c2_e6ff
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1656_c2_e6ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1656_c2_e6ff
result_is_pc_updated_MUX_uxn_opcodes_h_l1656_c2_e6ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1656_c2_e6ff
tmp8_low_MUX_uxn_opcodes_h_l1656_c2_e6ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond,
tmp8_low_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1656_c2_e6ff
tmp8_high_MUX_uxn_opcodes_h_l1656_c2_e6ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond,
tmp8_high_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1669_c11_de1c
BIN_OP_EQ_uxn_opcodes_h_l1669_c11_de1c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1669_c11_de1c_left,
BIN_OP_EQ_uxn_opcodes_h_l1669_c11_de1c_right,
BIN_OP_EQ_uxn_opcodes_h_l1669_c11_de1c_return_output);

-- t8_MUX_uxn_opcodes_h_l1669_c7_55d9
t8_MUX_uxn_opcodes_h_l1669_c7_55d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1669_c7_55d9_cond,
t8_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue,
t8_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse,
t8_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_55d9
result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_55d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_55d9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_55d9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_55d9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_55d9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1669_c7_55d9
result_u8_value_MUX_uxn_opcodes_h_l1669_c7_55d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1669_c7_55d9_cond,
result_u8_value_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1669_c7_55d9
result_u16_value_MUX_uxn_opcodes_h_l1669_c7_55d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1669_c7_55d9_cond,
result_u16_value_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_55d9
result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_55d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_55d9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_55d9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_55d9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_55d9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1669_c7_55d9
tmp8_low_MUX_uxn_opcodes_h_l1669_c7_55d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1669_c7_55d9_cond,
tmp8_low_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1669_c7_55d9
tmp8_high_MUX_uxn_opcodes_h_l1669_c7_55d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1669_c7_55d9_cond,
tmp8_high_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1670_c30_38b3
sp_relative_shift_uxn_opcodes_h_l1670_c30_38b3 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1670_c30_38b3_ins,
sp_relative_shift_uxn_opcodes_h_l1670_c30_38b3_x,
sp_relative_shift_uxn_opcodes_h_l1670_c30_38b3_y,
sp_relative_shift_uxn_opcodes_h_l1670_c30_38b3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e665
BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e665 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e665_left,
BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e665_right,
BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e665_return_output);

-- t8_MUX_uxn_opcodes_h_l1672_c7_5143
t8_MUX_uxn_opcodes_h_l1672_c7_5143 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1672_c7_5143_cond,
t8_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue,
t8_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse,
t8_MUX_uxn_opcodes_h_l1672_c7_5143_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_5143
result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_5143 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_5143_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_5143_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_5143
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_5143 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_5143_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_5143_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1672_c7_5143
result_u8_value_MUX_uxn_opcodes_h_l1672_c7_5143 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1672_c7_5143_cond,
result_u8_value_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1672_c7_5143_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1672_c7_5143
result_u16_value_MUX_uxn_opcodes_h_l1672_c7_5143 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1672_c7_5143_cond,
result_u16_value_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1672_c7_5143_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_5143
result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_5143 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_5143_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_5143_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1672_c7_5143
result_sp_relative_shift_MUX_uxn_opcodes_h_l1672_c7_5143 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1672_c7_5143_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1672_c7_5143_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1672_c7_5143
tmp8_low_MUX_uxn_opcodes_h_l1672_c7_5143 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1672_c7_5143_cond,
tmp8_low_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1672_c7_5143_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1672_c7_5143
tmp8_high_MUX_uxn_opcodes_h_l1672_c7_5143 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1672_c7_5143_cond,
tmp8_high_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1672_c7_5143_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1675_c22_9950
BIN_OP_PLUS_uxn_opcodes_h_l1675_c22_9950 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1675_c22_9950_left,
BIN_OP_PLUS_uxn_opcodes_h_l1675_c22_9950_right,
BIN_OP_PLUS_uxn_opcodes_h_l1675_c22_9950_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1677_c11_fe32
BIN_OP_EQ_uxn_opcodes_h_l1677_c11_fe32 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1677_c11_fe32_left,
BIN_OP_EQ_uxn_opcodes_h_l1677_c11_fe32_right,
BIN_OP_EQ_uxn_opcodes_h_l1677_c11_fe32_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_b8e9
result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_b8e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_b8e9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_b8e9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_b8e9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_b8e9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_b8e9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_b8e9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_b8e9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_b8e9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_b8e9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_b8e9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1677_c7_b8e9
result_u8_value_MUX_uxn_opcodes_h_l1677_c7_b8e9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1677_c7_b8e9_cond,
result_u8_value_MUX_uxn_opcodes_h_l1677_c7_b8e9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1677_c7_b8e9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1677_c7_b8e9_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1677_c7_b8e9
result_u16_value_MUX_uxn_opcodes_h_l1677_c7_b8e9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1677_c7_b8e9_cond,
result_u16_value_MUX_uxn_opcodes_h_l1677_c7_b8e9_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1677_c7_b8e9_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1677_c7_b8e9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_b8e9
result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_b8e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_b8e9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_b8e9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_b8e9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_b8e9_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1677_c7_b8e9
tmp8_low_MUX_uxn_opcodes_h_l1677_c7_b8e9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1677_c7_b8e9_cond,
tmp8_low_MUX_uxn_opcodes_h_l1677_c7_b8e9_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1677_c7_b8e9_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1677_c7_b8e9_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1677_c7_b8e9
tmp8_high_MUX_uxn_opcodes_h_l1677_c7_b8e9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1677_c7_b8e9_cond,
tmp8_high_MUX_uxn_opcodes_h_l1677_c7_b8e9_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1677_c7_b8e9_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1677_c7_b8e9_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1678_c22_fda1
BIN_OP_PLUS_uxn_opcodes_h_l1678_c22_fda1 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1678_c22_fda1_left,
BIN_OP_PLUS_uxn_opcodes_h_l1678_c22_fda1_right,
BIN_OP_PLUS_uxn_opcodes_h_l1678_c22_fda1_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1678_c22_5540
BIN_OP_PLUS_uxn_opcodes_h_l1678_c22_5540 : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1678_c22_5540_left,
BIN_OP_PLUS_uxn_opcodes_h_l1678_c22_5540_right,
BIN_OP_PLUS_uxn_opcodes_h_l1678_c22_5540_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1680_c11_4387
BIN_OP_EQ_uxn_opcodes_h_l1680_c11_4387 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1680_c11_4387_left,
BIN_OP_EQ_uxn_opcodes_h_l1680_c11_4387_right,
BIN_OP_EQ_uxn_opcodes_h_l1680_c11_4387_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_9625
result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_9625 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_9625_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_9625_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_9625_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_9625_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_9625
result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_9625 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_9625_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_9625_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_9625_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_9625_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_9625
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_9625 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_9625_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_9625_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_9625_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_9625_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1680_c7_9625
result_u8_value_MUX_uxn_opcodes_h_l1680_c7_9625 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1680_c7_9625_cond,
result_u8_value_MUX_uxn_opcodes_h_l1680_c7_9625_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1680_c7_9625_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1680_c7_9625_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1680_c7_9625
tmp8_low_MUX_uxn_opcodes_h_l1680_c7_9625 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1680_c7_9625_cond,
tmp8_low_MUX_uxn_opcodes_h_l1680_c7_9625_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1680_c7_9625_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1680_c7_9625_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1680_c7_9625
tmp8_high_MUX_uxn_opcodes_h_l1680_c7_9625 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1680_c7_9625_cond,
tmp8_high_MUX_uxn_opcodes_h_l1680_c7_9625_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1680_c7_9625_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1680_c7_9625_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1686_c11_9467
BIN_OP_EQ_uxn_opcodes_h_l1686_c11_9467 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1686_c11_9467_left,
BIN_OP_EQ_uxn_opcodes_h_l1686_c11_9467_right,
BIN_OP_EQ_uxn_opcodes_h_l1686_c11_9467_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_11e9
result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_11e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_11e9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_11e9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_11e9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_11e9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_11e9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_11e9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_11e9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_11e9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_11e9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_11e9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1686_c7_11e9
result_u8_value_MUX_uxn_opcodes_h_l1686_c7_11e9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1686_c7_11e9_cond,
result_u8_value_MUX_uxn_opcodes_h_l1686_c7_11e9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1686_c7_11e9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1686_c7_11e9_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1686_c7_11e9
tmp8_low_MUX_uxn_opcodes_h_l1686_c7_11e9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1686_c7_11e9_cond,
tmp8_low_MUX_uxn_opcodes_h_l1686_c7_11e9_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1686_c7_11e9_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1686_c7_11e9_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1656_c6_c35a_return_output,
 t8_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1669_c11_de1c_return_output,
 t8_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output,
 sp_relative_shift_uxn_opcodes_h_l1670_c30_38b3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e665_return_output,
 t8_MUX_uxn_opcodes_h_l1672_c7_5143_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_5143_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_5143_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1672_c7_5143_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1672_c7_5143_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_5143_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1672_c7_5143_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1672_c7_5143_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1672_c7_5143_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1675_c22_9950_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1677_c11_fe32_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_b8e9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_b8e9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1677_c7_b8e9_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1677_c7_b8e9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_b8e9_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1677_c7_b8e9_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1677_c7_b8e9_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1678_c22_fda1_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1678_c22_5540_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1680_c11_4387_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_9625_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_9625_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_9625_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1680_c7_9625_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1680_c7_9625_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1680_c7_9625_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1686_c11_9467_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_11e9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_11e9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1686_c7_11e9_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1686_c7_11e9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c6_c35a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c6_c35a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c6_c35a_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1656_c2_e6ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1656_c2_e6ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1666_c3_5384 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1661_c3_6595 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1656_c2_e6ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1656_c2_e6ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_de1c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_de1c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_de1c_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1672_c7_5143_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1669_c7_55d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_5143_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_55d9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_5143_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_55d9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1672_c7_5143_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_55d9_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1672_c7_5143_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1669_c7_55d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_5143_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_55d9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1672_c7_5143_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_55d9_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1672_c7_5143_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_55d9_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1672_c7_5143_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1669_c7_55d9_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1670_c30_38b3_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1670_c30_38b3_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1670_c30_38b3_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1670_c30_38b3_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e665_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e665_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e665_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1672_c7_5143_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_b8e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_5143_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_b8e9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_5143_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1677_c7_b8e9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1672_c7_5143_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1675_c3_d30a : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1677_c7_b8e9_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1672_c7_5143_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_b8e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_5143_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1674_c3_5121 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1672_c7_5143_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1672_c7_5143_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1677_c7_b8e9_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1672_c7_5143_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1677_c7_b8e9_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1672_c7_5143_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1675_c22_9950_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1675_c27_544d_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1675_c22_9950_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1675_c22_9950_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_fe32_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_fe32_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_fe32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_b8e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_b8e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_9625_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_b8e9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_b8e9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_b8e9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_9625_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_b8e9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1677_c7_b8e9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1677_c7_b8e9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1680_c7_9625_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1677_c7_b8e9_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1677_c7_b8e9_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1678_c3_0e7d : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1677_c7_b8e9_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1677_c7_b8e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_b8e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_b8e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_9625_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_b8e9_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1677_c7_b8e9_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1677_c7_b8e9_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1680_c7_9625_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1677_c7_b8e9_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1677_c7_b8e9_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1677_c7_b8e9_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1680_c7_9625_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1677_c7_b8e9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1678_c22_fda1_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1678_c27_0066_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1678_c22_fda1_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1678_c22_fda1_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1678_c22_5540_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1678_c22_5540_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1678_c22_5540_return_output : signed(18 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c11_4387_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c11_4387_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c11_4387_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_9625_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_9625_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_11e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_9625_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_9625_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_9625_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_9625_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_9625_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1683_c3_8687 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_9625_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_11e9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_9625_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1680_c7_9625_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1680_c7_9625_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_11e9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1680_c7_9625_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1680_c7_9625_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1680_c7_9625_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1686_c7_11e9_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1680_c7_9625_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1680_c7_9625_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1680_c7_9625_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1680_c7_9625_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_9467_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_9467_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_9467_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_11e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_11e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_11e9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_11e9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1688_c3_d1fe : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_11e9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_11e9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_11e9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_11e9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_11e9_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1686_c7_11e9_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1686_c7_11e9_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1686_c7_11e9_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1677_l1672_l1669_l1656_l1686_DUPLICATE_41e1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1669_l1656_l1677_DUPLICATE_118b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1680_l1677_l1672_l1669_l1686_DUPLICATE_0ad2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1669_l1672_l1686_l1677_DUPLICATE_0805_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1669_l1680_l1672_l1677_DUPLICATE_55ee_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9f32_uxn_opcodes_h_l1652_l1693_DUPLICATE_dd98_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_9625_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e665_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1688_c3_d1fe := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_11e9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1688_c3_d1fe;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_fe32_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_9467_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1674_c3_5121 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1674_c3_5121;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1678_c22_5540_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1661_c3_6595 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1661_c3_6595;
     VAR_sp_relative_shift_uxn_opcodes_h_l1670_c30_38b3_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c6_c35a_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c11_4387_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_11e9_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1666_c3_5384 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1666_c3_5384;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_de1c_right := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1683_c3_8687 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_9625_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1683_c3_8687;
     VAR_sp_relative_shift_uxn_opcodes_h_l1670_c30_38b3_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1670_c30_38b3_ins := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1675_c22_9950_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1678_c22_fda1_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c6_c35a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_de1c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e665_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_fe32_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c11_4387_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_9467_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1680_c7_9625_iftrue := VAR_previous_ram_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_11e9_iftrue := VAR_previous_ram_read;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1680_c7_9625_iftrue := VAR_previous_ram_read;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1686_c7_11e9_iftrue := VAR_previous_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse := t8;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1677_c7_b8e9_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1680_c7_9625_iffalse := tmp8_high;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1677_c7_b8e9_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1680_c7_9625_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1686_c7_11e9_iffalse := tmp8_low;
     -- CAST_TO_int8_t[uxn_opcodes_h_l1678_c27_0066] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1678_c27_0066_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1669_l1680_l1672_l1677_DUPLICATE_55ee LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1669_l1680_l1672_l1677_DUPLICATE_55ee_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1672_c11_e665] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e665_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e665_left;
     BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e665_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e665_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e665_return_output := BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e665_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1677_l1672_l1669_l1656_l1686_DUPLICATE_41e1 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1677_l1672_l1669_l1656_l1686_DUPLICATE_41e1_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1656_c6_c35a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1656_c6_c35a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c6_c35a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1656_c6_c35a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c6_c35a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c6_c35a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1656_c6_c35a_return_output;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l1672_c7_5143] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1672_c7_5143_return_output := result.sp_relative_shift;

     -- sp_relative_shift[uxn_opcodes_h_l1670_c30_38b3] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1670_c30_38b3_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1670_c30_38b3_ins;
     sp_relative_shift_uxn_opcodes_h_l1670_c30_38b3_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1670_c30_38b3_x;
     sp_relative_shift_uxn_opcodes_h_l1670_c30_38b3_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1670_c30_38b3_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1670_c30_38b3_return_output := sp_relative_shift_uxn_opcodes_h_l1670_c30_38b3_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1680_l1677_l1672_l1669_l1686_DUPLICATE_0ad2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1680_l1677_l1672_l1669_l1686_DUPLICATE_0ad2_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1669_c11_de1c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1669_c11_de1c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_de1c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1669_c11_de1c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_de1c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_de1c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1669_c11_de1c_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1675_c27_544d] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1675_c27_544d_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1656_c2_e6ff] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1656_c2_e6ff_return_output := result.is_vram_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1656_c2_e6ff] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1656_c2_e6ff_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1669_l1672_l1686_l1677_DUPLICATE_0805 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1669_l1672_l1686_l1677_DUPLICATE_0805_return_output := result.stack_address_sp_offset;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1656_c2_e6ff] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1656_c2_e6ff_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1669_l1656_l1677_DUPLICATE_118b LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1669_l1656_l1677_DUPLICATE_118b_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1680_c11_4387] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1680_c11_4387_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c11_4387_left;
     BIN_OP_EQ_uxn_opcodes_h_l1680_c11_4387_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c11_4387_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c11_4387_return_output := BIN_OP_EQ_uxn_opcodes_h_l1680_c11_4387_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1677_c11_fe32] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1677_c11_fe32_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_fe32_left;
     BIN_OP_EQ_uxn_opcodes_h_l1677_c11_fe32_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_fe32_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_fe32_return_output := BIN_OP_EQ_uxn_opcodes_h_l1677_c11_fe32_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1686_c11_9467] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1686_c11_9467_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_9467_left;
     BIN_OP_EQ_uxn_opcodes_h_l1686_c11_9467_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_9467_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_9467_return_output := BIN_OP_EQ_uxn_opcodes_h_l1686_c11_9467_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1656_c2_e6ff] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1656_c2_e6ff_return_output := result.is_ram_write;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c6_c35a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c6_c35a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c6_c35a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c6_c35a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c6_c35a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c6_c35a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c6_c35a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c6_c35a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c6_c35a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c6_c35a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c6_c35a_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c6_c35a_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c6_c35a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_55d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_de1c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_55d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_de1c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_55d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_de1c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_55d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_de1c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1669_c7_55d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_de1c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_55d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_de1c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1669_c7_55d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_de1c_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1669_c7_55d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_de1c_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_55d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_de1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_5143_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e665_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_5143_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e665_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1672_c7_5143_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e665_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_5143_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e665_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1672_c7_5143_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e665_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1672_c7_5143_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e665_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1672_c7_5143_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e665_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1672_c7_5143_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e665_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1672_c7_5143_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_e665_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_b8e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_fe32_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_b8e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_fe32_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_b8e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_fe32_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1677_c7_b8e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_fe32_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1677_c7_b8e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_fe32_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1677_c7_b8e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_fe32_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1677_c7_b8e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_fe32_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_9625_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c11_4387_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_9625_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c11_4387_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_9625_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c11_4387_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1680_c7_9625_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c11_4387_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1680_c7_9625_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c11_4387_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1680_c7_9625_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c11_4387_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_11e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_9467_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_11e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_9467_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_11e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_9467_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1686_c7_11e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_9467_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1675_c22_9950_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1675_c27_544d_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1678_c22_fda1_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1678_c27_0066_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1669_l1656_l1677_DUPLICATE_118b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1669_l1656_l1677_DUPLICATE_118b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1677_c7_b8e9_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1669_l1656_l1677_DUPLICATE_118b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1680_l1677_l1672_l1669_l1686_DUPLICATE_0ad2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1680_l1677_l1672_l1669_l1686_DUPLICATE_0ad2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_b8e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1680_l1677_l1672_l1669_l1686_DUPLICATE_0ad2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_9625_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1680_l1677_l1672_l1669_l1686_DUPLICATE_0ad2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_11e9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1680_l1677_l1672_l1669_l1686_DUPLICATE_0ad2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1669_l1680_l1672_l1677_DUPLICATE_55ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1669_l1680_l1672_l1677_DUPLICATE_55ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_b8e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1669_l1680_l1672_l1677_DUPLICATE_55ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_9625_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1669_l1680_l1672_l1677_DUPLICATE_55ee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1669_l1672_l1686_l1677_DUPLICATE_0805_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1669_l1672_l1686_l1677_DUPLICATE_0805_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_b8e9_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1669_l1672_l1686_l1677_DUPLICATE_0805_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_11e9_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1669_l1672_l1686_l1677_DUPLICATE_0805_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1677_l1672_l1669_l1656_l1686_DUPLICATE_41e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1677_l1672_l1669_l1656_l1686_DUPLICATE_41e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1677_l1672_l1669_l1656_l1686_DUPLICATE_41e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1677_c7_b8e9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1677_l1672_l1669_l1656_l1686_DUPLICATE_41e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_11e9_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1677_l1672_l1669_l1656_l1686_DUPLICATE_41e1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1656_c2_e6ff_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1656_c2_e6ff_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1656_c2_e6ff_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1656_c2_e6ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1672_c7_5143_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1670_c30_38b3_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1680_c7_9625] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_9625_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_9625_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_9625_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_9625_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_9625_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_9625_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_9625_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_9625_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1656_c2_e6ff] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1686_c7_11e9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_11e9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_11e9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_11e9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_11e9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_11e9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_11e9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_11e9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_11e9_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1678_c22_fda1] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1678_c22_fda1_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1678_c22_fda1_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1678_c22_fda1_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1678_c22_fda1_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1678_c22_fda1_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1678_c22_fda1_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1656_c2_e6ff] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1686_c7_11e9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_11e9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_11e9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_11e9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_11e9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_11e9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_11e9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_11e9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_11e9_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1656_c2_e6ff] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1680_c7_9625] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1680_c7_9625_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1680_c7_9625_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1680_c7_9625_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1680_c7_9625_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1680_c7_9625_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1680_c7_9625_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1680_c7_9625_return_output := tmp8_high_MUX_uxn_opcodes_h_l1680_c7_9625_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1672_c7_5143] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1672_c7_5143_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1672_c7_5143_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1672_c7_5143_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1672_c7_5143_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1675_c22_9950] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1675_c22_9950_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1675_c22_9950_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1675_c22_9950_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1675_c22_9950_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1675_c22_9950_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1675_c22_9950_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1686_c7_11e9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1686_c7_11e9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_11e9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1686_c7_11e9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_11e9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1686_c7_11e9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_11e9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_11e9_return_output := result_u8_value_MUX_uxn_opcodes_h_l1686_c7_11e9_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1656_c2_e6ff] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output;

     -- t8_MUX[uxn_opcodes_h_l1672_c7_5143] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1672_c7_5143_cond <= VAR_t8_MUX_uxn_opcodes_h_l1672_c7_5143_cond;
     t8_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue;
     t8_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1672_c7_5143_return_output := t8_MUX_uxn_opcodes_h_l1672_c7_5143_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1686_c7_11e9] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1686_c7_11e9_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1686_c7_11e9_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1686_c7_11e9_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1686_c7_11e9_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1686_c7_11e9_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1686_c7_11e9_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1686_c7_11e9_return_output := tmp8_low_MUX_uxn_opcodes_h_l1686_c7_11e9_return_output;

     -- Submodule level 2
     VAR_result_u16_value_uxn_opcodes_h_l1675_c3_d30a := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1675_c22_9950_return_output)),16);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1678_c22_5540_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l1678_c22_fda1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_9625_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_11e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_b8e9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1680_c7_9625_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1672_c7_5143_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_9625_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_11e9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1680_c7_9625_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_11e9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1672_c7_5143_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1677_c7_b8e9_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1680_c7_9625_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1680_c7_9625_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1686_c7_11e9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1675_c3_d30a;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1669_c7_55d9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_55d9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_55d9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1680_c7_9625] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_9625_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_9625_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_9625_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_9625_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_9625_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_9625_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_9625_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_9625_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1680_c7_9625] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1680_c7_9625_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1680_c7_9625_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1680_c7_9625_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1680_c7_9625_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1680_c7_9625_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1680_c7_9625_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1680_c7_9625_return_output := result_u8_value_MUX_uxn_opcodes_h_l1680_c7_9625_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1677_c7_b8e9] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1677_c7_b8e9_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1677_c7_b8e9_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1677_c7_b8e9_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1677_c7_b8e9_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1677_c7_b8e9_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1677_c7_b8e9_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1677_c7_b8e9_return_output := tmp8_high_MUX_uxn_opcodes_h_l1677_c7_b8e9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1677_c7_b8e9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_b8e9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_b8e9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_b8e9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_b8e9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_b8e9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_b8e9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_b8e9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_b8e9_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1680_c7_9625] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1680_c7_9625_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1680_c7_9625_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1680_c7_9625_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1680_c7_9625_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1680_c7_9625_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1680_c7_9625_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1680_c7_9625_return_output := tmp8_low_MUX_uxn_opcodes_h_l1680_c7_9625_return_output;

     -- t8_MUX[uxn_opcodes_h_l1669_c7_55d9] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1669_c7_55d9_cond <= VAR_t8_MUX_uxn_opcodes_h_l1669_c7_55d9_cond;
     t8_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue;
     t8_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output := t8_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1678_c22_5540] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1678_c22_5540_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1678_c22_5540_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1678_c22_5540_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1678_c22_5540_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1678_c22_5540_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1678_c22_5540_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1680_c7_9625] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_9625_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_9625_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_9625_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_9625_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_9625_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_9625_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_9625_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_9625_return_output;

     -- Submodule level 3
     VAR_result_u16_value_uxn_opcodes_h_l1678_c3_0e7d := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1678_c22_5540_return_output)),16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_b8e9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c7_9625_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_b8e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_b8e9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c7_9625_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1677_c7_b8e9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1680_c7_9625_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1677_c7_b8e9_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1677_c7_b8e9_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1680_c7_9625_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1677_c7_b8e9_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1678_c3_0e7d;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1656_c2_e6ff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1677_c7_b8e9] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1677_c7_b8e9_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1677_c7_b8e9_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1677_c7_b8e9_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1677_c7_b8e9_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1677_c7_b8e9_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1677_c7_b8e9_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1677_c7_b8e9_return_output := tmp8_low_MUX_uxn_opcodes_h_l1677_c7_b8e9_return_output;

     -- t8_MUX[uxn_opcodes_h_l1656_c2_e6ff] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond <= VAR_t8_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond;
     t8_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue;
     t8_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output := t8_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1677_c7_b8e9] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1677_c7_b8e9_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1677_c7_b8e9_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1677_c7_b8e9_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1677_c7_b8e9_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1677_c7_b8e9_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1677_c7_b8e9_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1677_c7_b8e9_return_output := result_u16_value_MUX_uxn_opcodes_h_l1677_c7_b8e9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1677_c7_b8e9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_b8e9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_b8e9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_b8e9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_b8e9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_b8e9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_b8e9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_b8e9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_b8e9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1672_c7_5143] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_5143_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_5143_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_5143_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_5143_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1677_c7_b8e9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1677_c7_b8e9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1677_c7_b8e9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1677_c7_b8e9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1677_c7_b8e9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1677_c7_b8e9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1677_c7_b8e9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1677_c7_b8e9_return_output := result_u8_value_MUX_uxn_opcodes_h_l1677_c7_b8e9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1677_c7_b8e9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_b8e9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_b8e9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_b8e9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_b8e9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_b8e9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_b8e9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_b8e9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_b8e9_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1672_c7_5143] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1672_c7_5143_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1672_c7_5143_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1672_c7_5143_return_output := tmp8_high_MUX_uxn_opcodes_h_l1672_c7_5143_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_b8e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1672_c7_5143_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_b8e9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1677_c7_b8e9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1677_c7_b8e9_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1672_c7_5143_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1677_c7_b8e9_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1672_c7_5143] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1672_c7_5143_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1672_c7_5143_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1672_c7_5143_return_output := result_u16_value_MUX_uxn_opcodes_h_l1672_c7_5143_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1669_c7_55d9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_55d9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_55d9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1672_c7_5143] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_5143_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_5143_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_5143_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_5143_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1669_c7_55d9] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1669_c7_55d9_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1669_c7_55d9_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output := tmp8_high_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1672_c7_5143] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1672_c7_5143_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1672_c7_5143_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1672_c7_5143_return_output := tmp8_low_MUX_uxn_opcodes_h_l1672_c7_5143_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1672_c7_5143] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_5143_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_5143_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_5143_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_5143_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1672_c7_5143] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1672_c7_5143_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1672_c7_5143_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1672_c7_5143_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1672_c7_5143_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1672_c7_5143_return_output := result_u8_value_MUX_uxn_opcodes_h_l1672_c7_5143_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_5143_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1672_c7_5143_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1672_c7_5143_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1672_c7_5143_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1672_c7_5143_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1669_c7_55d9] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1669_c7_55d9_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1669_c7_55d9_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output := result_u16_value_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1669_c7_55d9] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1669_c7_55d9_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_55d9_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output := tmp8_low_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1669_c7_55d9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_55d9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_55d9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1656_c2_e6ff] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1669_c7_55d9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_55d9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_55d9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1669_c7_55d9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1669_c7_55d9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_55d9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_55d9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_55d9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output := result_u8_value_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1656_c2_e6ff] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output := tmp8_high_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output;
     REG_VAR_tmp8_high := VAR_tmp8_high_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_55d9_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1656_c2_e6ff] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output := result_u8_value_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1656_c2_e6ff] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output := result_u16_value_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1656_c2_e6ff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1656_c2_e6ff] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output := tmp8_low_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1656_c2_e6ff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_e6ff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_e6ff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_e6ff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output;

     -- Submodule level 7
     REG_VAR_tmp8_low := VAR_tmp8_low_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_9f32_uxn_opcodes_h_l1652_l1693_DUPLICATE_dd98 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9f32_uxn_opcodes_h_l1652_l1693_DUPLICATE_dd98_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_9f32(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1656_c2_e6ff_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9f32_uxn_opcodes_h_l1652_l1693_DUPLICATE_dd98_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9f32_uxn_opcodes_h_l1652_l1693_DUPLICATE_dd98_return_output;
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
