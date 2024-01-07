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
entity ldr2_0CLK_388b52ed is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ldr2_0CLK_388b52ed;
architecture arch of ldr2_0CLK_388b52ed is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1643_c6_7d34]
signal BIN_OP_EQ_uxn_opcodes_h_l1643_c6_7d34_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1643_c6_7d34_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1643_c6_7d34_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1643_c2_09f9]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1643_c2_09f9_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1643_c2_09f9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c2_09f9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1643_c2_09f9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c2_09f9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1643_c2_09f9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1643_c2_09f9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1643_c2_09f9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1643_c2_09f9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1643_c2_09f9]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1643_c2_09f9_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1643_c2_09f9]
signal result_u8_value_MUX_uxn_opcodes_h_l1643_c2_09f9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1643_c2_09f9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1643_c2_09f9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1643_c2_09f9]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1643_c2_09f9_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1643_c2_09f9]
signal result_u16_value_MUX_uxn_opcodes_h_l1643_c2_09f9_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1643_c2_09f9]
signal t8_MUX_uxn_opcodes_h_l1643_c2_09f9_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1643_c2_09f9]
signal tmp8_high_MUX_uxn_opcodes_h_l1643_c2_09f9_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1643_c2_09f9]
signal tmp8_low_MUX_uxn_opcodes_h_l1643_c2_09f9_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1656_c11_1a2a]
signal BIN_OP_EQ_uxn_opcodes_h_l1656_c11_1a2a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1656_c11_1a2a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1656_c11_1a2a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1656_c7_7a78]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_7a78_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1656_c7_7a78]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_7a78_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1656_c7_7a78]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_7a78_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1656_c7_7a78]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_7a78_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1656_c7_7a78]
signal result_u8_value_MUX_uxn_opcodes_h_l1656_c7_7a78_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1656_c7_7a78]
signal result_u16_value_MUX_uxn_opcodes_h_l1656_c7_7a78_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1656_c7_7a78]
signal t8_MUX_uxn_opcodes_h_l1656_c7_7a78_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1656_c7_7a78]
signal tmp8_high_MUX_uxn_opcodes_h_l1656_c7_7a78_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1656_c7_7a78]
signal tmp8_low_MUX_uxn_opcodes_h_l1656_c7_7a78_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1657_c30_d65b]
signal sp_relative_shift_uxn_opcodes_h_l1657_c30_d65b_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1657_c30_d65b_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1657_c30_d65b_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1657_c30_d65b_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1659_c11_1c84]
signal BIN_OP_EQ_uxn_opcodes_h_l1659_c11_1c84_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1659_c11_1c84_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1659_c11_1c84_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1659_c7_43a1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_43a1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1659_c7_43a1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_43a1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1659_c7_43a1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_43a1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1659_c7_43a1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_43a1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1659_c7_43a1]
signal result_u8_value_MUX_uxn_opcodes_h_l1659_c7_43a1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1659_c7_43a1]
signal result_u16_value_MUX_uxn_opcodes_h_l1659_c7_43a1_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1659_c7_43a1]
signal t8_MUX_uxn_opcodes_h_l1659_c7_43a1_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1659_c7_43a1]
signal tmp8_high_MUX_uxn_opcodes_h_l1659_c7_43a1_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1659_c7_43a1]
signal tmp8_low_MUX_uxn_opcodes_h_l1659_c7_43a1_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output : unsigned(7 downto 0);

-- u16_add_u8_as_i8[uxn_opcodes_h_l1662_c22_e750]
signal u16_add_u8_as_i8_uxn_opcodes_h_l1662_c22_e750_u16 : unsigned(15 downto 0);
signal u16_add_u8_as_i8_uxn_opcodes_h_l1662_c22_e750_u8 : unsigned(7 downto 0);
signal u16_add_u8_as_i8_uxn_opcodes_h_l1662_c22_e750_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1664_c11_8784]
signal BIN_OP_EQ_uxn_opcodes_h_l1664_c11_8784_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1664_c11_8784_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1664_c11_8784_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1664_c7_3d3d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_3d3d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_3d3d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_3d3d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_3d3d_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1664_c7_3d3d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3d3d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3d3d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3d3d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3d3d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1664_c7_3d3d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1664_c7_3d3d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1664_c7_3d3d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1664_c7_3d3d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1664_c7_3d3d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1664_c7_3d3d]
signal result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3d3d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3d3d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3d3d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3d3d_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1664_c7_3d3d]
signal result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3d3d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3d3d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3d3d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3d3d_return_output : unsigned(15 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1664_c7_3d3d]
signal tmp8_high_MUX_uxn_opcodes_h_l1664_c7_3d3d_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1664_c7_3d3d_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1664_c7_3d3d_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1664_c7_3d3d_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1664_c7_3d3d]
signal tmp8_low_MUX_uxn_opcodes_h_l1664_c7_3d3d_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1664_c7_3d3d_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1664_c7_3d3d_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1664_c7_3d3d_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1665_c3_acec]
signal BIN_OP_PLUS_uxn_opcodes_h_l1665_c3_acec_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1665_c3_acec_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1665_c3_acec_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1667_c11_3377]
signal BIN_OP_EQ_uxn_opcodes_h_l1667_c11_3377_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1667_c11_3377_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1667_c11_3377_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1667_c7_19c4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_19c4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_19c4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_19c4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_19c4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1667_c7_19c4]
signal result_u8_value_MUX_uxn_opcodes_h_l1667_c7_19c4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1667_c7_19c4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1667_c7_19c4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1667_c7_19c4_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1667_c7_19c4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_19c4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_19c4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_19c4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_19c4_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1667_c7_19c4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_19c4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_19c4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_19c4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_19c4_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1667_c7_19c4]
signal tmp8_high_MUX_uxn_opcodes_h_l1667_c7_19c4_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1667_c7_19c4_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1667_c7_19c4_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1667_c7_19c4_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1667_c7_19c4]
signal tmp8_low_MUX_uxn_opcodes_h_l1667_c7_19c4_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1667_c7_19c4_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1667_c7_19c4_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1667_c7_19c4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1673_c11_225d]
signal BIN_OP_EQ_uxn_opcodes_h_l1673_c11_225d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1673_c11_225d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1673_c11_225d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1673_c7_fc4b]
signal result_u8_value_MUX_uxn_opcodes_h_l1673_c7_fc4b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1673_c7_fc4b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1673_c7_fc4b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1673_c7_fc4b_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1673_c7_fc4b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1673_c7_fc4b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1673_c7_fc4b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1673_c7_fc4b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1673_c7_fc4b_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1673_c7_fc4b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1673_c7_fc4b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1673_c7_fc4b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1673_c7_fc4b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1673_c7_fc4b_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1673_c7_fc4b]
signal tmp8_low_MUX_uxn_opcodes_h_l1673_c7_fc4b_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1673_c7_fc4b_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1673_c7_fc4b_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1673_c7_fc4b_return_output : unsigned(7 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_dd3d( ref_toks_0 : opcode_result_t;
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
      base.is_vram_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_ram_write := ref_toks_6;
      base.u8_value := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_stack_index_flipped := ref_toks_9;
      base.u16_value := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1643_c6_7d34
BIN_OP_EQ_uxn_opcodes_h_l1643_c6_7d34 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1643_c6_7d34_left,
BIN_OP_EQ_uxn_opcodes_h_l1643_c6_7d34_right,
BIN_OP_EQ_uxn_opcodes_h_l1643_c6_7d34_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1643_c2_09f9
result_is_vram_write_MUX_uxn_opcodes_h_l1643_c2_09f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1643_c2_09f9_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c2_09f9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c2_09f9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c2_09f9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c2_09f9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c2_09f9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c2_09f9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1643_c2_09f9
result_is_opc_done_MUX_uxn_opcodes_h_l1643_c2_09f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1643_c2_09f9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1643_c2_09f9
result_is_stack_write_MUX_uxn_opcodes_h_l1643_c2_09f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1643_c2_09f9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1643_c2_09f9
result_is_ram_write_MUX_uxn_opcodes_h_l1643_c2_09f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1643_c2_09f9_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1643_c2_09f9
result_u8_value_MUX_uxn_opcodes_h_l1643_c2_09f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1643_c2_09f9_cond,
result_u8_value_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1643_c2_09f9
result_is_pc_updated_MUX_uxn_opcodes_h_l1643_c2_09f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1643_c2_09f9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1643_c2_09f9
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1643_c2_09f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1643_c2_09f9_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1643_c2_09f9
result_u16_value_MUX_uxn_opcodes_h_l1643_c2_09f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1643_c2_09f9_cond,
result_u16_value_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output);

-- t8_MUX_uxn_opcodes_h_l1643_c2_09f9
t8_MUX_uxn_opcodes_h_l1643_c2_09f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1643_c2_09f9_cond,
t8_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue,
t8_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse,
t8_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1643_c2_09f9
tmp8_high_MUX_uxn_opcodes_h_l1643_c2_09f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1643_c2_09f9_cond,
tmp8_high_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1643_c2_09f9
tmp8_low_MUX_uxn_opcodes_h_l1643_c2_09f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1643_c2_09f9_cond,
tmp8_low_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1656_c11_1a2a
BIN_OP_EQ_uxn_opcodes_h_l1656_c11_1a2a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1656_c11_1a2a_left,
BIN_OP_EQ_uxn_opcodes_h_l1656_c11_1a2a_right,
BIN_OP_EQ_uxn_opcodes_h_l1656_c11_1a2a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_7a78
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_7a78 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_7a78_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_7a78
result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_7a78 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_7a78_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_7a78
result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_7a78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_7a78_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_7a78
result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_7a78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_7a78_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1656_c7_7a78
result_u8_value_MUX_uxn_opcodes_h_l1656_c7_7a78 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1656_c7_7a78_cond,
result_u8_value_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1656_c7_7a78
result_u16_value_MUX_uxn_opcodes_h_l1656_c7_7a78 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1656_c7_7a78_cond,
result_u16_value_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output);

-- t8_MUX_uxn_opcodes_h_l1656_c7_7a78
t8_MUX_uxn_opcodes_h_l1656_c7_7a78 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1656_c7_7a78_cond,
t8_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue,
t8_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse,
t8_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1656_c7_7a78
tmp8_high_MUX_uxn_opcodes_h_l1656_c7_7a78 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1656_c7_7a78_cond,
tmp8_high_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1656_c7_7a78
tmp8_low_MUX_uxn_opcodes_h_l1656_c7_7a78 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1656_c7_7a78_cond,
tmp8_low_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1657_c30_d65b
sp_relative_shift_uxn_opcodes_h_l1657_c30_d65b : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1657_c30_d65b_ins,
sp_relative_shift_uxn_opcodes_h_l1657_c30_d65b_x,
sp_relative_shift_uxn_opcodes_h_l1657_c30_d65b_y,
sp_relative_shift_uxn_opcodes_h_l1657_c30_d65b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1659_c11_1c84
BIN_OP_EQ_uxn_opcodes_h_l1659_c11_1c84 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1659_c11_1c84_left,
BIN_OP_EQ_uxn_opcodes_h_l1659_c11_1c84_right,
BIN_OP_EQ_uxn_opcodes_h_l1659_c11_1c84_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_43a1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_43a1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_43a1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_43a1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_43a1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_43a1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_43a1
result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_43a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_43a1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_43a1
result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_43a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_43a1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1659_c7_43a1
result_u8_value_MUX_uxn_opcodes_h_l1659_c7_43a1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1659_c7_43a1_cond,
result_u8_value_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1659_c7_43a1
result_u16_value_MUX_uxn_opcodes_h_l1659_c7_43a1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1659_c7_43a1_cond,
result_u16_value_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output);

-- t8_MUX_uxn_opcodes_h_l1659_c7_43a1
t8_MUX_uxn_opcodes_h_l1659_c7_43a1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1659_c7_43a1_cond,
t8_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue,
t8_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse,
t8_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1659_c7_43a1
tmp8_high_MUX_uxn_opcodes_h_l1659_c7_43a1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1659_c7_43a1_cond,
tmp8_high_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1659_c7_43a1
tmp8_low_MUX_uxn_opcodes_h_l1659_c7_43a1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1659_c7_43a1_cond,
tmp8_low_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output);

-- u16_add_u8_as_i8_uxn_opcodes_h_l1662_c22_e750
u16_add_u8_as_i8_uxn_opcodes_h_l1662_c22_e750 : entity work.u16_add_u8_as_i8_0CLK_e595f783 port map (
u16_add_u8_as_i8_uxn_opcodes_h_l1662_c22_e750_u16,
u16_add_u8_as_i8_uxn_opcodes_h_l1662_c22_e750_u8,
u16_add_u8_as_i8_uxn_opcodes_h_l1662_c22_e750_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1664_c11_8784
BIN_OP_EQ_uxn_opcodes_h_l1664_c11_8784 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1664_c11_8784_left,
BIN_OP_EQ_uxn_opcodes_h_l1664_c11_8784_right,
BIN_OP_EQ_uxn_opcodes_h_l1664_c11_8784_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_3d3d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_3d3d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_3d3d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_3d3d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_3d3d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_3d3d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3d3d
result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3d3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3d3d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3d3d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3d3d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3d3d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1664_c7_3d3d
result_is_stack_write_MUX_uxn_opcodes_h_l1664_c7_3d3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1664_c7_3d3d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1664_c7_3d3d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1664_c7_3d3d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1664_c7_3d3d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3d3d
result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3d3d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3d3d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3d3d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3d3d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3d3d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3d3d
result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3d3d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3d3d_cond,
result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3d3d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3d3d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3d3d_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1664_c7_3d3d
tmp8_high_MUX_uxn_opcodes_h_l1664_c7_3d3d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1664_c7_3d3d_cond,
tmp8_high_MUX_uxn_opcodes_h_l1664_c7_3d3d_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1664_c7_3d3d_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1664_c7_3d3d_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1664_c7_3d3d
tmp8_low_MUX_uxn_opcodes_h_l1664_c7_3d3d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1664_c7_3d3d_cond,
tmp8_low_MUX_uxn_opcodes_h_l1664_c7_3d3d_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1664_c7_3d3d_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1664_c7_3d3d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1665_c3_acec
BIN_OP_PLUS_uxn_opcodes_h_l1665_c3_acec : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1665_c3_acec_left,
BIN_OP_PLUS_uxn_opcodes_h_l1665_c3_acec_right,
BIN_OP_PLUS_uxn_opcodes_h_l1665_c3_acec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1667_c11_3377
BIN_OP_EQ_uxn_opcodes_h_l1667_c11_3377 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1667_c11_3377_left,
BIN_OP_EQ_uxn_opcodes_h_l1667_c11_3377_right,
BIN_OP_EQ_uxn_opcodes_h_l1667_c11_3377_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_19c4
result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_19c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_19c4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_19c4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_19c4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_19c4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1667_c7_19c4
result_u8_value_MUX_uxn_opcodes_h_l1667_c7_19c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1667_c7_19c4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1667_c7_19c4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1667_c7_19c4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1667_c7_19c4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_19c4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_19c4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_19c4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_19c4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_19c4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_19c4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_19c4
result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_19c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_19c4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_19c4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_19c4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_19c4_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1667_c7_19c4
tmp8_high_MUX_uxn_opcodes_h_l1667_c7_19c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1667_c7_19c4_cond,
tmp8_high_MUX_uxn_opcodes_h_l1667_c7_19c4_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1667_c7_19c4_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1667_c7_19c4_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1667_c7_19c4
tmp8_low_MUX_uxn_opcodes_h_l1667_c7_19c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1667_c7_19c4_cond,
tmp8_low_MUX_uxn_opcodes_h_l1667_c7_19c4_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1667_c7_19c4_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1667_c7_19c4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1673_c11_225d
BIN_OP_EQ_uxn_opcodes_h_l1673_c11_225d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1673_c11_225d_left,
BIN_OP_EQ_uxn_opcodes_h_l1673_c11_225d_right,
BIN_OP_EQ_uxn_opcodes_h_l1673_c11_225d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1673_c7_fc4b
result_u8_value_MUX_uxn_opcodes_h_l1673_c7_fc4b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1673_c7_fc4b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1673_c7_fc4b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1673_c7_fc4b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1673_c7_fc4b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1673_c7_fc4b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1673_c7_fc4b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1673_c7_fc4b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1673_c7_fc4b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1673_c7_fc4b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1673_c7_fc4b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1673_c7_fc4b
result_is_opc_done_MUX_uxn_opcodes_h_l1673_c7_fc4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1673_c7_fc4b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1673_c7_fc4b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1673_c7_fc4b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1673_c7_fc4b_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1673_c7_fc4b
tmp8_low_MUX_uxn_opcodes_h_l1673_c7_fc4b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1673_c7_fc4b_cond,
tmp8_low_MUX_uxn_opcodes_h_l1673_c7_fc4b_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1673_c7_fc4b_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1673_c7_fc4b_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1643_c6_7d34_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output,
 t8_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1656_c11_1a2a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output,
 t8_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output,
 sp_relative_shift_uxn_opcodes_h_l1657_c30_d65b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1659_c11_1c84_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output,
 t8_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output,
 u16_add_u8_as_i8_uxn_opcodes_h_l1662_c22_e750_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1664_c11_8784_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_3d3d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3d3d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1664_c7_3d3d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3d3d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3d3d_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1664_c7_3d3d_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1664_c7_3d3d_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1665_c3_acec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1667_c11_3377_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_19c4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1667_c7_19c4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_19c4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_19c4_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1667_c7_19c4_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1667_c7_19c4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1673_c11_225d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1673_c7_fc4b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1673_c7_fc4b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1673_c7_fc4b_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1673_c7_fc4b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1643_c6_7d34_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1643_c6_7d34_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1643_c6_7d34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1643_c2_09f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1643_c2_09f9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1653_c3_a08a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c2_09f9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1648_c3_53b2 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c2_09f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1643_c2_09f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1643_c2_09f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1643_c2_09f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1643_c2_09f9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1643_c2_09f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1643_c2_09f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1643_c2_09f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1643_c2_09f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1643_c2_09f9_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1643_c2_09f9_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1643_c2_09f9_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1643_c2_09f9_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1643_c2_09f9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_1a2a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_1a2a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_1a2a_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_7a78_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_7a78_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_7a78_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_7a78_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c7_7a78_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c7_7a78_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1656_c7_7a78_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1656_c7_7a78_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1656_c7_7a78_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1657_c30_d65b_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1657_c30_d65b_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1657_c30_d65b_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1657_c30_d65b_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_1c84_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_1c84_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_1c84_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_3d3d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_43a1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1661_c3_f6d6 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1659_c7_43a1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_43a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3d3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_43a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1664_c7_3d3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_43a1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3d3d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_43a1_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3d3d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_43a1_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1659_c7_43a1_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1664_c7_3d3d_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_43a1_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1664_c7_3d3d_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_43a1_cond : unsigned(0 downto 0);
 variable VAR_u16_add_u8_as_i8_uxn_opcodes_h_l1662_c22_e750_u16 : unsigned(15 downto 0);
 variable VAR_u16_add_u8_as_i8_uxn_opcodes_h_l1662_c22_e750_u8 : unsigned(7 downto 0);
 variable VAR_u16_add_u8_as_i8_uxn_opcodes_h_l1662_c22_e750_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_8784_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_8784_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_8784_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_3d3d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_3d3d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_19c4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_3d3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3d3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3d3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_19c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3d3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1664_c7_3d3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1664_c7_3d3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_19c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1664_c7_3d3d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3d3d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3d3d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1667_c7_19c4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3d3d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3d3d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1665_c3_04af : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3d3d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3d3d_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1664_c7_3d3d_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1664_c7_3d3d_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1667_c7_19c4_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1664_c7_3d3d_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1664_c7_3d3d_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1664_c7_3d3d_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1667_c7_19c4_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1664_c7_3d3d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1665_c3_acec_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1665_c3_acec_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1665_c3_acec_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1667_c11_3377_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1667_c11_3377_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1667_c11_3377_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_19c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_19c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_19c4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1667_c7_19c4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1667_c7_19c4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1673_c7_fc4b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1667_c7_19c4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_19c4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1670_c3_8874 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_19c4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1673_c7_fc4b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_19c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_19c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_19c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1673_c7_fc4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_19c4_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1667_c7_19c4_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1667_c7_19c4_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1667_c7_19c4_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1667_c7_19c4_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1667_c7_19c4_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1673_c7_fc4b_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1667_c7_19c4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1673_c11_225d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1673_c11_225d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1673_c11_225d_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1673_c7_fc4b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1673_c7_fc4b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1673_c7_fc4b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1673_c7_fc4b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1675_c3_0853 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1673_c7_fc4b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1673_c7_fc4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1673_c7_fc4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1673_c7_fc4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1673_c7_fc4b_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1673_c7_fc4b_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1673_c7_fc4b_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1673_c7_fc4b_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1643_l1673_DUPLICATE_d2fc_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1665_l1664_l1656_l1643_DUPLICATE_40a1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1664_l1656_l1659_l1673_DUPLICATE_188f_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1673_l1667_DUPLICATE_f7ee_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1664_l1656_l1667_l1659_DUPLICATE_1bd7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_dd3d_uxn_opcodes_h_l1680_l1639_DUPLICATE_0a88_return_output : opcode_result_t;
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
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1657_c30_d65b_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1648_c3_53b2 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1648_c3_53b2;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1665_c3_acec_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_19c4_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1667_c11_3377_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1657_c30_d65b_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1661_c3_f6d6 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1661_c3_f6d6;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1673_c7_fc4b_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1653_c3_a08a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1653_c3_a08a;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1670_c3_8874 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_19c4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1670_c3_8874;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1673_c11_225d_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_8784_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1675_c3_0853 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1673_c7_fc4b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1675_c3_0853;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_1a2a_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_1c84_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1643_c6_7d34_right := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1657_c30_d65b_ins := VAR_ins;
     VAR_u16_add_u8_as_i8_uxn_opcodes_h_l1662_c22_e750_u16 := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1643_c6_7d34_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_1a2a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_1c84_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_8784_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1667_c11_3377_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1673_c11_225d_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1667_c7_19c4_iftrue := VAR_previous_ram_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1673_c7_fc4b_iftrue := VAR_previous_ram_read;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1667_c7_19c4_iftrue := VAR_previous_ram_read;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1673_c7_fc4b_iftrue := VAR_previous_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue := VAR_previous_stack_read;
     VAR_u16_add_u8_as_i8_uxn_opcodes_h_l1662_c22_e750_u8 := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse := t8;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1664_c7_3d3d_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1667_c7_19c4_iffalse := tmp8_high;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1664_c7_3d3d_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1667_c7_19c4_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1673_c7_fc4b_iffalse := tmp8_low;
     -- u16_add_u8_as_i8[uxn_opcodes_h_l1662_c22_e750] LATENCY=0
     -- Inputs
     u16_add_u8_as_i8_uxn_opcodes_h_l1662_c22_e750_u16 <= VAR_u16_add_u8_as_i8_uxn_opcodes_h_l1662_c22_e750_u16;
     u16_add_u8_as_i8_uxn_opcodes_h_l1662_c22_e750_u8 <= VAR_u16_add_u8_as_i8_uxn_opcodes_h_l1662_c22_e750_u8;
     -- Outputs
     VAR_u16_add_u8_as_i8_uxn_opcodes_h_l1662_c22_e750_return_output := u16_add_u8_as_i8_uxn_opcodes_h_l1662_c22_e750_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1673_l1667_DUPLICATE_f7ee LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1673_l1667_DUPLICATE_f7ee_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1656_c11_1a2a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1656_c11_1a2a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_1a2a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1656_c11_1a2a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_1a2a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_1a2a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1656_c11_1a2a_return_output;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l1659_c7_43a1] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1659_c7_43a1_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1664_c11_8784] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1664_c11_8784_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_8784_left;
     BIN_OP_EQ_uxn_opcodes_h_l1664_c11_8784_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_8784_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_8784_return_output := BIN_OP_EQ_uxn_opcodes_h_l1664_c11_8784_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1667_c11_3377] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1667_c11_3377_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1667_c11_3377_left;
     BIN_OP_EQ_uxn_opcodes_h_l1667_c11_3377_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1667_c11_3377_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1667_c11_3377_return_output := BIN_OP_EQ_uxn_opcodes_h_l1667_c11_3377_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1643_c2_09f9] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1643_c2_09f9_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1664_l1656_l1667_l1659_DUPLICATE_1bd7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1664_l1656_l1667_l1659_DUPLICATE_1bd7_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1665_l1664_l1656_l1643_DUPLICATE_40a1 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1665_l1664_l1656_l1643_DUPLICATE_40a1_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1643_c6_7d34] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1643_c6_7d34_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1643_c6_7d34_left;
     BIN_OP_EQ_uxn_opcodes_h_l1643_c6_7d34_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1643_c6_7d34_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1643_c6_7d34_return_output := BIN_OP_EQ_uxn_opcodes_h_l1643_c6_7d34_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1643_l1673_DUPLICATE_d2fc LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1643_l1673_DUPLICATE_d2fc_return_output := result.u8_value;

     -- sp_relative_shift[uxn_opcodes_h_l1657_c30_d65b] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1657_c30_d65b_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1657_c30_d65b_ins;
     sp_relative_shift_uxn_opcodes_h_l1657_c30_d65b_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1657_c30_d65b_x;
     sp_relative_shift_uxn_opcodes_h_l1657_c30_d65b_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1657_c30_d65b_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1657_c30_d65b_return_output := sp_relative_shift_uxn_opcodes_h_l1657_c30_d65b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1673_c11_225d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1673_c11_225d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1673_c11_225d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1673_c11_225d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1673_c11_225d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1673_c11_225d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1673_c11_225d_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1643_c2_09f9] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1643_c2_09f9_return_output := result.is_ram_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1643_c2_09f9] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1643_c2_09f9_return_output := result.is_stack_index_flipped;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1643_c2_09f9] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1643_c2_09f9_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1664_l1656_l1659_l1673_DUPLICATE_188f LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1664_l1656_l1659_l1673_DUPLICATE_188f_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1659_c11_1c84] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1659_c11_1c84_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_1c84_left;
     BIN_OP_EQ_uxn_opcodes_h_l1659_c11_1c84_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_1c84_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_1c84_return_output := BIN_OP_EQ_uxn_opcodes_h_l1659_c11_1c84_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1643_c2_09f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1643_c6_7d34_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1643_c2_09f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1643_c6_7d34_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1643_c2_09f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1643_c6_7d34_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1643_c2_09f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1643_c6_7d34_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1643_c2_09f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1643_c6_7d34_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1643_c2_09f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1643_c6_7d34_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c2_09f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1643_c6_7d34_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c2_09f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1643_c6_7d34_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1643_c2_09f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1643_c6_7d34_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1643_c2_09f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1643_c6_7d34_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1643_c2_09f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1643_c6_7d34_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1643_c2_09f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1643_c6_7d34_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1643_c2_09f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1643_c6_7d34_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_7a78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_1a2a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_7a78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_1a2a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_7a78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_1a2a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_7a78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_1a2a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c7_7a78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_1a2a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c7_7a78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_1a2a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1656_c7_7a78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_1a2a_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1656_c7_7a78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_1a2a_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1656_c7_7a78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_1a2a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_43a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_1c84_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_43a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_1c84_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_43a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_1c84_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_43a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_1c84_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_43a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_1c84_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_43a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_1c84_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1659_c7_43a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_1c84_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_43a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_1c84_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_43a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_1c84_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3d3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_8784_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1664_c7_3d3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_8784_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_3d3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_8784_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3d3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_8784_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3d3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_8784_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1664_c7_3d3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_8784_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1664_c7_3d3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_8784_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_19c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1667_c11_3377_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_19c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1667_c11_3377_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_19c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1667_c11_3377_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1667_c7_19c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1667_c11_3377_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1667_c7_19c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1667_c11_3377_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1667_c7_19c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1667_c11_3377_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1673_c7_fc4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1673_c11_225d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1673_c7_fc4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1673_c11_225d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1673_c7_fc4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1673_c11_225d_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1673_c7_fc4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1673_c11_225d_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1665_c3_acec_left := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1665_l1664_l1656_l1643_DUPLICATE_40a1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1665_l1664_l1656_l1643_DUPLICATE_40a1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1665_l1664_l1656_l1643_DUPLICATE_40a1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3d3d_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1665_l1664_l1656_l1643_DUPLICATE_40a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1673_l1667_DUPLICATE_f7ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1673_l1667_DUPLICATE_f7ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3d3d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1673_l1667_DUPLICATE_f7ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_19c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1673_l1667_DUPLICATE_f7ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1673_c7_fc4b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1673_l1667_DUPLICATE_f7ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1664_l1656_l1667_l1659_DUPLICATE_1bd7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1664_l1656_l1667_l1659_DUPLICATE_1bd7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1664_c7_3d3d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1664_l1656_l1667_l1659_DUPLICATE_1bd7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_19c4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1664_l1656_l1667_l1659_DUPLICATE_1bd7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1664_l1656_l1659_l1673_DUPLICATE_188f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1664_l1656_l1659_l1673_DUPLICATE_188f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_3d3d_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1664_l1656_l1659_l1673_DUPLICATE_188f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1673_c7_fc4b_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1664_l1656_l1659_l1673_DUPLICATE_188f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1643_l1673_DUPLICATE_d2fc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1643_l1673_DUPLICATE_d2fc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1643_l1673_DUPLICATE_d2fc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3d3d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1643_l1673_DUPLICATE_d2fc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1673_c7_fc4b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1664_l1659_l1656_l1643_l1673_DUPLICATE_d2fc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1643_c2_09f9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1643_c2_09f9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1643_c2_09f9_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1643_c2_09f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1659_c7_43a1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1657_c30_d65b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue := VAR_u16_add_u8_as_i8_uxn_opcodes_h_l1662_c22_e750_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1673_c7_fc4b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1673_c7_fc4b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1673_c7_fc4b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1673_c7_fc4b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1673_c7_fc4b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1673_c7_fc4b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1673_c7_fc4b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1673_c7_fc4b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1673_c7_fc4b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1667_c7_19c4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_19c4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_19c4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_19c4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_19c4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_19c4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_19c4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_19c4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_19c4_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1643_c2_09f9] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1643_c2_09f9_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1643_c2_09f9_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1659_c7_43a1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_43a1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_43a1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1643_c2_09f9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1643_c2_09f9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1643_c2_09f9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1673_c7_fc4b] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1673_c7_fc4b_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1673_c7_fc4b_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1673_c7_fc4b_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1673_c7_fc4b_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1673_c7_fc4b_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1673_c7_fc4b_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1673_c7_fc4b_return_output := tmp8_low_MUX_uxn_opcodes_h_l1673_c7_fc4b_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1665_c3_acec] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1665_c3_acec_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1665_c3_acec_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1665_c3_acec_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1665_c3_acec_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1665_c3_acec_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1665_c3_acec_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1673_c7_fc4b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1673_c7_fc4b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1673_c7_fc4b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1673_c7_fc4b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1673_c7_fc4b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1673_c7_fc4b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1673_c7_fc4b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1673_c7_fc4b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1673_c7_fc4b_return_output;

     -- t8_MUX[uxn_opcodes_h_l1659_c7_43a1] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1659_c7_43a1_cond <= VAR_t8_MUX_uxn_opcodes_h_l1659_c7_43a1_cond;
     t8_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue;
     t8_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output := t8_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1643_c2_09f9] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1643_c2_09f9_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1643_c2_09f9_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1673_c7_fc4b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1673_c7_fc4b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1673_c7_fc4b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1673_c7_fc4b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1673_c7_fc4b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1673_c7_fc4b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1673_c7_fc4b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1673_c7_fc4b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1673_c7_fc4b_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1643_c2_09f9] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1643_c2_09f9_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1643_c2_09f9_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1667_c7_19c4] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1667_c7_19c4_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1667_c7_19c4_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1667_c7_19c4_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1667_c7_19c4_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1667_c7_19c4_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1667_c7_19c4_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1667_c7_19c4_return_output := tmp8_high_MUX_uxn_opcodes_h_l1667_c7_19c4_return_output;

     -- Submodule level 2
     VAR_result_u16_value_uxn_opcodes_h_l1665_c3_04af := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1665_c3_acec_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_19c4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1673_c7_fc4b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1664_c7_3d3d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_19c4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_19c4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1673_c7_fc4b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1667_c7_19c4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1673_c7_fc4b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1664_c7_3d3d_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1667_c7_19c4_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1667_c7_19c4_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1673_c7_fc4b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3d3d_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1665_c3_04af;
     -- tmp8_low_MUX[uxn_opcodes_h_l1667_c7_19c4] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1667_c7_19c4_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1667_c7_19c4_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1667_c7_19c4_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1667_c7_19c4_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1667_c7_19c4_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1667_c7_19c4_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1667_c7_19c4_return_output := tmp8_low_MUX_uxn_opcodes_h_l1667_c7_19c4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1656_c7_7a78] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_7a78_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_7a78_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1667_c7_19c4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1667_c7_19c4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1667_c7_19c4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1667_c7_19c4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1667_c7_19c4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1667_c7_19c4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1667_c7_19c4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1667_c7_19c4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1667_c7_19c4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1664_c7_3d3d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1664_c7_3d3d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1664_c7_3d3d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1664_c7_3d3d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1664_c7_3d3d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1664_c7_3d3d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1664_c7_3d3d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1664_c7_3d3d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1664_c7_3d3d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1667_c7_19c4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_19c4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_19c4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_19c4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_19c4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_19c4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_19c4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_19c4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_19c4_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1664_c7_3d3d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3d3d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3d3d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3d3d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3d3d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3d3d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3d3d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3d3d_return_output := result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3d3d_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1664_c7_3d3d] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1664_c7_3d3d_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1664_c7_3d3d_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1664_c7_3d3d_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1664_c7_3d3d_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1664_c7_3d3d_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1664_c7_3d3d_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1664_c7_3d3d_return_output := tmp8_high_MUX_uxn_opcodes_h_l1664_c7_3d3d_return_output;

     -- t8_MUX[uxn_opcodes_h_l1656_c7_7a78] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1656_c7_7a78_cond <= VAR_t8_MUX_uxn_opcodes_h_l1656_c7_7a78_cond;
     t8_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue;
     t8_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output := t8_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1667_c7_19c4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_19c4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_19c4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_19c4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_19c4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_19c4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_19c4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_19c4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_19c4_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3d3d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_19c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1664_c7_3d3d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_3d3d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_19c4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3d3d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3d3d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1667_c7_19c4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1664_c7_3d3d_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1664_c7_3d3d_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1667_c7_19c4_return_output;
     -- tmp8_high_MUX[uxn_opcodes_h_l1659_c7_43a1] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1659_c7_43a1_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_43a1_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output := tmp8_high_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1664_c7_3d3d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_3d3d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_3d3d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_3d3d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_3d3d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_3d3d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_3d3d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_3d3d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_3d3d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1664_c7_3d3d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3d3d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3d3d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3d3d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3d3d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3d3d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3d3d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3d3d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3d3d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1659_c7_43a1] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1659_c7_43a1_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_43a1_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output := result_u16_value_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1659_c7_43a1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_43a1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_43a1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output;

     -- t8_MUX[uxn_opcodes_h_l1643_c2_09f9] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1643_c2_09f9_cond <= VAR_t8_MUX_uxn_opcodes_h_l1643_c2_09f9_cond;
     t8_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue;
     t8_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output := t8_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1643_c2_09f9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c2_09f9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c2_09f9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1664_c7_3d3d] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1664_c7_3d3d_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1664_c7_3d3d_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1664_c7_3d3d_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1664_c7_3d3d_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1664_c7_3d3d_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1664_c7_3d3d_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1664_c7_3d3d_return_output := tmp8_low_MUX_uxn_opcodes_h_l1664_c7_3d3d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1664_c7_3d3d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3d3d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3d3d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3d3d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3d3d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3d3d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3d3d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3d3d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3d3d_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3d3d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1664_c7_3d3d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3d3d_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1664_c7_3d3d_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1656_c7_7a78] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_7a78_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_7a78_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1656_c7_7a78] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1656_c7_7a78_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c7_7a78_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output := result_u16_value_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1659_c7_43a1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1659_c7_43a1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_43a1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output := result_u8_value_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1659_c7_43a1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_43a1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_43a1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1656_c7_7a78] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1656_c7_7a78_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1656_c7_7a78_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output := tmp8_high_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1659_c7_43a1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_43a1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_43a1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1659_c7_43a1] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1659_c7_43a1_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_43a1_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_43a1_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_43a1_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output := tmp8_low_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_43a1_return_output;
     -- tmp8_high_MUX[uxn_opcodes_h_l1643_c2_09f9] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1643_c2_09f9_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1643_c2_09f9_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output := tmp8_high_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1656_c7_7a78] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_7a78_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_7a78_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1643_c2_09f9] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1643_c2_09f9_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1643_c2_09f9_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output := result_u16_value_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1656_c7_7a78] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_7a78_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_7a78_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1656_c7_7a78] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1656_c7_7a78_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1656_c7_7a78_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output := tmp8_low_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1656_c7_7a78] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1656_c7_7a78_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c7_7a78_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c7_7a78_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c7_7a78_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output := result_u8_value_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1643_c2_09f9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1643_c2_09f9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1643_c2_09f9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output;
     REG_VAR_tmp8_high := VAR_tmp8_high_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1656_c7_7a78_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1643_c2_09f9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1643_c2_09f9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1643_c2_09f9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1643_c2_09f9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c2_09f9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c2_09f9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1643_c2_09f9] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1643_c2_09f9_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1643_c2_09f9_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output := tmp8_low_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1643_c2_09f9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1643_c2_09f9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1643_c2_09f9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1643_c2_09f9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1643_c2_09f9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output := result_u8_value_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output;

     -- Submodule level 7
     REG_VAR_tmp8_low := VAR_tmp8_low_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_dd3d_uxn_opcodes_h_l1680_l1639_DUPLICATE_0a88 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_dd3d_uxn_opcodes_h_l1680_l1639_DUPLICATE_0a88_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_dd3d(
     result,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1643_c2_09f9_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_dd3d_uxn_opcodes_h_l1680_l1639_DUPLICATE_0a88_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_dd3d_uxn_opcodes_h_l1680_l1639_DUPLICATE_0a88_return_output;
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
