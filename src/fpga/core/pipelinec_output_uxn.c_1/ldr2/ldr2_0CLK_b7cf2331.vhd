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
-- BIN_OP_EQ[uxn_opcodes_h_l1638_c6_7d48]
signal BIN_OP_EQ_uxn_opcodes_h_l1638_c6_7d48_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1638_c6_7d48_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1638_c6_7d48_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1638_c2_e7a4]
signal t8_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1638_c2_e7a4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1638_c2_e7a4]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1638_c2_e7a4]
signal result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1638_c2_e7a4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1638_c2_e7a4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1638_c2_e7a4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1638_c2_e7a4]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1638_c2_e7a4]
signal result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1638_c2_e7a4]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1638_c2_e7a4]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1638_c2_e7a4]
signal tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1638_c2_e7a4]
signal tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1651_c11_ff6e]
signal BIN_OP_EQ_uxn_opcodes_h_l1651_c11_ff6e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1651_c11_ff6e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1651_c11_ff6e_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1651_c7_7a2c]
signal t8_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1651_c7_7a2c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1651_c7_7a2c]
signal result_u16_value_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1651_c7_7a2c]
signal result_u8_value_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1651_c7_7a2c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1651_c7_7a2c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1651_c7_7a2c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output : unsigned(3 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1651_c7_7a2c]
signal tmp8_high_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1651_c7_7a2c]
signal tmp8_low_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1652_c30_1adc]
signal sp_relative_shift_uxn_opcodes_h_l1652_c30_1adc_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1652_c30_1adc_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1652_c30_1adc_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1652_c30_1adc_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1654_c11_3f49]
signal BIN_OP_EQ_uxn_opcodes_h_l1654_c11_3f49_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1654_c11_3f49_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1654_c11_3f49_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1654_c7_a650]
signal t8_MUX_uxn_opcodes_h_l1654_c7_a650_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1654_c7_a650_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1654_c7_a650]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_a650_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_a650_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1654_c7_a650]
signal result_u16_value_MUX_uxn_opcodes_h_l1654_c7_a650_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1654_c7_a650_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1654_c7_a650]
signal result_u8_value_MUX_uxn_opcodes_h_l1654_c7_a650_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1654_c7_a650_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1654_c7_a650]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_a650_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_a650_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1654_c7_a650]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_a650_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_a650_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1654_c7_a650]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_a650_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_a650_return_output : unsigned(3 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1654_c7_a650]
signal tmp8_high_MUX_uxn_opcodes_h_l1654_c7_a650_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1654_c7_a650_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1654_c7_a650]
signal tmp8_low_MUX_uxn_opcodes_h_l1654_c7_a650_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1654_c7_a650_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1657_c22_7ba8]
signal BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_7ba8_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_7ba8_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_7ba8_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1659_c11_6b62]
signal BIN_OP_EQ_uxn_opcodes_h_l1659_c11_6b62_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1659_c11_6b62_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1659_c11_6b62_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1659_c7_1973]
signal result_u16_value_MUX_uxn_opcodes_h_l1659_c7_1973_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1659_c7_1973_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1659_c7_1973_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1659_c7_1973_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1659_c7_1973]
signal result_u8_value_MUX_uxn_opcodes_h_l1659_c7_1973_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1659_c7_1973_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1659_c7_1973_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1659_c7_1973_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1659_c7_1973]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_1973_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_1973_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_1973_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_1973_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1659_c7_1973]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_1973_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_1973_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_1973_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_1973_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1659_c7_1973]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_1973_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_1973_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_1973_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_1973_return_output : unsigned(3 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1659_c7_1973]
signal tmp8_high_MUX_uxn_opcodes_h_l1659_c7_1973_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1659_c7_1973_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1659_c7_1973_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1659_c7_1973_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1659_c7_1973]
signal tmp8_low_MUX_uxn_opcodes_h_l1659_c7_1973_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1659_c7_1973_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1659_c7_1973_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1659_c7_1973_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1660_c22_be16]
signal BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_be16_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_be16_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_be16_return_output : signed(17 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1660_c22_717b]
signal BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_717b_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_717b_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_717b_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1662_c11_cf29]
signal BIN_OP_EQ_uxn_opcodes_h_l1662_c11_cf29_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1662_c11_cf29_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1662_c11_cf29_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1662_c7_9e7a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_9e7a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_9e7a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_9e7a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_9e7a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1662_c7_9e7a]
signal result_u8_value_MUX_uxn_opcodes_h_l1662_c7_9e7a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1662_c7_9e7a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1662_c7_9e7a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1662_c7_9e7a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1662_c7_9e7a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_9e7a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_9e7a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_9e7a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_9e7a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1662_c7_9e7a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_9e7a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_9e7a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_9e7a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_9e7a_return_output : unsigned(3 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1662_c7_9e7a]
signal tmp8_high_MUX_uxn_opcodes_h_l1662_c7_9e7a_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1662_c7_9e7a_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1662_c7_9e7a_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1662_c7_9e7a_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1662_c7_9e7a]
signal tmp8_low_MUX_uxn_opcodes_h_l1662_c7_9e7a_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1662_c7_9e7a_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1662_c7_9e7a_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1662_c7_9e7a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1668_c11_8559]
signal BIN_OP_EQ_uxn_opcodes_h_l1668_c11_8559_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1668_c11_8559_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1668_c11_8559_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1668_c7_d78a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_d78a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_d78a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_d78a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_d78a_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1668_c7_d78a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_d78a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_d78a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_d78a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_d78a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1668_c7_d78a]
signal result_u8_value_MUX_uxn_opcodes_h_l1668_c7_d78a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1668_c7_d78a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1668_c7_d78a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1668_c7_d78a_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1668_c7_d78a]
signal tmp8_low_MUX_uxn_opcodes_h_l1668_c7_d78a_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1668_c7_d78a_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1668_c7_d78a_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1668_c7_d78a_return_output : unsigned(7 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_c942( ref_toks_0 : opcode_result_t;
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
      base.is_ram_write := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_stack_index_flipped := ref_toks_7;
      base.u8_value := ref_toks_8;
      base.is_pc_updated := ref_toks_9;
      base.is_vram_write := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1638_c6_7d48
BIN_OP_EQ_uxn_opcodes_h_l1638_c6_7d48 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1638_c6_7d48_left,
BIN_OP_EQ_uxn_opcodes_h_l1638_c6_7d48_right,
BIN_OP_EQ_uxn_opcodes_h_l1638_c6_7d48_return_output);

-- t8_MUX_uxn_opcodes_h_l1638_c2_e7a4
t8_MUX_uxn_opcodes_h_l1638_c2_e7a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond,
t8_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue,
t8_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse,
t8_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e7a4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e7a4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4
result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e7a4
result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e7a4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond,
result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e7a4
result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e7a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e7a4
result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e7a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e7a4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e7a4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e7a4
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e7a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e7a4
result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e7a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e7a4
result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e7a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4
result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e7a4
tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e7a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond,
tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e7a4
tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e7a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond,
tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1651_c11_ff6e
BIN_OP_EQ_uxn_opcodes_h_l1651_c11_ff6e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1651_c11_ff6e_left,
BIN_OP_EQ_uxn_opcodes_h_l1651_c11_ff6e_right,
BIN_OP_EQ_uxn_opcodes_h_l1651_c11_ff6e_return_output);

-- t8_MUX_uxn_opcodes_h_l1651_c7_7a2c
t8_MUX_uxn_opcodes_h_l1651_c7_7a2c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond,
t8_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue,
t8_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse,
t8_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_7a2c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_7a2c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1651_c7_7a2c
result_u16_value_MUX_uxn_opcodes_h_l1651_c7_7a2c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond,
result_u16_value_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1651_c7_7a2c
result_u8_value_MUX_uxn_opcodes_h_l1651_c7_7a2c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_7a2c
result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_7a2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_7a2c
result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_7a2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_7a2c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_7a2c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1651_c7_7a2c
tmp8_high_MUX_uxn_opcodes_h_l1651_c7_7a2c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond,
tmp8_high_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1651_c7_7a2c
tmp8_low_MUX_uxn_opcodes_h_l1651_c7_7a2c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond,
tmp8_low_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1652_c30_1adc
sp_relative_shift_uxn_opcodes_h_l1652_c30_1adc : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1652_c30_1adc_ins,
sp_relative_shift_uxn_opcodes_h_l1652_c30_1adc_x,
sp_relative_shift_uxn_opcodes_h_l1652_c30_1adc_y,
sp_relative_shift_uxn_opcodes_h_l1652_c30_1adc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1654_c11_3f49
BIN_OP_EQ_uxn_opcodes_h_l1654_c11_3f49 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1654_c11_3f49_left,
BIN_OP_EQ_uxn_opcodes_h_l1654_c11_3f49_right,
BIN_OP_EQ_uxn_opcodes_h_l1654_c11_3f49_return_output);

-- t8_MUX_uxn_opcodes_h_l1654_c7_a650
t8_MUX_uxn_opcodes_h_l1654_c7_a650 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1654_c7_a650_cond,
t8_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue,
t8_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse,
t8_MUX_uxn_opcodes_h_l1654_c7_a650_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_a650
result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_a650 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_a650_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_a650_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1654_c7_a650
result_u16_value_MUX_uxn_opcodes_h_l1654_c7_a650 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1654_c7_a650_cond,
result_u16_value_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1654_c7_a650_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1654_c7_a650
result_u8_value_MUX_uxn_opcodes_h_l1654_c7_a650 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1654_c7_a650_cond,
result_u8_value_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1654_c7_a650_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_a650
result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_a650 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_a650_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_a650_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_a650
result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_a650 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_a650_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_a650_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_a650
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_a650 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_a650_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_a650_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1654_c7_a650
tmp8_high_MUX_uxn_opcodes_h_l1654_c7_a650 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1654_c7_a650_cond,
tmp8_high_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1654_c7_a650_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1654_c7_a650
tmp8_low_MUX_uxn_opcodes_h_l1654_c7_a650 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1654_c7_a650_cond,
tmp8_low_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1654_c7_a650_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_7ba8
BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_7ba8 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_7ba8_left,
BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_7ba8_right,
BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_7ba8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1659_c11_6b62
BIN_OP_EQ_uxn_opcodes_h_l1659_c11_6b62 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1659_c11_6b62_left,
BIN_OP_EQ_uxn_opcodes_h_l1659_c11_6b62_right,
BIN_OP_EQ_uxn_opcodes_h_l1659_c11_6b62_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1659_c7_1973
result_u16_value_MUX_uxn_opcodes_h_l1659_c7_1973 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1659_c7_1973_cond,
result_u16_value_MUX_uxn_opcodes_h_l1659_c7_1973_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1659_c7_1973_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1659_c7_1973_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1659_c7_1973
result_u8_value_MUX_uxn_opcodes_h_l1659_c7_1973 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1659_c7_1973_cond,
result_u8_value_MUX_uxn_opcodes_h_l1659_c7_1973_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1659_c7_1973_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1659_c7_1973_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_1973
result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_1973 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_1973_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_1973_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_1973_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_1973_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_1973
result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_1973 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_1973_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_1973_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_1973_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_1973_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_1973
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_1973 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_1973_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_1973_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_1973_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_1973_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1659_c7_1973
tmp8_high_MUX_uxn_opcodes_h_l1659_c7_1973 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1659_c7_1973_cond,
tmp8_high_MUX_uxn_opcodes_h_l1659_c7_1973_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1659_c7_1973_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1659_c7_1973_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1659_c7_1973
tmp8_low_MUX_uxn_opcodes_h_l1659_c7_1973 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1659_c7_1973_cond,
tmp8_low_MUX_uxn_opcodes_h_l1659_c7_1973_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1659_c7_1973_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1659_c7_1973_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_be16
BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_be16 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_be16_left,
BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_be16_right,
BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_be16_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_717b
BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_717b : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_717b_left,
BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_717b_right,
BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_717b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1662_c11_cf29
BIN_OP_EQ_uxn_opcodes_h_l1662_c11_cf29 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1662_c11_cf29_left,
BIN_OP_EQ_uxn_opcodes_h_l1662_c11_cf29_right,
BIN_OP_EQ_uxn_opcodes_h_l1662_c11_cf29_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_9e7a
result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_9e7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_9e7a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_9e7a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_9e7a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_9e7a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1662_c7_9e7a
result_u8_value_MUX_uxn_opcodes_h_l1662_c7_9e7a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1662_c7_9e7a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1662_c7_9e7a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1662_c7_9e7a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1662_c7_9e7a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_9e7a
result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_9e7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_9e7a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_9e7a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_9e7a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_9e7a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_9e7a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_9e7a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_9e7a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_9e7a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_9e7a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_9e7a_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1662_c7_9e7a
tmp8_high_MUX_uxn_opcodes_h_l1662_c7_9e7a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1662_c7_9e7a_cond,
tmp8_high_MUX_uxn_opcodes_h_l1662_c7_9e7a_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1662_c7_9e7a_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1662_c7_9e7a_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1662_c7_9e7a
tmp8_low_MUX_uxn_opcodes_h_l1662_c7_9e7a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1662_c7_9e7a_cond,
tmp8_low_MUX_uxn_opcodes_h_l1662_c7_9e7a_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1662_c7_9e7a_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1662_c7_9e7a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1668_c11_8559
BIN_OP_EQ_uxn_opcodes_h_l1668_c11_8559 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1668_c11_8559_left,
BIN_OP_EQ_uxn_opcodes_h_l1668_c11_8559_right,
BIN_OP_EQ_uxn_opcodes_h_l1668_c11_8559_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_d78a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_d78a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_d78a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_d78a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_d78a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_d78a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_d78a
result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_d78a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_d78a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_d78a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_d78a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_d78a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1668_c7_d78a
result_u8_value_MUX_uxn_opcodes_h_l1668_c7_d78a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1668_c7_d78a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1668_c7_d78a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1668_c7_d78a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1668_c7_d78a_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1668_c7_d78a
tmp8_low_MUX_uxn_opcodes_h_l1668_c7_d78a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1668_c7_d78a_cond,
tmp8_low_MUX_uxn_opcodes_h_l1668_c7_d78a_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1668_c7_d78a_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1668_c7_d78a_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1638_c6_7d48_return_output,
 t8_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1651_c11_ff6e_return_output,
 t8_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output,
 sp_relative_shift_uxn_opcodes_h_l1652_c30_1adc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1654_c11_3f49_return_output,
 t8_MUX_uxn_opcodes_h_l1654_c7_a650_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_a650_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1654_c7_a650_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1654_c7_a650_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_a650_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_a650_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_a650_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1654_c7_a650_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1654_c7_a650_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_7ba8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1659_c11_6b62_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1659_c7_1973_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1659_c7_1973_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_1973_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_1973_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_1973_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1659_c7_1973_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1659_c7_1973_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_be16_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_717b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1662_c11_cf29_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_9e7a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1662_c7_9e7a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_9e7a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_9e7a_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1662_c7_9e7a_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1662_c7_9e7a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1668_c11_8559_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_d78a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_d78a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1668_c7_d78a_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1668_c7_d78a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_7d48_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_7d48_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_7d48_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1643_c3_82b1 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1638_c2_e7a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1648_c3_fb9b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1638_c2_e7a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1638_c2_e7a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1638_c2_e7a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_ff6e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_ff6e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_ff6e_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1654_c7_a650_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_a650_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_a650_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_a650_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_a650_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_a650_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_a650_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_a650_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_a650_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_1adc_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_1adc_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_1adc_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_1adc_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_3f49_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_3f49_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_3f49_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1654_c7_a650_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1656_c3_02a1 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1654_c7_a650_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_a650_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1657_c3_365a : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_1973_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_a650_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_1973_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_a650_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_1973_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_a650_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_1973_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_a650_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_1973_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_a650_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_1973_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_a650_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_1973_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_a650_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_7ba8_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1657_c27_f5b4_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_7ba8_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_7ba8_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_6b62_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_6b62_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_6b62_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_1973_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1660_c3_4e46 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_1973_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_1973_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_1973_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_1973_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_9e7a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_1973_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_1973_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_1973_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_9e7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_1973_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_1973_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_1973_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_9e7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_1973_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_1973_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_1973_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_9e7a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_1973_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_1973_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_1973_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_9e7a_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_1973_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_1973_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_1973_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_9e7a_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_1973_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_be16_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1660_c27_05ee_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_be16_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_be16_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_717b_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_717b_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_717b_return_output : signed(18 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_cf29_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_cf29_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_cf29_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_9e7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_9e7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_d78a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_9e7a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_9e7a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_9e7a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_d78a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_9e7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_9e7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_9e7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_9e7a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_9e7a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1665_c3_ee3b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_9e7a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_d78a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_9e7a_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_9e7a_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_9e7a_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_9e7a_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_9e7a_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_9e7a_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_d78a_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_9e7a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_8559_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_8559_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_8559_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_d78a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1670_c3_7e3f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_d78a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_d78a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_d78a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_d78a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_d78a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_d78a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_d78a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_d78a_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_d78a_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_d78a_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_d78a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1651_l1638_l1659_DUPLICATE_d82a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1668_l1659_l1654_l1651_l1638_DUPLICATE_f578_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1651_l1662_l1654_l1659_DUPLICATE_deb8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1668_l1662_l1659_l1654_l1651_DUPLICATE_c062_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1651_l1654_l1668_l1659_DUPLICATE_fa44_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c942_uxn_opcodes_h_l1675_l1634_DUPLICATE_9f21_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_ff6e_right := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_1adc_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1648_c3_fb9b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1648_c3_fb9b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_6b62_right := to_unsigned(3, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_3f49_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_d78a_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1665_c3_ee3b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_9e7a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1665_c3_ee3b;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_717b_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_9e7a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_8559_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_7d48_right := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_cf29_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1656_c3_02a1 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1656_c3_02a1;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1670_c3_7e3f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_d78a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1670_c3_7e3f;
     VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_1adc_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1643_c3_82b1 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1643_c3_82b1;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_1adc_ins := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_7ba8_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_be16_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_7d48_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_ff6e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_3f49_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_6b62_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_cf29_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_8559_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_9e7a_iftrue := VAR_previous_ram_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_d78a_iftrue := VAR_previous_ram_read;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_9e7a_iftrue := VAR_previous_ram_read;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_d78a_iftrue := VAR_previous_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse := t8;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_1973_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_9e7a_iffalse := tmp8_high;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_1973_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_9e7a_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_d78a_iffalse := tmp8_low;
     -- BIN_OP_EQ[uxn_opcodes_h_l1659_c11_6b62] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1659_c11_6b62_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_6b62_left;
     BIN_OP_EQ_uxn_opcodes_h_l1659_c11_6b62_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_6b62_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_6b62_return_output := BIN_OP_EQ_uxn_opcodes_h_l1659_c11_6b62_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1668_l1662_l1659_l1654_l1651_DUPLICATE_c062 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1668_l1662_l1659_l1654_l1651_DUPLICATE_c062_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1651_c11_ff6e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1651_c11_ff6e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_ff6e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1651_c11_ff6e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_ff6e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_ff6e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1651_c11_ff6e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1654_c11_3f49] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1654_c11_3f49_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_3f49_left;
     BIN_OP_EQ_uxn_opcodes_h_l1654_c11_3f49_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_3f49_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_3f49_return_output := BIN_OP_EQ_uxn_opcodes_h_l1654_c11_3f49_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1638_c2_e7a4] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1638_c2_e7a4_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1668_c11_8559] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1668_c11_8559_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_8559_left;
     BIN_OP_EQ_uxn_opcodes_h_l1668_c11_8559_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_8559_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_8559_return_output := BIN_OP_EQ_uxn_opcodes_h_l1668_c11_8559_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1662_c11_cf29] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1662_c11_cf29_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_cf29_left;
     BIN_OP_EQ_uxn_opcodes_h_l1662_c11_cf29_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_cf29_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_cf29_return_output := BIN_OP_EQ_uxn_opcodes_h_l1662_c11_cf29_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1651_l1654_l1668_l1659_DUPLICATE_fa44 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1651_l1654_l1668_l1659_DUPLICATE_fa44_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1651_l1662_l1654_l1659_DUPLICATE_deb8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1651_l1662_l1654_l1659_DUPLICATE_deb8_return_output := result.is_stack_write;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1638_c2_e7a4] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1638_c2_e7a4_return_output := result.is_ram_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1638_c2_e7a4] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1638_c2_e7a4_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1638_c6_7d48] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1638_c6_7d48_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_7d48_left;
     BIN_OP_EQ_uxn_opcodes_h_l1638_c6_7d48_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_7d48_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_7d48_return_output := BIN_OP_EQ_uxn_opcodes_h_l1638_c6_7d48_return_output;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l1654_c7_a650] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1654_c7_a650_return_output := result.sp_relative_shift;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1657_c27_f5b4] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1657_c27_f5b4_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- CAST_TO_int8_t[uxn_opcodes_h_l1660_c27_05ee] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1660_c27_05ee_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1668_l1659_l1654_l1651_l1638_DUPLICATE_f578 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1668_l1659_l1654_l1651_l1638_DUPLICATE_f578_return_output := result.u8_value;

     -- sp_relative_shift[uxn_opcodes_h_l1652_c30_1adc] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1652_c30_1adc_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_1adc_ins;
     sp_relative_shift_uxn_opcodes_h_l1652_c30_1adc_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_1adc_x;
     sp_relative_shift_uxn_opcodes_h_l1652_c30_1adc_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_1adc_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_1adc_return_output := sp_relative_shift_uxn_opcodes_h_l1652_c30_1adc_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1638_c2_e7a4] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1638_c2_e7a4_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1651_l1638_l1659_DUPLICATE_d82a LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1651_l1638_l1659_DUPLICATE_d82a_return_output := result.u16_value;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_7d48_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_7d48_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_7d48_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_7d48_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_7d48_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_7d48_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_7d48_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_7d48_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_7d48_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_7d48_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_7d48_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_7d48_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_7d48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_ff6e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_ff6e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_ff6e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_ff6e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_ff6e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_ff6e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_ff6e_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_ff6e_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_ff6e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_a650_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_3f49_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_a650_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_3f49_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_a650_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_3f49_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_a650_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_3f49_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_a650_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_3f49_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_a650_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_3f49_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1654_c7_a650_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_3f49_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_a650_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_3f49_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_a650_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_3f49_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_1973_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_6b62_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_1973_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_6b62_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_1973_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_6b62_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_1973_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_6b62_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_1973_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_6b62_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_1973_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_6b62_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_1973_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_6b62_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_9e7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_cf29_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_9e7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_cf29_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_9e7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_cf29_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_9e7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_cf29_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_9e7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_cf29_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_9e7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_cf29_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_d78a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_8559_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_d78a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_8559_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_d78a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_8559_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_d78a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_8559_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_7ba8_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1657_c27_f5b4_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_be16_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1660_c27_05ee_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1651_l1638_l1659_DUPLICATE_d82a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1651_l1638_l1659_DUPLICATE_d82a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_1973_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1651_l1638_l1659_DUPLICATE_d82a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1668_l1662_l1659_l1654_l1651_DUPLICATE_c062_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1668_l1662_l1659_l1654_l1651_DUPLICATE_c062_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_1973_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1668_l1662_l1659_l1654_l1651_DUPLICATE_c062_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_9e7a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1668_l1662_l1659_l1654_l1651_DUPLICATE_c062_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_d78a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1668_l1662_l1659_l1654_l1651_DUPLICATE_c062_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1651_l1662_l1654_l1659_DUPLICATE_deb8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1651_l1662_l1654_l1659_DUPLICATE_deb8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_1973_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1651_l1662_l1654_l1659_DUPLICATE_deb8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_9e7a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1651_l1662_l1654_l1659_DUPLICATE_deb8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1651_l1654_l1668_l1659_DUPLICATE_fa44_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1651_l1654_l1668_l1659_DUPLICATE_fa44_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_1973_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1651_l1654_l1668_l1659_DUPLICATE_fa44_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_d78a_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1651_l1654_l1668_l1659_DUPLICATE_fa44_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1668_l1659_l1654_l1651_l1638_DUPLICATE_f578_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1668_l1659_l1654_l1651_l1638_DUPLICATE_f578_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1668_l1659_l1654_l1651_l1638_DUPLICATE_f578_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_1973_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1668_l1659_l1654_l1651_l1638_DUPLICATE_f578_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_d78a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1668_l1659_l1654_l1651_l1638_DUPLICATE_f578_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1638_c2_e7a4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1638_c2_e7a4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1638_c2_e7a4_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1638_c2_e7a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1654_c7_a650_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_1adc_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1638_c2_e7a4] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1668_c7_d78a] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1668_c7_d78a_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_d78a_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1668_c7_d78a_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_d78a_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1668_c7_d78a_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_d78a_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_d78a_return_output := tmp8_low_MUX_uxn_opcodes_h_l1668_c7_d78a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1654_c7_a650] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_a650_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_a650_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_a650_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_a650_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1668_c7_d78a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1668_c7_d78a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_d78a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1668_c7_d78a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_d78a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1668_c7_d78a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_d78a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_d78a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1668_c7_d78a_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1657_c22_7ba8] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_7ba8_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_7ba8_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_7ba8_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_7ba8_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_7ba8_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_7ba8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1668_c7_d78a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_d78a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_d78a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_d78a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_d78a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_d78a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_d78a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_d78a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_d78a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1668_c7_d78a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_d78a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_d78a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_d78a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_d78a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_d78a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_d78a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_d78a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_d78a_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1638_c2_e7a4] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1662_c7_9e7a] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1662_c7_9e7a_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_9e7a_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1662_c7_9e7a_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_9e7a_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1662_c7_9e7a_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_9e7a_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_9e7a_return_output := tmp8_high_MUX_uxn_opcodes_h_l1662_c7_9e7a_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1660_c22_be16] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_be16_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_be16_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_be16_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_be16_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_be16_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_be16_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1662_c7_9e7a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_9e7a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_9e7a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_9e7a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_9e7a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_9e7a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_9e7a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_9e7a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_9e7a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1638_c2_e7a4] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1638_c2_e7a4] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output;

     -- t8_MUX[uxn_opcodes_h_l1654_c7_a650] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1654_c7_a650_cond <= VAR_t8_MUX_uxn_opcodes_h_l1654_c7_a650_cond;
     t8_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue;
     t8_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1654_c7_a650_return_output := t8_MUX_uxn_opcodes_h_l1654_c7_a650_return_output;

     -- Submodule level 2
     VAR_result_u16_value_uxn_opcodes_h_l1657_c3_365a := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_7ba8_return_output)),16);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_717b_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_be16_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_9e7a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_d78a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_1973_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_9e7a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_a650_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_9e7a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_d78a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_9e7a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_d78a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1654_c7_a650_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_1973_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_9e7a_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_9e7a_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_d78a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1657_c3_365a;
     -- BIN_OP_PLUS[uxn_opcodes_h_l1660_c22_717b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_717b_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_717b_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_717b_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_717b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_717b_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_717b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1651_c7_7a2c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output;

     -- t8_MUX[uxn_opcodes_h_l1651_c7_7a2c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond <= VAR_t8_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond;
     t8_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue;
     t8_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output := t8_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1662_c7_9e7a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_9e7a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_9e7a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_9e7a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_9e7a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_9e7a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_9e7a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_9e7a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_9e7a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1659_c7_1973] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_1973_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_1973_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_1973_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_1973_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_1973_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_1973_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_1973_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_1973_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1662_c7_9e7a] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1662_c7_9e7a_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_9e7a_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1662_c7_9e7a_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_9e7a_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1662_c7_9e7a_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_9e7a_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_9e7a_return_output := tmp8_low_MUX_uxn_opcodes_h_l1662_c7_9e7a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1662_c7_9e7a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1662_c7_9e7a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_9e7a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1662_c7_9e7a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_9e7a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1662_c7_9e7a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_9e7a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_9e7a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1662_c7_9e7a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1662_c7_9e7a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_9e7a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_9e7a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_9e7a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_9e7a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_9e7a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_9e7a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_9e7a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_9e7a_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1659_c7_1973] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1659_c7_1973_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_1973_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1659_c7_1973_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_1973_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1659_c7_1973_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_1973_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_1973_return_output := tmp8_high_MUX_uxn_opcodes_h_l1659_c7_1973_return_output;

     -- Submodule level 3
     VAR_result_u16_value_uxn_opcodes_h_l1660_c3_4e46 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_717b_return_output)),16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_1973_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_9e7a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_1973_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_1973_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_9e7a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_1973_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_9e7a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_1973_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_1973_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_9e7a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_1973_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1660_c3_4e46;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1659_c7_1973] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_1973_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_1973_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_1973_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_1973_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_1973_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_1973_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_1973_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_1973_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1659_c7_1973] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_1973_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_1973_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_1973_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_1973_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_1973_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_1973_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_1973_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_1973_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1638_c2_e7a4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1659_c7_1973] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1659_c7_1973_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_1973_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1659_c7_1973_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_1973_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1659_c7_1973_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_1973_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_1973_return_output := result_u16_value_MUX_uxn_opcodes_h_l1659_c7_1973_return_output;

     -- t8_MUX[uxn_opcodes_h_l1638_c2_e7a4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond <= VAR_t8_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond;
     t8_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue;
     t8_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output := t8_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1659_c7_1973] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1659_c7_1973_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_1973_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1659_c7_1973_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_1973_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1659_c7_1973_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_1973_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_1973_return_output := result_u8_value_MUX_uxn_opcodes_h_l1659_c7_1973_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1659_c7_1973] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1659_c7_1973_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_1973_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1659_c7_1973_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_1973_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1659_c7_1973_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_1973_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_1973_return_output := tmp8_low_MUX_uxn_opcodes_h_l1659_c7_1973_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1654_c7_a650] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_a650_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_a650_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_a650_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_a650_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1654_c7_a650] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1654_c7_a650_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_a650_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_a650_return_output := tmp8_high_MUX_uxn_opcodes_h_l1654_c7_a650_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_1973_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_a650_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_1973_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_1973_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_1973_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_a650_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_1973_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1654_c7_a650] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_a650_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_a650_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_a650_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_a650_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1651_c7_7a2c] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output := tmp8_high_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1651_c7_7a2c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1654_c7_a650] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1654_c7_a650_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_a650_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_a650_return_output := result_u8_value_MUX_uxn_opcodes_h_l1654_c7_a650_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1654_c7_a650] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1654_c7_a650_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_a650_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_a650_return_output := result_u16_value_MUX_uxn_opcodes_h_l1654_c7_a650_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1654_c7_a650] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1654_c7_a650_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_a650_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_a650_return_output := tmp8_low_MUX_uxn_opcodes_h_l1654_c7_a650_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1654_c7_a650] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_a650_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_a650_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_a650_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_a650_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_a650_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_a650_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_a650_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_a650_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_a650_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_a650_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_a650_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1651_c7_7a2c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output := result_u16_value_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1651_c7_7a2c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1651_c7_7a2c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1651_c7_7a2c] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output := tmp8_low_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1638_c2_e7a4] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output := tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1638_c2_e7a4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1651_c7_7a2c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_7a2c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_7a2c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_7a2c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output;
     REG_VAR_tmp8_high := VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_7a2c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1638_c2_e7a4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1638_c2_e7a4] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output := tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1638_c2_e7a4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1638_c2_e7a4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output := result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1638_c2_e7a4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e7a4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e7a4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e7a4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output;

     -- Submodule level 7
     REG_VAR_tmp8_low := VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c942_uxn_opcodes_h_l1675_l1634_DUPLICATE_9f21 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c942_uxn_opcodes_h_l1675_l1634_DUPLICATE_9f21_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c942(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e7a4_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c942_uxn_opcodes_h_l1675_l1634_DUPLICATE_9f21_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c942_uxn_opcodes_h_l1675_l1634_DUPLICATE_9f21_return_output;
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