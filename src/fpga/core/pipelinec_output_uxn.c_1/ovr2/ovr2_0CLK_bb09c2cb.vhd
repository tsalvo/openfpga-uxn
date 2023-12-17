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
-- Submodules: 75
entity ovr2_0CLK_bb09c2cb is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ovr2_0CLK_bb09c2cb;
architecture arch of ovr2_0CLK_bb09c2cb is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16_low : unsigned(7 downto 0) := to_unsigned(0, 8);
signal t16_high : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16_low : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16_high : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16_low : unsigned(7 downto 0);
signal REG_COMB_t16_high : unsigned(7 downto 0);
signal REG_COMB_n16_low : unsigned(7 downto 0);
signal REG_COMB_n16_high : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l344_c6_c4d6]
signal BIN_OP_EQ_uxn_opcodes_h_l344_c6_c4d6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l344_c6_c4d6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l344_c6_c4d6_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l344_c2_b7a3]
signal t16_low_MUX_uxn_opcodes_h_l344_c2_b7a3_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l344_c2_b7a3]
signal t16_high_MUX_uxn_opcodes_h_l344_c2_b7a3_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l344_c2_b7a3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_b7a3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l344_c2_b7a3]
signal result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_b7a3_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l344_c2_b7a3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_b7a3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l344_c2_b7a3]
signal result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_b7a3_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l344_c2_b7a3]
signal result_u8_value_MUX_uxn_opcodes_h_l344_c2_b7a3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l344_c2_b7a3]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_b7a3_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l344_c2_b7a3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_b7a3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l344_c2_b7a3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_b7a3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l344_c2_b7a3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_b7a3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l344_c2_b7a3]
signal n16_low_MUX_uxn_opcodes_h_l344_c2_b7a3_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l344_c2_b7a3]
signal n16_high_MUX_uxn_opcodes_h_l344_c2_b7a3_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l357_c11_4ce8]
signal BIN_OP_EQ_uxn_opcodes_h_l357_c11_4ce8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l357_c11_4ce8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l357_c11_4ce8_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l357_c7_8564]
signal t16_low_MUX_uxn_opcodes_h_l357_c7_8564_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l357_c7_8564_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l357_c7_8564_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l357_c7_8564_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l357_c7_8564]
signal t16_high_MUX_uxn_opcodes_h_l357_c7_8564_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l357_c7_8564_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l357_c7_8564_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l357_c7_8564_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l357_c7_8564]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_8564_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_8564_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_8564_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_8564_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l357_c7_8564]
signal result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_8564_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_8564_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_8564_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_8564_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l357_c7_8564]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_8564_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_8564_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_8564_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_8564_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l357_c7_8564]
signal result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_8564_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_8564_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_8564_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_8564_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l357_c7_8564]
signal result_u8_value_MUX_uxn_opcodes_h_l357_c7_8564_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l357_c7_8564_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l357_c7_8564_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l357_c7_8564_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l357_c7_8564]
signal n16_low_MUX_uxn_opcodes_h_l357_c7_8564_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l357_c7_8564_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l357_c7_8564_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l357_c7_8564_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l357_c7_8564]
signal n16_high_MUX_uxn_opcodes_h_l357_c7_8564_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l357_c7_8564_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l357_c7_8564_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l357_c7_8564_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l360_c11_e4f7]
signal BIN_OP_EQ_uxn_opcodes_h_l360_c11_e4f7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l360_c11_e4f7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l360_c11_e4f7_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l360_c7_1b11]
signal t16_low_MUX_uxn_opcodes_h_l360_c7_1b11_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l360_c7_1b11_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l360_c7_1b11]
signal t16_high_MUX_uxn_opcodes_h_l360_c7_1b11_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l360_c7_1b11_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l360_c7_1b11]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_1b11_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_1b11_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l360_c7_1b11]
signal result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_1b11_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_1b11_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l360_c7_1b11]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_1b11_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_1b11_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l360_c7_1b11]
signal result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_1b11_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_1b11_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l360_c7_1b11]
signal result_u8_value_MUX_uxn_opcodes_h_l360_c7_1b11_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l360_c7_1b11_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l360_c7_1b11]
signal n16_low_MUX_uxn_opcodes_h_l360_c7_1b11_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l360_c7_1b11_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l360_c7_1b11]
signal n16_high_MUX_uxn_opcodes_h_l360_c7_1b11_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l360_c7_1b11_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l364_c11_6f34]
signal BIN_OP_EQ_uxn_opcodes_h_l364_c11_6f34_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l364_c11_6f34_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l364_c11_6f34_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l364_c7_15d6]
signal t16_low_MUX_uxn_opcodes_h_l364_c7_15d6_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l364_c7_15d6_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l364_c7_15d6_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l364_c7_15d6_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l364_c7_15d6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_15d6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_15d6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_15d6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_15d6_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l364_c7_15d6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_15d6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_15d6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_15d6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_15d6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l364_c7_15d6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_15d6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_15d6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_15d6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_15d6_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l364_c7_15d6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_15d6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_15d6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_15d6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_15d6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l364_c7_15d6]
signal result_u8_value_MUX_uxn_opcodes_h_l364_c7_15d6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l364_c7_15d6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l364_c7_15d6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l364_c7_15d6_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l364_c7_15d6]
signal n16_low_MUX_uxn_opcodes_h_l364_c7_15d6_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l364_c7_15d6_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l364_c7_15d6_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l364_c7_15d6_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l364_c7_15d6]
signal n16_high_MUX_uxn_opcodes_h_l364_c7_15d6_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l364_c7_15d6_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l364_c7_15d6_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l364_c7_15d6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l368_c11_4d48]
signal BIN_OP_EQ_uxn_opcodes_h_l368_c11_4d48_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l368_c11_4d48_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l368_c11_4d48_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l368_c7_ea8a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_ea8a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_ea8a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_ea8a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_ea8a_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l368_c7_ea8a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_ea8a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_ea8a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_ea8a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_ea8a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l368_c7_ea8a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_ea8a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_ea8a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_ea8a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_ea8a_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l368_c7_ea8a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_ea8a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_ea8a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_ea8a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_ea8a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l368_c7_ea8a]
signal result_u8_value_MUX_uxn_opcodes_h_l368_c7_ea8a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l368_c7_ea8a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l368_c7_ea8a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l368_c7_ea8a_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l368_c7_ea8a]
signal n16_low_MUX_uxn_opcodes_h_l368_c7_ea8a_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l368_c7_ea8a_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l368_c7_ea8a_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l368_c7_ea8a_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l368_c7_ea8a]
signal n16_high_MUX_uxn_opcodes_h_l368_c7_ea8a_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l368_c7_ea8a_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l368_c7_ea8a_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l368_c7_ea8a_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l370_c30_a645]
signal sp_relative_shift_uxn_opcodes_h_l370_c30_a645_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l370_c30_a645_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l370_c30_a645_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l370_c30_a645_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l375_c11_f76f]
signal BIN_OP_EQ_uxn_opcodes_h_l375_c11_f76f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l375_c11_f76f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l375_c11_f76f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l375_c7_822e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_822e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_822e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_822e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_822e_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l375_c7_822e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_822e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_822e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_822e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_822e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l375_c7_822e]
signal result_u8_value_MUX_uxn_opcodes_h_l375_c7_822e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l375_c7_822e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l375_c7_822e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l375_c7_822e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l375_c7_822e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_822e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_822e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_822e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_822e_return_output : signed(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l375_c7_822e]
signal n16_low_MUX_uxn_opcodes_h_l375_c7_822e_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l375_c7_822e_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l375_c7_822e_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l375_c7_822e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l381_c11_93cc]
signal BIN_OP_EQ_uxn_opcodes_h_l381_c11_93cc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l381_c11_93cc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l381_c11_93cc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l381_c7_47f8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_47f8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_47f8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_47f8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_47f8_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l381_c7_47f8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_47f8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_47f8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_47f8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_47f8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l381_c7_47f8]
signal result_u8_value_MUX_uxn_opcodes_h_l381_c7_47f8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l381_c7_47f8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l381_c7_47f8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l381_c7_47f8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l385_c11_af20]
signal BIN_OP_EQ_uxn_opcodes_h_l385_c11_af20_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l385_c11_af20_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l385_c11_af20_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l385_c7_a352]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_a352_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_a352_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_a352_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_a352_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l385_c7_a352]
signal result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_a352_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_a352_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_a352_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_a352_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l385_c7_a352]
signal result_u8_value_MUX_uxn_opcodes_h_l385_c7_a352_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l385_c7_a352_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l385_c7_a352_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l385_c7_a352_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l389_c11_3ea1]
signal BIN_OP_EQ_uxn_opcodes_h_l389_c11_3ea1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l389_c11_3ea1_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l389_c11_3ea1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l389_c7_f92c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_f92c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_f92c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_f92c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_f92c_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l389_c7_f92c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_f92c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_f92c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_f92c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_f92c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l389_c7_f92c]
signal result_u8_value_MUX_uxn_opcodes_h_l389_c7_f92c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l389_c7_f92c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l389_c7_f92c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l389_c7_f92c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l393_c11_37f3]
signal BIN_OP_EQ_uxn_opcodes_h_l393_c11_37f3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l393_c11_37f3_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l393_c11_37f3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l393_c7_87cb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_87cb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_87cb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_87cb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_87cb_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l393_c7_87cb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_87cb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_87cb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_87cb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_87cb_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l393_c7_87cb]
signal result_u8_value_MUX_uxn_opcodes_h_l393_c7_87cb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l393_c7_87cb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l393_c7_87cb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l393_c7_87cb_return_output : unsigned(7 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_e848( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l344_c6_c4d6
BIN_OP_EQ_uxn_opcodes_h_l344_c6_c4d6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l344_c6_c4d6_left,
BIN_OP_EQ_uxn_opcodes_h_l344_c6_c4d6_right,
BIN_OP_EQ_uxn_opcodes_h_l344_c6_c4d6_return_output);

-- t16_low_MUX_uxn_opcodes_h_l344_c2_b7a3
t16_low_MUX_uxn_opcodes_h_l344_c2_b7a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l344_c2_b7a3_cond,
t16_low_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue,
t16_low_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse,
t16_low_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output);

-- t16_high_MUX_uxn_opcodes_h_l344_c2_b7a3
t16_high_MUX_uxn_opcodes_h_l344_c2_b7a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l344_c2_b7a3_cond,
t16_high_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue,
t16_high_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse,
t16_high_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_b7a3
result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_b7a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_b7a3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_b7a3
result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_b7a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_b7a3_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_b7a3
result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_b7a3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_b7a3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_b7a3
result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_b7a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_b7a3_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l344_c2_b7a3
result_u8_value_MUX_uxn_opcodes_h_l344_c2_b7a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l344_c2_b7a3_cond,
result_u8_value_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_b7a3
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_b7a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_b7a3_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_b7a3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_b7a3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_b7a3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_b7a3
result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_b7a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_b7a3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_b7a3
result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_b7a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_b7a3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output);

-- n16_low_MUX_uxn_opcodes_h_l344_c2_b7a3
n16_low_MUX_uxn_opcodes_h_l344_c2_b7a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l344_c2_b7a3_cond,
n16_low_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue,
n16_low_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse,
n16_low_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output);

-- n16_high_MUX_uxn_opcodes_h_l344_c2_b7a3
n16_high_MUX_uxn_opcodes_h_l344_c2_b7a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l344_c2_b7a3_cond,
n16_high_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue,
n16_high_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse,
n16_high_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l357_c11_4ce8
BIN_OP_EQ_uxn_opcodes_h_l357_c11_4ce8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l357_c11_4ce8_left,
BIN_OP_EQ_uxn_opcodes_h_l357_c11_4ce8_right,
BIN_OP_EQ_uxn_opcodes_h_l357_c11_4ce8_return_output);

-- t16_low_MUX_uxn_opcodes_h_l357_c7_8564
t16_low_MUX_uxn_opcodes_h_l357_c7_8564 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l357_c7_8564_cond,
t16_low_MUX_uxn_opcodes_h_l357_c7_8564_iftrue,
t16_low_MUX_uxn_opcodes_h_l357_c7_8564_iffalse,
t16_low_MUX_uxn_opcodes_h_l357_c7_8564_return_output);

-- t16_high_MUX_uxn_opcodes_h_l357_c7_8564
t16_high_MUX_uxn_opcodes_h_l357_c7_8564 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l357_c7_8564_cond,
t16_high_MUX_uxn_opcodes_h_l357_c7_8564_iftrue,
t16_high_MUX_uxn_opcodes_h_l357_c7_8564_iffalse,
t16_high_MUX_uxn_opcodes_h_l357_c7_8564_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_8564
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_8564 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_8564_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_8564_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_8564_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_8564_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_8564
result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_8564 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_8564_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_8564_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_8564_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_8564_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_8564
result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_8564 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_8564_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_8564_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_8564_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_8564_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_8564
result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_8564 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_8564_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_8564_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_8564_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_8564_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l357_c7_8564
result_u8_value_MUX_uxn_opcodes_h_l357_c7_8564 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l357_c7_8564_cond,
result_u8_value_MUX_uxn_opcodes_h_l357_c7_8564_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l357_c7_8564_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l357_c7_8564_return_output);

-- n16_low_MUX_uxn_opcodes_h_l357_c7_8564
n16_low_MUX_uxn_opcodes_h_l357_c7_8564 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l357_c7_8564_cond,
n16_low_MUX_uxn_opcodes_h_l357_c7_8564_iftrue,
n16_low_MUX_uxn_opcodes_h_l357_c7_8564_iffalse,
n16_low_MUX_uxn_opcodes_h_l357_c7_8564_return_output);

-- n16_high_MUX_uxn_opcodes_h_l357_c7_8564
n16_high_MUX_uxn_opcodes_h_l357_c7_8564 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l357_c7_8564_cond,
n16_high_MUX_uxn_opcodes_h_l357_c7_8564_iftrue,
n16_high_MUX_uxn_opcodes_h_l357_c7_8564_iffalse,
n16_high_MUX_uxn_opcodes_h_l357_c7_8564_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l360_c11_e4f7
BIN_OP_EQ_uxn_opcodes_h_l360_c11_e4f7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l360_c11_e4f7_left,
BIN_OP_EQ_uxn_opcodes_h_l360_c11_e4f7_right,
BIN_OP_EQ_uxn_opcodes_h_l360_c11_e4f7_return_output);

-- t16_low_MUX_uxn_opcodes_h_l360_c7_1b11
t16_low_MUX_uxn_opcodes_h_l360_c7_1b11 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l360_c7_1b11_cond,
t16_low_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue,
t16_low_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse,
t16_low_MUX_uxn_opcodes_h_l360_c7_1b11_return_output);

-- t16_high_MUX_uxn_opcodes_h_l360_c7_1b11
t16_high_MUX_uxn_opcodes_h_l360_c7_1b11 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l360_c7_1b11_cond,
t16_high_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue,
t16_high_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse,
t16_high_MUX_uxn_opcodes_h_l360_c7_1b11_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_1b11
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_1b11 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_1b11_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_1b11_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_1b11
result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_1b11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_1b11_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_1b11_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_1b11
result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_1b11 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_1b11_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_1b11_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_1b11
result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_1b11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_1b11_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_1b11_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l360_c7_1b11
result_u8_value_MUX_uxn_opcodes_h_l360_c7_1b11 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l360_c7_1b11_cond,
result_u8_value_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l360_c7_1b11_return_output);

-- n16_low_MUX_uxn_opcodes_h_l360_c7_1b11
n16_low_MUX_uxn_opcodes_h_l360_c7_1b11 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l360_c7_1b11_cond,
n16_low_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue,
n16_low_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse,
n16_low_MUX_uxn_opcodes_h_l360_c7_1b11_return_output);

-- n16_high_MUX_uxn_opcodes_h_l360_c7_1b11
n16_high_MUX_uxn_opcodes_h_l360_c7_1b11 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l360_c7_1b11_cond,
n16_high_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue,
n16_high_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse,
n16_high_MUX_uxn_opcodes_h_l360_c7_1b11_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l364_c11_6f34
BIN_OP_EQ_uxn_opcodes_h_l364_c11_6f34 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l364_c11_6f34_left,
BIN_OP_EQ_uxn_opcodes_h_l364_c11_6f34_right,
BIN_OP_EQ_uxn_opcodes_h_l364_c11_6f34_return_output);

-- t16_low_MUX_uxn_opcodes_h_l364_c7_15d6
t16_low_MUX_uxn_opcodes_h_l364_c7_15d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l364_c7_15d6_cond,
t16_low_MUX_uxn_opcodes_h_l364_c7_15d6_iftrue,
t16_low_MUX_uxn_opcodes_h_l364_c7_15d6_iffalse,
t16_low_MUX_uxn_opcodes_h_l364_c7_15d6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_15d6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_15d6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_15d6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_15d6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_15d6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_15d6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_15d6
result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_15d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_15d6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_15d6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_15d6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_15d6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_15d6
result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_15d6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_15d6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_15d6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_15d6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_15d6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_15d6
result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_15d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_15d6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_15d6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_15d6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_15d6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l364_c7_15d6
result_u8_value_MUX_uxn_opcodes_h_l364_c7_15d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l364_c7_15d6_cond,
result_u8_value_MUX_uxn_opcodes_h_l364_c7_15d6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l364_c7_15d6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l364_c7_15d6_return_output);

-- n16_low_MUX_uxn_opcodes_h_l364_c7_15d6
n16_low_MUX_uxn_opcodes_h_l364_c7_15d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l364_c7_15d6_cond,
n16_low_MUX_uxn_opcodes_h_l364_c7_15d6_iftrue,
n16_low_MUX_uxn_opcodes_h_l364_c7_15d6_iffalse,
n16_low_MUX_uxn_opcodes_h_l364_c7_15d6_return_output);

-- n16_high_MUX_uxn_opcodes_h_l364_c7_15d6
n16_high_MUX_uxn_opcodes_h_l364_c7_15d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l364_c7_15d6_cond,
n16_high_MUX_uxn_opcodes_h_l364_c7_15d6_iftrue,
n16_high_MUX_uxn_opcodes_h_l364_c7_15d6_iffalse,
n16_high_MUX_uxn_opcodes_h_l364_c7_15d6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l368_c11_4d48
BIN_OP_EQ_uxn_opcodes_h_l368_c11_4d48 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l368_c11_4d48_left,
BIN_OP_EQ_uxn_opcodes_h_l368_c11_4d48_right,
BIN_OP_EQ_uxn_opcodes_h_l368_c11_4d48_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_ea8a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_ea8a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_ea8a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_ea8a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_ea8a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_ea8a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_ea8a
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_ea8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_ea8a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_ea8a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_ea8a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_ea8a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_ea8a
result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_ea8a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_ea8a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_ea8a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_ea8a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_ea8a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_ea8a
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_ea8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_ea8a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_ea8a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_ea8a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_ea8a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l368_c7_ea8a
result_u8_value_MUX_uxn_opcodes_h_l368_c7_ea8a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l368_c7_ea8a_cond,
result_u8_value_MUX_uxn_opcodes_h_l368_c7_ea8a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l368_c7_ea8a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l368_c7_ea8a_return_output);

-- n16_low_MUX_uxn_opcodes_h_l368_c7_ea8a
n16_low_MUX_uxn_opcodes_h_l368_c7_ea8a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l368_c7_ea8a_cond,
n16_low_MUX_uxn_opcodes_h_l368_c7_ea8a_iftrue,
n16_low_MUX_uxn_opcodes_h_l368_c7_ea8a_iffalse,
n16_low_MUX_uxn_opcodes_h_l368_c7_ea8a_return_output);

-- n16_high_MUX_uxn_opcodes_h_l368_c7_ea8a
n16_high_MUX_uxn_opcodes_h_l368_c7_ea8a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l368_c7_ea8a_cond,
n16_high_MUX_uxn_opcodes_h_l368_c7_ea8a_iftrue,
n16_high_MUX_uxn_opcodes_h_l368_c7_ea8a_iffalse,
n16_high_MUX_uxn_opcodes_h_l368_c7_ea8a_return_output);

-- sp_relative_shift_uxn_opcodes_h_l370_c30_a645
sp_relative_shift_uxn_opcodes_h_l370_c30_a645 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l370_c30_a645_ins,
sp_relative_shift_uxn_opcodes_h_l370_c30_a645_x,
sp_relative_shift_uxn_opcodes_h_l370_c30_a645_y,
sp_relative_shift_uxn_opcodes_h_l370_c30_a645_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l375_c11_f76f
BIN_OP_EQ_uxn_opcodes_h_l375_c11_f76f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l375_c11_f76f_left,
BIN_OP_EQ_uxn_opcodes_h_l375_c11_f76f_right,
BIN_OP_EQ_uxn_opcodes_h_l375_c11_f76f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_822e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_822e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_822e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_822e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_822e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_822e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_822e
result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_822e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_822e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_822e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_822e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_822e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l375_c7_822e
result_u8_value_MUX_uxn_opcodes_h_l375_c7_822e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l375_c7_822e_cond,
result_u8_value_MUX_uxn_opcodes_h_l375_c7_822e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l375_c7_822e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l375_c7_822e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_822e
result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_822e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_822e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_822e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_822e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_822e_return_output);

-- n16_low_MUX_uxn_opcodes_h_l375_c7_822e
n16_low_MUX_uxn_opcodes_h_l375_c7_822e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l375_c7_822e_cond,
n16_low_MUX_uxn_opcodes_h_l375_c7_822e_iftrue,
n16_low_MUX_uxn_opcodes_h_l375_c7_822e_iffalse,
n16_low_MUX_uxn_opcodes_h_l375_c7_822e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l381_c11_93cc
BIN_OP_EQ_uxn_opcodes_h_l381_c11_93cc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l381_c11_93cc_left,
BIN_OP_EQ_uxn_opcodes_h_l381_c11_93cc_right,
BIN_OP_EQ_uxn_opcodes_h_l381_c11_93cc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_47f8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_47f8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_47f8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_47f8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_47f8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_47f8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_47f8
result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_47f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_47f8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_47f8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_47f8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_47f8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l381_c7_47f8
result_u8_value_MUX_uxn_opcodes_h_l381_c7_47f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l381_c7_47f8_cond,
result_u8_value_MUX_uxn_opcodes_h_l381_c7_47f8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l381_c7_47f8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l381_c7_47f8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l385_c11_af20
BIN_OP_EQ_uxn_opcodes_h_l385_c11_af20 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l385_c11_af20_left,
BIN_OP_EQ_uxn_opcodes_h_l385_c11_af20_right,
BIN_OP_EQ_uxn_opcodes_h_l385_c11_af20_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_a352
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_a352 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_a352_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_a352_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_a352_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_a352_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_a352
result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_a352 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_a352_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_a352_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_a352_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_a352_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l385_c7_a352
result_u8_value_MUX_uxn_opcodes_h_l385_c7_a352 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l385_c7_a352_cond,
result_u8_value_MUX_uxn_opcodes_h_l385_c7_a352_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l385_c7_a352_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l385_c7_a352_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l389_c11_3ea1
BIN_OP_EQ_uxn_opcodes_h_l389_c11_3ea1 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l389_c11_3ea1_left,
BIN_OP_EQ_uxn_opcodes_h_l389_c11_3ea1_right,
BIN_OP_EQ_uxn_opcodes_h_l389_c11_3ea1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_f92c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_f92c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_f92c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_f92c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_f92c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_f92c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_f92c
result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_f92c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_f92c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_f92c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_f92c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_f92c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l389_c7_f92c
result_u8_value_MUX_uxn_opcodes_h_l389_c7_f92c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l389_c7_f92c_cond,
result_u8_value_MUX_uxn_opcodes_h_l389_c7_f92c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l389_c7_f92c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l389_c7_f92c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l393_c11_37f3
BIN_OP_EQ_uxn_opcodes_h_l393_c11_37f3 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l393_c11_37f3_left,
BIN_OP_EQ_uxn_opcodes_h_l393_c11_37f3_right,
BIN_OP_EQ_uxn_opcodes_h_l393_c11_37f3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_87cb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_87cb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_87cb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_87cb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_87cb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_87cb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_87cb
result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_87cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_87cb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_87cb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_87cb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_87cb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l393_c7_87cb
result_u8_value_MUX_uxn_opcodes_h_l393_c7_87cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l393_c7_87cb_cond,
result_u8_value_MUX_uxn_opcodes_h_l393_c7_87cb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l393_c7_87cb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l393_c7_87cb_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16_low,
 t16_high,
 n16_low,
 n16_high,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l344_c6_c4d6_return_output,
 t16_low_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output,
 t16_high_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output,
 n16_low_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output,
 n16_high_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l357_c11_4ce8_return_output,
 t16_low_MUX_uxn_opcodes_h_l357_c7_8564_return_output,
 t16_high_MUX_uxn_opcodes_h_l357_c7_8564_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_8564_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_8564_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_8564_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_8564_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l357_c7_8564_return_output,
 n16_low_MUX_uxn_opcodes_h_l357_c7_8564_return_output,
 n16_high_MUX_uxn_opcodes_h_l357_c7_8564_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l360_c11_e4f7_return_output,
 t16_low_MUX_uxn_opcodes_h_l360_c7_1b11_return_output,
 t16_high_MUX_uxn_opcodes_h_l360_c7_1b11_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_1b11_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_1b11_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_1b11_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_1b11_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l360_c7_1b11_return_output,
 n16_low_MUX_uxn_opcodes_h_l360_c7_1b11_return_output,
 n16_high_MUX_uxn_opcodes_h_l360_c7_1b11_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l364_c11_6f34_return_output,
 t16_low_MUX_uxn_opcodes_h_l364_c7_15d6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_15d6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_15d6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_15d6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_15d6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l364_c7_15d6_return_output,
 n16_low_MUX_uxn_opcodes_h_l364_c7_15d6_return_output,
 n16_high_MUX_uxn_opcodes_h_l364_c7_15d6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l368_c11_4d48_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_ea8a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_ea8a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_ea8a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_ea8a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l368_c7_ea8a_return_output,
 n16_low_MUX_uxn_opcodes_h_l368_c7_ea8a_return_output,
 n16_high_MUX_uxn_opcodes_h_l368_c7_ea8a_return_output,
 sp_relative_shift_uxn_opcodes_h_l370_c30_a645_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l375_c11_f76f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_822e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_822e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l375_c7_822e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_822e_return_output,
 n16_low_MUX_uxn_opcodes_h_l375_c7_822e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l381_c11_93cc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_47f8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_47f8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l381_c7_47f8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l385_c11_af20_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_a352_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_a352_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l385_c7_a352_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l389_c11_3ea1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_f92c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_f92c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l389_c7_f92c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l393_c11_37f3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_87cb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_87cb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l393_c7_87cb_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c6_c4d6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c6_c4d6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c6_c4d6_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l357_c7_8564_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l344_c2_b7a3_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l357_c7_8564_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l344_c2_b7a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_8564_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_b7a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l344_c2_b7a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_b7a3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l349_c3_843e : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_8564_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_b7a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l344_c2_b7a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_b7a3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_8564_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l344_c2_b7a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l344_c2_b7a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_b7a3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l354_c3_50de : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_8564_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_b7a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l344_c2_b7a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_b7a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_8564_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_b7a3_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l357_c7_8564_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l344_c2_b7a3_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l357_c7_8564_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l344_c2_b7a3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_4ce8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_4ce8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_4ce8_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l357_c7_8564_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l357_c7_8564_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l360_c7_1b11_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l357_c7_8564_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l357_c7_8564_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l357_c7_8564_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l360_c7_1b11_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l357_c7_8564_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_8564_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l358_c3_4024 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_8564_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_1b11_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_8564_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_8564_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_8564_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_1b11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_8564_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_8564_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_8564_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_1b11_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_8564_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_8564_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_8564_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_1b11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_8564_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_8564_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_8564_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l360_c7_1b11_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_8564_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l357_c7_8564_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l357_c7_8564_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l360_c7_1b11_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l357_c7_8564_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l357_c7_8564_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l357_c7_8564_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l360_c7_1b11_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l357_c7_8564_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_e4f7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_e4f7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_e4f7_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l364_c7_15d6_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l360_c7_1b11_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l360_c7_1b11_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l362_c3_982c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_15d6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_1b11_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_15d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_1b11_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_15d6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_1b11_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_15d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_1b11_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_15d6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l360_c7_1b11_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l364_c7_15d6_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l360_c7_1b11_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l364_c7_15d6_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l360_c7_1b11_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_6f34_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_6f34_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_6f34_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l364_c7_15d6_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l364_c7_15d6_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l364_c7_15d6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_15d6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l366_c3_12b5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_15d6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_ea8a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_15d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_15d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_15d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_ea8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_15d6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_15d6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_15d6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_ea8a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_15d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_15d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_15d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_ea8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_15d6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_15d6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_15d6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_ea8a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_15d6_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l364_c7_15d6_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l364_c7_15d6_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l368_c7_ea8a_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l364_c7_15d6_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l364_c7_15d6_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l364_c7_15d6_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l368_c7_ea8a_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l364_c7_15d6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_4d48_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_4d48_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_4d48_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_ea8a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l372_c3_a644 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_ea8a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_822e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_ea8a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_ea8a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_ea8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_ea8a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_ea8a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_ea8a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_822e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_ea8a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_ea8a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_ea8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_822e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_ea8a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_ea8a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_ea8a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l375_c7_822e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_ea8a_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l368_c7_ea8a_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l368_c7_ea8a_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l375_c7_822e_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l368_c7_ea8a_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l368_c7_ea8a_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l368_c7_ea8a_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l368_c7_ea8a_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l370_c30_a645_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l370_c30_a645_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l370_c30_a645_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l370_c30_a645_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l375_c11_f76f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l375_c11_f76f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l375_c11_f76f_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_822e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l378_c3_5eaa : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_822e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_47f8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_822e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_822e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_822e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_47f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_822e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l375_c7_822e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l375_c7_822e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l381_c7_47f8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l375_c7_822e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_822e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l377_c3_a1c9 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_822e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_822e_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l375_c7_822e_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l375_c7_822e_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l375_c7_822e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_93cc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_93cc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_93cc_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_47f8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l382_c3_3f11 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_47f8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_a352_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_47f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_47f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_47f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_a352_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_47f8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l381_c7_47f8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l381_c7_47f8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l385_c7_a352_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l381_c7_47f8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l385_c11_af20_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l385_c11_af20_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l385_c11_af20_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_a352_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l386_c3_c8f6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_a352_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_f92c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_a352_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_a352_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_a352_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_f92c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_a352_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l385_c7_a352_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l385_c7_a352_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l389_c7_f92c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l385_c7_a352_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l389_c11_3ea1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l389_c11_3ea1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l389_c11_3ea1_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_f92c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l390_c3_2bac : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_f92c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_87cb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_f92c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_f92c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_f92c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_87cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_f92c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l389_c7_f92c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l389_c7_f92c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l393_c7_87cb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l389_c7_f92c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_37f3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_37f3_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_37f3_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_87cb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l394_c3_78ec : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_87cb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l393_c7_87cb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_87cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_87cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_87cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_87cb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l393_c7_87cb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l393_c7_87cb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l393_c7_87cb_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l360_l357_l344_l364_l393_DUPLICATE_47d5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l360_l364_l357_l368_DUPLICATE_85ea_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l360_l375_l364_l357_DUPLICATE_d431_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l360_l389_l357_l385_l381_l375_l368_l364_l393_DUPLICATE_663f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l399_l340_DUPLICATE_216d_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16_low : unsigned(7 downto 0);
variable REG_VAR_t16_high : unsigned(7 downto 0);
variable REG_VAR_n16_low : unsigned(7 downto 0);
variable REG_VAR_n16_high : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16_low := t16_low;
  REG_VAR_t16_high := t16_high;
  REG_VAR_n16_low := n16_low;
  REG_VAR_n16_high := n16_high;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l382_c3_3f11 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_47f8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l382_c3_3f11;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_ea8a_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l394_c3_78ec := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_87cb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l394_c3_78ec;
     VAR_sp_relative_shift_uxn_opcodes_h_l370_c30_a645_y := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l378_c3_5eaa := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_822e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l378_c3_5eaa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_4d48_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l354_c3_50de := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l354_c3_50de;
     VAR_sp_relative_shift_uxn_opcodes_h_l370_c30_a645_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l386_c3_c8f6 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_a352_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l386_c3_c8f6;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l390_c3_2bac := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_f92c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l390_c3_2bac;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l366_c3_12b5 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_15d6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l366_c3_12b5;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l349_c3_843e := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l349_c3_843e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_4ce8_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l372_c3_a644 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_ea8a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l372_c3_a644;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l375_c11_f76f_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l389_c11_3ea1_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_6f34_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l385_c11_af20_right := to_unsigned(7, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l377_c3_a1c9 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_822e_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l377_c3_a1c9;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_37f3_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_93cc_right := to_unsigned(6, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c6_c4d6_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l362_c3_982c := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l362_c3_982c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l358_c3_4024 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_8564_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l358_c3_4024;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_87cb_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_e4f7_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l370_c30_a645_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l357_c7_8564_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l364_c7_15d6_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l368_c7_ea8a_iffalse := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l385_c7_a352_iftrue := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l393_c7_87cb_iftrue := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l357_c7_8564_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l364_c7_15d6_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l368_c7_ea8a_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l375_c7_822e_iffalse := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l381_c7_47f8_iftrue := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l389_c7_f92c_iftrue := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c6_c4d6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_4ce8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_e4f7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_6f34_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_4d48_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l375_c11_f76f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_93cc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l385_c11_af20_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l389_c11_3ea1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_37f3_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l368_c7_ea8a_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l375_c7_822e_iftrue := VAR_previous_stack_read;
     VAR_t16_high_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue := VAR_previous_stack_read;
     VAR_t16_low_MUX_uxn_opcodes_h_l364_c7_15d6_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l375_c7_822e_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l357_c7_8564_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse := t16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_ea8a_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l357_c7_8564_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l364_c7_15d6_iffalse := t16_low;
     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l344_c2_b7a3] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l344_c2_b7a3_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l360_l364_l357_l368_DUPLICATE_85ea LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l360_l364_l357_l368_DUPLICATE_85ea_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l375_c11_f76f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l375_c11_f76f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l375_c11_f76f_left;
     BIN_OP_EQ_uxn_opcodes_h_l375_c11_f76f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l375_c11_f76f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l375_c11_f76f_return_output := BIN_OP_EQ_uxn_opcodes_h_l375_c11_f76f_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l360_l357_l344_l364_l393_DUPLICATE_47d5 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l360_l357_l344_l364_l393_DUPLICATE_47d5_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l360_c11_e4f7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l360_c11_e4f7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_e4f7_left;
     BIN_OP_EQ_uxn_opcodes_h_l360_c11_e4f7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_e4f7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_e4f7_return_output := BIN_OP_EQ_uxn_opcodes_h_l360_c11_e4f7_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l370_c30_a645] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l370_c30_a645_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l370_c30_a645_ins;
     sp_relative_shift_uxn_opcodes_h_l370_c30_a645_x <= VAR_sp_relative_shift_uxn_opcodes_h_l370_c30_a645_x;
     sp_relative_shift_uxn_opcodes_h_l370_c30_a645_y <= VAR_sp_relative_shift_uxn_opcodes_h_l370_c30_a645_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l370_c30_a645_return_output := sp_relative_shift_uxn_opcodes_h_l370_c30_a645_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l344_c2_b7a3] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l344_c2_b7a3_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l357_c11_4ce8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l357_c11_4ce8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_4ce8_left;
     BIN_OP_EQ_uxn_opcodes_h_l357_c11_4ce8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_4ce8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_4ce8_return_output := BIN_OP_EQ_uxn_opcodes_h_l357_c11_4ce8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l389_c11_3ea1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l389_c11_3ea1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l389_c11_3ea1_left;
     BIN_OP_EQ_uxn_opcodes_h_l389_c11_3ea1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l389_c11_3ea1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l389_c11_3ea1_return_output := BIN_OP_EQ_uxn_opcodes_h_l389_c11_3ea1_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l393_c7_87cb] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l393_c7_87cb_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l344_c6_c4d6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l344_c6_c4d6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c6_c4d6_left;
     BIN_OP_EQ_uxn_opcodes_h_l344_c6_c4d6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c6_c4d6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c6_c4d6_return_output := BIN_OP_EQ_uxn_opcodes_h_l344_c6_c4d6_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l360_l375_l364_l357_DUPLICATE_d431 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l360_l375_l364_l357_DUPLICATE_d431_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l385_c11_af20] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l385_c11_af20_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l385_c11_af20_left;
     BIN_OP_EQ_uxn_opcodes_h_l385_c11_af20_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l385_c11_af20_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l385_c11_af20_return_output := BIN_OP_EQ_uxn_opcodes_h_l385_c11_af20_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l393_c11_37f3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l393_c11_37f3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_37f3_left;
     BIN_OP_EQ_uxn_opcodes_h_l393_c11_37f3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_37f3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_37f3_return_output := BIN_OP_EQ_uxn_opcodes_h_l393_c11_37f3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l368_c11_4d48] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l368_c11_4d48_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_4d48_left;
     BIN_OP_EQ_uxn_opcodes_h_l368_c11_4d48_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_4d48_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_4d48_return_output := BIN_OP_EQ_uxn_opcodes_h_l368_c11_4d48_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l381_c11_93cc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l381_c11_93cc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_93cc_left;
     BIN_OP_EQ_uxn_opcodes_h_l381_c11_93cc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_93cc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_93cc_return_output := BIN_OP_EQ_uxn_opcodes_h_l381_c11_93cc_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l344_c2_b7a3] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l344_c2_b7a3_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l364_c11_6f34] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l364_c11_6f34_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_6f34_left;
     BIN_OP_EQ_uxn_opcodes_h_l364_c11_6f34_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_6f34_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_6f34_return_output := BIN_OP_EQ_uxn_opcodes_h_l364_c11_6f34_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l360_l389_l357_l385_l381_l375_l368_l364_l393_DUPLICATE_663f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l360_l389_l357_l385_l381_l375_l368_l364_l393_DUPLICATE_663f_return_output := result.is_opc_done;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l344_c2_b7a3] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l344_c2_b7a3_return_output := result.is_vram_write;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l344_c2_b7a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c6_c4d6_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l344_c2_b7a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c6_c4d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_b7a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c6_c4d6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_b7a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c6_c4d6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_b7a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c6_c4d6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_b7a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c6_c4d6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_b7a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c6_c4d6_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_b7a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c6_c4d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_b7a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c6_c4d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_b7a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c6_c4d6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l344_c2_b7a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c6_c4d6_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l344_c2_b7a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c6_c4d6_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l344_c2_b7a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c6_c4d6_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l357_c7_8564_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_4ce8_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l357_c7_8564_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_4ce8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_8564_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_4ce8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_8564_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_4ce8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_8564_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_4ce8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_8564_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_4ce8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_8564_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_4ce8_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l357_c7_8564_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_4ce8_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l357_c7_8564_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_4ce8_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l360_c7_1b11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_e4f7_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l360_c7_1b11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_e4f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_1b11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_e4f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_1b11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_e4f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_1b11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_e4f7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_1b11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_e4f7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l360_c7_1b11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_e4f7_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l360_c7_1b11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_e4f7_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l360_c7_1b11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_e4f7_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l364_c7_15d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_6f34_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l364_c7_15d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_6f34_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_15d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_6f34_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_15d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_6f34_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_15d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_6f34_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_15d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_6f34_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_15d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_6f34_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l364_c7_15d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_6f34_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l368_c7_ea8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_4d48_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l368_c7_ea8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_4d48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_ea8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_4d48_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_ea8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_4d48_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_ea8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_4d48_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_ea8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_4d48_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_ea8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_4d48_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l375_c7_822e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l375_c11_f76f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_822e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l375_c11_f76f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_822e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l375_c11_f76f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_822e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l375_c11_f76f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l375_c7_822e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l375_c11_f76f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_47f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_93cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_47f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_93cc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l381_c7_47f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_93cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_a352_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l385_c11_af20_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_a352_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l385_c11_af20_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l385_c7_a352_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l385_c11_af20_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_f92c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l389_c11_3ea1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_f92c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l389_c11_3ea1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l389_c7_f92c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l389_c11_3ea1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_87cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_37f3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_87cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_37f3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l393_c7_87cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_37f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_8564_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l360_l375_l364_l357_DUPLICATE_d431_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l360_l375_l364_l357_DUPLICATE_d431_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_15d6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l360_l375_l364_l357_DUPLICATE_d431_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_822e_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l360_l375_l364_l357_DUPLICATE_d431_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_8564_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l360_l389_l357_l385_l381_l375_l368_l364_l393_DUPLICATE_663f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l360_l389_l357_l385_l381_l375_l368_l364_l393_DUPLICATE_663f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_15d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l360_l389_l357_l385_l381_l375_l368_l364_l393_DUPLICATE_663f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_ea8a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l360_l389_l357_l385_l381_l375_l368_l364_l393_DUPLICATE_663f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_822e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l360_l389_l357_l385_l381_l375_l368_l364_l393_DUPLICATE_663f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_47f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l360_l389_l357_l385_l381_l375_l368_l364_l393_DUPLICATE_663f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_a352_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l360_l389_l357_l385_l381_l375_l368_l364_l393_DUPLICATE_663f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_f92c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l360_l389_l357_l385_l381_l375_l368_l364_l393_DUPLICATE_663f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_87cb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l360_l389_l357_l385_l381_l375_l368_l364_l393_DUPLICATE_663f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_8564_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l360_l364_l357_l368_DUPLICATE_85ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l360_l364_l357_l368_DUPLICATE_85ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_15d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l360_l364_l357_l368_DUPLICATE_85ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_ea8a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l360_l364_l357_l368_DUPLICATE_85ea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l360_l357_l344_l364_l393_DUPLICATE_47d5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_8564_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l360_l357_l344_l364_l393_DUPLICATE_47d5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l360_l357_l344_l364_l393_DUPLICATE_47d5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_15d6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l360_l357_l344_l364_l393_DUPLICATE_47d5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l393_c7_87cb_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l360_l357_l344_l364_l393_DUPLICATE_47d5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l344_c2_b7a3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l344_c2_b7a3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l344_c2_b7a3_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l344_c2_b7a3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_87cb_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l393_c7_87cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_ea8a_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l370_c30_a645_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l375_c7_822e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_822e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_822e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_822e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_822e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_822e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_822e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_822e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_822e_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l368_c7_ea8a] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l368_c7_ea8a_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l368_c7_ea8a_cond;
     n16_high_MUX_uxn_opcodes_h_l368_c7_ea8a_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l368_c7_ea8a_iftrue;
     n16_high_MUX_uxn_opcodes_h_l368_c7_ea8a_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l368_c7_ea8a_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l368_c7_ea8a_return_output := n16_high_MUX_uxn_opcodes_h_l368_c7_ea8a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l393_c7_87cb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_87cb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_87cb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_87cb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_87cb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_87cb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_87cb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_87cb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_87cb_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l344_c2_b7a3] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_b7a3_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_b7a3_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l364_c7_15d6] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l364_c7_15d6_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l364_c7_15d6_cond;
     t16_low_MUX_uxn_opcodes_h_l364_c7_15d6_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l364_c7_15d6_iftrue;
     t16_low_MUX_uxn_opcodes_h_l364_c7_15d6_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l364_c7_15d6_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l364_c7_15d6_return_output := t16_low_MUX_uxn_opcodes_h_l364_c7_15d6_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l344_c2_b7a3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_b7a3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_b7a3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l393_c7_87cb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l393_c7_87cb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l393_c7_87cb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l393_c7_87cb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l393_c7_87cb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l393_c7_87cb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l393_c7_87cb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l393_c7_87cb_return_output := result_u8_value_MUX_uxn_opcodes_h_l393_c7_87cb_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l360_c7_1b11] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l360_c7_1b11_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l360_c7_1b11_cond;
     t16_high_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue;
     t16_high_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l360_c7_1b11_return_output := t16_high_MUX_uxn_opcodes_h_l360_c7_1b11_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l393_c7_87cb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_87cb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_87cb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_87cb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_87cb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_87cb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_87cb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_87cb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_87cb_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l344_c2_b7a3] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_b7a3_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_b7a3_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l375_c7_822e] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l375_c7_822e_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l375_c7_822e_cond;
     n16_low_MUX_uxn_opcodes_h_l375_c7_822e_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l375_c7_822e_iftrue;
     n16_low_MUX_uxn_opcodes_h_l375_c7_822e_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l375_c7_822e_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l375_c7_822e_return_output := n16_low_MUX_uxn_opcodes_h_l375_c7_822e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l368_c7_ea8a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_ea8a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_ea8a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_ea8a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_ea8a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_ea8a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_ea8a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_ea8a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_ea8a_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l344_c2_b7a3] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_b7a3_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_b7a3_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output;

     -- Submodule level 2
     VAR_n16_high_MUX_uxn_opcodes_h_l364_c7_15d6_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l368_c7_ea8a_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l368_c7_ea8a_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l375_c7_822e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_f92c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_87cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_15d6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_ea8a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_ea8a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_822e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_f92c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_87cb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l389_c7_f92c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l393_c7_87cb_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l357_c7_8564_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l360_c7_1b11_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l364_c7_15d6_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l389_c7_f92c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l389_c7_f92c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l389_c7_f92c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l389_c7_f92c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l389_c7_f92c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l389_c7_f92c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l389_c7_f92c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l389_c7_f92c_return_output := result_u8_value_MUX_uxn_opcodes_h_l389_c7_f92c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l368_c7_ea8a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_ea8a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_ea8a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_ea8a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_ea8a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_ea8a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_ea8a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_ea8a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_ea8a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l389_c7_f92c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_f92c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_f92c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_f92c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_f92c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_f92c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_f92c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_f92c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_f92c_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l360_c7_1b11] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l360_c7_1b11_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l360_c7_1b11_cond;
     t16_low_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue;
     t16_low_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l360_c7_1b11_return_output := t16_low_MUX_uxn_opcodes_h_l360_c7_1b11_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l368_c7_ea8a] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l368_c7_ea8a_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l368_c7_ea8a_cond;
     n16_low_MUX_uxn_opcodes_h_l368_c7_ea8a_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l368_c7_ea8a_iftrue;
     n16_low_MUX_uxn_opcodes_h_l368_c7_ea8a_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l368_c7_ea8a_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l368_c7_ea8a_return_output := n16_low_MUX_uxn_opcodes_h_l368_c7_ea8a_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l357_c7_8564] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l357_c7_8564_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l357_c7_8564_cond;
     t16_high_MUX_uxn_opcodes_h_l357_c7_8564_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l357_c7_8564_iftrue;
     t16_high_MUX_uxn_opcodes_h_l357_c7_8564_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l357_c7_8564_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l357_c7_8564_return_output := t16_high_MUX_uxn_opcodes_h_l357_c7_8564_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l364_c7_15d6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_15d6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_15d6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_15d6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_15d6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_15d6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_15d6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_15d6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_15d6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l389_c7_f92c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_f92c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_f92c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_f92c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_f92c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_f92c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_f92c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_f92c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_f92c_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l364_c7_15d6] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l364_c7_15d6_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l364_c7_15d6_cond;
     n16_high_MUX_uxn_opcodes_h_l364_c7_15d6_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l364_c7_15d6_iftrue;
     n16_high_MUX_uxn_opcodes_h_l364_c7_15d6_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l364_c7_15d6_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l364_c7_15d6_return_output := n16_high_MUX_uxn_opcodes_h_l364_c7_15d6_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l364_c7_15d6_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l364_c7_15d6_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l368_c7_ea8a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_a352_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_f92c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_15d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_15d6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_ea8a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_a352_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_f92c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l385_c7_a352_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l389_c7_f92c_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l357_c7_8564_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l357_c7_8564_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l360_c7_1b11_return_output;
     -- t16_high_MUX[uxn_opcodes_h_l344_c2_b7a3] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l344_c2_b7a3_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l344_c2_b7a3_cond;
     t16_high_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue;
     t16_high_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output := t16_high_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l385_c7_a352] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_a352_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_a352_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_a352_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_a352_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_a352_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_a352_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_a352_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_a352_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l385_c7_a352] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l385_c7_a352_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l385_c7_a352_cond;
     result_u8_value_MUX_uxn_opcodes_h_l385_c7_a352_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l385_c7_a352_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l385_c7_a352_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l385_c7_a352_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l385_c7_a352_return_output := result_u8_value_MUX_uxn_opcodes_h_l385_c7_a352_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l360_c7_1b11] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l360_c7_1b11_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l360_c7_1b11_cond;
     n16_high_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue;
     n16_high_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l360_c7_1b11_return_output := n16_high_MUX_uxn_opcodes_h_l360_c7_1b11_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l357_c7_8564] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l357_c7_8564_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l357_c7_8564_cond;
     t16_low_MUX_uxn_opcodes_h_l357_c7_8564_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l357_c7_8564_iftrue;
     t16_low_MUX_uxn_opcodes_h_l357_c7_8564_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l357_c7_8564_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l357_c7_8564_return_output := t16_low_MUX_uxn_opcodes_h_l357_c7_8564_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l385_c7_a352] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_a352_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_a352_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_a352_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_a352_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_a352_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_a352_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_a352_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_a352_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l364_c7_15d6] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l364_c7_15d6_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l364_c7_15d6_cond;
     n16_low_MUX_uxn_opcodes_h_l364_c7_15d6_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l364_c7_15d6_iftrue;
     n16_low_MUX_uxn_opcodes_h_l364_c7_15d6_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l364_c7_15d6_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l364_c7_15d6_return_output := n16_low_MUX_uxn_opcodes_h_l364_c7_15d6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l360_c7_1b11] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_1b11_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_1b11_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_1b11_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_1b11_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l364_c7_15d6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_15d6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_15d6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_15d6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_15d6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_15d6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_15d6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_15d6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_15d6_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l357_c7_8564_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l360_c7_1b11_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l364_c7_15d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_47f8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_a352_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_8564_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_1b11_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_15d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_47f8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_a352_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l381_c7_47f8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l385_c7_a352_return_output;
     REG_VAR_t16_high := VAR_t16_high_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l357_c7_8564_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l360_c7_1b11] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_1b11_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_1b11_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_1b11_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_1b11_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l381_c7_47f8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l381_c7_47f8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l381_c7_47f8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l381_c7_47f8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l381_c7_47f8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l381_c7_47f8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l381_c7_47f8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l381_c7_47f8_return_output := result_u8_value_MUX_uxn_opcodes_h_l381_c7_47f8_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l357_c7_8564] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l357_c7_8564_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l357_c7_8564_cond;
     n16_high_MUX_uxn_opcodes_h_l357_c7_8564_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l357_c7_8564_iftrue;
     n16_high_MUX_uxn_opcodes_h_l357_c7_8564_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l357_c7_8564_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l357_c7_8564_return_output := n16_high_MUX_uxn_opcodes_h_l357_c7_8564_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l360_c7_1b11] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l360_c7_1b11_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l360_c7_1b11_cond;
     n16_low_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue;
     n16_low_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l360_c7_1b11_return_output := n16_low_MUX_uxn_opcodes_h_l360_c7_1b11_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l381_c7_47f8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_47f8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_47f8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_47f8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_47f8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_47f8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_47f8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_47f8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_47f8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l381_c7_47f8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_47f8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_47f8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_47f8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_47f8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_47f8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_47f8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_47f8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_47f8_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l344_c2_b7a3] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l344_c2_b7a3_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l344_c2_b7a3_cond;
     t16_low_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue;
     t16_low_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output := t16_low_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l357_c7_8564] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_8564_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_8564_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_8564_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_8564_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_8564_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_8564_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_8564_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_8564_return_output;

     -- Submodule level 5
     VAR_n16_high_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l357_c7_8564_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l357_c7_8564_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l360_c7_1b11_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_822e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_47f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_8564_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_8564_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_1b11_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_822e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_47f8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l375_c7_822e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l381_c7_47f8_return_output;
     REG_VAR_t16_low := VAR_t16_low_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l375_c7_822e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_822e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_822e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_822e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_822e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_822e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_822e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_822e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_822e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l375_c7_822e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_822e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_822e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_822e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_822e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_822e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_822e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_822e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_822e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l375_c7_822e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l375_c7_822e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l375_c7_822e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l375_c7_822e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l375_c7_822e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l375_c7_822e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l375_c7_822e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l375_c7_822e_return_output := result_u8_value_MUX_uxn_opcodes_h_l375_c7_822e_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l357_c7_8564] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l357_c7_8564_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l357_c7_8564_cond;
     n16_low_MUX_uxn_opcodes_h_l357_c7_8564_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l357_c7_8564_iftrue;
     n16_low_MUX_uxn_opcodes_h_l357_c7_8564_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l357_c7_8564_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l357_c7_8564_return_output := n16_low_MUX_uxn_opcodes_h_l357_c7_8564_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l344_c2_b7a3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_b7a3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_b7a3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l344_c2_b7a3] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l344_c2_b7a3_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l344_c2_b7a3_cond;
     n16_high_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue;
     n16_high_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output := n16_high_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l357_c7_8564] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_8564_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_8564_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_8564_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_8564_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_8564_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_8564_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_8564_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_8564_return_output;

     -- Submodule level 6
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l357_c7_8564_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_ea8a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_822e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_8564_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_ea8a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_822e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_ea8a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l375_c7_822e_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l344_c2_b7a3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_b7a3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_b7a3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l368_c7_ea8a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_ea8a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_ea8a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_ea8a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_ea8a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_ea8a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_ea8a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_ea8a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_ea8a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l368_c7_ea8a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l368_c7_ea8a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_ea8a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l368_c7_ea8a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_ea8a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l368_c7_ea8a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_ea8a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_ea8a_return_output := result_u8_value_MUX_uxn_opcodes_h_l368_c7_ea8a_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l344_c2_b7a3] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l344_c2_b7a3_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l344_c2_b7a3_cond;
     n16_low_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue;
     n16_low_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output := n16_low_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l368_c7_ea8a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_ea8a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_ea8a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_ea8a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_ea8a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_ea8a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_ea8a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_ea8a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_ea8a_return_output;

     -- Submodule level 7
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_15d6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_ea8a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_15d6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_ea8a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_15d6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_ea8a_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l364_c7_15d6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_15d6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_15d6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_15d6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_15d6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_15d6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_15d6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_15d6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_15d6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l364_c7_15d6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l364_c7_15d6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_15d6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l364_c7_15d6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_15d6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l364_c7_15d6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_15d6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_15d6_return_output := result_u8_value_MUX_uxn_opcodes_h_l364_c7_15d6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l364_c7_15d6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_15d6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_15d6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_15d6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_15d6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_15d6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_15d6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_15d6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_15d6_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_15d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_15d6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_15d6_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l360_c7_1b11] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_1b11_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_1b11_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_1b11_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_1b11_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l360_c7_1b11] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l360_c7_1b11_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l360_c7_1b11_cond;
     result_u8_value_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l360_c7_1b11_return_output := result_u8_value_MUX_uxn_opcodes_h_l360_c7_1b11_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l360_c7_1b11] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_1b11_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_1b11_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_1b11_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_1b11_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_1b11_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_1b11_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_8564_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_1b11_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_8564_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_1b11_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_8564_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l360_c7_1b11_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l357_c7_8564] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_8564_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_8564_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_8564_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_8564_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_8564_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_8564_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_8564_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_8564_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l357_c7_8564] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_8564_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_8564_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_8564_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_8564_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_8564_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_8564_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_8564_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_8564_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l357_c7_8564] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l357_c7_8564_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_8564_cond;
     result_u8_value_MUX_uxn_opcodes_h_l357_c7_8564_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_8564_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l357_c7_8564_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_8564_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_8564_return_output := result_u8_value_MUX_uxn_opcodes_h_l357_c7_8564_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_8564_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_8564_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_8564_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l344_c2_b7a3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_b7a3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_b7a3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l344_c2_b7a3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_b7a3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_b7a3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l344_c2_b7a3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l344_c2_b7a3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l344_c2_b7a3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l344_c2_b7a3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l344_c2_b7a3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output := result_u8_value_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l399_l340_DUPLICATE_216d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l399_l340_DUPLICATE_216d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e848(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_b7a3_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l399_l340_DUPLICATE_216d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l399_l340_DUPLICATE_216d_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16_low <= REG_VAR_t16_low;
REG_COMB_t16_high <= REG_VAR_t16_high;
REG_COMB_n16_low <= REG_VAR_n16_low;
REG_COMB_n16_high <= REG_VAR_n16_high;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16_low <= REG_COMB_t16_low;
     t16_high <= REG_COMB_t16_high;
     n16_low <= REG_COMB_n16_low;
     n16_high <= REG_COMB_n16_high;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
