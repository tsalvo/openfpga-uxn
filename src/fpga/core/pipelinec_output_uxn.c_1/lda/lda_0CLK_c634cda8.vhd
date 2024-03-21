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
entity lda_0CLK_c634cda8 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lda_0CLK_c634cda8;
architecture arch of lda_0CLK_c634cda8 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1395_c6_e81c]
signal BIN_OP_EQ_uxn_opcodes_h_l1395_c6_e81c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1395_c6_e81c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1395_c6_e81c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1395_c2_9a8e]
signal t16_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1395_c2_9a8e]
signal tmp8_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1395_c2_9a8e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1395_c2_9a8e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1395_c2_9a8e]
signal result_u16_value_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1395_c2_9a8e]
signal result_u8_value_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1395_c2_9a8e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1395_c2_9a8e]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1395_c2_9a8e]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1395_c2_9a8e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1395_c2_9a8e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1395_c2_9a8e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1408_c11_9545]
signal BIN_OP_EQ_uxn_opcodes_h_l1408_c11_9545_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1408_c11_9545_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1408_c11_9545_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1408_c7_89e0]
signal t16_MUX_uxn_opcodes_h_l1408_c7_89e0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1408_c7_89e0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1408_c7_89e0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1408_c7_89e0]
signal tmp8_MUX_uxn_opcodes_h_l1408_c7_89e0_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1408_c7_89e0_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1408_c7_89e0_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1408_c7_89e0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_89e0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_89e0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_89e0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1408_c7_89e0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_89e0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_89e0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_89e0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1408_c7_89e0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_89e0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_89e0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_89e0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1408_c7_89e0]
signal result_u16_value_MUX_uxn_opcodes_h_l1408_c7_89e0_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1408_c7_89e0_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1408_c7_89e0_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1408_c7_89e0]
signal result_u8_value_MUX_uxn_opcodes_h_l1408_c7_89e0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1408_c7_89e0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1408_c7_89e0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1408_c7_89e0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_89e0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_89e0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_89e0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1411_c11_a697]
signal BIN_OP_EQ_uxn_opcodes_h_l1411_c11_a697_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1411_c11_a697_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1411_c11_a697_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1411_c7_e201]
signal t16_MUX_uxn_opcodes_h_l1411_c7_e201_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1411_c7_e201_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1411_c7_e201_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1411_c7_e201_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1411_c7_e201]
signal tmp8_MUX_uxn_opcodes_h_l1411_c7_e201_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1411_c7_e201_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1411_c7_e201_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1411_c7_e201_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1411_c7_e201]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_e201_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_e201_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_e201_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_e201_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1411_c7_e201]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_e201_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_e201_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_e201_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_e201_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1411_c7_e201]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_e201_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_e201_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_e201_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_e201_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1411_c7_e201]
signal result_u16_value_MUX_uxn_opcodes_h_l1411_c7_e201_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1411_c7_e201_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1411_c7_e201_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1411_c7_e201_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1411_c7_e201]
signal result_u8_value_MUX_uxn_opcodes_h_l1411_c7_e201_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1411_c7_e201_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1411_c7_e201_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1411_c7_e201_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1411_c7_e201]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_e201_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_e201_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_e201_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_e201_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1413_c3_a74e]
signal CONST_SL_8_uxn_opcodes_h_l1413_c3_a74e_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1413_c3_a74e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1415_c11_4e30]
signal BIN_OP_EQ_uxn_opcodes_h_l1415_c11_4e30_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1415_c11_4e30_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1415_c11_4e30_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1415_c7_4d39]
signal t16_MUX_uxn_opcodes_h_l1415_c7_4d39_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1415_c7_4d39_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1415_c7_4d39_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1415_c7_4d39]
signal tmp8_MUX_uxn_opcodes_h_l1415_c7_4d39_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1415_c7_4d39_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1415_c7_4d39_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1415_c7_4d39]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_4d39_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_4d39_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_4d39_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1415_c7_4d39]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_4d39_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_4d39_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_4d39_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1415_c7_4d39]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_4d39_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_4d39_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_4d39_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1415_c7_4d39]
signal result_u16_value_MUX_uxn_opcodes_h_l1415_c7_4d39_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1415_c7_4d39_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1415_c7_4d39_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1415_c7_4d39]
signal result_u8_value_MUX_uxn_opcodes_h_l1415_c7_4d39_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1415_c7_4d39_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1415_c7_4d39_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1415_c7_4d39]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_4d39_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_4d39_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_4d39_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1416_c3_8e0d]
signal BIN_OP_OR_uxn_opcodes_h_l1416_c3_8e0d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1416_c3_8e0d_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1416_c3_8e0d_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1417_c30_7818]
signal sp_relative_shift_uxn_opcodes_h_l1417_c30_7818_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1417_c30_7818_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1417_c30_7818_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1417_c30_7818_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1420_c11_a200]
signal BIN_OP_EQ_uxn_opcodes_h_l1420_c11_a200_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1420_c11_a200_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1420_c11_a200_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1420_c7_0109]
signal tmp8_MUX_uxn_opcodes_h_l1420_c7_0109_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1420_c7_0109_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1420_c7_0109_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1420_c7_0109_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1420_c7_0109]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0109_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0109_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0109_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0109_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1420_c7_0109]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0109_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0109_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0109_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0109_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1420_c7_0109]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0109_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0109_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0109_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0109_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1420_c7_0109]
signal result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0109_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0109_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0109_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0109_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1420_c7_0109]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0109_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0109_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0109_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0109_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1423_c11_1fc3]
signal BIN_OP_EQ_uxn_opcodes_h_l1423_c11_1fc3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1423_c11_1fc3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1423_c11_1fc3_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1423_c7_c1bc]
signal tmp8_MUX_uxn_opcodes_h_l1423_c7_c1bc_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1423_c7_c1bc_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1423_c7_c1bc_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1423_c7_c1bc_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1423_c7_c1bc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_c1bc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_c1bc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_c1bc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_c1bc_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1423_c7_c1bc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_c1bc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_c1bc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_c1bc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_c1bc_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1423_c7_c1bc]
signal result_u8_value_MUX_uxn_opcodes_h_l1423_c7_c1bc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1423_c7_c1bc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1423_c7_c1bc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1423_c7_c1bc_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1423_c7_c1bc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_c1bc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_c1bc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_c1bc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_c1bc_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_7557( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_vram_write := ref_toks_6;
      base.is_stack_index_flipped := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_ram_write := ref_toks_9;
      base.is_stack_write := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1395_c6_e81c
BIN_OP_EQ_uxn_opcodes_h_l1395_c6_e81c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1395_c6_e81c_left,
BIN_OP_EQ_uxn_opcodes_h_l1395_c6_e81c_right,
BIN_OP_EQ_uxn_opcodes_h_l1395_c6_e81c_return_output);

-- t16_MUX_uxn_opcodes_h_l1395_c2_9a8e
t16_MUX_uxn_opcodes_h_l1395_c2_9a8e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond,
t16_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue,
t16_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse,
t16_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1395_c2_9a8e
tmp8_MUX_uxn_opcodes_h_l1395_c2_9a8e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond,
tmp8_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue,
tmp8_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse,
tmp8_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_9a8e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_9a8e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_9a8e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_9a8e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1395_c2_9a8e
result_u16_value_MUX_uxn_opcodes_h_l1395_c2_9a8e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond,
result_u16_value_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1395_c2_9a8e
result_u8_value_MUX_uxn_opcodes_h_l1395_c2_9a8e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_9a8e
result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_9a8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e
result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_9a8e
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_9a8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_9a8e
result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_9a8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e
result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_9a8e
result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_9a8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1408_c11_9545
BIN_OP_EQ_uxn_opcodes_h_l1408_c11_9545 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1408_c11_9545_left,
BIN_OP_EQ_uxn_opcodes_h_l1408_c11_9545_right,
BIN_OP_EQ_uxn_opcodes_h_l1408_c11_9545_return_output);

-- t16_MUX_uxn_opcodes_h_l1408_c7_89e0
t16_MUX_uxn_opcodes_h_l1408_c7_89e0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1408_c7_89e0_cond,
t16_MUX_uxn_opcodes_h_l1408_c7_89e0_iftrue,
t16_MUX_uxn_opcodes_h_l1408_c7_89e0_iffalse,
t16_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1408_c7_89e0
tmp8_MUX_uxn_opcodes_h_l1408_c7_89e0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1408_c7_89e0_cond,
tmp8_MUX_uxn_opcodes_h_l1408_c7_89e0_iftrue,
tmp8_MUX_uxn_opcodes_h_l1408_c7_89e0_iffalse,
tmp8_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_89e0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_89e0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_89e0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_89e0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_89e0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_89e0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_89e0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_89e0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_89e0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_89e0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_89e0
result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_89e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_89e0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_89e0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_89e0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1408_c7_89e0
result_u16_value_MUX_uxn_opcodes_h_l1408_c7_89e0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1408_c7_89e0_cond,
result_u16_value_MUX_uxn_opcodes_h_l1408_c7_89e0_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1408_c7_89e0_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1408_c7_89e0
result_u8_value_MUX_uxn_opcodes_h_l1408_c7_89e0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1408_c7_89e0_cond,
result_u8_value_MUX_uxn_opcodes_h_l1408_c7_89e0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1408_c7_89e0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_89e0
result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_89e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_89e0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_89e0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_89e0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1411_c11_a697
BIN_OP_EQ_uxn_opcodes_h_l1411_c11_a697 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1411_c11_a697_left,
BIN_OP_EQ_uxn_opcodes_h_l1411_c11_a697_right,
BIN_OP_EQ_uxn_opcodes_h_l1411_c11_a697_return_output);

-- t16_MUX_uxn_opcodes_h_l1411_c7_e201
t16_MUX_uxn_opcodes_h_l1411_c7_e201 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1411_c7_e201_cond,
t16_MUX_uxn_opcodes_h_l1411_c7_e201_iftrue,
t16_MUX_uxn_opcodes_h_l1411_c7_e201_iffalse,
t16_MUX_uxn_opcodes_h_l1411_c7_e201_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1411_c7_e201
tmp8_MUX_uxn_opcodes_h_l1411_c7_e201 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1411_c7_e201_cond,
tmp8_MUX_uxn_opcodes_h_l1411_c7_e201_iftrue,
tmp8_MUX_uxn_opcodes_h_l1411_c7_e201_iffalse,
tmp8_MUX_uxn_opcodes_h_l1411_c7_e201_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_e201
result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_e201 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_e201_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_e201_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_e201_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_e201_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_e201
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_e201 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_e201_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_e201_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_e201_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_e201_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_e201
result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_e201 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_e201_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_e201_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_e201_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_e201_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1411_c7_e201
result_u16_value_MUX_uxn_opcodes_h_l1411_c7_e201 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1411_c7_e201_cond,
result_u16_value_MUX_uxn_opcodes_h_l1411_c7_e201_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1411_c7_e201_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1411_c7_e201_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1411_c7_e201
result_u8_value_MUX_uxn_opcodes_h_l1411_c7_e201 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1411_c7_e201_cond,
result_u8_value_MUX_uxn_opcodes_h_l1411_c7_e201_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1411_c7_e201_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1411_c7_e201_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_e201
result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_e201 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_e201_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_e201_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_e201_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_e201_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1413_c3_a74e
CONST_SL_8_uxn_opcodes_h_l1413_c3_a74e : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1413_c3_a74e_x,
CONST_SL_8_uxn_opcodes_h_l1413_c3_a74e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1415_c11_4e30
BIN_OP_EQ_uxn_opcodes_h_l1415_c11_4e30 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1415_c11_4e30_left,
BIN_OP_EQ_uxn_opcodes_h_l1415_c11_4e30_right,
BIN_OP_EQ_uxn_opcodes_h_l1415_c11_4e30_return_output);

-- t16_MUX_uxn_opcodes_h_l1415_c7_4d39
t16_MUX_uxn_opcodes_h_l1415_c7_4d39 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1415_c7_4d39_cond,
t16_MUX_uxn_opcodes_h_l1415_c7_4d39_iftrue,
t16_MUX_uxn_opcodes_h_l1415_c7_4d39_iffalse,
t16_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1415_c7_4d39
tmp8_MUX_uxn_opcodes_h_l1415_c7_4d39 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1415_c7_4d39_cond,
tmp8_MUX_uxn_opcodes_h_l1415_c7_4d39_iftrue,
tmp8_MUX_uxn_opcodes_h_l1415_c7_4d39_iffalse,
tmp8_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_4d39
result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_4d39 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_4d39_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_4d39_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_4d39_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_4d39
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_4d39 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_4d39_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_4d39_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_4d39_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_4d39
result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_4d39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_4d39_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_4d39_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_4d39_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1415_c7_4d39
result_u16_value_MUX_uxn_opcodes_h_l1415_c7_4d39 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1415_c7_4d39_cond,
result_u16_value_MUX_uxn_opcodes_h_l1415_c7_4d39_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1415_c7_4d39_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1415_c7_4d39
result_u8_value_MUX_uxn_opcodes_h_l1415_c7_4d39 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1415_c7_4d39_cond,
result_u8_value_MUX_uxn_opcodes_h_l1415_c7_4d39_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1415_c7_4d39_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_4d39
result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_4d39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_4d39_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_4d39_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_4d39_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1416_c3_8e0d
BIN_OP_OR_uxn_opcodes_h_l1416_c3_8e0d : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1416_c3_8e0d_left,
BIN_OP_OR_uxn_opcodes_h_l1416_c3_8e0d_right,
BIN_OP_OR_uxn_opcodes_h_l1416_c3_8e0d_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1417_c30_7818
sp_relative_shift_uxn_opcodes_h_l1417_c30_7818 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1417_c30_7818_ins,
sp_relative_shift_uxn_opcodes_h_l1417_c30_7818_x,
sp_relative_shift_uxn_opcodes_h_l1417_c30_7818_y,
sp_relative_shift_uxn_opcodes_h_l1417_c30_7818_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1420_c11_a200
BIN_OP_EQ_uxn_opcodes_h_l1420_c11_a200 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1420_c11_a200_left,
BIN_OP_EQ_uxn_opcodes_h_l1420_c11_a200_right,
BIN_OP_EQ_uxn_opcodes_h_l1420_c11_a200_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1420_c7_0109
tmp8_MUX_uxn_opcodes_h_l1420_c7_0109 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1420_c7_0109_cond,
tmp8_MUX_uxn_opcodes_h_l1420_c7_0109_iftrue,
tmp8_MUX_uxn_opcodes_h_l1420_c7_0109_iffalse,
tmp8_MUX_uxn_opcodes_h_l1420_c7_0109_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0109
result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0109 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0109_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0109_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0109_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0109_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0109
result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0109 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0109_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0109_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0109_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0109_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0109
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0109 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0109_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0109_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0109_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0109_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0109
result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0109 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0109_cond,
result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0109_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0109_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0109_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0109
result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0109 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0109_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0109_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0109_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0109_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1423_c11_1fc3
BIN_OP_EQ_uxn_opcodes_h_l1423_c11_1fc3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1423_c11_1fc3_left,
BIN_OP_EQ_uxn_opcodes_h_l1423_c11_1fc3_right,
BIN_OP_EQ_uxn_opcodes_h_l1423_c11_1fc3_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1423_c7_c1bc
tmp8_MUX_uxn_opcodes_h_l1423_c7_c1bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1423_c7_c1bc_cond,
tmp8_MUX_uxn_opcodes_h_l1423_c7_c1bc_iftrue,
tmp8_MUX_uxn_opcodes_h_l1423_c7_c1bc_iffalse,
tmp8_MUX_uxn_opcodes_h_l1423_c7_c1bc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_c1bc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_c1bc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_c1bc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_c1bc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_c1bc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_c1bc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_c1bc
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_c1bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_c1bc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_c1bc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_c1bc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_c1bc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1423_c7_c1bc
result_u8_value_MUX_uxn_opcodes_h_l1423_c7_c1bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1423_c7_c1bc_cond,
result_u8_value_MUX_uxn_opcodes_h_l1423_c7_c1bc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1423_c7_c1bc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1423_c7_c1bc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_c1bc
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_c1bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_c1bc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_c1bc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_c1bc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_c1bc_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t16,
 tmp8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1395_c6_e81c_return_output,
 t16_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output,
 tmp8_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1408_c11_9545_return_output,
 t16_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output,
 tmp8_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1411_c11_a697_return_output,
 t16_MUX_uxn_opcodes_h_l1411_c7_e201_return_output,
 tmp8_MUX_uxn_opcodes_h_l1411_c7_e201_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_e201_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_e201_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_e201_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1411_c7_e201_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1411_c7_e201_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_e201_return_output,
 CONST_SL_8_uxn_opcodes_h_l1413_c3_a74e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1415_c11_4e30_return_output,
 t16_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output,
 tmp8_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1416_c3_8e0d_return_output,
 sp_relative_shift_uxn_opcodes_h_l1417_c30_7818_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1420_c11_a200_return_output,
 tmp8_MUX_uxn_opcodes_h_l1420_c7_0109_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0109_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0109_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0109_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0109_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0109_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1423_c11_1fc3_return_output,
 tmp8_MUX_uxn_opcodes_h_l1423_c7_c1bc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_c1bc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_c1bc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1423_c7_c1bc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_c1bc_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_e81c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_e81c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_e81c_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1400_c3_61e2 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1405_c3_6bcd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1395_c2_9a8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1395_c2_9a8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1395_c2_9a8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1395_c2_9a8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_9545_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_9545_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_9545_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1408_c7_89e0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1408_c7_89e0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1411_c7_e201_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1408_c7_89e0_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1408_c7_89e0_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1408_c7_89e0_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1411_c7_e201_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1408_c7_89e0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_89e0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_89e0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_e201_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_89e0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_89e0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1409_c3_66d7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_89e0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_e201_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_89e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_89e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_89e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_e201_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_89e0_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1408_c7_89e0_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1408_c7_89e0_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c7_e201_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1408_c7_89e0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1408_c7_89e0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1408_c7_89e0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c7_e201_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1408_c7_89e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_89e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_89e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_e201_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_89e0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_a697_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_a697_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_a697_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1411_c7_e201_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1411_c7_e201_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1411_c7_e201_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1411_c7_e201_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1411_c7_e201_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1411_c7_e201_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_e201_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_e201_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_e201_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_e201_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_e201_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_e201_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_e201_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_e201_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_e201_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c7_e201_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c7_e201_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c7_e201_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c7_e201_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c7_e201_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c7_e201_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_e201_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_e201_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_e201_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1413_c3_a74e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1413_c3_a74e_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_4e30_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_4e30_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_4e30_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1415_c7_4d39_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1415_c7_4d39_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1415_c7_4d39_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1415_c7_4d39_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1415_c7_4d39_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1420_c7_0109_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1415_c7_4d39_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_4d39_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_4d39_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0109_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_4d39_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_4d39_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_4d39_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0109_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_4d39_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_4d39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_4d39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0109_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_4d39_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1415_c7_4d39_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1415_c7_4d39_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1415_c7_4d39_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_4d39_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_4d39_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0109_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_4d39_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_4d39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_4d39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0109_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_4d39_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1416_c3_8e0d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1416_c3_8e0d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1416_c3_8e0d_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1417_c30_7818_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1417_c30_7818_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1417_c30_7818_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1417_c30_7818_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_a200_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_a200_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_a200_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1420_c7_0109_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1420_c7_0109_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1423_c7_c1bc_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1420_c7_0109_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0109_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1421_c3_dcf2 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0109_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0109_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0109_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0109_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_c1bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0109_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0109_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0109_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_c1bc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0109_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0109_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0109_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_c1bc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0109_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0109_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0109_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_c1bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0109_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_1fc3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_1fc3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_1fc3_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1423_c7_c1bc_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1423_c7_c1bc_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1423_c7_c1bc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_c1bc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1426_c3_5bda : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_c1bc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_c1bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_c1bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_c1bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_c1bc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_c1bc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_c1bc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_c1bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_c1bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_c1bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_c1bc_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1411_l1395_l1415_l1408_DUPLICATE_2221_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1423_l1420_l1415_l1411_l1408_l1395_DUPLICATE_c1ec_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1411_l1408_l1420_DUPLICATE_8c4c_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1423_l1420_l1415_l1411_l1408_DUPLICATE_5557_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1423_l1420_l1415_l1411_l1408_DUPLICATE_62cb_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1412_l1416_DUPLICATE_e9d8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1411_l1423_l1415_l1420_DUPLICATE_098f_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7557_uxn_opcodes_h_l1431_l1390_DUPLICATE_bf78_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1426_c3_5bda := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_c1bc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1426_c3_5bda;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_c1bc_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_e81c_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1421_c3_dcf2 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0109_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1421_c3_dcf2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_4e30_right := to_unsigned(3, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_a200_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1409_c3_66d7 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_89e0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1409_c3_66d7;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1400_c3_61e2 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1400_c3_61e2;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_c1bc_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1405_c3_6bcd := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1405_c3_6bcd;
     VAR_sp_relative_shift_uxn_opcodes_h_l1417_c30_7818_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_9545_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_1fc3_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_a697_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1417_c30_7818_y := resize(to_signed(-1, 2), 4);

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
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l1417_c30_7818_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_e81c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_9545_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_a697_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_4e30_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_a200_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_1fc3_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_c1bc_iftrue := VAR_previous_ram_read;
     VAR_tmp8_MUX_uxn_opcodes_h_l1423_c7_c1bc_iftrue := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1416_c3_8e0d_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1408_c7_89e0_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1415_c7_4d39_iffalse := t16;
     VAR_tmp8_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1408_c7_89e0_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1411_c7_e201_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1415_c7_4d39_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1420_c7_0109_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1423_c7_c1bc_iffalse := tmp8;
     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1395_c2_9a8e] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1395_c2_9a8e_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1395_c6_e81c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1395_c6_e81c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_e81c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1395_c6_e81c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_e81c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_e81c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1395_c6_e81c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1423_c11_1fc3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1423_c11_1fc3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_1fc3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1423_c11_1fc3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_1fc3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_1fc3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1423_c11_1fc3_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1411_l1395_l1415_l1408_DUPLICATE_2221 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1411_l1395_l1415_l1408_DUPLICATE_2221_return_output := result.u16_value;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1411_l1423_l1415_l1420_DUPLICATE_098f LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1411_l1423_l1415_l1420_DUPLICATE_098f_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1411_l1408_l1420_DUPLICATE_8c4c LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1411_l1408_l1420_DUPLICATE_8c4c_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1423_l1420_l1415_l1411_l1408_DUPLICATE_62cb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1423_l1420_l1415_l1411_l1408_DUPLICATE_62cb_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1411_c11_a697] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1411_c11_a697_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_a697_left;
     BIN_OP_EQ_uxn_opcodes_h_l1411_c11_a697_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_a697_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_a697_return_output := BIN_OP_EQ_uxn_opcodes_h_l1411_c11_a697_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1395_c2_9a8e] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1395_c2_9a8e_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1423_l1420_l1415_l1411_l1408_l1395_DUPLICATE_c1ec LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1423_l1420_l1415_l1411_l1408_l1395_DUPLICATE_c1ec_return_output := result.u8_value;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1395_c2_9a8e] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1395_c2_9a8e_return_output := result.is_ram_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1412_l1416_DUPLICATE_e9d8 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1412_l1416_DUPLICATE_e9d8_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1423_l1420_l1415_l1411_l1408_DUPLICATE_5557 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1423_l1420_l1415_l1411_l1408_DUPLICATE_5557_return_output := result.is_opc_done;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1395_c2_9a8e] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1395_c2_9a8e_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1415_c11_4e30] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1415_c11_4e30_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_4e30_left;
     BIN_OP_EQ_uxn_opcodes_h_l1415_c11_4e30_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_4e30_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_4e30_return_output := BIN_OP_EQ_uxn_opcodes_h_l1415_c11_4e30_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1408_c11_9545] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1408_c11_9545_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_9545_left;
     BIN_OP_EQ_uxn_opcodes_h_l1408_c11_9545_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_9545_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_9545_return_output := BIN_OP_EQ_uxn_opcodes_h_l1408_c11_9545_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1420_c11_a200] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1420_c11_a200_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_a200_left;
     BIN_OP_EQ_uxn_opcodes_h_l1420_c11_a200_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_a200_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_a200_return_output := BIN_OP_EQ_uxn_opcodes_h_l1420_c11_a200_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1417_c30_7818] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1417_c30_7818_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1417_c30_7818_ins;
     sp_relative_shift_uxn_opcodes_h_l1417_c30_7818_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1417_c30_7818_x;
     sp_relative_shift_uxn_opcodes_h_l1417_c30_7818_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1417_c30_7818_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1417_c30_7818_return_output := sp_relative_shift_uxn_opcodes_h_l1417_c30_7818_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_e81c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_e81c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_e81c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_e81c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_e81c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_e81c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_e81c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_e81c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_e81c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_e81c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_e81c_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_e81c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_89e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_9545_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_89e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_9545_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_89e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_9545_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_89e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_9545_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1408_c7_89e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_9545_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1408_c7_89e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_9545_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1408_c7_89e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_9545_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1408_c7_89e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_9545_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_e201_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_a697_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_e201_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_a697_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_e201_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_a697_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_e201_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_a697_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c7_e201_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_a697_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c7_e201_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_a697_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1411_c7_e201_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_a697_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1411_c7_e201_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_a697_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_4d39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_4e30_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_4d39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_4e30_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_4d39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_4e30_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_4d39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_4e30_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1415_c7_4d39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_4e30_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_4d39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_4e30_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1415_c7_4d39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_4e30_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1415_c7_4d39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_4e30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0109_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_a200_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0109_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_a200_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0109_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_a200_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0109_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_a200_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0109_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_a200_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1420_c7_0109_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_a200_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_c1bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_1fc3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_c1bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_1fc3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_c1bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_1fc3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_c1bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_1fc3_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1423_c7_c1bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_1fc3_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1416_c3_8e0d_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1412_l1416_DUPLICATE_e9d8_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1413_c3_a74e_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1412_l1416_DUPLICATE_e9d8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_89e0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1411_l1408_l1420_DUPLICATE_8c4c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_e201_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1411_l1408_l1420_DUPLICATE_8c4c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0109_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1411_l1408_l1420_DUPLICATE_8c4c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1411_l1395_l1415_l1408_DUPLICATE_2221_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1408_c7_89e0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1411_l1395_l1415_l1408_DUPLICATE_2221_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c7_e201_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1411_l1395_l1415_l1408_DUPLICATE_2221_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1415_c7_4d39_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1411_l1395_l1415_l1408_DUPLICATE_2221_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_89e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1423_l1420_l1415_l1411_l1408_DUPLICATE_5557_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_e201_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1423_l1420_l1415_l1411_l1408_DUPLICATE_5557_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_4d39_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1423_l1420_l1415_l1411_l1408_DUPLICATE_5557_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0109_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1423_l1420_l1415_l1411_l1408_DUPLICATE_5557_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_c1bc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1423_l1420_l1415_l1411_l1408_DUPLICATE_5557_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_89e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1423_l1420_l1415_l1411_l1408_DUPLICATE_62cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_e201_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1423_l1420_l1415_l1411_l1408_DUPLICATE_62cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_4d39_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1423_l1420_l1415_l1411_l1408_DUPLICATE_62cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0109_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1423_l1420_l1415_l1411_l1408_DUPLICATE_62cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_c1bc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1423_l1420_l1415_l1411_l1408_DUPLICATE_62cb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_e201_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1411_l1423_l1415_l1420_DUPLICATE_098f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_4d39_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1411_l1423_l1415_l1420_DUPLICATE_098f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0109_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1411_l1423_l1415_l1420_DUPLICATE_098f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_c1bc_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1411_l1423_l1415_l1420_DUPLICATE_098f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1423_l1420_l1415_l1411_l1408_l1395_DUPLICATE_c1ec_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1408_c7_89e0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1423_l1420_l1415_l1411_l1408_l1395_DUPLICATE_c1ec_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c7_e201_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1423_l1420_l1415_l1411_l1408_l1395_DUPLICATE_c1ec_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_4d39_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1423_l1420_l1415_l1411_l1408_l1395_DUPLICATE_c1ec_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0109_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1423_l1420_l1415_l1411_l1408_l1395_DUPLICATE_c1ec_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_c1bc_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1423_l1420_l1415_l1411_l1408_l1395_DUPLICATE_c1ec_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1395_c2_9a8e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1395_c2_9a8e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1395_c2_9a8e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1395_c2_9a8e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_4d39_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1417_c30_7818_return_output;
     -- CONST_SL_8[uxn_opcodes_h_l1413_c3_a74e] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1413_c3_a74e_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1413_c3_a74e_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1413_c3_a74e_return_output := CONST_SL_8_uxn_opcodes_h_l1413_c3_a74e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1395_c2_9a8e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1423_c7_c1bc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1423_c7_c1bc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_c1bc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1423_c7_c1bc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_c1bc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1423_c7_c1bc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_c1bc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_c1bc_return_output := result_u8_value_MUX_uxn_opcodes_h_l1423_c7_c1bc_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1395_c2_9a8e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1423_c7_c1bc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_c1bc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_c1bc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_c1bc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_c1bc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_c1bc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_c1bc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_c1bc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_c1bc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1423_c7_c1bc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_c1bc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_c1bc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_c1bc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_c1bc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_c1bc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_c1bc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_c1bc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_c1bc_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1416_c3_8e0d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1416_c3_8e0d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1416_c3_8e0d_left;
     BIN_OP_OR_uxn_opcodes_h_l1416_c3_8e0d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1416_c3_8e0d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1416_c3_8e0d_return_output := BIN_OP_OR_uxn_opcodes_h_l1416_c3_8e0d_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1423_c7_c1bc] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1423_c7_c1bc_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1423_c7_c1bc_cond;
     tmp8_MUX_uxn_opcodes_h_l1423_c7_c1bc_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1423_c7_c1bc_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1423_c7_c1bc_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1423_c7_c1bc_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1423_c7_c1bc_return_output := tmp8_MUX_uxn_opcodes_h_l1423_c7_c1bc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1423_c7_c1bc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_c1bc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_c1bc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_c1bc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_c1bc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_c1bc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_c1bc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_c1bc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_c1bc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1420_c7_0109] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0109_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0109_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0109_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0109_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0109_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0109_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0109_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0109_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1395_c2_9a8e] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1395_c2_9a8e] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1415_c7_4d39_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1416_c3_8e0d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1415_c7_4d39_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1416_c3_8e0d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1411_c7_e201_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1413_c3_a74e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0109_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_c1bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0109_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_c1bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_4d39_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0109_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0109_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_c1bc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0109_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_c1bc_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1420_c7_0109_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1423_c7_c1bc_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1415_c7_4d39] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1415_c7_4d39_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1415_c7_4d39_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1415_c7_4d39_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1415_c7_4d39_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1415_c7_4d39_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1415_c7_4d39_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output := result_u16_value_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1420_c7_0109] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0109_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0109_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0109_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0109_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0109_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0109_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0109_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0109_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1420_c7_0109] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1420_c7_0109_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1420_c7_0109_cond;
     tmp8_MUX_uxn_opcodes_h_l1420_c7_0109_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1420_c7_0109_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1420_c7_0109_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1420_c7_0109_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1420_c7_0109_return_output := tmp8_MUX_uxn_opcodes_h_l1420_c7_0109_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1415_c7_4d39] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_4d39_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_4d39_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_4d39_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_4d39_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_4d39_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_4d39_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1420_c7_0109] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0109_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0109_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0109_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0109_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0109_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0109_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0109_return_output := result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0109_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1420_c7_0109] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0109_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0109_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0109_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0109_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0109_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0109_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0109_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0109_return_output;

     -- t16_MUX[uxn_opcodes_h_l1415_c7_4d39] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1415_c7_4d39_cond <= VAR_t16_MUX_uxn_opcodes_h_l1415_c7_4d39_cond;
     t16_MUX_uxn_opcodes_h_l1415_c7_4d39_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1415_c7_4d39_iftrue;
     t16_MUX_uxn_opcodes_h_l1415_c7_4d39_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1415_c7_4d39_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output := t16_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1420_c7_0109] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0109_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0109_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0109_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0109_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0109_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0109_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0109_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0109_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_4d39_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0109_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_4d39_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0109_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_e201_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_4d39_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0109_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c7_e201_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_4d39_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0109_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1411_c7_e201_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1415_c7_4d39_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1420_c7_0109_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1415_c7_4d39] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_4d39_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_4d39_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_4d39_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_4d39_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_4d39_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_4d39_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1415_c7_4d39] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1415_c7_4d39_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1415_c7_4d39_cond;
     tmp8_MUX_uxn_opcodes_h_l1415_c7_4d39_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1415_c7_4d39_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1415_c7_4d39_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1415_c7_4d39_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output := tmp8_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1411_c7_e201] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_e201_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_e201_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_e201_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_e201_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_e201_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_e201_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_e201_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_e201_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1411_c7_e201] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1411_c7_e201_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c7_e201_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1411_c7_e201_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c7_e201_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1411_c7_e201_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c7_e201_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c7_e201_return_output := result_u16_value_MUX_uxn_opcodes_h_l1411_c7_e201_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1415_c7_4d39] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_4d39_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_4d39_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_4d39_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_4d39_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_4d39_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_4d39_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1415_c7_4d39] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_4d39_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_4d39_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_4d39_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_4d39_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_4d39_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_4d39_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1415_c7_4d39] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1415_c7_4d39_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_4d39_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1415_c7_4d39_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_4d39_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1415_c7_4d39_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_4d39_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output := result_u8_value_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output;

     -- t16_MUX[uxn_opcodes_h_l1411_c7_e201] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1411_c7_e201_cond <= VAR_t16_MUX_uxn_opcodes_h_l1411_c7_e201_cond;
     t16_MUX_uxn_opcodes_h_l1411_c7_e201_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1411_c7_e201_iftrue;
     t16_MUX_uxn_opcodes_h_l1411_c7_e201_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1411_c7_e201_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1411_c7_e201_return_output := t16_MUX_uxn_opcodes_h_l1411_c7_e201_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_e201_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_e201_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_89e0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_e201_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_e201_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1408_c7_89e0_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c7_e201_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c7_e201_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1408_c7_89e0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1411_c7_e201_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1411_c7_e201_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1415_c7_4d39_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1408_c7_89e0] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1408_c7_89e0_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1408_c7_89e0_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1408_c7_89e0_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1408_c7_89e0_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1408_c7_89e0_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1408_c7_89e0_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output := result_u16_value_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1408_c7_89e0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_89e0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_89e0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_89e0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_89e0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_89e0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_89e0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1411_c7_e201] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_e201_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_e201_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_e201_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_e201_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_e201_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_e201_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_e201_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_e201_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1411_c7_e201] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1411_c7_e201_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1411_c7_e201_cond;
     tmp8_MUX_uxn_opcodes_h_l1411_c7_e201_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1411_c7_e201_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1411_c7_e201_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1411_c7_e201_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1411_c7_e201_return_output := tmp8_MUX_uxn_opcodes_h_l1411_c7_e201_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1411_c7_e201] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1411_c7_e201_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c7_e201_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1411_c7_e201_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c7_e201_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1411_c7_e201_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c7_e201_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c7_e201_return_output := result_u8_value_MUX_uxn_opcodes_h_l1411_c7_e201_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1411_c7_e201] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_e201_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_e201_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_e201_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_e201_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_e201_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_e201_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_e201_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_e201_return_output;

     -- t16_MUX[uxn_opcodes_h_l1408_c7_89e0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1408_c7_89e0_cond <= VAR_t16_MUX_uxn_opcodes_h_l1408_c7_89e0_cond;
     t16_MUX_uxn_opcodes_h_l1408_c7_89e0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1408_c7_89e0_iftrue;
     t16_MUX_uxn_opcodes_h_l1408_c7_89e0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1408_c7_89e0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output := t16_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1411_c7_e201] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_e201_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_e201_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_e201_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_e201_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_e201_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_e201_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_e201_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_e201_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_89e0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_e201_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_89e0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_e201_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_89e0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_e201_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1408_c7_89e0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c7_e201_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1408_c7_89e0_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1411_c7_e201_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1408_c7_89e0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_89e0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_89e0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_89e0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_89e0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_89e0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_89e0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1408_c7_89e0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1408_c7_89e0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1408_c7_89e0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1408_c7_89e0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1408_c7_89e0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1408_c7_89e0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1408_c7_89e0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output := result_u8_value_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1408_c7_89e0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_89e0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_89e0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_89e0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_89e0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_89e0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_89e0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1408_c7_89e0] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1408_c7_89e0_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1408_c7_89e0_cond;
     tmp8_MUX_uxn_opcodes_h_l1408_c7_89e0_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1408_c7_89e0_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1408_c7_89e0_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1408_c7_89e0_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output := tmp8_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output;

     -- t16_MUX[uxn_opcodes_h_l1395_c2_9a8e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond;
     t16_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue;
     t16_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output := t16_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1408_c7_89e0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_89e0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_89e0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_89e0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_89e0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_89e0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_89e0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1395_c2_9a8e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1395_c2_9a8e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output := result_u16_value_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1408_c7_89e0_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1395_c2_9a8e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1395_c2_9a8e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1395_c2_9a8e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1395_c2_9a8e] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond;
     tmp8_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output := tmp8_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1395_c2_9a8e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_9a8e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_9a8e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_9a8e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output;

     -- Submodule level 7
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_7557_uxn_opcodes_h_l1431_l1390_DUPLICATE_bf78 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7557_uxn_opcodes_h_l1431_l1390_DUPLICATE_bf78_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_7557(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_9a8e_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7557_uxn_opcodes_h_l1431_l1390_DUPLICATE_bf78_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7557_uxn_opcodes_h_l1431_l1390_DUPLICATE_bf78_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
