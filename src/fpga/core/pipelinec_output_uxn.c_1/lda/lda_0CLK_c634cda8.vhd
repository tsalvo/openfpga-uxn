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
-- BIN_OP_EQ[uxn_opcodes_h_l1395_c6_5daa]
signal BIN_OP_EQ_uxn_opcodes_h_l1395_c6_5daa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1395_c6_5daa_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1395_c6_5daa_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1395_c2_2d0e]
signal t16_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1395_c2_2d0e]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1395_c2_2d0e]
signal result_u16_value_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1395_c2_2d0e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1395_c2_2d0e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1395_c2_2d0e]
signal result_u8_value_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1395_c2_2d0e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1395_c2_2d0e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1395_c2_2d0e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1395_c2_2d0e]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1395_c2_2d0e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output : signed(3 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1395_c2_2d0e]
signal tmp8_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1408_c11_719a]
signal BIN_OP_EQ_uxn_opcodes_h_l1408_c11_719a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1408_c11_719a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1408_c11_719a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1408_c7_c472]
signal t16_MUX_uxn_opcodes_h_l1408_c7_c472_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1408_c7_c472_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1408_c7_c472_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1408_c7_c472_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1408_c7_c472]
signal result_u16_value_MUX_uxn_opcodes_h_l1408_c7_c472_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1408_c7_c472_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1408_c7_c472_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1408_c7_c472_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1408_c7_c472]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_c472_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_c472_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_c472_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_c472_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1408_c7_c472]
signal result_u8_value_MUX_uxn_opcodes_h_l1408_c7_c472_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1408_c7_c472_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1408_c7_c472_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1408_c7_c472_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1408_c7_c472]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_c472_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_c472_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_c472_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_c472_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1408_c7_c472]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_c472_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_c472_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_c472_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_c472_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1408_c7_c472]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_c472_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_c472_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_c472_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_c472_return_output : signed(3 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1408_c7_c472]
signal tmp8_MUX_uxn_opcodes_h_l1408_c7_c472_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1408_c7_c472_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1408_c7_c472_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1408_c7_c472_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1411_c11_fad6]
signal BIN_OP_EQ_uxn_opcodes_h_l1411_c11_fad6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1411_c11_fad6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1411_c11_fad6_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1411_c7_b070]
signal t16_MUX_uxn_opcodes_h_l1411_c7_b070_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1411_c7_b070_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1411_c7_b070_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1411_c7_b070_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1411_c7_b070]
signal result_u16_value_MUX_uxn_opcodes_h_l1411_c7_b070_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1411_c7_b070_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1411_c7_b070_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1411_c7_b070_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1411_c7_b070]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_b070_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_b070_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_b070_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_b070_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1411_c7_b070]
signal result_u8_value_MUX_uxn_opcodes_h_l1411_c7_b070_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1411_c7_b070_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1411_c7_b070_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1411_c7_b070_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1411_c7_b070]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_b070_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_b070_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_b070_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_b070_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1411_c7_b070]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_b070_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_b070_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_b070_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_b070_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1411_c7_b070]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_b070_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_b070_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_b070_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_b070_return_output : signed(3 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1411_c7_b070]
signal tmp8_MUX_uxn_opcodes_h_l1411_c7_b070_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1411_c7_b070_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1411_c7_b070_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1411_c7_b070_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1413_c3_b9d5]
signal CONST_SL_8_uxn_opcodes_h_l1413_c3_b9d5_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1413_c3_b9d5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1415_c11_a18a]
signal BIN_OP_EQ_uxn_opcodes_h_l1415_c11_a18a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1415_c11_a18a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1415_c11_a18a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1415_c7_d6e1]
signal t16_MUX_uxn_opcodes_h_l1415_c7_d6e1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1415_c7_d6e1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1415_c7_d6e1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1415_c7_d6e1]
signal result_u16_value_MUX_uxn_opcodes_h_l1415_c7_d6e1_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1415_c7_d6e1_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1415_c7_d6e1_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1415_c7_d6e1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d6e1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d6e1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d6e1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1415_c7_d6e1]
signal result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d6e1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d6e1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d6e1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1415_c7_d6e1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d6e1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d6e1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d6e1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1415_c7_d6e1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d6e1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d6e1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d6e1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1415_c7_d6e1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d6e1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d6e1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d6e1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output : signed(3 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1415_c7_d6e1]
signal tmp8_MUX_uxn_opcodes_h_l1415_c7_d6e1_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1415_c7_d6e1_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1415_c7_d6e1_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1416_c3_880a]
signal BIN_OP_OR_uxn_opcodes_h_l1416_c3_880a_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1416_c3_880a_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1416_c3_880a_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1417_c30_7dd2]
signal sp_relative_shift_uxn_opcodes_h_l1417_c30_7dd2_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1417_c30_7dd2_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1417_c30_7dd2_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1417_c30_7dd2_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1420_c11_8635]
signal BIN_OP_EQ_uxn_opcodes_h_l1420_c11_8635_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1420_c11_8635_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1420_c11_8635_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1420_c7_b579]
signal result_u8_value_MUX_uxn_opcodes_h_l1420_c7_b579_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1420_c7_b579_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1420_c7_b579_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1420_c7_b579_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1420_c7_b579]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_b579_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_b579_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_b579_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_b579_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1420_c7_b579]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_b579_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_b579_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_b579_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_b579_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1420_c7_b579]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_b579_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_b579_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_b579_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_b579_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1420_c7_b579]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_b579_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_b579_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_b579_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_b579_return_output : signed(3 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1420_c7_b579]
signal tmp8_MUX_uxn_opcodes_h_l1420_c7_b579_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1420_c7_b579_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1420_c7_b579_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1420_c7_b579_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1423_c11_ac69]
signal BIN_OP_EQ_uxn_opcodes_h_l1423_c11_ac69_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1423_c11_ac69_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1423_c11_ac69_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1423_c7_a4ed]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_a4ed_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_a4ed_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_a4ed_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_a4ed_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1423_c7_a4ed]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_a4ed_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_a4ed_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_a4ed_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_a4ed_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1423_c7_a4ed]
signal result_u8_value_MUX_uxn_opcodes_h_l1423_c7_a4ed_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1423_c7_a4ed_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1423_c7_a4ed_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1423_c7_a4ed_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1423_c7_a4ed]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_a4ed_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_a4ed_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_a4ed_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_a4ed_return_output : unsigned(3 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1423_c7_a4ed]
signal tmp8_MUX_uxn_opcodes_h_l1423_c7_a4ed_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1423_c7_a4ed_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1423_c7_a4ed_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1423_c7_a4ed_return_output : unsigned(7 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_d9be( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_vram_write := ref_toks_1;
      base.u16_value := ref_toks_2;
      base.is_pc_updated := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.is_stack_index_flipped := ref_toks_9;
      base.sp_relative_shift := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1395_c6_5daa
BIN_OP_EQ_uxn_opcodes_h_l1395_c6_5daa : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1395_c6_5daa_left,
BIN_OP_EQ_uxn_opcodes_h_l1395_c6_5daa_right,
BIN_OP_EQ_uxn_opcodes_h_l1395_c6_5daa_return_output);

-- t16_MUX_uxn_opcodes_h_l1395_c2_2d0e
t16_MUX_uxn_opcodes_h_l1395_c2_2d0e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond,
t16_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue,
t16_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse,
t16_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e
result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1395_c2_2d0e
result_u16_value_MUX_uxn_opcodes_h_l1395_c2_2d0e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond,
result_u16_value_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_2d0e
result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_2d0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_2d0e
result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_2d0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1395_c2_2d0e
result_u8_value_MUX_uxn_opcodes_h_l1395_c2_2d0e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_2d0e
result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_2d0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_2d0e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_2d0e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e
result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_2d0e
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_2d0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_2d0e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_2d0e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1395_c2_2d0e
tmp8_MUX_uxn_opcodes_h_l1395_c2_2d0e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond,
tmp8_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue,
tmp8_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse,
tmp8_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1408_c11_719a
BIN_OP_EQ_uxn_opcodes_h_l1408_c11_719a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1408_c11_719a_left,
BIN_OP_EQ_uxn_opcodes_h_l1408_c11_719a_right,
BIN_OP_EQ_uxn_opcodes_h_l1408_c11_719a_return_output);

-- t16_MUX_uxn_opcodes_h_l1408_c7_c472
t16_MUX_uxn_opcodes_h_l1408_c7_c472 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1408_c7_c472_cond,
t16_MUX_uxn_opcodes_h_l1408_c7_c472_iftrue,
t16_MUX_uxn_opcodes_h_l1408_c7_c472_iffalse,
t16_MUX_uxn_opcodes_h_l1408_c7_c472_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1408_c7_c472
result_u16_value_MUX_uxn_opcodes_h_l1408_c7_c472 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1408_c7_c472_cond,
result_u16_value_MUX_uxn_opcodes_h_l1408_c7_c472_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1408_c7_c472_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1408_c7_c472_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_c472
result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_c472 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_c472_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_c472_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_c472_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_c472_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1408_c7_c472
result_u8_value_MUX_uxn_opcodes_h_l1408_c7_c472 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1408_c7_c472_cond,
result_u8_value_MUX_uxn_opcodes_h_l1408_c7_c472_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1408_c7_c472_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1408_c7_c472_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_c472
result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_c472 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_c472_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_c472_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_c472_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_c472_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_c472
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_c472 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_c472_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_c472_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_c472_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_c472_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_c472
result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_c472 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_c472_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_c472_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_c472_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_c472_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1408_c7_c472
tmp8_MUX_uxn_opcodes_h_l1408_c7_c472 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1408_c7_c472_cond,
tmp8_MUX_uxn_opcodes_h_l1408_c7_c472_iftrue,
tmp8_MUX_uxn_opcodes_h_l1408_c7_c472_iffalse,
tmp8_MUX_uxn_opcodes_h_l1408_c7_c472_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1411_c11_fad6
BIN_OP_EQ_uxn_opcodes_h_l1411_c11_fad6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1411_c11_fad6_left,
BIN_OP_EQ_uxn_opcodes_h_l1411_c11_fad6_right,
BIN_OP_EQ_uxn_opcodes_h_l1411_c11_fad6_return_output);

-- t16_MUX_uxn_opcodes_h_l1411_c7_b070
t16_MUX_uxn_opcodes_h_l1411_c7_b070 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1411_c7_b070_cond,
t16_MUX_uxn_opcodes_h_l1411_c7_b070_iftrue,
t16_MUX_uxn_opcodes_h_l1411_c7_b070_iffalse,
t16_MUX_uxn_opcodes_h_l1411_c7_b070_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1411_c7_b070
result_u16_value_MUX_uxn_opcodes_h_l1411_c7_b070 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1411_c7_b070_cond,
result_u16_value_MUX_uxn_opcodes_h_l1411_c7_b070_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1411_c7_b070_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1411_c7_b070_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_b070
result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_b070 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_b070_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_b070_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_b070_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_b070_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1411_c7_b070
result_u8_value_MUX_uxn_opcodes_h_l1411_c7_b070 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1411_c7_b070_cond,
result_u8_value_MUX_uxn_opcodes_h_l1411_c7_b070_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1411_c7_b070_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1411_c7_b070_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_b070
result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_b070 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_b070_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_b070_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_b070_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_b070_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_b070
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_b070 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_b070_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_b070_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_b070_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_b070_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_b070
result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_b070 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_b070_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_b070_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_b070_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_b070_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1411_c7_b070
tmp8_MUX_uxn_opcodes_h_l1411_c7_b070 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1411_c7_b070_cond,
tmp8_MUX_uxn_opcodes_h_l1411_c7_b070_iftrue,
tmp8_MUX_uxn_opcodes_h_l1411_c7_b070_iffalse,
tmp8_MUX_uxn_opcodes_h_l1411_c7_b070_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1413_c3_b9d5
CONST_SL_8_uxn_opcodes_h_l1413_c3_b9d5 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1413_c3_b9d5_x,
CONST_SL_8_uxn_opcodes_h_l1413_c3_b9d5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1415_c11_a18a
BIN_OP_EQ_uxn_opcodes_h_l1415_c11_a18a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1415_c11_a18a_left,
BIN_OP_EQ_uxn_opcodes_h_l1415_c11_a18a_right,
BIN_OP_EQ_uxn_opcodes_h_l1415_c11_a18a_return_output);

-- t16_MUX_uxn_opcodes_h_l1415_c7_d6e1
t16_MUX_uxn_opcodes_h_l1415_c7_d6e1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1415_c7_d6e1_cond,
t16_MUX_uxn_opcodes_h_l1415_c7_d6e1_iftrue,
t16_MUX_uxn_opcodes_h_l1415_c7_d6e1_iffalse,
t16_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1415_c7_d6e1
result_u16_value_MUX_uxn_opcodes_h_l1415_c7_d6e1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1415_c7_d6e1_cond,
result_u16_value_MUX_uxn_opcodes_h_l1415_c7_d6e1_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1415_c7_d6e1_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d6e1
result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d6e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d6e1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d6e1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d6e1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d6e1
result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d6e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d6e1_cond,
result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d6e1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d6e1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d6e1
result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d6e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d6e1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d6e1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d6e1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d6e1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d6e1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d6e1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d6e1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d6e1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d6e1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d6e1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d6e1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d6e1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d6e1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1415_c7_d6e1
tmp8_MUX_uxn_opcodes_h_l1415_c7_d6e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1415_c7_d6e1_cond,
tmp8_MUX_uxn_opcodes_h_l1415_c7_d6e1_iftrue,
tmp8_MUX_uxn_opcodes_h_l1415_c7_d6e1_iffalse,
tmp8_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1416_c3_880a
BIN_OP_OR_uxn_opcodes_h_l1416_c3_880a : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1416_c3_880a_left,
BIN_OP_OR_uxn_opcodes_h_l1416_c3_880a_right,
BIN_OP_OR_uxn_opcodes_h_l1416_c3_880a_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1417_c30_7dd2
sp_relative_shift_uxn_opcodes_h_l1417_c30_7dd2 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1417_c30_7dd2_ins,
sp_relative_shift_uxn_opcodes_h_l1417_c30_7dd2_x,
sp_relative_shift_uxn_opcodes_h_l1417_c30_7dd2_y,
sp_relative_shift_uxn_opcodes_h_l1417_c30_7dd2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1420_c11_8635
BIN_OP_EQ_uxn_opcodes_h_l1420_c11_8635 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1420_c11_8635_left,
BIN_OP_EQ_uxn_opcodes_h_l1420_c11_8635_right,
BIN_OP_EQ_uxn_opcodes_h_l1420_c11_8635_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1420_c7_b579
result_u8_value_MUX_uxn_opcodes_h_l1420_c7_b579 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1420_c7_b579_cond,
result_u8_value_MUX_uxn_opcodes_h_l1420_c7_b579_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1420_c7_b579_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1420_c7_b579_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_b579
result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_b579 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_b579_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_b579_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_b579_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_b579_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_b579
result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_b579 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_b579_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_b579_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_b579_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_b579_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_b579
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_b579 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_b579_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_b579_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_b579_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_b579_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_b579
result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_b579 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_b579_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_b579_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_b579_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_b579_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1420_c7_b579
tmp8_MUX_uxn_opcodes_h_l1420_c7_b579 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1420_c7_b579_cond,
tmp8_MUX_uxn_opcodes_h_l1420_c7_b579_iftrue,
tmp8_MUX_uxn_opcodes_h_l1420_c7_b579_iffalse,
tmp8_MUX_uxn_opcodes_h_l1420_c7_b579_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1423_c11_ac69
BIN_OP_EQ_uxn_opcodes_h_l1423_c11_ac69 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1423_c11_ac69_left,
BIN_OP_EQ_uxn_opcodes_h_l1423_c11_ac69_right,
BIN_OP_EQ_uxn_opcodes_h_l1423_c11_ac69_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_a4ed
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_a4ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_a4ed_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_a4ed_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_a4ed_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_a4ed_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_a4ed
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_a4ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_a4ed_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_a4ed_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_a4ed_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_a4ed_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1423_c7_a4ed
result_u8_value_MUX_uxn_opcodes_h_l1423_c7_a4ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1423_c7_a4ed_cond,
result_u8_value_MUX_uxn_opcodes_h_l1423_c7_a4ed_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1423_c7_a4ed_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1423_c7_a4ed_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_a4ed
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_a4ed : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_a4ed_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_a4ed_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_a4ed_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_a4ed_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1423_c7_a4ed
tmp8_MUX_uxn_opcodes_h_l1423_c7_a4ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1423_c7_a4ed_cond,
tmp8_MUX_uxn_opcodes_h_l1423_c7_a4ed_iftrue,
tmp8_MUX_uxn_opcodes_h_l1423_c7_a4ed_iffalse,
tmp8_MUX_uxn_opcodes_h_l1423_c7_a4ed_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1395_c6_5daa_return_output,
 t16_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output,
 tmp8_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1408_c11_719a_return_output,
 t16_MUX_uxn_opcodes_h_l1408_c7_c472_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1408_c7_c472_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_c472_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1408_c7_c472_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_c472_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_c472_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_c472_return_output,
 tmp8_MUX_uxn_opcodes_h_l1408_c7_c472_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1411_c11_fad6_return_output,
 t16_MUX_uxn_opcodes_h_l1411_c7_b070_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1411_c7_b070_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_b070_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1411_c7_b070_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_b070_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_b070_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_b070_return_output,
 tmp8_MUX_uxn_opcodes_h_l1411_c7_b070_return_output,
 CONST_SL_8_uxn_opcodes_h_l1413_c3_b9d5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1415_c11_a18a_return_output,
 t16_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output,
 tmp8_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1416_c3_880a_return_output,
 sp_relative_shift_uxn_opcodes_h_l1417_c30_7dd2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1420_c11_8635_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1420_c7_b579_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_b579_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_b579_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_b579_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_b579_return_output,
 tmp8_MUX_uxn_opcodes_h_l1420_c7_b579_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1423_c11_ac69_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_a4ed_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_a4ed_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1423_c7_a4ed_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_a4ed_return_output,
 tmp8_MUX_uxn_opcodes_h_l1423_c7_a4ed_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_5daa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_5daa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_5daa_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1408_c7_c472_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1395_c2_2d0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1408_c7_c472_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1395_c2_2d0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_c472_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1408_c7_c472_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_c472_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1405_c3_3a98 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_c472_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1395_c2_2d0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1395_c2_2d0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1400_c3_9353 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_c472_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1408_c7_c472_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_719a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_719a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_719a_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1408_c7_c472_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1408_c7_c472_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1411_c7_b070_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1408_c7_c472_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1408_c7_c472_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1408_c7_c472_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c7_b070_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1408_c7_c472_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_c472_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_c472_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_b070_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_c472_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1408_c7_c472_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1408_c7_c472_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c7_b070_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1408_c7_c472_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_c472_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_c472_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_b070_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_c472_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_c472_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1409_c3_7d84 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_c472_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_b070_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_c472_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_c472_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_c472_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_b070_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_c472_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1408_c7_c472_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1408_c7_c472_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1411_c7_b070_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1408_c7_c472_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_fad6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_fad6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_fad6_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1411_c7_b070_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1411_c7_b070_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1411_c7_b070_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c7_b070_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c7_b070_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c7_b070_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_b070_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_b070_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_b070_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c7_b070_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c7_b070_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c7_b070_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_b070_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_b070_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_b070_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_b070_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_b070_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_b070_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_b070_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_b070_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_b070_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1411_c7_b070_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1411_c7_b070_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1411_c7_b070_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1413_c3_b9d5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1413_c3_b9d5_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_a18a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_a18a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_a18a_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1415_c7_d6e1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1415_c7_d6e1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1415_c7_d6e1_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1415_c7_d6e1_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1415_c7_d6e1_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1415_c7_d6e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d6e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d6e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_b579_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d6e1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d6e1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d6e1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1420_c7_b579_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d6e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d6e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d6e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_b579_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d6e1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d6e1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d6e1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_b579_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d6e1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d6e1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d6e1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_b579_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d6e1_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1415_c7_d6e1_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1415_c7_d6e1_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1420_c7_b579_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1415_c7_d6e1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1416_c3_880a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1416_c3_880a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1416_c3_880a_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1417_c30_7dd2_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1417_c30_7dd2_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1417_c30_7dd2_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1417_c30_7dd2_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_8635_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_8635_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_8635_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1420_c7_b579_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1420_c7_b579_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_a4ed_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1420_c7_b579_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_b579_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_b579_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_a4ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_b579_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_b579_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_b579_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_a4ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_b579_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_b579_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_b579_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_a4ed_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_b579_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_b579_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1421_c3_7ee0 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_b579_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_b579_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1420_c7_b579_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1420_c7_b579_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1423_c7_a4ed_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1420_c7_b579_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_ac69_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_ac69_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_ac69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_a4ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_a4ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_a4ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_a4ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_a4ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_a4ed_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_a4ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_a4ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_a4ed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_a4ed_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1426_c3_1c48 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_a4ed_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_a4ed_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1423_c7_a4ed_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1423_c7_a4ed_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1423_c7_a4ed_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1415_l1408_l1411_l1395_DUPLICATE_346d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1415_l1411_l1408_l1395_l1423_l1420_DUPLICATE_032c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1415_l1411_l1408_l1423_l1420_DUPLICATE_90c5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1415_l1411_l1408_l1423_l1420_DUPLICATE_b03e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1408_l1420_l1411_DUPLICATE_8020_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1416_l1412_DUPLICATE_9161_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1415_l1420_l1411_l1423_DUPLICATE_52e1_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d9be_uxn_opcodes_h_l1431_l1390_DUPLICATE_d74d_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_a18a_right := to_unsigned(3, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_fad6_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_719a_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_a4ed_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1400_c3_9353 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1400_c3_9353;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_ac69_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_5daa_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1421_c3_7ee0 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_b579_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1421_c3_7ee0;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_a4ed_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1417_c30_7dd2_y := resize(to_signed(-1, 2), 4);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1405_c3_3a98 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1405_c3_3a98;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1417_c30_7dd2_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1409_c3_7d84 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_c472_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1409_c3_7d84;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_8635_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1426_c3_1c48 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_a4ed_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1426_c3_1c48;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1417_c30_7dd2_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_5daa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_719a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_fad6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_a18a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_8635_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_ac69_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_a4ed_iftrue := VAR_previous_ram_read;
     VAR_tmp8_MUX_uxn_opcodes_h_l1423_c7_a4ed_iftrue := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1416_c3_880a_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1408_c7_c472_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1415_c7_d6e1_iffalse := t16;
     VAR_tmp8_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1408_c7_c472_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1411_c7_b070_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1415_c7_d6e1_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1420_c7_b579_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1423_c7_a4ed_iffalse := tmp8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1415_l1411_l1408_l1423_l1420_DUPLICATE_90c5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1415_l1411_l1408_l1423_l1420_DUPLICATE_90c5_return_output := result.is_opc_done;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1395_c2_2d0e] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1395_c2_2d0e_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1408_c11_719a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1408_c11_719a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_719a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1408_c11_719a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_719a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_719a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1408_c11_719a_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1415_l1411_l1408_l1395_l1423_l1420_DUPLICATE_032c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1415_l1411_l1408_l1395_l1423_l1420_DUPLICATE_032c_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1423_c11_ac69] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1423_c11_ac69_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_ac69_left;
     BIN_OP_EQ_uxn_opcodes_h_l1423_c11_ac69_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_ac69_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_ac69_return_output := BIN_OP_EQ_uxn_opcodes_h_l1423_c11_ac69_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1416_l1412_DUPLICATE_9161 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1416_l1412_DUPLICATE_9161_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1415_l1420_l1411_l1423_DUPLICATE_52e1 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1415_l1420_l1411_l1423_DUPLICATE_52e1_return_output := result.stack_address_sp_offset;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1395_c2_2d0e] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1395_c2_2d0e_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1415_c11_a18a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1415_c11_a18a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_a18a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1415_c11_a18a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_a18a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_a18a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1415_c11_a18a_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1415_l1408_l1411_l1395_DUPLICATE_346d LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1415_l1408_l1411_l1395_DUPLICATE_346d_return_output := result.u16_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1408_l1420_l1411_DUPLICATE_8020 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1408_l1420_l1411_DUPLICATE_8020_return_output := result.sp_relative_shift;

     -- sp_relative_shift[uxn_opcodes_h_l1417_c30_7dd2] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1417_c30_7dd2_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1417_c30_7dd2_ins;
     sp_relative_shift_uxn_opcodes_h_l1417_c30_7dd2_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1417_c30_7dd2_x;
     sp_relative_shift_uxn_opcodes_h_l1417_c30_7dd2_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1417_c30_7dd2_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1417_c30_7dd2_return_output := sp_relative_shift_uxn_opcodes_h_l1417_c30_7dd2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1420_c11_8635] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1420_c11_8635_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_8635_left;
     BIN_OP_EQ_uxn_opcodes_h_l1420_c11_8635_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_8635_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_8635_return_output := BIN_OP_EQ_uxn_opcodes_h_l1420_c11_8635_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1395_c6_5daa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1395_c6_5daa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_5daa_left;
     BIN_OP_EQ_uxn_opcodes_h_l1395_c6_5daa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_5daa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_5daa_return_output := BIN_OP_EQ_uxn_opcodes_h_l1395_c6_5daa_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1395_c2_2d0e] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1395_c2_2d0e_return_output := result.is_vram_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1395_c2_2d0e] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1395_c2_2d0e_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1411_c11_fad6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1411_c11_fad6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_fad6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1411_c11_fad6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_fad6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_fad6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1411_c11_fad6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1415_l1411_l1408_l1423_l1420_DUPLICATE_b03e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1415_l1411_l1408_l1423_l1420_DUPLICATE_b03e_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_5daa_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_5daa_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_5daa_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_5daa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_5daa_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_5daa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_5daa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_5daa_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_5daa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_5daa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_5daa_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_5daa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_c472_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_719a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_c472_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_719a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_c472_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_719a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_c472_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_719a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1408_c7_c472_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_719a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1408_c7_c472_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_719a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1408_c7_c472_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_719a_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1408_c7_c472_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_719a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_b070_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_fad6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_b070_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_fad6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_b070_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_fad6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_b070_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_fad6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c7_b070_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_fad6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c7_b070_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_fad6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1411_c7_b070_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_fad6_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1411_c7_b070_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_fad6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d6e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_a18a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d6e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_a18a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d6e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_a18a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d6e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_a18a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1415_c7_d6e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_a18a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d6e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_a18a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1415_c7_d6e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_a18a_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1415_c7_d6e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_a18a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_b579_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_8635_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_b579_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_8635_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_b579_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_8635_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_b579_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_8635_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1420_c7_b579_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_8635_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1420_c7_b579_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_8635_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_a4ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_ac69_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_a4ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_ac69_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_a4ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_ac69_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_a4ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_ac69_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1423_c7_a4ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_ac69_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1416_c3_880a_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1416_l1412_DUPLICATE_9161_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1413_c3_b9d5_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1416_l1412_DUPLICATE_9161_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_c472_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1408_l1420_l1411_DUPLICATE_8020_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_b070_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1408_l1420_l1411_DUPLICATE_8020_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_b579_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1408_l1420_l1411_DUPLICATE_8020_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1415_l1408_l1411_l1395_DUPLICATE_346d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1408_c7_c472_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1415_l1408_l1411_l1395_DUPLICATE_346d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c7_b070_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1415_l1408_l1411_l1395_DUPLICATE_346d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1415_c7_d6e1_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1415_l1408_l1411_l1395_DUPLICATE_346d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_c472_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1415_l1411_l1408_l1423_l1420_DUPLICATE_90c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_b070_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1415_l1411_l1408_l1423_l1420_DUPLICATE_90c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d6e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1415_l1411_l1408_l1423_l1420_DUPLICATE_90c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_b579_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1415_l1411_l1408_l1423_l1420_DUPLICATE_90c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_a4ed_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1415_l1411_l1408_l1423_l1420_DUPLICATE_90c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_c472_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1415_l1411_l1408_l1423_l1420_DUPLICATE_b03e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_b070_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1415_l1411_l1408_l1423_l1420_DUPLICATE_b03e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d6e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1415_l1411_l1408_l1423_l1420_DUPLICATE_b03e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_b579_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1415_l1411_l1408_l1423_l1420_DUPLICATE_b03e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_a4ed_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1415_l1411_l1408_l1423_l1420_DUPLICATE_b03e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_b070_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1415_l1420_l1411_l1423_DUPLICATE_52e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d6e1_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1415_l1420_l1411_l1423_DUPLICATE_52e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_b579_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1415_l1420_l1411_l1423_DUPLICATE_52e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_a4ed_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1415_l1420_l1411_l1423_DUPLICATE_52e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1415_l1411_l1408_l1395_l1423_l1420_DUPLICATE_032c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1408_c7_c472_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1415_l1411_l1408_l1395_l1423_l1420_DUPLICATE_032c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c7_b070_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1415_l1411_l1408_l1395_l1423_l1420_DUPLICATE_032c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d6e1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1415_l1411_l1408_l1395_l1423_l1420_DUPLICATE_032c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1420_c7_b579_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1415_l1411_l1408_l1395_l1423_l1420_DUPLICATE_032c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_a4ed_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1415_l1411_l1408_l1395_l1423_l1420_DUPLICATE_032c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1395_c2_2d0e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1395_c2_2d0e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1395_c2_2d0e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1395_c2_2d0e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d6e1_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1417_c30_7dd2_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1395_c2_2d0e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1395_c2_2d0e] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1423_c7_a4ed] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_a4ed_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_a4ed_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_a4ed_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_a4ed_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_a4ed_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_a4ed_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_a4ed_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_a4ed_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1423_c7_a4ed] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_a4ed_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_a4ed_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_a4ed_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_a4ed_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_a4ed_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_a4ed_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_a4ed_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_a4ed_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1423_c7_a4ed] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1423_c7_a4ed_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1423_c7_a4ed_cond;
     tmp8_MUX_uxn_opcodes_h_l1423_c7_a4ed_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1423_c7_a4ed_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1423_c7_a4ed_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1423_c7_a4ed_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1423_c7_a4ed_return_output := tmp8_MUX_uxn_opcodes_h_l1423_c7_a4ed_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1416_c3_880a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1416_c3_880a_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1416_c3_880a_left;
     BIN_OP_OR_uxn_opcodes_h_l1416_c3_880a_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1416_c3_880a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1416_c3_880a_return_output := BIN_OP_OR_uxn_opcodes_h_l1416_c3_880a_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1413_c3_b9d5] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1413_c3_b9d5_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1413_c3_b9d5_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1413_c3_b9d5_return_output := CONST_SL_8_uxn_opcodes_h_l1413_c3_b9d5_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1395_c2_2d0e] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1423_c7_a4ed] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1423_c7_a4ed_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_a4ed_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1423_c7_a4ed_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_a4ed_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1423_c7_a4ed_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_a4ed_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_a4ed_return_output := result_u8_value_MUX_uxn_opcodes_h_l1423_c7_a4ed_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1423_c7_a4ed] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_a4ed_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_a4ed_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_a4ed_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_a4ed_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_a4ed_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_a4ed_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_a4ed_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_a4ed_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1420_c7_b579] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_b579_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_b579_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_b579_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_b579_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_b579_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_b579_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_b579_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_b579_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1395_c2_2d0e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1415_c7_d6e1_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1416_c3_880a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1415_c7_d6e1_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1416_c3_880a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1411_c7_b070_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1413_c3_b9d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_b579_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_a4ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_b579_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_a4ed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d6e1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_b579_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_b579_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_a4ed_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1420_c7_b579_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_a4ed_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1420_c7_b579_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1423_c7_a4ed_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1420_c7_b579] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_b579_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_b579_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_b579_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_b579_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_b579_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_b579_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_b579_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_b579_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1415_c7_d6e1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d6e1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d6e1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d6e1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d6e1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d6e1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d6e1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output;

     -- t16_MUX[uxn_opcodes_h_l1415_c7_d6e1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1415_c7_d6e1_cond <= VAR_t16_MUX_uxn_opcodes_h_l1415_c7_d6e1_cond;
     t16_MUX_uxn_opcodes_h_l1415_c7_d6e1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1415_c7_d6e1_iftrue;
     t16_MUX_uxn_opcodes_h_l1415_c7_d6e1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1415_c7_d6e1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output := t16_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1420_c7_b579] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1420_c7_b579_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1420_c7_b579_cond;
     tmp8_MUX_uxn_opcodes_h_l1420_c7_b579_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1420_c7_b579_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1420_c7_b579_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1420_c7_b579_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1420_c7_b579_return_output := tmp8_MUX_uxn_opcodes_h_l1420_c7_b579_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1420_c7_b579] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1420_c7_b579_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1420_c7_b579_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1420_c7_b579_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1420_c7_b579_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1420_c7_b579_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1420_c7_b579_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1420_c7_b579_return_output := result_u8_value_MUX_uxn_opcodes_h_l1420_c7_b579_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1415_c7_d6e1] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1415_c7_d6e1_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1415_c7_d6e1_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1415_c7_d6e1_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1415_c7_d6e1_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1415_c7_d6e1_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1415_c7_d6e1_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output := result_u16_value_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1420_c7_b579] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_b579_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_b579_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_b579_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_b579_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_b579_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_b579_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_b579_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_b579_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1420_c7_b579] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_b579_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_b579_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_b579_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_b579_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_b579_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_b579_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_b579_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_b579_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d6e1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_b579_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d6e1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_b579_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_b070_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d6e1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_b579_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c7_b070_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d6e1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1420_c7_b579_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1411_c7_b070_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1415_c7_d6e1_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1420_c7_b579_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1415_c7_d6e1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d6e1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d6e1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d6e1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d6e1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d6e1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d6e1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1415_c7_d6e1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d6e1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d6e1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d6e1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d6e1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d6e1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d6e1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1415_c7_d6e1] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1415_c7_d6e1_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1415_c7_d6e1_cond;
     tmp8_MUX_uxn_opcodes_h_l1415_c7_d6e1_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1415_c7_d6e1_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1415_c7_d6e1_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1415_c7_d6e1_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output := tmp8_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1415_c7_d6e1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d6e1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d6e1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d6e1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d6e1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d6e1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d6e1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output := result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output;

     -- t16_MUX[uxn_opcodes_h_l1411_c7_b070] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1411_c7_b070_cond <= VAR_t16_MUX_uxn_opcodes_h_l1411_c7_b070_cond;
     t16_MUX_uxn_opcodes_h_l1411_c7_b070_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1411_c7_b070_iftrue;
     t16_MUX_uxn_opcodes_h_l1411_c7_b070_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1411_c7_b070_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1411_c7_b070_return_output := t16_MUX_uxn_opcodes_h_l1411_c7_b070_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1411_c7_b070] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1411_c7_b070_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c7_b070_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1411_c7_b070_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c7_b070_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1411_c7_b070_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c7_b070_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c7_b070_return_output := result_u16_value_MUX_uxn_opcodes_h_l1411_c7_b070_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1415_c7_d6e1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d6e1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d6e1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d6e1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d6e1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d6e1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d6e1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1411_c7_b070] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_b070_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_b070_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_b070_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_b070_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_b070_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_b070_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_b070_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_b070_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_b070_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_b070_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_c472_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_b070_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_b070_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1408_c7_c472_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c7_b070_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c7_b070_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1408_c7_c472_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1411_c7_b070_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1411_c7_b070_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1415_c7_d6e1_return_output;
     -- t16_MUX[uxn_opcodes_h_l1408_c7_c472] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1408_c7_c472_cond <= VAR_t16_MUX_uxn_opcodes_h_l1408_c7_c472_cond;
     t16_MUX_uxn_opcodes_h_l1408_c7_c472_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1408_c7_c472_iftrue;
     t16_MUX_uxn_opcodes_h_l1408_c7_c472_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1408_c7_c472_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1408_c7_c472_return_output := t16_MUX_uxn_opcodes_h_l1408_c7_c472_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1411_c7_b070] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_b070_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_b070_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_b070_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_b070_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_b070_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_b070_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_b070_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_b070_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1411_c7_b070] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1411_c7_b070_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c7_b070_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1411_c7_b070_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c7_b070_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1411_c7_b070_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c7_b070_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c7_b070_return_output := result_u8_value_MUX_uxn_opcodes_h_l1411_c7_b070_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1411_c7_b070] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_b070_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_b070_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_b070_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_b070_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_b070_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_b070_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_b070_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_b070_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1408_c7_c472] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1408_c7_c472_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1408_c7_c472_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1408_c7_c472_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1408_c7_c472_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1408_c7_c472_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1408_c7_c472_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1408_c7_c472_return_output := result_u16_value_MUX_uxn_opcodes_h_l1408_c7_c472_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1411_c7_b070] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1411_c7_b070_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1411_c7_b070_cond;
     tmp8_MUX_uxn_opcodes_h_l1411_c7_b070_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1411_c7_b070_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1411_c7_b070_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1411_c7_b070_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1411_c7_b070_return_output := tmp8_MUX_uxn_opcodes_h_l1411_c7_b070_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1408_c7_c472] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_c472_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_c472_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_c472_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_c472_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_c472_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_c472_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_c472_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_c472_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1411_c7_b070] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_b070_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_b070_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_b070_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_b070_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_b070_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_b070_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_b070_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_b070_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_c472_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_b070_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_c472_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_b070_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_c472_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_c472_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_b070_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1408_c7_c472_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1408_c7_c472_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c7_b070_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1408_c7_c472_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1408_c7_c472_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1411_c7_b070_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1408_c7_c472] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1408_c7_c472_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1408_c7_c472_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1408_c7_c472_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1408_c7_c472_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1408_c7_c472_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1408_c7_c472_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1408_c7_c472_return_output := result_u8_value_MUX_uxn_opcodes_h_l1408_c7_c472_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1395_c2_2d0e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output := result_u16_value_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1395_c2_2d0e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1408_c7_c472] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_c472_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_c472_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_c472_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_c472_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_c472_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_c472_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_c472_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_c472_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1408_c7_c472] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1408_c7_c472_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1408_c7_c472_cond;
     tmp8_MUX_uxn_opcodes_h_l1408_c7_c472_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1408_c7_c472_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1408_c7_c472_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1408_c7_c472_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1408_c7_c472_return_output := tmp8_MUX_uxn_opcodes_h_l1408_c7_c472_return_output;

     -- t16_MUX[uxn_opcodes_h_l1395_c2_2d0e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond;
     t16_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue;
     t16_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output := t16_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1408_c7_c472] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_c472_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_c472_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_c472_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_c472_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_c472_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_c472_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_c472_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_c472_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1408_c7_c472] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_c472_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_c472_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_c472_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_c472_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_c472_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_c472_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_c472_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_c472_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_c472_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_c472_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_c472_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1408_c7_c472_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1408_c7_c472_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1395_c2_2d0e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1395_c2_2d0e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1395_c2_2d0e] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond;
     tmp8_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output := tmp8_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1395_c2_2d0e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1395_c2_2d0e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1395_c2_2d0e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1395_c2_2d0e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1395_c2_2d0e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output;

     -- Submodule level 7
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d9be_uxn_opcodes_h_l1431_l1390_DUPLICATE_d74d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d9be_uxn_opcodes_h_l1431_l1390_DUPLICATE_d74d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d9be(
     result,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_2d0e_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d9be_uxn_opcodes_h_l1431_l1390_DUPLICATE_d74d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d9be_uxn_opcodes_h_l1431_l1390_DUPLICATE_d74d_return_output;
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
