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
-- BIN_OP_EQ[uxn_opcodes_h_l1638_c6_cc5f]
signal BIN_OP_EQ_uxn_opcodes_h_l1638_c6_cc5f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1638_c6_cc5f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1638_c6_cc5f_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1638_c2_5ef9]
signal t8_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1638_c2_5ef9]
signal tmp8_high_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1638_c2_5ef9]
signal tmp8_low_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1638_c2_5ef9]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1638_c2_5ef9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1638_c2_5ef9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1638_c2_5ef9]
signal result_u8_value_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1638_c2_5ef9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1638_c2_5ef9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1638_c2_5ef9]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1638_c2_5ef9]
signal result_u16_value_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1638_c2_5ef9]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1638_c2_5ef9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1651_c11_3c25]
signal BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3c25_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3c25_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3c25_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1651_c7_cbdc]
signal t8_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1651_c7_cbdc]
signal tmp8_high_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1651_c7_cbdc]
signal tmp8_low_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1651_c7_cbdc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1651_c7_cbdc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1651_c7_cbdc]
signal result_u8_value_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1651_c7_cbdc]
signal result_u16_value_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1651_c7_cbdc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1651_c7_cbdc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output : unsigned(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1652_c30_bf18]
signal sp_relative_shift_uxn_opcodes_h_l1652_c30_bf18_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1652_c30_bf18_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1652_c30_bf18_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1652_c30_bf18_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1654_c11_8490]
signal BIN_OP_EQ_uxn_opcodes_h_l1654_c11_8490_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1654_c11_8490_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1654_c11_8490_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1654_c7_8893]
signal t8_MUX_uxn_opcodes_h_l1654_c7_8893_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1654_c7_8893_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1654_c7_8893]
signal tmp8_high_MUX_uxn_opcodes_h_l1654_c7_8893_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1654_c7_8893_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1654_c7_8893]
signal tmp8_low_MUX_uxn_opcodes_h_l1654_c7_8893_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1654_c7_8893_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1654_c7_8893]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_8893_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_8893_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1654_c7_8893]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_8893_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_8893_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1654_c7_8893]
signal result_u8_value_MUX_uxn_opcodes_h_l1654_c7_8893_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1654_c7_8893_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1654_c7_8893]
signal result_u16_value_MUX_uxn_opcodes_h_l1654_c7_8893_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1654_c7_8893_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1654_c7_8893]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_8893_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_8893_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1654_c7_8893]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_8893_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_8893_return_output : unsigned(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1657_c22_8c45]
signal BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_8c45_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_8c45_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_8c45_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1659_c11_2004]
signal BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2004_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2004_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2004_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1659_c7_b6b7]
signal tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b6b7_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b6b7_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b6b7_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b6b7_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1659_c7_b6b7]
signal tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b6b7_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b6b7_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b6b7_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b6b7_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1659_c7_b6b7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b6b7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b6b7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b6b7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b6b7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1659_c7_b6b7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b6b7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b6b7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b6b7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b6b7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1659_c7_b6b7]
signal result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b6b7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b6b7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b6b7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b6b7_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1659_c7_b6b7]
signal result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b6b7_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b6b7_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b6b7_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b6b7_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1659_c7_b6b7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b6b7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b6b7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b6b7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b6b7_return_output : unsigned(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1660_c22_027b]
signal BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_027b_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_027b_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_027b_return_output : signed(17 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1660_c22_998c]
signal BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_998c_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_998c_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_998c_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1662_c11_aeac]
signal BIN_OP_EQ_uxn_opcodes_h_l1662_c11_aeac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1662_c11_aeac_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1662_c11_aeac_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1662_c7_a427]
signal tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a427_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a427_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a427_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a427_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1662_c7_a427]
signal tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a427_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a427_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a427_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a427_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1662_c7_a427]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a427_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a427_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a427_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a427_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1662_c7_a427]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a427_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a427_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a427_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a427_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1662_c7_a427]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a427_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a427_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a427_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a427_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1662_c7_a427]
signal result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a427_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a427_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a427_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a427_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1668_c11_e229]
signal BIN_OP_EQ_uxn_opcodes_h_l1668_c11_e229_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1668_c11_e229_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1668_c11_e229_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1668_c7_8182]
signal tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8182_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8182_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8182_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8182_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1668_c7_8182]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8182_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8182_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8182_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8182_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1668_c7_8182]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8182_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8182_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8182_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8182_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1668_c7_8182]
signal result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8182_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8182_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8182_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8182_return_output : unsigned(7 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_1899( ref_toks_0 : opcode_result_t;
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
      base.is_stack_index_flipped := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.u16_value := ref_toks_8;
      base.is_ram_write := ref_toks_9;
      base.stack_address_sp_offset := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1638_c6_cc5f
BIN_OP_EQ_uxn_opcodes_h_l1638_c6_cc5f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1638_c6_cc5f_left,
BIN_OP_EQ_uxn_opcodes_h_l1638_c6_cc5f_right,
BIN_OP_EQ_uxn_opcodes_h_l1638_c6_cc5f_return_output);

-- t8_MUX_uxn_opcodes_h_l1638_c2_5ef9
t8_MUX_uxn_opcodes_h_l1638_c2_5ef9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond,
t8_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue,
t8_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse,
t8_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1638_c2_5ef9
tmp8_high_MUX_uxn_opcodes_h_l1638_c2_5ef9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond,
tmp8_high_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1638_c2_5ef9
tmp8_low_MUX_uxn_opcodes_h_l1638_c2_5ef9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond,
tmp8_low_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_5ef9
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_5ef9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_5ef9
result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_5ef9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_5ef9
result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_5ef9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1638_c2_5ef9
result_u8_value_MUX_uxn_opcodes_h_l1638_c2_5ef9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond,
result_u8_value_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_5ef9
result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_5ef9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_5ef9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_5ef9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9
result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1638_c2_5ef9
result_u16_value_MUX_uxn_opcodes_h_l1638_c2_5ef9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond,
result_u16_value_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9
result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_5ef9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_5ef9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3c25
BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3c25 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3c25_left,
BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3c25_right,
BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3c25_return_output);

-- t8_MUX_uxn_opcodes_h_l1651_c7_cbdc
t8_MUX_uxn_opcodes_h_l1651_c7_cbdc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond,
t8_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue,
t8_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse,
t8_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1651_c7_cbdc
tmp8_high_MUX_uxn_opcodes_h_l1651_c7_cbdc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond,
tmp8_high_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1651_c7_cbdc
tmp8_low_MUX_uxn_opcodes_h_l1651_c7_cbdc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond,
tmp8_low_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_cbdc
result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_cbdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_cbdc
result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_cbdc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1651_c7_cbdc
result_u8_value_MUX_uxn_opcodes_h_l1651_c7_cbdc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond,
result_u8_value_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1651_c7_cbdc
result_u16_value_MUX_uxn_opcodes_h_l1651_c7_cbdc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond,
result_u16_value_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_cbdc
result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_cbdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_cbdc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_cbdc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1652_c30_bf18
sp_relative_shift_uxn_opcodes_h_l1652_c30_bf18 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1652_c30_bf18_ins,
sp_relative_shift_uxn_opcodes_h_l1652_c30_bf18_x,
sp_relative_shift_uxn_opcodes_h_l1652_c30_bf18_y,
sp_relative_shift_uxn_opcodes_h_l1652_c30_bf18_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1654_c11_8490
BIN_OP_EQ_uxn_opcodes_h_l1654_c11_8490 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1654_c11_8490_left,
BIN_OP_EQ_uxn_opcodes_h_l1654_c11_8490_right,
BIN_OP_EQ_uxn_opcodes_h_l1654_c11_8490_return_output);

-- t8_MUX_uxn_opcodes_h_l1654_c7_8893
t8_MUX_uxn_opcodes_h_l1654_c7_8893 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1654_c7_8893_cond,
t8_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue,
t8_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse,
t8_MUX_uxn_opcodes_h_l1654_c7_8893_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1654_c7_8893
tmp8_high_MUX_uxn_opcodes_h_l1654_c7_8893 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1654_c7_8893_cond,
tmp8_high_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1654_c7_8893_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1654_c7_8893
tmp8_low_MUX_uxn_opcodes_h_l1654_c7_8893 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1654_c7_8893_cond,
tmp8_low_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1654_c7_8893_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_8893
result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_8893 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_8893_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_8893_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_8893
result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_8893 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_8893_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_8893_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1654_c7_8893
result_u8_value_MUX_uxn_opcodes_h_l1654_c7_8893 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1654_c7_8893_cond,
result_u8_value_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1654_c7_8893_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1654_c7_8893
result_u16_value_MUX_uxn_opcodes_h_l1654_c7_8893 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1654_c7_8893_cond,
result_u16_value_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1654_c7_8893_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_8893
result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_8893 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_8893_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_8893_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_8893
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_8893 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_8893_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_8893_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_8c45
BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_8c45 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_8c45_left,
BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_8c45_right,
BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_8c45_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2004
BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2004 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2004_left,
BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2004_right,
BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2004_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b6b7
tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b6b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b6b7_cond,
tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b6b7_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b6b7_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b6b7_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b6b7
tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b6b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b6b7_cond,
tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b6b7_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b6b7_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b6b7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b6b7
result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b6b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b6b7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b6b7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b6b7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b6b7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b6b7
result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b6b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b6b7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b6b7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b6b7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b6b7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b6b7
result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b6b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b6b7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b6b7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b6b7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b6b7_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b6b7
result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b6b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b6b7_cond,
result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b6b7_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b6b7_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b6b7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b6b7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b6b7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b6b7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b6b7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b6b7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b6b7_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_027b
BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_027b : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_027b_left,
BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_027b_right,
BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_027b_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_998c
BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_998c : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_998c_left,
BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_998c_right,
BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_998c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1662_c11_aeac
BIN_OP_EQ_uxn_opcodes_h_l1662_c11_aeac : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1662_c11_aeac_left,
BIN_OP_EQ_uxn_opcodes_h_l1662_c11_aeac_right,
BIN_OP_EQ_uxn_opcodes_h_l1662_c11_aeac_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a427
tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a427 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a427_cond,
tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a427_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a427_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a427_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a427
tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a427 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a427_cond,
tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a427_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a427_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a427_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a427
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a427 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a427_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a427_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a427_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a427_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a427
result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a427 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a427_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a427_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a427_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a427_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a427
result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a427 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a427_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a427_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a427_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a427_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a427
result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a427 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a427_cond,
result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a427_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a427_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a427_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1668_c11_e229
BIN_OP_EQ_uxn_opcodes_h_l1668_c11_e229 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1668_c11_e229_left,
BIN_OP_EQ_uxn_opcodes_h_l1668_c11_e229_right,
BIN_OP_EQ_uxn_opcodes_h_l1668_c11_e229_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8182
tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8182 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8182_cond,
tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8182_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8182_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8182_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8182
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8182 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8182_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8182_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8182_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8182_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8182
result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8182 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8182_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8182_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8182_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8182_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8182
result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8182 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8182_cond,
result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8182_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8182_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8182_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1638_c6_cc5f_return_output,
 t8_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3c25_return_output,
 t8_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output,
 sp_relative_shift_uxn_opcodes_h_l1652_c30_bf18_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1654_c11_8490_return_output,
 t8_MUX_uxn_opcodes_h_l1654_c7_8893_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1654_c7_8893_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1654_c7_8893_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_8893_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_8893_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1654_c7_8893_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1654_c7_8893_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_8893_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_8893_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_8c45_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2004_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b6b7_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b6b7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b6b7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b6b7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b6b7_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b6b7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b6b7_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_027b_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_998c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1662_c11_aeac_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a427_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a427_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a427_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a427_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a427_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a427_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1668_c11_e229_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8182_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8182_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8182_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8182_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_cc5f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_cc5f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_cc5f_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1638_c2_5ef9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1638_c2_5ef9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1643_c3_1872 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1638_c2_5ef9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1638_c2_5ef9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1648_c3_48ab : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3c25_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3c25_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3c25_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1654_c7_8893_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_8893_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_8893_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_8893_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_8893_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_8893_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_8893_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_8893_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_8893_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_bf18_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_bf18_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_bf18_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_bf18_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_8490_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_8490_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_8490_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1654_c7_8893_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b6b7_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_8893_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b6b7_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_8893_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b6b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_8893_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1656_c3_b11d : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1654_c7_8893_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_8893_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b6b7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_8893_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1657_c3_c7f0 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b6b7_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_8893_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b6b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_8893_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b6b7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_8893_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_8c45_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1657_c27_c1a2_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_8c45_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_8c45_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2004_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2004_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2004_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b6b7_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b6b7_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a427_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b6b7_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b6b7_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b6b7_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a427_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b6b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b6b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b6b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a427_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b6b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b6b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b6b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a427_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b6b7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b6b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b6b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a427_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b6b7_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b6b7_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1660_c3_f89b : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b6b7_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b6b7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b6b7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b6b7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a427_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b6b7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_027b_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1660_c27_022e_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_027b_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_027b_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_998c_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_998c_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_998c_return_output : signed(18 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_aeac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_aeac_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_aeac_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a427_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a427_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a427_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a427_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a427_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8182_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a427_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a427_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1665_c3_b4b7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a427_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8182_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a427_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a427_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a427_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8182_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a427_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a427_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a427_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a427_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a427_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a427_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8182_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a427_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_e229_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_e229_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_e229_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8182_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8182_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8182_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8182_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1670_c3_3fff : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8182_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8182_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8182_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8182_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8182_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8182_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8182_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8182_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1638_l1668_l1659_l1654_l1651_DUPLICATE_6918_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1638_l1659_l1651_DUPLICATE_35e7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1659_l1651_l1662_l1654_DUPLICATE_f407_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1668_l1662_l1659_l1654_l1651_DUPLICATE_54b6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1668_l1659_l1651_l1654_DUPLICATE_291d_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1899_uxn_opcodes_h_l1675_l1634_DUPLICATE_e39b_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_aeac_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_bf18_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1656_c3_b11d := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1656_c3_b11d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1665_c3_b4b7 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a427_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1665_c3_b4b7;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1670_c3_3fff := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8182_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1670_c3_3fff;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8182_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1648_c3_48ab := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1648_c3_48ab;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_8490_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_e229_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a427_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3c25_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_bf18_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_998c_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1643_c3_1872 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1643_c3_1872;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_cc5f_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2004_right := to_unsigned(3, 2);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_bf18_ins := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_8c45_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_027b_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_cc5f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3c25_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_8490_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2004_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_aeac_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_e229_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a427_iftrue := VAR_previous_ram_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8182_iftrue := VAR_previous_ram_read;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a427_iftrue := VAR_previous_ram_read;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8182_iftrue := VAR_previous_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse := t8;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b6b7_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a427_iffalse := tmp8_high;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b6b7_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a427_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8182_iffalse := tmp8_low;
     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1638_c2_5ef9] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1638_c2_5ef9_return_output := result.is_pc_updated;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l1654_c7_8893] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1654_c7_8893_return_output := result.sp_relative_shift;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1638_c2_5ef9] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1638_c2_5ef9_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1638_c6_cc5f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1638_c6_cc5f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_cc5f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1638_c6_cc5f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_cc5f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_cc5f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1638_c6_cc5f_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1668_l1659_l1651_l1654_DUPLICATE_291d LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1668_l1659_l1651_l1654_DUPLICATE_291d_return_output := result.stack_address_sp_offset;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1638_c2_5ef9] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1638_c2_5ef9_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1654_c11_8490] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1654_c11_8490_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_8490_left;
     BIN_OP_EQ_uxn_opcodes_h_l1654_c11_8490_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_8490_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_8490_return_output := BIN_OP_EQ_uxn_opcodes_h_l1654_c11_8490_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1668_l1662_l1659_l1654_l1651_DUPLICATE_54b6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1668_l1662_l1659_l1654_l1651_DUPLICATE_54b6_return_output := result.is_opc_done;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1657_c27_c1a2] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1657_c27_c1a2_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1651_c11_3c25] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3c25_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3c25_left;
     BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3c25_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3c25_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3c25_return_output := BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3c25_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1660_c27_022e] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1660_c27_022e_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1659_l1651_l1662_l1654_DUPLICATE_f407 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1659_l1651_l1662_l1654_DUPLICATE_f407_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1638_l1659_l1651_DUPLICATE_35e7 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1638_l1659_l1651_DUPLICATE_35e7_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1659_c11_2004] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2004_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2004_left;
     BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2004_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2004_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2004_return_output := BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2004_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1638_c2_5ef9] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1638_c2_5ef9_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1638_l1668_l1659_l1654_l1651_DUPLICATE_6918 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1638_l1668_l1659_l1654_l1651_DUPLICATE_6918_return_output := result.u8_value;

     -- sp_relative_shift[uxn_opcodes_h_l1652_c30_bf18] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1652_c30_bf18_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_bf18_ins;
     sp_relative_shift_uxn_opcodes_h_l1652_c30_bf18_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_bf18_x;
     sp_relative_shift_uxn_opcodes_h_l1652_c30_bf18_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_bf18_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_bf18_return_output := sp_relative_shift_uxn_opcodes_h_l1652_c30_bf18_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1662_c11_aeac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1662_c11_aeac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_aeac_left;
     BIN_OP_EQ_uxn_opcodes_h_l1662_c11_aeac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_aeac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_aeac_return_output := BIN_OP_EQ_uxn_opcodes_h_l1662_c11_aeac_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1668_c11_e229] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1668_c11_e229_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_e229_left;
     BIN_OP_EQ_uxn_opcodes_h_l1668_c11_e229_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_e229_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_e229_return_output := BIN_OP_EQ_uxn_opcodes_h_l1668_c11_e229_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_cc5f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_cc5f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_cc5f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_cc5f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_cc5f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_cc5f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_cc5f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_cc5f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_cc5f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_cc5f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_cc5f_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_cc5f_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_cc5f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3c25_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3c25_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3c25_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3c25_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3c25_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3c25_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3c25_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3c25_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3c25_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_8893_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_8490_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_8893_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_8490_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_8893_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_8490_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_8893_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_8490_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_8893_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_8490_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_8893_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_8490_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1654_c7_8893_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_8490_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_8893_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_8490_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_8893_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_8490_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b6b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2004_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b6b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2004_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b6b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2004_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b6b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2004_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b6b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2004_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b6b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2004_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b6b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_2004_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_aeac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_aeac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_aeac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_aeac_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_aeac_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_aeac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8182_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_e229_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8182_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_e229_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8182_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_e229_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8182_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_e229_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_8c45_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1657_c27_c1a2_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_027b_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1660_c27_022e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1638_l1659_l1651_DUPLICATE_35e7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1638_l1659_l1651_DUPLICATE_35e7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b6b7_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1638_l1659_l1651_DUPLICATE_35e7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1668_l1662_l1659_l1654_l1651_DUPLICATE_54b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1668_l1662_l1659_l1654_l1651_DUPLICATE_54b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b6b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1668_l1662_l1659_l1654_l1651_DUPLICATE_54b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a427_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1668_l1662_l1659_l1654_l1651_DUPLICATE_54b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8182_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1668_l1662_l1659_l1654_l1651_DUPLICATE_54b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1659_l1651_l1662_l1654_DUPLICATE_f407_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1659_l1651_l1662_l1654_DUPLICATE_f407_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b6b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1659_l1651_l1662_l1654_DUPLICATE_f407_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a427_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1659_l1651_l1662_l1654_DUPLICATE_f407_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1668_l1659_l1651_l1654_DUPLICATE_291d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1668_l1659_l1651_l1654_DUPLICATE_291d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b6b7_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1668_l1659_l1651_l1654_DUPLICATE_291d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8182_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1668_l1659_l1651_l1654_DUPLICATE_291d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1638_l1668_l1659_l1654_l1651_DUPLICATE_6918_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1638_l1668_l1659_l1654_l1651_DUPLICATE_6918_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1638_l1668_l1659_l1654_l1651_DUPLICATE_6918_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b6b7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1638_l1668_l1659_l1654_l1651_DUPLICATE_6918_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8182_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1638_l1668_l1659_l1654_l1651_DUPLICATE_6918_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1638_c2_5ef9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1638_c2_5ef9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1638_c2_5ef9_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1638_c2_5ef9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1654_c7_8893_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_bf18_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1638_c2_5ef9] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1657_c22_8c45] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_8c45_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_8c45_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_8c45_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_8c45_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_8c45_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_8c45_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1668_c7_8182] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8182_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8182_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8182_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8182_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8182_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8182_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8182_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8182_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1662_c7_a427] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a427_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a427_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a427_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a427_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a427_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a427_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a427_return_output := tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a427_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1668_c7_8182] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8182_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8182_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8182_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8182_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8182_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8182_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8182_return_output := tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8182_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1662_c7_a427] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a427_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a427_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a427_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a427_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a427_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a427_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a427_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a427_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1668_c7_8182] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8182_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8182_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8182_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8182_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8182_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8182_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8182_return_output := result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8182_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1638_c2_5ef9] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1668_c7_8182] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8182_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8182_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8182_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8182_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8182_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8182_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8182_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8182_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1638_c2_5ef9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output;

     -- t8_MUX[uxn_opcodes_h_l1654_c7_8893] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1654_c7_8893_cond <= VAR_t8_MUX_uxn_opcodes_h_l1654_c7_8893_cond;
     t8_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue;
     t8_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1654_c7_8893_return_output := t8_MUX_uxn_opcodes_h_l1654_c7_8893_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1660_c22_027b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_027b_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_027b_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_027b_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_027b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_027b_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_027b_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1638_c2_5ef9] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1654_c7_8893] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_8893_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_8893_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_8893_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_8893_return_output;

     -- Submodule level 2
     VAR_result_u16_value_uxn_opcodes_h_l1657_c3_c7f0 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_8c45_return_output)),16);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_998c_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_027b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a427_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8182_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b6b7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a427_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_8893_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a427_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8182_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a427_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8182_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1654_c7_8893_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b6b7_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a427_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a427_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8182_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1657_c3_c7f0;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1651_c7_cbdc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1662_c7_a427] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a427_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a427_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a427_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a427_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a427_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a427_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a427_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a427_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1662_c7_a427] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a427_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a427_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a427_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a427_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a427_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a427_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a427_return_output := tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a427_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1660_c22_998c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_998c_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_998c_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_998c_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_998c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_998c_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_998c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1659_c7_b6b7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b6b7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b6b7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b6b7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b6b7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b6b7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b6b7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b6b7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b6b7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1662_c7_a427] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a427_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a427_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a427_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a427_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a427_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a427_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a427_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a427_return_output;

     -- t8_MUX[uxn_opcodes_h_l1651_c7_cbdc] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond <= VAR_t8_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond;
     t8_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue;
     t8_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output := t8_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1659_c7_b6b7] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b6b7_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b6b7_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b6b7_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b6b7_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b6b7_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b6b7_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b6b7_return_output := tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b6b7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1662_c7_a427] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a427_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a427_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a427_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a427_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a427_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a427_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a427_return_output := result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a427_return_output;

     -- Submodule level 3
     VAR_result_u16_value_uxn_opcodes_h_l1660_c3_f89b := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_998c_return_output)),16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b6b7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a427_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b6b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b6b7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a427_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b6b7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a427_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b6b7_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b6b7_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a427_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b6b7_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1660_c3_f89b;
     -- t8_MUX[uxn_opcodes_h_l1638_c2_5ef9] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond <= VAR_t8_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond;
     t8_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue;
     t8_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output := t8_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1638_c2_5ef9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1654_c7_8893] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1654_c7_8893_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_8893_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_8893_return_output := tmp8_high_MUX_uxn_opcodes_h_l1654_c7_8893_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1654_c7_8893] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_8893_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_8893_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_8893_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_8893_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1659_c7_b6b7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b6b7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b6b7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b6b7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b6b7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b6b7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b6b7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b6b7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b6b7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1659_c7_b6b7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b6b7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b6b7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b6b7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b6b7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b6b7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b6b7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b6b7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b6b7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1659_c7_b6b7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b6b7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b6b7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b6b7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b6b7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b6b7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b6b7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b6b7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b6b7_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1659_c7_b6b7] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b6b7_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b6b7_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b6b7_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b6b7_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b6b7_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b6b7_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b6b7_return_output := tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b6b7_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1659_c7_b6b7] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b6b7_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b6b7_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b6b7_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b6b7_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b6b7_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b6b7_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b6b7_return_output := result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b6b7_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b6b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_8893_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b6b7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b6b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b6b7_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_8893_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b6b7_return_output;
     -- tmp8_low_MUX[uxn_opcodes_h_l1654_c7_8893] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1654_c7_8893_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_8893_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_8893_return_output := tmp8_low_MUX_uxn_opcodes_h_l1654_c7_8893_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1654_c7_8893] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1654_c7_8893_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_8893_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_8893_return_output := result_u16_value_MUX_uxn_opcodes_h_l1654_c7_8893_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1654_c7_8893] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1654_c7_8893_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_8893_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_8893_return_output := result_u8_value_MUX_uxn_opcodes_h_l1654_c7_8893_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1651_c7_cbdc] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output := tmp8_high_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1654_c7_8893] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_8893_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_8893_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_8893_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_8893_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1654_c7_8893] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_8893_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_8893_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_8893_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_8893_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_8893_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_8893_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1651_c7_cbdc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_8893_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_8893_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_8893_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_8893_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_8893_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1651_c7_cbdc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output := result_u8_value_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1638_c2_5ef9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1651_c7_cbdc] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output := tmp8_low_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1651_c7_cbdc] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output := result_u16_value_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1638_c2_5ef9] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output := tmp8_high_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1651_c7_cbdc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1651_c7_cbdc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_cbdc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_cbdc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_cbdc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output;
     REG_VAR_tmp8_high := VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_cbdc_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1638_c2_5ef9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1638_c2_5ef9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output := result_u8_value_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1638_c2_5ef9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1638_c2_5ef9] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output := tmp8_low_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1638_c2_5ef9] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_5ef9_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_5ef9_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_5ef9_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output := result_u16_value_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output;

     -- Submodule level 7
     REG_VAR_tmp8_low := VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1899_uxn_opcodes_h_l1675_l1634_DUPLICATE_e39b LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1899_uxn_opcodes_h_l1675_l1634_DUPLICATE_e39b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1899(
     result,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_5ef9_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1899_uxn_opcodes_h_l1675_l1634_DUPLICATE_e39b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1899_uxn_opcodes_h_l1675_l1634_DUPLICATE_e39b_return_output;
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
