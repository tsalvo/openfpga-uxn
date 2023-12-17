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
-- BIN_OP_EQ[uxn_opcodes_h_l1661_c6_33e2]
signal BIN_OP_EQ_uxn_opcodes_h_l1661_c6_33e2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1661_c6_33e2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1661_c6_33e2_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1661_c2_7e89]
signal tmp8_low_MUX_uxn_opcodes_h_l1661_c2_7e89_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1661_c2_7e89]
signal t8_MUX_uxn_opcodes_h_l1661_c2_7e89_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1661_c2_7e89]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_7e89_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1661_c2_7e89]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_7e89_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1661_c2_7e89]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_7e89_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1661_c2_7e89]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_7e89_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1661_c2_7e89]
signal result_u8_value_MUX_uxn_opcodes_h_l1661_c2_7e89_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1661_c2_7e89]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_7e89_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1661_c2_7e89]
signal result_u16_value_MUX_uxn_opcodes_h_l1661_c2_7e89_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1661_c2_7e89]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_7e89_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1661_c2_7e89]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_7e89_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1661_c2_7e89]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_7e89_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1661_c2_7e89]
signal tmp8_high_MUX_uxn_opcodes_h_l1661_c2_7e89_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1674_c11_8dbc]
signal BIN_OP_EQ_uxn_opcodes_h_l1674_c11_8dbc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1674_c11_8dbc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1674_c11_8dbc_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1674_c7_d33a]
signal tmp8_low_MUX_uxn_opcodes_h_l1674_c7_d33a_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1674_c7_d33a]
signal t8_MUX_uxn_opcodes_h_l1674_c7_d33a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1674_c7_d33a]
signal result_u16_value_MUX_uxn_opcodes_h_l1674_c7_d33a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1674_c7_d33a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_d33a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1674_c7_d33a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_d33a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1674_c7_d33a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_d33a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1674_c7_d33a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_d33a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1674_c7_d33a]
signal result_u8_value_MUX_uxn_opcodes_h_l1674_c7_d33a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1674_c7_d33a]
signal tmp8_high_MUX_uxn_opcodes_h_l1674_c7_d33a_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1675_c30_bd2d]
signal sp_relative_shift_uxn_opcodes_h_l1675_c30_bd2d_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1675_c30_bd2d_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1675_c30_bd2d_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1675_c30_bd2d_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1677_c11_2c6c]
signal BIN_OP_EQ_uxn_opcodes_h_l1677_c11_2c6c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1677_c11_2c6c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1677_c11_2c6c_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1677_c7_e8e7]
signal tmp8_low_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1677_c7_e8e7]
signal t8_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1677_c7_e8e7]
signal result_u16_value_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1677_c7_e8e7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1677_c7_e8e7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1677_c7_e8e7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1677_c7_e8e7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1677_c7_e8e7]
signal result_u8_value_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1677_c7_e8e7]
signal tmp8_high_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1680_c22_27be]
signal BIN_OP_PLUS_uxn_opcodes_h_l1680_c22_27be_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1680_c22_27be_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1680_c22_27be_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1682_c11_014a]
signal BIN_OP_EQ_uxn_opcodes_h_l1682_c11_014a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1682_c11_014a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1682_c11_014a_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1682_c7_d3a4]
signal tmp8_low_MUX_uxn_opcodes_h_l1682_c7_d3a4_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1682_c7_d3a4_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1682_c7_d3a4_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1682_c7_d3a4_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1682_c7_d3a4]
signal result_u16_value_MUX_uxn_opcodes_h_l1682_c7_d3a4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1682_c7_d3a4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1682_c7_d3a4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1682_c7_d3a4_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1682_c7_d3a4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_d3a4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_d3a4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_d3a4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_d3a4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1682_c7_d3a4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_d3a4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_d3a4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_d3a4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_d3a4_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1682_c7_d3a4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_d3a4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_d3a4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_d3a4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_d3a4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1682_c7_d3a4]
signal result_u8_value_MUX_uxn_opcodes_h_l1682_c7_d3a4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1682_c7_d3a4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1682_c7_d3a4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1682_c7_d3a4_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1682_c7_d3a4]
signal tmp8_high_MUX_uxn_opcodes_h_l1682_c7_d3a4_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1682_c7_d3a4_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1682_c7_d3a4_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1682_c7_d3a4_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1683_c22_970a]
signal BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_970a_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_970a_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_970a_return_output : signed(17 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1683_c22_9323]
signal BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_9323_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_9323_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_9323_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1685_c11_989b]
signal BIN_OP_EQ_uxn_opcodes_h_l1685_c11_989b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1685_c11_989b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1685_c11_989b_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1685_c7_5217]
signal tmp8_low_MUX_uxn_opcodes_h_l1685_c7_5217_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1685_c7_5217_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1685_c7_5217_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1685_c7_5217_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1685_c7_5217]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_5217_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_5217_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_5217_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_5217_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1685_c7_5217]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_5217_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_5217_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_5217_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_5217_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1685_c7_5217]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_5217_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_5217_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_5217_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_5217_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1685_c7_5217]
signal result_u8_value_MUX_uxn_opcodes_h_l1685_c7_5217_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1685_c7_5217_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1685_c7_5217_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1685_c7_5217_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1685_c7_5217]
signal tmp8_high_MUX_uxn_opcodes_h_l1685_c7_5217_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1685_c7_5217_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1685_c7_5217_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1685_c7_5217_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1691_c11_a0ea]
signal BIN_OP_EQ_uxn_opcodes_h_l1691_c11_a0ea_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1691_c11_a0ea_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1691_c11_a0ea_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1691_c7_534f]
signal tmp8_low_MUX_uxn_opcodes_h_l1691_c7_534f_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1691_c7_534f_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1691_c7_534f_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1691_c7_534f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1691_c7_534f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_534f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_534f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_534f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_534f_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1691_c7_534f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_534f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_534f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_534f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_534f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1691_c7_534f]
signal result_u8_value_MUX_uxn_opcodes_h_l1691_c7_534f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1691_c7_534f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1691_c7_534f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1691_c7_534f_return_output : unsigned(7 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_416d( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.u16_value := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_pc_updated := ref_toks_9;
      base.is_opc_done := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1661_c6_33e2
BIN_OP_EQ_uxn_opcodes_h_l1661_c6_33e2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1661_c6_33e2_left,
BIN_OP_EQ_uxn_opcodes_h_l1661_c6_33e2_right,
BIN_OP_EQ_uxn_opcodes_h_l1661_c6_33e2_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1661_c2_7e89
tmp8_low_MUX_uxn_opcodes_h_l1661_c2_7e89 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1661_c2_7e89_cond,
tmp8_low_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output);

-- t8_MUX_uxn_opcodes_h_l1661_c2_7e89
t8_MUX_uxn_opcodes_h_l1661_c2_7e89 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1661_c2_7e89_cond,
t8_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue,
t8_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse,
t8_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_7e89
result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_7e89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_7e89_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_7e89
result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_7e89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_7e89_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_7e89
result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_7e89 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_7e89_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_7e89
result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_7e89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_7e89_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1661_c2_7e89
result_u8_value_MUX_uxn_opcodes_h_l1661_c2_7e89 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1661_c2_7e89_cond,
result_u8_value_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_7e89
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_7e89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_7e89_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1661_c2_7e89
result_u16_value_MUX_uxn_opcodes_h_l1661_c2_7e89 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1661_c2_7e89_cond,
result_u16_value_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_7e89
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_7e89 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_7e89_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_7e89
result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_7e89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_7e89_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_7e89
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_7e89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_7e89_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1661_c2_7e89
tmp8_high_MUX_uxn_opcodes_h_l1661_c2_7e89 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1661_c2_7e89_cond,
tmp8_high_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1674_c11_8dbc
BIN_OP_EQ_uxn_opcodes_h_l1674_c11_8dbc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1674_c11_8dbc_left,
BIN_OP_EQ_uxn_opcodes_h_l1674_c11_8dbc_right,
BIN_OP_EQ_uxn_opcodes_h_l1674_c11_8dbc_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1674_c7_d33a
tmp8_low_MUX_uxn_opcodes_h_l1674_c7_d33a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1674_c7_d33a_cond,
tmp8_low_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output);

-- t8_MUX_uxn_opcodes_h_l1674_c7_d33a
t8_MUX_uxn_opcodes_h_l1674_c7_d33a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1674_c7_d33a_cond,
t8_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue,
t8_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse,
t8_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1674_c7_d33a
result_u16_value_MUX_uxn_opcodes_h_l1674_c7_d33a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1674_c7_d33a_cond,
result_u16_value_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_d33a
result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_d33a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_d33a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_d33a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_d33a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_d33a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_d33a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_d33a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_d33a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_d33a
result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_d33a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_d33a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1674_c7_d33a
result_u8_value_MUX_uxn_opcodes_h_l1674_c7_d33a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1674_c7_d33a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1674_c7_d33a
tmp8_high_MUX_uxn_opcodes_h_l1674_c7_d33a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1674_c7_d33a_cond,
tmp8_high_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1675_c30_bd2d
sp_relative_shift_uxn_opcodes_h_l1675_c30_bd2d : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1675_c30_bd2d_ins,
sp_relative_shift_uxn_opcodes_h_l1675_c30_bd2d_x,
sp_relative_shift_uxn_opcodes_h_l1675_c30_bd2d_y,
sp_relative_shift_uxn_opcodes_h_l1675_c30_bd2d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1677_c11_2c6c
BIN_OP_EQ_uxn_opcodes_h_l1677_c11_2c6c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1677_c11_2c6c_left,
BIN_OP_EQ_uxn_opcodes_h_l1677_c11_2c6c_right,
BIN_OP_EQ_uxn_opcodes_h_l1677_c11_2c6c_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1677_c7_e8e7
tmp8_low_MUX_uxn_opcodes_h_l1677_c7_e8e7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond,
tmp8_low_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output);

-- t8_MUX_uxn_opcodes_h_l1677_c7_e8e7
t8_MUX_uxn_opcodes_h_l1677_c7_e8e7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond,
t8_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue,
t8_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse,
t8_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1677_c7_e8e7
result_u16_value_MUX_uxn_opcodes_h_l1677_c7_e8e7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond,
result_u16_value_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_e8e7
result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_e8e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_e8e7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_e8e7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_e8e7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_e8e7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_e8e7
result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_e8e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1677_c7_e8e7
result_u8_value_MUX_uxn_opcodes_h_l1677_c7_e8e7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1677_c7_e8e7
tmp8_high_MUX_uxn_opcodes_h_l1677_c7_e8e7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond,
tmp8_high_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1680_c22_27be
BIN_OP_PLUS_uxn_opcodes_h_l1680_c22_27be : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1680_c22_27be_left,
BIN_OP_PLUS_uxn_opcodes_h_l1680_c22_27be_right,
BIN_OP_PLUS_uxn_opcodes_h_l1680_c22_27be_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1682_c11_014a
BIN_OP_EQ_uxn_opcodes_h_l1682_c11_014a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1682_c11_014a_left,
BIN_OP_EQ_uxn_opcodes_h_l1682_c11_014a_right,
BIN_OP_EQ_uxn_opcodes_h_l1682_c11_014a_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1682_c7_d3a4
tmp8_low_MUX_uxn_opcodes_h_l1682_c7_d3a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1682_c7_d3a4_cond,
tmp8_low_MUX_uxn_opcodes_h_l1682_c7_d3a4_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1682_c7_d3a4_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1682_c7_d3a4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1682_c7_d3a4
result_u16_value_MUX_uxn_opcodes_h_l1682_c7_d3a4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1682_c7_d3a4_cond,
result_u16_value_MUX_uxn_opcodes_h_l1682_c7_d3a4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1682_c7_d3a4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1682_c7_d3a4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_d3a4
result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_d3a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_d3a4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_d3a4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_d3a4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_d3a4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_d3a4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_d3a4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_d3a4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_d3a4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_d3a4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_d3a4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_d3a4
result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_d3a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_d3a4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_d3a4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_d3a4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_d3a4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1682_c7_d3a4
result_u8_value_MUX_uxn_opcodes_h_l1682_c7_d3a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1682_c7_d3a4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1682_c7_d3a4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1682_c7_d3a4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1682_c7_d3a4_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1682_c7_d3a4
tmp8_high_MUX_uxn_opcodes_h_l1682_c7_d3a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1682_c7_d3a4_cond,
tmp8_high_MUX_uxn_opcodes_h_l1682_c7_d3a4_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1682_c7_d3a4_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1682_c7_d3a4_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_970a
BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_970a : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_970a_left,
BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_970a_right,
BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_970a_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_9323
BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_9323 : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_9323_left,
BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_9323_right,
BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_9323_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1685_c11_989b
BIN_OP_EQ_uxn_opcodes_h_l1685_c11_989b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1685_c11_989b_left,
BIN_OP_EQ_uxn_opcodes_h_l1685_c11_989b_right,
BIN_OP_EQ_uxn_opcodes_h_l1685_c11_989b_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1685_c7_5217
tmp8_low_MUX_uxn_opcodes_h_l1685_c7_5217 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1685_c7_5217_cond,
tmp8_low_MUX_uxn_opcodes_h_l1685_c7_5217_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1685_c7_5217_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1685_c7_5217_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_5217
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_5217 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_5217_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_5217_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_5217_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_5217_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_5217
result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_5217 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_5217_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_5217_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_5217_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_5217_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_5217
result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_5217 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_5217_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_5217_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_5217_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_5217_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1685_c7_5217
result_u8_value_MUX_uxn_opcodes_h_l1685_c7_5217 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1685_c7_5217_cond,
result_u8_value_MUX_uxn_opcodes_h_l1685_c7_5217_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1685_c7_5217_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1685_c7_5217_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1685_c7_5217
tmp8_high_MUX_uxn_opcodes_h_l1685_c7_5217 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1685_c7_5217_cond,
tmp8_high_MUX_uxn_opcodes_h_l1685_c7_5217_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1685_c7_5217_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1685_c7_5217_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1691_c11_a0ea
BIN_OP_EQ_uxn_opcodes_h_l1691_c11_a0ea : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1691_c11_a0ea_left,
BIN_OP_EQ_uxn_opcodes_h_l1691_c11_a0ea_right,
BIN_OP_EQ_uxn_opcodes_h_l1691_c11_a0ea_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1691_c7_534f
tmp8_low_MUX_uxn_opcodes_h_l1691_c7_534f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1691_c7_534f_cond,
tmp8_low_MUX_uxn_opcodes_h_l1691_c7_534f_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1691_c7_534f_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1691_c7_534f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_534f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_534f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_534f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_534f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_534f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_534f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_534f
result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_534f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_534f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_534f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_534f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_534f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1691_c7_534f
result_u8_value_MUX_uxn_opcodes_h_l1691_c7_534f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1691_c7_534f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1691_c7_534f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1691_c7_534f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1691_c7_534f_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1661_c6_33e2_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output,
 t8_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1674_c11_8dbc_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output,
 t8_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output,
 sp_relative_shift_uxn_opcodes_h_l1675_c30_bd2d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1677_c11_2c6c_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output,
 t8_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1680_c22_27be_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1682_c11_014a_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1682_c7_d3a4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1682_c7_d3a4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_d3a4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_d3a4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_d3a4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1682_c7_d3a4_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1682_c7_d3a4_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_970a_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_9323_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1685_c11_989b_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1685_c7_5217_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_5217_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_5217_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_5217_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1685_c7_5217_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1685_c7_5217_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1691_c11_a0ea_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1691_c7_534f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_534f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_534f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1691_c7_534f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_33e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_33e2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_33e2_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1661_c2_7e89_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1661_c2_7e89_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_7e89_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1661_c2_7e89_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_7e89_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1666_c3_028a : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_7e89_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1661_c2_7e89_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_7e89_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c2_7e89_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1661_c2_7e89_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_7e89_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c2_7e89_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1671_c3_0fdd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_7e89_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1661_c2_7e89_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_7e89_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_7e89_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1661_c2_7e89_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_8dbc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_8dbc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_8dbc_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1674_c7_d33a_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1674_c7_d33a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1674_c7_d33a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_d33a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_d33a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_d33a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_d33a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1674_c7_d33a_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1674_c7_d33a_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1675_c30_bd2d_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1675_c30_bd2d_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1675_c30_bd2d_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1675_c30_bd2d_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_2c6c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_2c6c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_2c6c_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1682_c7_d3a4_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1680_c3_ae1a : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c7_d3a4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_d3a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_d3a4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1679_c3_c9b5 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1677_c7_e8e7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_d3a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c7_d3a4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1682_c7_d3a4_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1680_c22_27be_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1680_c27_66a3_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1680_c22_27be_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1680_c22_27be_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_014a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_014a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_014a_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1682_c7_d3a4_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1682_c7_d3a4_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1685_c7_5217_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1682_c7_d3a4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c7_d3a4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1683_c3_3fdc : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c7_d3a4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c7_d3a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_d3a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_d3a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_5217_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_d3a4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_d3a4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_d3a4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_5217_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_d3a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_d3a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_d3a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_5217_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_d3a4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c7_d3a4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c7_d3a4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1685_c7_5217_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c7_d3a4_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1682_c7_d3a4_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1682_c7_d3a4_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1685_c7_5217_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1682_c7_d3a4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_970a_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1683_c27_11bb_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_970a_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_970a_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_9323_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_9323_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_9323_return_output : signed(18 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_989b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_989b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_989b_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1685_c7_5217_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1685_c7_5217_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1691_c7_534f_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1685_c7_5217_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_5217_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1688_c3_2ef3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_5217_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_534f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_5217_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_5217_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_5217_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_5217_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_5217_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_5217_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_534f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_5217_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1685_c7_5217_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1685_c7_5217_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1691_c7_534f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1685_c7_5217_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1685_c7_5217_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1685_c7_5217_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1685_c7_5217_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_a0ea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_a0ea_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_a0ea_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1691_c7_534f_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1691_c7_534f_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1691_c7_534f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_534f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1693_c3_8b5e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_534f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_534f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_534f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_534f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_534f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1691_c7_534f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1691_c7_534f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1691_c7_534f_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1691_l1682_l1677_l1674_l1661_DUPLICATE_e102_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1661_l1682_l1674_DUPLICATE_03f4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1677_l1682_l1674_l1685_DUPLICATE_edfd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1677_l1691_l1682_l1674_DUPLICATE_761a_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1691_l1685_l1682_l1677_l1674_DUPLICATE_cef1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_416d_uxn_opcodes_h_l1698_l1657_DUPLICATE_54c9_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_534f_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_8dbc_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_2c6c_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_014a_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1671_c3_0fdd := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1671_c3_0fdd;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1693_c3_8b5e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_534f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1693_c3_8b5e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_989b_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1688_c3_2ef3 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_5217_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1688_c3_2ef3;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1679_c3_c9b5 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1679_c3_c9b5;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_9323_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_a0ea_right := to_unsigned(5, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_5217_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1666_c3_028a := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1666_c3_028a;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_33e2_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1675_c30_bd2d_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_sp_relative_shift_uxn_opcodes_h_l1675_c30_bd2d_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1675_c30_bd2d_ins := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1680_c22_27be_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_970a_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_33e2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_8dbc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_2c6c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_014a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_989b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_a0ea_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1685_c7_5217_iftrue := VAR_previous_ram_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1691_c7_534f_iftrue := VAR_previous_ram_read;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1685_c7_5217_iftrue := VAR_previous_ram_read;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1691_c7_534f_iftrue := VAR_previous_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse := t8;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1682_c7_d3a4_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1685_c7_5217_iffalse := tmp8_high;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1682_c7_d3a4_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1685_c7_5217_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1691_c7_534f_iffalse := tmp8_low;
     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1661_c2_7e89] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1661_c2_7e89_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1677_c11_2c6c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1677_c11_2c6c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_2c6c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1677_c11_2c6c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_2c6c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_2c6c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1677_c11_2c6c_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1661_c2_7e89] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1661_c2_7e89_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1682_c11_014a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1682_c11_014a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_014a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1682_c11_014a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_014a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_014a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1682_c11_014a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1661_c6_33e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1661_c6_33e2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_33e2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1661_c6_33e2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_33e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_33e2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1661_c6_33e2_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1691_l1682_l1677_l1674_l1661_DUPLICATE_e102 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1691_l1682_l1677_l1674_l1661_DUPLICATE_e102_return_output := result.u8_value;

     -- sp_relative_shift[uxn_opcodes_h_l1675_c30_bd2d] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1675_c30_bd2d_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1675_c30_bd2d_ins;
     sp_relative_shift_uxn_opcodes_h_l1675_c30_bd2d_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1675_c30_bd2d_x;
     sp_relative_shift_uxn_opcodes_h_l1675_c30_bd2d_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1675_c30_bd2d_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1675_c30_bd2d_return_output := sp_relative_shift_uxn_opcodes_h_l1675_c30_bd2d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1674_c11_8dbc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1674_c11_8dbc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_8dbc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1674_c11_8dbc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_8dbc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_8dbc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1674_c11_8dbc_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1661_c2_7e89] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1661_c2_7e89_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1661_l1682_l1674_DUPLICATE_03f4 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1661_l1682_l1674_DUPLICATE_03f4_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1691_c11_a0ea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1691_c11_a0ea_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_a0ea_left;
     BIN_OP_EQ_uxn_opcodes_h_l1691_c11_a0ea_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_a0ea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_a0ea_return_output := BIN_OP_EQ_uxn_opcodes_h_l1691_c11_a0ea_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1677_l1691_l1682_l1674_DUPLICATE_761a LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1677_l1691_l1682_l1674_DUPLICATE_761a_return_output := result.stack_address_sp_offset;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1683_c27_11bb] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1683_c27_11bb_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1691_l1685_l1682_l1677_l1674_DUPLICATE_cef1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1691_l1685_l1682_l1677_l1674_DUPLICATE_cef1_return_output := result.is_opc_done;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1680_c27_66a3] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1680_c27_66a3_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l1677_c7_e8e7] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1677_c7_e8e7_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1677_l1682_l1674_l1685_DUPLICATE_edfd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1677_l1682_l1674_l1685_DUPLICATE_edfd_return_output := result.is_stack_write;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1661_c2_7e89] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1661_c2_7e89_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1685_c11_989b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1685_c11_989b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_989b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1685_c11_989b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_989b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_989b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1685_c11_989b_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_7e89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_33e2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_7e89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_33e2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_7e89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_33e2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_7e89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_33e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_7e89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_33e2_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_7e89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_33e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_7e89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_33e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_7e89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_33e2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c2_7e89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_33e2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c2_7e89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_33e2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1661_c2_7e89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_33e2_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1661_c2_7e89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_33e2_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1661_c2_7e89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_33e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_d33a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_8dbc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_d33a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_8dbc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_d33a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_8dbc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_d33a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_8dbc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1674_c7_d33a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_8dbc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1674_c7_d33a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_8dbc_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1674_c7_d33a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_8dbc_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1674_c7_d33a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_8dbc_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1674_c7_d33a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_8dbc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_2c6c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_2c6c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_2c6c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_2c6c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_2c6c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_2c6c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_2c6c_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_2c6c_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_2c6c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_d3a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_014a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_d3a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_014a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_d3a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_014a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c7_d3a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_014a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c7_d3a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_014a_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1682_c7_d3a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_014a_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1682_c7_d3a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_014a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_5217_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_989b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_5217_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_989b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_5217_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_989b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1685_c7_5217_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_989b_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1685_c7_5217_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_989b_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1685_c7_5217_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_989b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_534f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_a0ea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_534f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_a0ea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1691_c7_534f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_a0ea_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1691_c7_534f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_a0ea_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1680_c22_27be_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1680_c27_66a3_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_970a_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1683_c27_11bb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1661_l1682_l1674_DUPLICATE_03f4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1661_l1682_l1674_DUPLICATE_03f4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c7_d3a4_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1661_l1682_l1674_DUPLICATE_03f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1691_l1685_l1682_l1677_l1674_DUPLICATE_cef1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1691_l1685_l1682_l1677_l1674_DUPLICATE_cef1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_d3a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1691_l1685_l1682_l1677_l1674_DUPLICATE_cef1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_5217_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1691_l1685_l1682_l1677_l1674_DUPLICATE_cef1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_534f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1691_l1685_l1682_l1677_l1674_DUPLICATE_cef1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1677_l1682_l1674_l1685_DUPLICATE_edfd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1677_l1682_l1674_l1685_DUPLICATE_edfd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_d3a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1677_l1682_l1674_l1685_DUPLICATE_edfd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_5217_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1677_l1682_l1674_l1685_DUPLICATE_edfd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1677_l1691_l1682_l1674_DUPLICATE_761a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1677_l1691_l1682_l1674_DUPLICATE_761a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_d3a4_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1677_l1691_l1682_l1674_DUPLICATE_761a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_534f_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1677_l1691_l1682_l1674_DUPLICATE_761a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1691_l1682_l1677_l1674_l1661_DUPLICATE_e102_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1691_l1682_l1677_l1674_l1661_DUPLICATE_e102_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1691_l1682_l1677_l1674_l1661_DUPLICATE_e102_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c7_d3a4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1691_l1682_l1677_l1674_l1661_DUPLICATE_e102_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1691_c7_534f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1691_l1682_l1677_l1674_l1661_DUPLICATE_e102_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1661_c2_7e89_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1661_c2_7e89_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1661_c2_7e89_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1661_c2_7e89_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1677_c7_e8e7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1675_c30_bd2d_return_output;
     -- t8_MUX[uxn_opcodes_h_l1677_c7_e8e7] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond <= VAR_t8_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond;
     t8_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue;
     t8_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output := t8_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1661_c2_7e89] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_7e89_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_7e89_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1691_c7_534f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_534f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_534f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_534f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_534f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_534f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_534f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_534f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_534f_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1680_c22_27be] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1680_c22_27be_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1680_c22_27be_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1680_c22_27be_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1680_c22_27be_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1680_c22_27be_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1680_c22_27be_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1685_c7_5217] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1685_c7_5217_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1685_c7_5217_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1685_c7_5217_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1685_c7_5217_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1685_c7_5217_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1685_c7_5217_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1685_c7_5217_return_output := tmp8_high_MUX_uxn_opcodes_h_l1685_c7_5217_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1677_c7_e8e7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1691_c7_534f] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1691_c7_534f_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1691_c7_534f_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1691_c7_534f_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1691_c7_534f_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1691_c7_534f_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1691_c7_534f_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1691_c7_534f_return_output := tmp8_low_MUX_uxn_opcodes_h_l1691_c7_534f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1685_c7_5217] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_5217_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_5217_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_5217_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_5217_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_5217_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_5217_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_5217_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_5217_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1661_c2_7e89] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_7e89_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_7e89_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1691_c7_534f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_534f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_534f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_534f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_534f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_534f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_534f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_534f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_534f_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1661_c2_7e89] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_7e89_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_7e89_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1691_c7_534f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1691_c7_534f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1691_c7_534f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1691_c7_534f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1691_c7_534f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1691_c7_534f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1691_c7_534f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1691_c7_534f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1691_c7_534f_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1683_c22_970a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_970a_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_970a_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_970a_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_970a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_970a_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_970a_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1661_c2_7e89] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_7e89_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_7e89_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output;

     -- Submodule level 2
     VAR_result_u16_value_uxn_opcodes_h_l1680_c3_ae1a := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1680_c22_27be_return_output)),16);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_9323_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_970a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_5217_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_534f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_d3a4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_5217_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_5217_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_534f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1685_c7_5217_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1691_c7_534f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1682_c7_d3a4_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1685_c7_5217_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1685_c7_5217_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1691_c7_534f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1680_c3_ae1a;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1685_c7_5217] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_5217_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_5217_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_5217_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_5217_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_5217_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_5217_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_5217_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_5217_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1685_c7_5217] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1685_c7_5217_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1685_c7_5217_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1685_c7_5217_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1685_c7_5217_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1685_c7_5217_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1685_c7_5217_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1685_c7_5217_return_output := tmp8_low_MUX_uxn_opcodes_h_l1685_c7_5217_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1685_c7_5217] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1685_c7_5217_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1685_c7_5217_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1685_c7_5217_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1685_c7_5217_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1685_c7_5217_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1685_c7_5217_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1685_c7_5217_return_output := result_u8_value_MUX_uxn_opcodes_h_l1685_c7_5217_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1683_c22_9323] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_9323_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_9323_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_9323_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_9323_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_9323_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_9323_return_output;

     -- t8_MUX[uxn_opcodes_h_l1674_c7_d33a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1674_c7_d33a_cond <= VAR_t8_MUX_uxn_opcodes_h_l1674_c7_d33a_cond;
     t8_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue;
     t8_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output := t8_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1682_c7_d3a4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_d3a4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_d3a4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_d3a4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_d3a4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_d3a4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_d3a4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_d3a4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_d3a4_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1682_c7_d3a4] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1682_c7_d3a4_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1682_c7_d3a4_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1682_c7_d3a4_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1682_c7_d3a4_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1682_c7_d3a4_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1682_c7_d3a4_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1682_c7_d3a4_return_output := tmp8_high_MUX_uxn_opcodes_h_l1682_c7_d3a4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1674_c7_d33a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_d33a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_d33a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1685_c7_5217] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_5217_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_5217_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_5217_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_5217_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_5217_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_5217_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_5217_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_5217_return_output;

     -- Submodule level 3
     VAR_result_u16_value_uxn_opcodes_h_l1683_c3_3fdc := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_9323_return_output)),16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_d3a4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_5217_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_d3a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_d3a4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_5217_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c7_d3a4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1685_c7_5217_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1682_c7_d3a4_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1682_c7_d3a4_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1685_c7_5217_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c7_d3a4_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1683_c3_3fdc;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1677_c7_e8e7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1682_c7_d3a4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_d3a4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_d3a4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_d3a4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_d3a4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_d3a4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_d3a4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_d3a4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_d3a4_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1682_c7_d3a4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1682_c7_d3a4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c7_d3a4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1682_c7_d3a4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c7_d3a4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1682_c7_d3a4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c7_d3a4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c7_d3a4_return_output := result_u16_value_MUX_uxn_opcodes_h_l1682_c7_d3a4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1661_c2_7e89] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_7e89_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_7e89_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output;

     -- t8_MUX[uxn_opcodes_h_l1661_c2_7e89] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1661_c2_7e89_cond <= VAR_t8_MUX_uxn_opcodes_h_l1661_c2_7e89_cond;
     t8_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue;
     t8_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output := t8_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1677_c7_e8e7] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output := tmp8_high_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1682_c7_d3a4] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1682_c7_d3a4_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1682_c7_d3a4_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1682_c7_d3a4_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1682_c7_d3a4_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1682_c7_d3a4_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1682_c7_d3a4_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1682_c7_d3a4_return_output := tmp8_low_MUX_uxn_opcodes_h_l1682_c7_d3a4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1682_c7_d3a4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_d3a4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_d3a4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_d3a4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_d3a4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_d3a4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_d3a4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_d3a4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_d3a4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1682_c7_d3a4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1682_c7_d3a4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c7_d3a4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1682_c7_d3a4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c7_d3a4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1682_c7_d3a4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c7_d3a4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c7_d3a4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1682_c7_d3a4_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_d3a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_d3a4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c7_d3a4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c7_d3a4_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1682_c7_d3a4_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1677_c7_e8e7] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output := result_u16_value_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1674_c7_d33a] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1674_c7_d33a_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1674_c7_d33a_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output := tmp8_high_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1677_c7_e8e7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1677_c7_e8e7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1677_c7_e8e7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1677_c7_e8e7] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1677_c7_e8e7_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1677_c7_e8e7_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1677_c7_e8e7_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output := tmp8_low_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1674_c7_d33a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_d33a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_d33a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1677_c7_e8e7_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1674_c7_d33a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_d33a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_d33a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1661_c2_7e89] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1661_c2_7e89_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1661_c2_7e89_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output := tmp8_high_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1674_c7_d33a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_d33a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_d33a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1661_c2_7e89] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_7e89_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_7e89_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1674_c7_d33a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1674_c7_d33a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1674_c7_d33a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1674_c7_d33a] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1674_c7_d33a_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1674_c7_d33a_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output := tmp8_low_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1674_c7_d33a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1674_c7_d33a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1674_c7_d33a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1674_c7_d33a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1674_c7_d33a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output := result_u16_value_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output;
     REG_VAR_tmp8_high := VAR_tmp8_high_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1674_c7_d33a_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1661_c2_7e89] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_7e89_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_7e89_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1661_c2_7e89] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1661_c2_7e89_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1661_c2_7e89_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output := tmp8_low_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1661_c2_7e89] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1661_c2_7e89_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c2_7e89_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output := result_u16_value_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1661_c2_7e89] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1661_c2_7e89_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c2_7e89_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output := result_u8_value_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1661_c2_7e89] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_7e89_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_7e89_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_7e89_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_7e89_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output;

     -- Submodule level 7
     REG_VAR_tmp8_low := VAR_tmp8_low_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_416d_uxn_opcodes_h_l1698_l1657_DUPLICATE_54c9 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_416d_uxn_opcodes_h_l1698_l1657_DUPLICATE_54c9_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_416d(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_7e89_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_416d_uxn_opcodes_h_l1698_l1657_DUPLICATE_54c9_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_416d_uxn_opcodes_h_l1698_l1657_DUPLICATE_54c9_return_output;
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
