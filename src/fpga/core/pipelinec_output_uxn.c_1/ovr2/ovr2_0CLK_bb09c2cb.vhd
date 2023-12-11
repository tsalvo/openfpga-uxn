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
-- BIN_OP_EQ[uxn_opcodes_h_l344_c6_8cf6]
signal BIN_OP_EQ_uxn_opcodes_h_l344_c6_8cf6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l344_c6_8cf6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l344_c6_8cf6_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l344_c2_74a5]
signal t16_low_MUX_uxn_opcodes_h_l344_c2_74a5_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l344_c2_74a5_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l344_c2_74a5]
signal n16_low_MUX_uxn_opcodes_h_l344_c2_74a5_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l344_c2_74a5_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l344_c2_74a5]
signal n16_high_MUX_uxn_opcodes_h_l344_c2_74a5_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l344_c2_74a5_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l344_c2_74a5]
signal t16_high_MUX_uxn_opcodes_h_l344_c2_74a5_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l344_c2_74a5_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l344_c2_74a5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_74a5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_74a5_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l344_c2_74a5]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_74a5_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_74a5_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l344_c2_74a5]
signal result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_74a5_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_74a5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l344_c2_74a5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_74a5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_74a5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l344_c2_74a5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_74a5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_74a5_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l344_c2_74a5]
signal result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_74a5_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_74a5_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l344_c2_74a5]
signal result_u8_value_MUX_uxn_opcodes_h_l344_c2_74a5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l344_c2_74a5_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l344_c2_74a5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_74a5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_74a5_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l344_c2_74a5]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_74a5_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_74a5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l357_c11_88e7]
signal BIN_OP_EQ_uxn_opcodes_h_l357_c11_88e7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l357_c11_88e7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l357_c11_88e7_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l357_c7_c775]
signal t16_low_MUX_uxn_opcodes_h_l357_c7_c775_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l357_c7_c775_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l357_c7_c775_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l357_c7_c775_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l357_c7_c775]
signal n16_low_MUX_uxn_opcodes_h_l357_c7_c775_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l357_c7_c775_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l357_c7_c775_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l357_c7_c775_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l357_c7_c775]
signal n16_high_MUX_uxn_opcodes_h_l357_c7_c775_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l357_c7_c775_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l357_c7_c775_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l357_c7_c775_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l357_c7_c775]
signal t16_high_MUX_uxn_opcodes_h_l357_c7_c775_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l357_c7_c775_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l357_c7_c775_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l357_c7_c775_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l357_c7_c775]
signal result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_c775_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_c775_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_c775_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_c775_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l357_c7_c775]
signal result_u8_value_MUX_uxn_opcodes_h_l357_c7_c775_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l357_c7_c775_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l357_c7_c775_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l357_c7_c775_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l357_c7_c775]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_c775_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_c775_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_c775_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_c775_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l357_c7_c775]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_c775_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_c775_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_c775_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_c775_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l357_c7_c775]
signal result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_c775_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_c775_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_c775_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_c775_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l360_c11_2feb]
signal BIN_OP_EQ_uxn_opcodes_h_l360_c11_2feb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l360_c11_2feb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l360_c11_2feb_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l360_c7_3c51]
signal t16_low_MUX_uxn_opcodes_h_l360_c7_3c51_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l360_c7_3c51_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l360_c7_3c51]
signal n16_low_MUX_uxn_opcodes_h_l360_c7_3c51_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l360_c7_3c51_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l360_c7_3c51]
signal n16_high_MUX_uxn_opcodes_h_l360_c7_3c51_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l360_c7_3c51_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l360_c7_3c51]
signal t16_high_MUX_uxn_opcodes_h_l360_c7_3c51_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l360_c7_3c51_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l360_c7_3c51]
signal result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_3c51_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_3c51_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l360_c7_3c51]
signal result_u8_value_MUX_uxn_opcodes_h_l360_c7_3c51_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l360_c7_3c51_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l360_c7_3c51]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_3c51_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_3c51_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l360_c7_3c51]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_3c51_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_3c51_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l360_c7_3c51]
signal result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_3c51_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_3c51_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l364_c11_4748]
signal BIN_OP_EQ_uxn_opcodes_h_l364_c11_4748_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l364_c11_4748_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l364_c11_4748_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l364_c7_e88f]
signal t16_low_MUX_uxn_opcodes_h_l364_c7_e88f_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l364_c7_e88f_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l364_c7_e88f_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l364_c7_e88f_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l364_c7_e88f]
signal n16_low_MUX_uxn_opcodes_h_l364_c7_e88f_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l364_c7_e88f_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l364_c7_e88f_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l364_c7_e88f_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l364_c7_e88f]
signal n16_high_MUX_uxn_opcodes_h_l364_c7_e88f_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l364_c7_e88f_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l364_c7_e88f_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l364_c7_e88f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l364_c7_e88f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_e88f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_e88f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_e88f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_e88f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l364_c7_e88f]
signal result_u8_value_MUX_uxn_opcodes_h_l364_c7_e88f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l364_c7_e88f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l364_c7_e88f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l364_c7_e88f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l364_c7_e88f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_e88f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_e88f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_e88f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_e88f_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l364_c7_e88f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_e88f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_e88f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_e88f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_e88f_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l364_c7_e88f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_e88f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_e88f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_e88f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_e88f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l368_c11_ad8c]
signal BIN_OP_EQ_uxn_opcodes_h_l368_c11_ad8c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l368_c11_ad8c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l368_c11_ad8c_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l368_c7_f377]
signal n16_low_MUX_uxn_opcodes_h_l368_c7_f377_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l368_c7_f377_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l368_c7_f377_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l368_c7_f377_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l368_c7_f377]
signal n16_high_MUX_uxn_opcodes_h_l368_c7_f377_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l368_c7_f377_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l368_c7_f377_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l368_c7_f377_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l368_c7_f377]
signal result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f377_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f377_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f377_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f377_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l368_c7_f377]
signal result_u8_value_MUX_uxn_opcodes_h_l368_c7_f377_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l368_c7_f377_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l368_c7_f377_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l368_c7_f377_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l368_c7_f377]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f377_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f377_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f377_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f377_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l368_c7_f377]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f377_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f377_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f377_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f377_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l368_c7_f377]
signal result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f377_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f377_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f377_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f377_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l370_c30_a4a6]
signal sp_relative_shift_uxn_opcodes_h_l370_c30_a4a6_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l370_c30_a4a6_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l370_c30_a4a6_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l370_c30_a4a6_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l375_c11_1dd1]
signal BIN_OP_EQ_uxn_opcodes_h_l375_c11_1dd1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l375_c11_1dd1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l375_c11_1dd1_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l375_c7_4dff]
signal n16_low_MUX_uxn_opcodes_h_l375_c7_4dff_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l375_c7_4dff_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l375_c7_4dff_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l375_c7_4dff_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l375_c7_4dff]
signal result_u8_value_MUX_uxn_opcodes_h_l375_c7_4dff_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l375_c7_4dff_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l375_c7_4dff_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l375_c7_4dff_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l375_c7_4dff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_4dff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_4dff_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_4dff_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_4dff_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l375_c7_4dff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_4dff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_4dff_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_4dff_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_4dff_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l375_c7_4dff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_4dff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_4dff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_4dff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_4dff_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l381_c11_0a62]
signal BIN_OP_EQ_uxn_opcodes_h_l381_c11_0a62_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l381_c11_0a62_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l381_c11_0a62_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l381_c7_1ef3]
signal result_u8_value_MUX_uxn_opcodes_h_l381_c7_1ef3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l381_c7_1ef3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l381_c7_1ef3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l381_c7_1ef3_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l381_c7_1ef3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_1ef3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_1ef3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_1ef3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_1ef3_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l381_c7_1ef3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_1ef3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_1ef3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_1ef3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_1ef3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l385_c11_4580]
signal BIN_OP_EQ_uxn_opcodes_h_l385_c11_4580_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l385_c11_4580_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l385_c11_4580_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l385_c7_8f72]
signal result_u8_value_MUX_uxn_opcodes_h_l385_c7_8f72_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l385_c7_8f72_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l385_c7_8f72_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l385_c7_8f72_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l385_c7_8f72]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f72_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f72_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f72_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f72_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l385_c7_8f72]
signal result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f72_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f72_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f72_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f72_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l389_c11_5207]
signal BIN_OP_EQ_uxn_opcodes_h_l389_c11_5207_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l389_c11_5207_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l389_c11_5207_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l389_c7_cf2b]
signal result_u8_value_MUX_uxn_opcodes_h_l389_c7_cf2b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l389_c7_cf2b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l389_c7_cf2b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l389_c7_cf2b_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l389_c7_cf2b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_cf2b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_cf2b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_cf2b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_cf2b_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l389_c7_cf2b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_cf2b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_cf2b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_cf2b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_cf2b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l393_c11_273c]
signal BIN_OP_EQ_uxn_opcodes_h_l393_c11_273c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l393_c11_273c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l393_c11_273c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l393_c7_42db]
signal result_u8_value_MUX_uxn_opcodes_h_l393_c7_42db_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l393_c7_42db_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l393_c7_42db_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l393_c7_42db_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l393_c7_42db]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_42db_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_42db_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_42db_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_42db_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l393_c7_42db]
signal result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_42db_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_42db_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_42db_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_42db_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_84a2( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_vram_write := ref_toks_6;
      base.u8_value := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_pc_updated := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l344_c6_8cf6
BIN_OP_EQ_uxn_opcodes_h_l344_c6_8cf6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l344_c6_8cf6_left,
BIN_OP_EQ_uxn_opcodes_h_l344_c6_8cf6_right,
BIN_OP_EQ_uxn_opcodes_h_l344_c6_8cf6_return_output);

-- t16_low_MUX_uxn_opcodes_h_l344_c2_74a5
t16_low_MUX_uxn_opcodes_h_l344_c2_74a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l344_c2_74a5_cond,
t16_low_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue,
t16_low_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse,
t16_low_MUX_uxn_opcodes_h_l344_c2_74a5_return_output);

-- n16_low_MUX_uxn_opcodes_h_l344_c2_74a5
n16_low_MUX_uxn_opcodes_h_l344_c2_74a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l344_c2_74a5_cond,
n16_low_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue,
n16_low_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse,
n16_low_MUX_uxn_opcodes_h_l344_c2_74a5_return_output);

-- n16_high_MUX_uxn_opcodes_h_l344_c2_74a5
n16_high_MUX_uxn_opcodes_h_l344_c2_74a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l344_c2_74a5_cond,
n16_high_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue,
n16_high_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse,
n16_high_MUX_uxn_opcodes_h_l344_c2_74a5_return_output);

-- t16_high_MUX_uxn_opcodes_h_l344_c2_74a5
t16_high_MUX_uxn_opcodes_h_l344_c2_74a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l344_c2_74a5_cond,
t16_high_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue,
t16_high_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse,
t16_high_MUX_uxn_opcodes_h_l344_c2_74a5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_74a5
result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_74a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_74a5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_74a5_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_74a5
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_74a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_74a5_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_74a5_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_74a5
result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_74a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_74a5_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_74a5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_74a5
result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_74a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_74a5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_74a5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_74a5
result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_74a5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_74a5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_74a5_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_74a5
result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_74a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_74a5_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_74a5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l344_c2_74a5
result_u8_value_MUX_uxn_opcodes_h_l344_c2_74a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l344_c2_74a5_cond,
result_u8_value_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l344_c2_74a5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_74a5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_74a5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_74a5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_74a5_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_74a5
result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_74a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_74a5_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_74a5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l357_c11_88e7
BIN_OP_EQ_uxn_opcodes_h_l357_c11_88e7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l357_c11_88e7_left,
BIN_OP_EQ_uxn_opcodes_h_l357_c11_88e7_right,
BIN_OP_EQ_uxn_opcodes_h_l357_c11_88e7_return_output);

-- t16_low_MUX_uxn_opcodes_h_l357_c7_c775
t16_low_MUX_uxn_opcodes_h_l357_c7_c775 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l357_c7_c775_cond,
t16_low_MUX_uxn_opcodes_h_l357_c7_c775_iftrue,
t16_low_MUX_uxn_opcodes_h_l357_c7_c775_iffalse,
t16_low_MUX_uxn_opcodes_h_l357_c7_c775_return_output);

-- n16_low_MUX_uxn_opcodes_h_l357_c7_c775
n16_low_MUX_uxn_opcodes_h_l357_c7_c775 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l357_c7_c775_cond,
n16_low_MUX_uxn_opcodes_h_l357_c7_c775_iftrue,
n16_low_MUX_uxn_opcodes_h_l357_c7_c775_iffalse,
n16_low_MUX_uxn_opcodes_h_l357_c7_c775_return_output);

-- n16_high_MUX_uxn_opcodes_h_l357_c7_c775
n16_high_MUX_uxn_opcodes_h_l357_c7_c775 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l357_c7_c775_cond,
n16_high_MUX_uxn_opcodes_h_l357_c7_c775_iftrue,
n16_high_MUX_uxn_opcodes_h_l357_c7_c775_iffalse,
n16_high_MUX_uxn_opcodes_h_l357_c7_c775_return_output);

-- t16_high_MUX_uxn_opcodes_h_l357_c7_c775
t16_high_MUX_uxn_opcodes_h_l357_c7_c775 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l357_c7_c775_cond,
t16_high_MUX_uxn_opcodes_h_l357_c7_c775_iftrue,
t16_high_MUX_uxn_opcodes_h_l357_c7_c775_iffalse,
t16_high_MUX_uxn_opcodes_h_l357_c7_c775_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_c775
result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_c775 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_c775_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_c775_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_c775_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_c775_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l357_c7_c775
result_u8_value_MUX_uxn_opcodes_h_l357_c7_c775 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l357_c7_c775_cond,
result_u8_value_MUX_uxn_opcodes_h_l357_c7_c775_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l357_c7_c775_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l357_c7_c775_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_c775
result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_c775 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_c775_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_c775_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_c775_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_c775_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_c775
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_c775 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_c775_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_c775_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_c775_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_c775_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_c775
result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_c775 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_c775_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_c775_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_c775_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_c775_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l360_c11_2feb
BIN_OP_EQ_uxn_opcodes_h_l360_c11_2feb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l360_c11_2feb_left,
BIN_OP_EQ_uxn_opcodes_h_l360_c11_2feb_right,
BIN_OP_EQ_uxn_opcodes_h_l360_c11_2feb_return_output);

-- t16_low_MUX_uxn_opcodes_h_l360_c7_3c51
t16_low_MUX_uxn_opcodes_h_l360_c7_3c51 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l360_c7_3c51_cond,
t16_low_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue,
t16_low_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse,
t16_low_MUX_uxn_opcodes_h_l360_c7_3c51_return_output);

-- n16_low_MUX_uxn_opcodes_h_l360_c7_3c51
n16_low_MUX_uxn_opcodes_h_l360_c7_3c51 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l360_c7_3c51_cond,
n16_low_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue,
n16_low_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse,
n16_low_MUX_uxn_opcodes_h_l360_c7_3c51_return_output);

-- n16_high_MUX_uxn_opcodes_h_l360_c7_3c51
n16_high_MUX_uxn_opcodes_h_l360_c7_3c51 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l360_c7_3c51_cond,
n16_high_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue,
n16_high_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse,
n16_high_MUX_uxn_opcodes_h_l360_c7_3c51_return_output);

-- t16_high_MUX_uxn_opcodes_h_l360_c7_3c51
t16_high_MUX_uxn_opcodes_h_l360_c7_3c51 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l360_c7_3c51_cond,
t16_high_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue,
t16_high_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse,
t16_high_MUX_uxn_opcodes_h_l360_c7_3c51_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_3c51
result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_3c51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_3c51_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_3c51_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l360_c7_3c51
result_u8_value_MUX_uxn_opcodes_h_l360_c7_3c51 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l360_c7_3c51_cond,
result_u8_value_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l360_c7_3c51_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_3c51
result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_3c51 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_3c51_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_3c51_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_3c51
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_3c51 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_3c51_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_3c51_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_3c51
result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_3c51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_3c51_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_3c51_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l364_c11_4748
BIN_OP_EQ_uxn_opcodes_h_l364_c11_4748 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l364_c11_4748_left,
BIN_OP_EQ_uxn_opcodes_h_l364_c11_4748_right,
BIN_OP_EQ_uxn_opcodes_h_l364_c11_4748_return_output);

-- t16_low_MUX_uxn_opcodes_h_l364_c7_e88f
t16_low_MUX_uxn_opcodes_h_l364_c7_e88f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l364_c7_e88f_cond,
t16_low_MUX_uxn_opcodes_h_l364_c7_e88f_iftrue,
t16_low_MUX_uxn_opcodes_h_l364_c7_e88f_iffalse,
t16_low_MUX_uxn_opcodes_h_l364_c7_e88f_return_output);

-- n16_low_MUX_uxn_opcodes_h_l364_c7_e88f
n16_low_MUX_uxn_opcodes_h_l364_c7_e88f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l364_c7_e88f_cond,
n16_low_MUX_uxn_opcodes_h_l364_c7_e88f_iftrue,
n16_low_MUX_uxn_opcodes_h_l364_c7_e88f_iffalse,
n16_low_MUX_uxn_opcodes_h_l364_c7_e88f_return_output);

-- n16_high_MUX_uxn_opcodes_h_l364_c7_e88f
n16_high_MUX_uxn_opcodes_h_l364_c7_e88f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l364_c7_e88f_cond,
n16_high_MUX_uxn_opcodes_h_l364_c7_e88f_iftrue,
n16_high_MUX_uxn_opcodes_h_l364_c7_e88f_iffalse,
n16_high_MUX_uxn_opcodes_h_l364_c7_e88f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_e88f
result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_e88f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_e88f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_e88f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_e88f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_e88f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l364_c7_e88f
result_u8_value_MUX_uxn_opcodes_h_l364_c7_e88f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l364_c7_e88f_cond,
result_u8_value_MUX_uxn_opcodes_h_l364_c7_e88f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l364_c7_e88f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l364_c7_e88f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_e88f
result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_e88f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_e88f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_e88f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_e88f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_e88f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_e88f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_e88f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_e88f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_e88f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_e88f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_e88f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_e88f
result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_e88f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_e88f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_e88f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_e88f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_e88f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l368_c11_ad8c
BIN_OP_EQ_uxn_opcodes_h_l368_c11_ad8c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l368_c11_ad8c_left,
BIN_OP_EQ_uxn_opcodes_h_l368_c11_ad8c_right,
BIN_OP_EQ_uxn_opcodes_h_l368_c11_ad8c_return_output);

-- n16_low_MUX_uxn_opcodes_h_l368_c7_f377
n16_low_MUX_uxn_opcodes_h_l368_c7_f377 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l368_c7_f377_cond,
n16_low_MUX_uxn_opcodes_h_l368_c7_f377_iftrue,
n16_low_MUX_uxn_opcodes_h_l368_c7_f377_iffalse,
n16_low_MUX_uxn_opcodes_h_l368_c7_f377_return_output);

-- n16_high_MUX_uxn_opcodes_h_l368_c7_f377
n16_high_MUX_uxn_opcodes_h_l368_c7_f377 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l368_c7_f377_cond,
n16_high_MUX_uxn_opcodes_h_l368_c7_f377_iftrue,
n16_high_MUX_uxn_opcodes_h_l368_c7_f377_iffalse,
n16_high_MUX_uxn_opcodes_h_l368_c7_f377_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f377
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f377 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f377_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f377_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f377_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f377_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l368_c7_f377
result_u8_value_MUX_uxn_opcodes_h_l368_c7_f377 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l368_c7_f377_cond,
result_u8_value_MUX_uxn_opcodes_h_l368_c7_f377_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l368_c7_f377_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l368_c7_f377_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f377
result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f377 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f377_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f377_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f377_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f377_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f377
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f377 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f377_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f377_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f377_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f377_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f377
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f377 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f377_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f377_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f377_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f377_return_output);

-- sp_relative_shift_uxn_opcodes_h_l370_c30_a4a6
sp_relative_shift_uxn_opcodes_h_l370_c30_a4a6 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l370_c30_a4a6_ins,
sp_relative_shift_uxn_opcodes_h_l370_c30_a4a6_x,
sp_relative_shift_uxn_opcodes_h_l370_c30_a4a6_y,
sp_relative_shift_uxn_opcodes_h_l370_c30_a4a6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l375_c11_1dd1
BIN_OP_EQ_uxn_opcodes_h_l375_c11_1dd1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l375_c11_1dd1_left,
BIN_OP_EQ_uxn_opcodes_h_l375_c11_1dd1_right,
BIN_OP_EQ_uxn_opcodes_h_l375_c11_1dd1_return_output);

-- n16_low_MUX_uxn_opcodes_h_l375_c7_4dff
n16_low_MUX_uxn_opcodes_h_l375_c7_4dff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l375_c7_4dff_cond,
n16_low_MUX_uxn_opcodes_h_l375_c7_4dff_iftrue,
n16_low_MUX_uxn_opcodes_h_l375_c7_4dff_iffalse,
n16_low_MUX_uxn_opcodes_h_l375_c7_4dff_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l375_c7_4dff
result_u8_value_MUX_uxn_opcodes_h_l375_c7_4dff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l375_c7_4dff_cond,
result_u8_value_MUX_uxn_opcodes_h_l375_c7_4dff_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l375_c7_4dff_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l375_c7_4dff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_4dff
result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_4dff : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_4dff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_4dff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_4dff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_4dff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_4dff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_4dff : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_4dff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_4dff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_4dff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_4dff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_4dff
result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_4dff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_4dff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_4dff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_4dff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_4dff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l381_c11_0a62
BIN_OP_EQ_uxn_opcodes_h_l381_c11_0a62 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l381_c11_0a62_left,
BIN_OP_EQ_uxn_opcodes_h_l381_c11_0a62_right,
BIN_OP_EQ_uxn_opcodes_h_l381_c11_0a62_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l381_c7_1ef3
result_u8_value_MUX_uxn_opcodes_h_l381_c7_1ef3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l381_c7_1ef3_cond,
result_u8_value_MUX_uxn_opcodes_h_l381_c7_1ef3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l381_c7_1ef3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l381_c7_1ef3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_1ef3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_1ef3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_1ef3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_1ef3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_1ef3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_1ef3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_1ef3
result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_1ef3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_1ef3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_1ef3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_1ef3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_1ef3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l385_c11_4580
BIN_OP_EQ_uxn_opcodes_h_l385_c11_4580 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l385_c11_4580_left,
BIN_OP_EQ_uxn_opcodes_h_l385_c11_4580_right,
BIN_OP_EQ_uxn_opcodes_h_l385_c11_4580_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l385_c7_8f72
result_u8_value_MUX_uxn_opcodes_h_l385_c7_8f72 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l385_c7_8f72_cond,
result_u8_value_MUX_uxn_opcodes_h_l385_c7_8f72_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l385_c7_8f72_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l385_c7_8f72_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f72
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f72 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f72_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f72_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f72_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f72_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f72
result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f72_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f72_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f72_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f72_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l389_c11_5207
BIN_OP_EQ_uxn_opcodes_h_l389_c11_5207 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l389_c11_5207_left,
BIN_OP_EQ_uxn_opcodes_h_l389_c11_5207_right,
BIN_OP_EQ_uxn_opcodes_h_l389_c11_5207_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l389_c7_cf2b
result_u8_value_MUX_uxn_opcodes_h_l389_c7_cf2b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l389_c7_cf2b_cond,
result_u8_value_MUX_uxn_opcodes_h_l389_c7_cf2b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l389_c7_cf2b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l389_c7_cf2b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_cf2b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_cf2b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_cf2b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_cf2b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_cf2b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_cf2b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_cf2b
result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_cf2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_cf2b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_cf2b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_cf2b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_cf2b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l393_c11_273c
BIN_OP_EQ_uxn_opcodes_h_l393_c11_273c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l393_c11_273c_left,
BIN_OP_EQ_uxn_opcodes_h_l393_c11_273c_right,
BIN_OP_EQ_uxn_opcodes_h_l393_c11_273c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l393_c7_42db
result_u8_value_MUX_uxn_opcodes_h_l393_c7_42db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l393_c7_42db_cond,
result_u8_value_MUX_uxn_opcodes_h_l393_c7_42db_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l393_c7_42db_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l393_c7_42db_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_42db
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_42db : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_42db_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_42db_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_42db_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_42db_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_42db
result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_42db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_42db_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_42db_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_42db_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_42db_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l344_c6_8cf6_return_output,
 t16_low_MUX_uxn_opcodes_h_l344_c2_74a5_return_output,
 n16_low_MUX_uxn_opcodes_h_l344_c2_74a5_return_output,
 n16_high_MUX_uxn_opcodes_h_l344_c2_74a5_return_output,
 t16_high_MUX_uxn_opcodes_h_l344_c2_74a5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_74a5_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_74a5_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_74a5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_74a5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_74a5_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_74a5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l344_c2_74a5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_74a5_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_74a5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l357_c11_88e7_return_output,
 t16_low_MUX_uxn_opcodes_h_l357_c7_c775_return_output,
 n16_low_MUX_uxn_opcodes_h_l357_c7_c775_return_output,
 n16_high_MUX_uxn_opcodes_h_l357_c7_c775_return_output,
 t16_high_MUX_uxn_opcodes_h_l357_c7_c775_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_c775_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l357_c7_c775_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_c775_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_c775_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_c775_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l360_c11_2feb_return_output,
 t16_low_MUX_uxn_opcodes_h_l360_c7_3c51_return_output,
 n16_low_MUX_uxn_opcodes_h_l360_c7_3c51_return_output,
 n16_high_MUX_uxn_opcodes_h_l360_c7_3c51_return_output,
 t16_high_MUX_uxn_opcodes_h_l360_c7_3c51_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_3c51_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l360_c7_3c51_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_3c51_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_3c51_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_3c51_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l364_c11_4748_return_output,
 t16_low_MUX_uxn_opcodes_h_l364_c7_e88f_return_output,
 n16_low_MUX_uxn_opcodes_h_l364_c7_e88f_return_output,
 n16_high_MUX_uxn_opcodes_h_l364_c7_e88f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_e88f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l364_c7_e88f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_e88f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_e88f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_e88f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l368_c11_ad8c_return_output,
 n16_low_MUX_uxn_opcodes_h_l368_c7_f377_return_output,
 n16_high_MUX_uxn_opcodes_h_l368_c7_f377_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f377_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l368_c7_f377_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f377_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f377_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f377_return_output,
 sp_relative_shift_uxn_opcodes_h_l370_c30_a4a6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l375_c11_1dd1_return_output,
 n16_low_MUX_uxn_opcodes_h_l375_c7_4dff_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l375_c7_4dff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_4dff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_4dff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_4dff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l381_c11_0a62_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l381_c7_1ef3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_1ef3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_1ef3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l385_c11_4580_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l385_c7_8f72_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f72_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f72_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l389_c11_5207_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l389_c7_cf2b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_cf2b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_cf2b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l393_c11_273c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l393_c7_42db_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_42db_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_42db_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c6_8cf6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c6_8cf6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c6_8cf6_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l357_c7_c775_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l344_c2_74a5_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l344_c2_74a5_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l357_c7_c775_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l344_c2_74a5_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l344_c2_74a5_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l357_c7_c775_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l344_c2_74a5_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l344_c2_74a5_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l357_c7_c775_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l344_c2_74a5_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l344_c2_74a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_c775_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_74a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_74a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l344_c2_74a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_74a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_74a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l344_c2_74a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_74a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_74a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_c775_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_74a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_74a5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l349_c3_3ab4 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_c775_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_74a5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_74a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l344_c2_74a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_74a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_74a5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_c775_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l344_c2_74a5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l344_c2_74a5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l354_c3_696f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_c775_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_74a5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_74a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l344_c2_74a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_74a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_74a5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_88e7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_88e7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_88e7_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l357_c7_c775_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l357_c7_c775_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l360_c7_3c51_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l357_c7_c775_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l357_c7_c775_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l357_c7_c775_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l360_c7_3c51_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l357_c7_c775_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l357_c7_c775_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l357_c7_c775_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l360_c7_3c51_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l357_c7_c775_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l357_c7_c775_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l357_c7_c775_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l360_c7_3c51_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l357_c7_c775_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_c775_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_c775_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_3c51_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_c775_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_c775_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_c775_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l360_c7_3c51_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_c775_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_c775_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_c775_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_3c51_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_c775_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_c775_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l358_c3_72d2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_c775_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_3c51_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_c775_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_c775_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_c775_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_3c51_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_c775_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_2feb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_2feb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_2feb_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l364_c7_e88f_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l360_c7_3c51_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l364_c7_e88f_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l360_c7_3c51_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l364_c7_e88f_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l360_c7_3c51_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l360_c7_3c51_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_e88f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_3c51_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_e88f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l360_c7_3c51_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_e88f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_3c51_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l362_c3_b06c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_e88f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_3c51_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_e88f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_3c51_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_4748_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_4748_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_4748_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l364_c7_e88f_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l364_c7_e88f_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l364_c7_e88f_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l364_c7_e88f_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l364_c7_e88f_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l368_c7_f377_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l364_c7_e88f_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l364_c7_e88f_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l364_c7_e88f_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l368_c7_f377_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l364_c7_e88f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_e88f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_e88f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f377_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_e88f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_e88f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_e88f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_f377_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_e88f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_e88f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_e88f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f377_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_e88f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_e88f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l366_c3_a23e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_e88f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f377_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_e88f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_e88f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_e88f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f377_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_e88f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_ad8c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_ad8c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_ad8c_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l368_c7_f377_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l368_c7_f377_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l375_c7_4dff_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l368_c7_f377_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l368_c7_f377_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l368_c7_f377_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l368_c7_f377_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f377_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f377_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_4dff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f377_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_f377_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_f377_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l375_c7_4dff_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_f377_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f377_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f377_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_4dff_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f377_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f377_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l372_c3_70de : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f377_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_4dff_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f377_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f377_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f377_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f377_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l370_c30_a4a6_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l370_c30_a4a6_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l370_c30_a4a6_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l370_c30_a4a6_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l375_c11_1dd1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l375_c11_1dd1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l375_c11_1dd1_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l375_c7_4dff_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l375_c7_4dff_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l375_c7_4dff_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l375_c7_4dff_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l375_c7_4dff_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l381_c7_1ef3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l375_c7_4dff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_4dff_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l377_c3_bc31 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_4dff_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_4dff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_4dff_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l378_c3_34e8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_4dff_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_1ef3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_4dff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_4dff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_4dff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_1ef3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_4dff_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_0a62_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_0a62_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_0a62_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l381_c7_1ef3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l381_c7_1ef3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l385_c7_8f72_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l381_c7_1ef3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_1ef3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l382_c3_48a8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_1ef3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f72_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_1ef3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_1ef3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_1ef3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_1ef3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l385_c11_4580_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l385_c11_4580_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l385_c11_4580_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l385_c7_8f72_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l385_c7_8f72_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l389_c7_cf2b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l385_c7_8f72_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f72_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l386_c3_df54 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f72_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_cf2b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f72_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_cf2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f72_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l389_c11_5207_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l389_c11_5207_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l389_c11_5207_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l389_c7_cf2b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l389_c7_cf2b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l393_c7_42db_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l389_c7_cf2b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_cf2b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l390_c3_ce5c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_cf2b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_42db_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_cf2b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_cf2b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_cf2b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_42db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_cf2b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_273c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_273c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_273c_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l393_c7_42db_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l393_c7_42db_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l393_c7_42db_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_42db_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l394_c3_c2a1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_42db_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l393_c7_42db_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_42db_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_42db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_42db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_42db_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l357_l344_l364_l393_l360_DUPLICATE_595e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l389_l357_l385_l381_l375_l368_l364_l393_l360_DUPLICATE_7c57_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l364_l357_l360_l375_DUPLICATE_9935_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l364_l357_l368_l360_DUPLICATE_4e96_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l399_l340_DUPLICATE_d2c2_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c6_8cf6_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l386_c3_df54 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f72_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l386_c3_df54;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l354_c3_696f := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l354_c3_696f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l366_c3_a23e := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_e88f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l366_c3_a23e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l382_c3_48a8 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_1ef3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l382_c3_48a8;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_ad8c_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l389_c11_5207_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_0a62_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l358_c3_72d2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_c775_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l358_c3_72d2;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l372_c3_70de := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f377_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l372_c3_70de;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l385_c11_4580_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l394_c3_c2a1 := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_42db_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l394_c3_c2a1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_2feb_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_88e7_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l362_c3_b06c := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l362_c3_b06c;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f377_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l377_c3_bc31 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_4dff_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l377_c3_bc31;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l390_c3_ce5c := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_cf2b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l390_c3_ce5c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_273c_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l378_c3_34e8 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_4dff_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l378_c3_34e8;
     VAR_sp_relative_shift_uxn_opcodes_h_l370_c30_a4a6_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l375_c11_1dd1_right := to_unsigned(5, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_4748_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l370_c30_a4a6_y := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_42db_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l349_c3_3ab4 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l349_c3_3ab4;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l370_c30_a4a6_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l357_c7_c775_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l364_c7_e88f_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l368_c7_f377_iffalse := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l385_c7_8f72_iftrue := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l393_c7_42db_iftrue := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l357_c7_c775_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l364_c7_e88f_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l368_c7_f377_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l375_c7_4dff_iffalse := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l381_c7_1ef3_iftrue := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l389_c7_cf2b_iftrue := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c6_8cf6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_88e7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_2feb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_4748_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_ad8c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l375_c11_1dd1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_0a62_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l385_c11_4580_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l389_c11_5207_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_273c_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l368_c7_f377_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l375_c7_4dff_iftrue := VAR_previous_stack_read;
     VAR_t16_high_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue := VAR_previous_stack_read;
     VAR_t16_low_MUX_uxn_opcodes_h_l364_c7_e88f_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l375_c7_4dff_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l357_c7_c775_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse := t16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_f377_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l357_c7_c775_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l364_c7_e88f_iffalse := t16_low;
     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l393_c7_42db] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l393_c7_42db_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l357_l344_l364_l393_l360_DUPLICATE_595e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l357_l344_l364_l393_l360_DUPLICATE_595e_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l344_c6_8cf6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l344_c6_8cf6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c6_8cf6_left;
     BIN_OP_EQ_uxn_opcodes_h_l344_c6_8cf6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c6_8cf6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c6_8cf6_return_output := BIN_OP_EQ_uxn_opcodes_h_l344_c6_8cf6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l364_c11_4748] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l364_c11_4748_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_4748_left;
     BIN_OP_EQ_uxn_opcodes_h_l364_c11_4748_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_4748_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_4748_return_output := BIN_OP_EQ_uxn_opcodes_h_l364_c11_4748_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l344_c2_74a5] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l344_c2_74a5_return_output := result.is_pc_updated;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l344_c2_74a5] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l344_c2_74a5_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l360_c11_2feb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l360_c11_2feb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_2feb_left;
     BIN_OP_EQ_uxn_opcodes_h_l360_c11_2feb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_2feb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_2feb_return_output := BIN_OP_EQ_uxn_opcodes_h_l360_c11_2feb_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l344_c2_74a5] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l344_c2_74a5_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l385_c11_4580] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l385_c11_4580_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l385_c11_4580_left;
     BIN_OP_EQ_uxn_opcodes_h_l385_c11_4580_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l385_c11_4580_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l385_c11_4580_return_output := BIN_OP_EQ_uxn_opcodes_h_l385_c11_4580_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l389_c11_5207] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l389_c11_5207_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l389_c11_5207_left;
     BIN_OP_EQ_uxn_opcodes_h_l389_c11_5207_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l389_c11_5207_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l389_c11_5207_return_output := BIN_OP_EQ_uxn_opcodes_h_l389_c11_5207_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l344_c2_74a5] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l344_c2_74a5_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l381_c11_0a62] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l381_c11_0a62_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_0a62_left;
     BIN_OP_EQ_uxn_opcodes_h_l381_c11_0a62_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_0a62_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_0a62_return_output := BIN_OP_EQ_uxn_opcodes_h_l381_c11_0a62_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l370_c30_a4a6] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l370_c30_a4a6_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l370_c30_a4a6_ins;
     sp_relative_shift_uxn_opcodes_h_l370_c30_a4a6_x <= VAR_sp_relative_shift_uxn_opcodes_h_l370_c30_a4a6_x;
     sp_relative_shift_uxn_opcodes_h_l370_c30_a4a6_y <= VAR_sp_relative_shift_uxn_opcodes_h_l370_c30_a4a6_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l370_c30_a4a6_return_output := sp_relative_shift_uxn_opcodes_h_l370_c30_a4a6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l364_l357_l368_l360_DUPLICATE_4e96 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l364_l357_l368_l360_DUPLICATE_4e96_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l357_c11_88e7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l357_c11_88e7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_88e7_left;
     BIN_OP_EQ_uxn_opcodes_h_l357_c11_88e7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_88e7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_88e7_return_output := BIN_OP_EQ_uxn_opcodes_h_l357_c11_88e7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l393_c11_273c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l393_c11_273c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_273c_left;
     BIN_OP_EQ_uxn_opcodes_h_l393_c11_273c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_273c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_273c_return_output := BIN_OP_EQ_uxn_opcodes_h_l393_c11_273c_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l364_l357_l360_l375_DUPLICATE_9935 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l364_l357_l360_l375_DUPLICATE_9935_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l389_l357_l385_l381_l375_l368_l364_l393_l360_DUPLICATE_7c57 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l389_l357_l385_l381_l375_l368_l364_l393_l360_DUPLICATE_7c57_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l368_c11_ad8c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l368_c11_ad8c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_ad8c_left;
     BIN_OP_EQ_uxn_opcodes_h_l368_c11_ad8c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_ad8c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_ad8c_return_output := BIN_OP_EQ_uxn_opcodes_h_l368_c11_ad8c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l375_c11_1dd1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l375_c11_1dd1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l375_c11_1dd1_left;
     BIN_OP_EQ_uxn_opcodes_h_l375_c11_1dd1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l375_c11_1dd1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l375_c11_1dd1_return_output := BIN_OP_EQ_uxn_opcodes_h_l375_c11_1dd1_return_output;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l344_c2_74a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c6_8cf6_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l344_c2_74a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c6_8cf6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_74a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c6_8cf6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_74a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c6_8cf6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_74a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c6_8cf6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_74a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c6_8cf6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_74a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c6_8cf6_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_74a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c6_8cf6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_74a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c6_8cf6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_74a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c6_8cf6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l344_c2_74a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c6_8cf6_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l344_c2_74a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c6_8cf6_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l344_c2_74a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l344_c6_8cf6_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l357_c7_c775_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_88e7_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l357_c7_c775_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_88e7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_c775_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_88e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_c775_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_88e7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_c775_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_88e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_c775_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_88e7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_c775_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_88e7_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l357_c7_c775_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_88e7_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l357_c7_c775_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l357_c11_88e7_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l360_c7_3c51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_2feb_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l360_c7_3c51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_2feb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_3c51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_2feb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_3c51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_2feb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_3c51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_2feb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_3c51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_2feb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l360_c7_3c51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_2feb_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l360_c7_3c51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_2feb_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l360_c7_3c51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_2feb_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l364_c7_e88f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_4748_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l364_c7_e88f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_4748_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_e88f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_4748_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_e88f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_4748_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_e88f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_4748_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_e88f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_4748_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_e88f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_4748_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l364_c7_e88f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_4748_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l368_c7_f377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_ad8c_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l368_c7_f377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_ad8c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_ad8c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_ad8c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_ad8c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_ad8c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_f377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_ad8c_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l375_c7_4dff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l375_c11_1dd1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_4dff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l375_c11_1dd1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_4dff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l375_c11_1dd1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_4dff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l375_c11_1dd1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l375_c7_4dff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l375_c11_1dd1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_1ef3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_0a62_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_1ef3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_0a62_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l381_c7_1ef3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l381_c11_0a62_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l385_c11_4580_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l385_c11_4580_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l385_c7_8f72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l385_c11_4580_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_cf2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l389_c11_5207_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_cf2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l389_c11_5207_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l389_c7_cf2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l389_c11_5207_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_42db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_273c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_42db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_273c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l393_c7_42db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l393_c11_273c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_c775_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l364_l357_l360_l375_DUPLICATE_9935_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l364_l357_l360_l375_DUPLICATE_9935_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_e88f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l364_l357_l360_l375_DUPLICATE_9935_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_4dff_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l364_l357_l360_l375_DUPLICATE_9935_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_c775_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l389_l357_l385_l381_l375_l368_l364_l393_l360_DUPLICATE_7c57_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l389_l357_l385_l381_l375_l368_l364_l393_l360_DUPLICATE_7c57_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_e88f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l389_l357_l385_l381_l375_l368_l364_l393_l360_DUPLICATE_7c57_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f377_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l389_l357_l385_l381_l375_l368_l364_l393_l360_DUPLICATE_7c57_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_4dff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l389_l357_l385_l381_l375_l368_l364_l393_l360_DUPLICATE_7c57_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_1ef3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l389_l357_l385_l381_l375_l368_l364_l393_l360_DUPLICATE_7c57_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f72_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l389_l357_l385_l381_l375_l368_l364_l393_l360_DUPLICATE_7c57_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_cf2b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l389_l357_l385_l381_l375_l368_l364_l393_l360_DUPLICATE_7c57_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_42db_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l389_l357_l385_l381_l375_l368_l364_l393_l360_DUPLICATE_7c57_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_c775_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l364_l357_l368_l360_DUPLICATE_4e96_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l364_l357_l368_l360_DUPLICATE_4e96_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_e88f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l364_l357_l368_l360_DUPLICATE_4e96_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f377_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l364_l357_l368_l360_DUPLICATE_4e96_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l357_l344_l364_l393_l360_DUPLICATE_595e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_c775_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l357_l344_l364_l393_l360_DUPLICATE_595e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l357_l344_l364_l393_l360_DUPLICATE_595e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_e88f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l357_l344_l364_l393_l360_DUPLICATE_595e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l393_c7_42db_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l357_l344_l364_l393_l360_DUPLICATE_595e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l344_c2_74a5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l344_c2_74a5_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l344_c2_74a5_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l344_c2_74a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_42db_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l393_c7_42db_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f377_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l370_c30_a4a6_return_output;
     -- n16_high_MUX[uxn_opcodes_h_l368_c7_f377] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l368_c7_f377_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l368_c7_f377_cond;
     n16_high_MUX_uxn_opcodes_h_l368_c7_f377_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l368_c7_f377_iftrue;
     n16_high_MUX_uxn_opcodes_h_l368_c7_f377_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l368_c7_f377_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l368_c7_f377_return_output := n16_high_MUX_uxn_opcodes_h_l368_c7_f377_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l375_c7_4dff] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l375_c7_4dff_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l375_c7_4dff_cond;
     n16_low_MUX_uxn_opcodes_h_l375_c7_4dff_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l375_c7_4dff_iftrue;
     n16_low_MUX_uxn_opcodes_h_l375_c7_4dff_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l375_c7_4dff_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l375_c7_4dff_return_output := n16_low_MUX_uxn_opcodes_h_l375_c7_4dff_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l344_c2_74a5] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_74a5_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_74a5_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_74a5_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_74a5_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l364_c7_e88f] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l364_c7_e88f_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l364_c7_e88f_cond;
     t16_low_MUX_uxn_opcodes_h_l364_c7_e88f_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l364_c7_e88f_iftrue;
     t16_low_MUX_uxn_opcodes_h_l364_c7_e88f_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l364_c7_e88f_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l364_c7_e88f_return_output := t16_low_MUX_uxn_opcodes_h_l364_c7_e88f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l375_c7_4dff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_4dff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_4dff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_4dff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_4dff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_4dff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_4dff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_4dff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_4dff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l393_c7_42db] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_42db_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_42db_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_42db_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_42db_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_42db_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_42db_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_42db_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_42db_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l368_c7_f377] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f377_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f377_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f377_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f377_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f377_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f377_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f377_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f377_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l393_c7_42db] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l393_c7_42db_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l393_c7_42db_cond;
     result_u8_value_MUX_uxn_opcodes_h_l393_c7_42db_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l393_c7_42db_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l393_c7_42db_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l393_c7_42db_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l393_c7_42db_return_output := result_u8_value_MUX_uxn_opcodes_h_l393_c7_42db_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l393_c7_42db] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_42db_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_42db_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_42db_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_42db_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_42db_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_42db_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_42db_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_42db_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l360_c7_3c51] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l360_c7_3c51_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l360_c7_3c51_cond;
     t16_high_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue;
     t16_high_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l360_c7_3c51_return_output := t16_high_MUX_uxn_opcodes_h_l360_c7_3c51_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l344_c2_74a5] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_74a5_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_74a5_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_74a5_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_74a5_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l344_c2_74a5] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_74a5_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_74a5_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_74a5_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_74a5_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l344_c2_74a5] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_74a5_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_74a5_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_74a5_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_74a5_return_output;

     -- Submodule level 2
     VAR_n16_high_MUX_uxn_opcodes_h_l364_c7_e88f_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l368_c7_f377_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l368_c7_f377_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l375_c7_4dff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_cf2b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l393_c7_42db_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_e88f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_f377_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f377_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l375_c7_4dff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_cf2b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l393_c7_42db_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l389_c7_cf2b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l393_c7_42db_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l357_c7_c775_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l360_c7_3c51_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l364_c7_e88f_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l389_c7_cf2b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_cf2b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_cf2b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_cf2b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_cf2b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_cf2b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_cf2b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_cf2b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_cf2b_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l364_c7_e88f] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l364_c7_e88f_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l364_c7_e88f_cond;
     n16_high_MUX_uxn_opcodes_h_l364_c7_e88f_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l364_c7_e88f_iftrue;
     n16_high_MUX_uxn_opcodes_h_l364_c7_e88f_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l364_c7_e88f_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l364_c7_e88f_return_output := n16_high_MUX_uxn_opcodes_h_l364_c7_e88f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l364_c7_e88f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_e88f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_e88f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_e88f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_e88f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_e88f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_e88f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_e88f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_e88f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l368_c7_f377] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f377_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f377_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f377_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f377_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f377_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f377_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f377_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f377_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l357_c7_c775] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l357_c7_c775_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l357_c7_c775_cond;
     t16_high_MUX_uxn_opcodes_h_l357_c7_c775_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l357_c7_c775_iftrue;
     t16_high_MUX_uxn_opcodes_h_l357_c7_c775_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l357_c7_c775_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l357_c7_c775_return_output := t16_high_MUX_uxn_opcodes_h_l357_c7_c775_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l389_c7_cf2b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l389_c7_cf2b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l389_c7_cf2b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l389_c7_cf2b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l389_c7_cf2b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l389_c7_cf2b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l389_c7_cf2b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l389_c7_cf2b_return_output := result_u8_value_MUX_uxn_opcodes_h_l389_c7_cf2b_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l360_c7_3c51] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l360_c7_3c51_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l360_c7_3c51_cond;
     t16_low_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue;
     t16_low_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l360_c7_3c51_return_output := t16_low_MUX_uxn_opcodes_h_l360_c7_3c51_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l389_c7_cf2b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_cf2b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_cf2b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_cf2b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_cf2b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_cf2b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_cf2b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_cf2b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_cf2b_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l368_c7_f377] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l368_c7_f377_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l368_c7_f377_cond;
     n16_low_MUX_uxn_opcodes_h_l368_c7_f377_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l368_c7_f377_iftrue;
     n16_low_MUX_uxn_opcodes_h_l368_c7_f377_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l368_c7_f377_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l368_c7_f377_return_output := n16_low_MUX_uxn_opcodes_h_l368_c7_f377_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l364_c7_e88f_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l364_c7_e88f_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l368_c7_f377_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f72_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l389_c7_cf2b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_e88f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_e88f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l368_c7_f377_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f72_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l389_c7_cf2b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l385_c7_8f72_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l389_c7_cf2b_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l357_c7_c775_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l357_c7_c775_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l360_c7_3c51_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l385_c7_8f72] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f72_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f72_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f72_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f72_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f72_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f72_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f72_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f72_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l385_c7_8f72] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f72_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f72_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f72_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f72_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f72_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f72_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f72_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f72_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l364_c7_e88f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_e88f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_e88f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_e88f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_e88f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_e88f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_e88f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_e88f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_e88f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l385_c7_8f72] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l385_c7_8f72_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l385_c7_8f72_cond;
     result_u8_value_MUX_uxn_opcodes_h_l385_c7_8f72_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l385_c7_8f72_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l385_c7_8f72_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l385_c7_8f72_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l385_c7_8f72_return_output := result_u8_value_MUX_uxn_opcodes_h_l385_c7_8f72_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l344_c2_74a5] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l344_c2_74a5_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l344_c2_74a5_cond;
     t16_high_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue;
     t16_high_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l344_c2_74a5_return_output := t16_high_MUX_uxn_opcodes_h_l344_c2_74a5_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l360_c7_3c51] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l360_c7_3c51_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l360_c7_3c51_cond;
     n16_high_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue;
     n16_high_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l360_c7_3c51_return_output := n16_high_MUX_uxn_opcodes_h_l360_c7_3c51_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l357_c7_c775] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l357_c7_c775_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l357_c7_c775_cond;
     t16_low_MUX_uxn_opcodes_h_l357_c7_c775_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l357_c7_c775_iftrue;
     t16_low_MUX_uxn_opcodes_h_l357_c7_c775_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l357_c7_c775_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l357_c7_c775_return_output := t16_low_MUX_uxn_opcodes_h_l357_c7_c775_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l360_c7_3c51] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_3c51_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_3c51_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_3c51_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_3c51_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l364_c7_e88f] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l364_c7_e88f_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l364_c7_e88f_cond;
     n16_low_MUX_uxn_opcodes_h_l364_c7_e88f_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l364_c7_e88f_iftrue;
     n16_low_MUX_uxn_opcodes_h_l364_c7_e88f_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l364_c7_e88f_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l364_c7_e88f_return_output := n16_low_MUX_uxn_opcodes_h_l364_c7_e88f_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l357_c7_c775_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l360_c7_3c51_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l364_c7_e88f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_1ef3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l385_c7_8f72_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_c775_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_3c51_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l364_c7_e88f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_1ef3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l385_c7_8f72_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l381_c7_1ef3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l385_c7_8f72_return_output;
     REG_VAR_t16_high := VAR_t16_high_MUX_uxn_opcodes_h_l344_c2_74a5_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l357_c7_c775_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l381_c7_1ef3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_1ef3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_1ef3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_1ef3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_1ef3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_1ef3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_1ef3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_1ef3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_1ef3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l381_c7_1ef3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l381_c7_1ef3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l381_c7_1ef3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l381_c7_1ef3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l381_c7_1ef3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l381_c7_1ef3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l381_c7_1ef3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l381_c7_1ef3_return_output := result_u8_value_MUX_uxn_opcodes_h_l381_c7_1ef3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l357_c7_c775] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_c775_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_c775_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_c775_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_c775_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_c775_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_c775_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_c775_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_c775_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l357_c7_c775] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l357_c7_c775_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l357_c7_c775_cond;
     n16_high_MUX_uxn_opcodes_h_l357_c7_c775_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l357_c7_c775_iftrue;
     n16_high_MUX_uxn_opcodes_h_l357_c7_c775_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l357_c7_c775_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l357_c7_c775_return_output := n16_high_MUX_uxn_opcodes_h_l357_c7_c775_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l344_c2_74a5] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l344_c2_74a5_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l344_c2_74a5_cond;
     t16_low_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue;
     t16_low_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l344_c2_74a5_return_output := t16_low_MUX_uxn_opcodes_h_l344_c2_74a5_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l360_c7_3c51] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l360_c7_3c51_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l360_c7_3c51_cond;
     n16_low_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue;
     n16_low_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l360_c7_3c51_return_output := n16_low_MUX_uxn_opcodes_h_l360_c7_3c51_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l381_c7_1ef3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_1ef3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_1ef3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_1ef3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_1ef3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_1ef3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_1ef3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_1ef3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_1ef3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l360_c7_3c51] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_3c51_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_3c51_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_3c51_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_3c51_return_output;

     -- Submodule level 5
     VAR_n16_high_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l357_c7_c775_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l357_c7_c775_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l360_c7_3c51_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_4dff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l381_c7_1ef3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l357_c7_c775_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_c775_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l360_c7_3c51_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_4dff_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l381_c7_1ef3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l375_c7_4dff_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l381_c7_1ef3_return_output;
     REG_VAR_t16_low := VAR_t16_low_MUX_uxn_opcodes_h_l344_c2_74a5_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l375_c7_4dff] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l375_c7_4dff_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l375_c7_4dff_cond;
     result_u8_value_MUX_uxn_opcodes_h_l375_c7_4dff_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l375_c7_4dff_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l375_c7_4dff_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l375_c7_4dff_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l375_c7_4dff_return_output := result_u8_value_MUX_uxn_opcodes_h_l375_c7_4dff_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l357_c7_c775] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_c775_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_c775_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_c775_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_c775_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_c775_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_c775_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_c775_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_c775_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l357_c7_c775] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l357_c7_c775_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l357_c7_c775_cond;
     n16_low_MUX_uxn_opcodes_h_l357_c7_c775_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l357_c7_c775_iftrue;
     n16_low_MUX_uxn_opcodes_h_l357_c7_c775_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l357_c7_c775_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l357_c7_c775_return_output := n16_low_MUX_uxn_opcodes_h_l357_c7_c775_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l344_c2_74a5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_74a5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_74a5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_74a5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_74a5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l375_c7_4dff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_4dff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_4dff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_4dff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_4dff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_4dff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_4dff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_4dff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_4dff_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l344_c2_74a5] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l344_c2_74a5_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l344_c2_74a5_cond;
     n16_high_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue;
     n16_high_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l344_c2_74a5_return_output := n16_high_MUX_uxn_opcodes_h_l344_c2_74a5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l375_c7_4dff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_4dff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_4dff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_4dff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_4dff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_4dff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_4dff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_4dff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_4dff_return_output;

     -- Submodule level 6
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l344_c2_74a5_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l357_c7_c775_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f377_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l375_c7_4dff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l357_c7_c775_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f377_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l375_c7_4dff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_f377_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l375_c7_4dff_return_output;
     -- n16_low_MUX[uxn_opcodes_h_l344_c2_74a5] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l344_c2_74a5_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l344_c2_74a5_cond;
     n16_low_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue;
     n16_low_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l344_c2_74a5_return_output := n16_low_MUX_uxn_opcodes_h_l344_c2_74a5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l368_c7_f377] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f377_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f377_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f377_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f377_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f377_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f377_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f377_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f377_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l368_c7_f377] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l368_c7_f377_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_f377_cond;
     result_u8_value_MUX_uxn_opcodes_h_l368_c7_f377_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_f377_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l368_c7_f377_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_f377_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_f377_return_output := result_u8_value_MUX_uxn_opcodes_h_l368_c7_f377_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l368_c7_f377] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f377_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f377_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f377_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f377_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f377_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f377_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f377_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f377_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l344_c2_74a5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_74a5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_74a5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_74a5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_74a5_return_output;

     -- Submodule level 7
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l344_c2_74a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_e88f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_f377_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_e88f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_f377_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_e88f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_f377_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l364_c7_e88f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_e88f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_e88f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_e88f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_e88f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_e88f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_e88f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_e88f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_e88f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l364_c7_e88f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l364_c7_e88f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_e88f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l364_c7_e88f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_e88f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l364_c7_e88f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_e88f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_e88f_return_output := result_u8_value_MUX_uxn_opcodes_h_l364_c7_e88f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l364_c7_e88f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_e88f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_e88f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_e88f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_e88f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_e88f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_e88f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_e88f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_e88f_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_e88f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_e88f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_e88f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l360_c7_3c51] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_3c51_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_3c51_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_3c51_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_3c51_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l360_c7_3c51] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_3c51_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_3c51_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_3c51_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_3c51_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l360_c7_3c51] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l360_c7_3c51_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l360_c7_3c51_cond;
     result_u8_value_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l360_c7_3c51_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l360_c7_3c51_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l360_c7_3c51_return_output := result_u8_value_MUX_uxn_opcodes_h_l360_c7_3c51_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_c775_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_3c51_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_c775_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_3c51_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_c775_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l360_c7_3c51_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l357_c7_c775] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l357_c7_c775_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_c775_cond;
     result_u8_value_MUX_uxn_opcodes_h_l357_c7_c775_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_c775_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l357_c7_c775_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_c775_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_c775_return_output := result_u8_value_MUX_uxn_opcodes_h_l357_c7_c775_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l357_c7_c775] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_c775_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_c775_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_c775_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_c775_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_c775_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_c775_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_c775_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_c775_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l357_c7_c775] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_c775_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_c775_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_c775_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_c775_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_c775_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_c775_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_c775_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_c775_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l357_c7_c775_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l357_c7_c775_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l357_c7_c775_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l344_c2_74a5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_74a5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_74a5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_74a5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_74a5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l344_c2_74a5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l344_c2_74a5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l344_c2_74a5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l344_c2_74a5_return_output := result_u8_value_MUX_uxn_opcodes_h_l344_c2_74a5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l344_c2_74a5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_74a5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_74a5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_74a5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_74a5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_74a5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_74a5_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l399_l340_DUPLICATE_d2c2 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l399_l340_DUPLICATE_d2c2_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_84a2(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l344_c2_74a5_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l344_c2_74a5_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l344_c2_74a5_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l344_c2_74a5_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l344_c2_74a5_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l344_c2_74a5_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l344_c2_74a5_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l344_c2_74a5_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l344_c2_74a5_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l399_l340_DUPLICATE_d2c2_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l399_l340_DUPLICATE_d2c2_return_output;
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
