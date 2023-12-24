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
-- BIN_OP_EQ[uxn_opcodes_h_l1411_c6_1883]
signal BIN_OP_EQ_uxn_opcodes_h_l1411_c6_1883_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1411_c6_1883_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1411_c6_1883_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1411_c2_c4c6]
signal tmp8_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1411_c2_c4c6]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1411_c2_c4c6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1411_c2_c4c6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1411_c2_c4c6]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1411_c2_c4c6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1411_c2_c4c6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1411_c2_c4c6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1411_c2_c4c6]
signal result_u16_value_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1411_c2_c4c6]
signal result_u8_value_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1411_c2_c4c6]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1411_c2_c4c6]
signal t16_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1424_c11_2b6c]
signal BIN_OP_EQ_uxn_opcodes_h_l1424_c11_2b6c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1424_c11_2b6c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1424_c11_2b6c_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1424_c7_e28e]
signal tmp8_MUX_uxn_opcodes_h_l1424_c7_e28e_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1424_c7_e28e_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1424_c7_e28e_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1424_c7_e28e]
signal result_u16_value_MUX_uxn_opcodes_h_l1424_c7_e28e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1424_c7_e28e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1424_c7_e28e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1424_c7_e28e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_e28e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_e28e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_e28e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1424_c7_e28e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_e28e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_e28e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_e28e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1424_c7_e28e]
signal result_u8_value_MUX_uxn_opcodes_h_l1424_c7_e28e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1424_c7_e28e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1424_c7_e28e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1424_c7_e28e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_e28e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_e28e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_e28e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1424_c7_e28e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_e28e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_e28e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_e28e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1424_c7_e28e]
signal t16_MUX_uxn_opcodes_h_l1424_c7_e28e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1424_c7_e28e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1424_c7_e28e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1427_c11_5e1c]
signal BIN_OP_EQ_uxn_opcodes_h_l1427_c11_5e1c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1427_c11_5e1c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1427_c11_5e1c_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1427_c7_579a]
signal tmp8_MUX_uxn_opcodes_h_l1427_c7_579a_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1427_c7_579a_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1427_c7_579a_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1427_c7_579a_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1427_c7_579a]
signal result_u16_value_MUX_uxn_opcodes_h_l1427_c7_579a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1427_c7_579a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1427_c7_579a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1427_c7_579a_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1427_c7_579a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_579a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_579a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_579a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_579a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1427_c7_579a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_579a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_579a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_579a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_579a_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1427_c7_579a]
signal result_u8_value_MUX_uxn_opcodes_h_l1427_c7_579a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1427_c7_579a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1427_c7_579a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1427_c7_579a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1427_c7_579a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_579a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_579a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_579a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_579a_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1427_c7_579a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_579a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_579a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_579a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_579a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1427_c7_579a]
signal t16_MUX_uxn_opcodes_h_l1427_c7_579a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1427_c7_579a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1427_c7_579a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1427_c7_579a_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1429_c3_c353]
signal CONST_SL_8_uxn_opcodes_h_l1429_c3_c353_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1429_c3_c353_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1431_c11_c400]
signal BIN_OP_EQ_uxn_opcodes_h_l1431_c11_c400_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1431_c11_c400_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1431_c11_c400_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1431_c7_73ef]
signal tmp8_MUX_uxn_opcodes_h_l1431_c7_73ef_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1431_c7_73ef_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1431_c7_73ef_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1431_c7_73ef]
signal result_u16_value_MUX_uxn_opcodes_h_l1431_c7_73ef_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1431_c7_73ef_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1431_c7_73ef_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1431_c7_73ef]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_73ef_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_73ef_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_73ef_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1431_c7_73ef]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_73ef_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_73ef_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_73ef_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1431_c7_73ef]
signal result_u8_value_MUX_uxn_opcodes_h_l1431_c7_73ef_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1431_c7_73ef_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1431_c7_73ef_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1431_c7_73ef]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_73ef_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_73ef_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_73ef_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1431_c7_73ef]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_73ef_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_73ef_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_73ef_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1431_c7_73ef]
signal t16_MUX_uxn_opcodes_h_l1431_c7_73ef_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1431_c7_73ef_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1431_c7_73ef_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1432_c3_72cd]
signal BIN_OP_OR_uxn_opcodes_h_l1432_c3_72cd_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1432_c3_72cd_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1432_c3_72cd_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1433_c30_22de]
signal sp_relative_shift_uxn_opcodes_h_l1433_c30_22de_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1433_c30_22de_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1433_c30_22de_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1433_c30_22de_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1436_c11_f21c]
signal BIN_OP_EQ_uxn_opcodes_h_l1436_c11_f21c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1436_c11_f21c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1436_c11_f21c_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1436_c7_2996]
signal tmp8_MUX_uxn_opcodes_h_l1436_c7_2996_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1436_c7_2996_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1436_c7_2996_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1436_c7_2996_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1436_c7_2996]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_2996_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_2996_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_2996_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_2996_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1436_c7_2996]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_2996_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_2996_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_2996_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_2996_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1436_c7_2996]
signal result_u8_value_MUX_uxn_opcodes_h_l1436_c7_2996_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1436_c7_2996_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1436_c7_2996_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1436_c7_2996_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1436_c7_2996]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_2996_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_2996_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_2996_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_2996_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1436_c7_2996]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_2996_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_2996_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_2996_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_2996_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1439_c11_b87e]
signal BIN_OP_EQ_uxn_opcodes_h_l1439_c11_b87e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1439_c11_b87e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1439_c11_b87e_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1439_c7_77f3]
signal tmp8_MUX_uxn_opcodes_h_l1439_c7_77f3_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1439_c7_77f3_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1439_c7_77f3_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1439_c7_77f3_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1439_c7_77f3]
signal result_u8_value_MUX_uxn_opcodes_h_l1439_c7_77f3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1439_c7_77f3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1439_c7_77f3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1439_c7_77f3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1439_c7_77f3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_77f3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_77f3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_77f3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_77f3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1439_c7_77f3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_77f3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_77f3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_77f3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_77f3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1439_c7_77f3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_77f3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_77f3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_77f3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_77f3_return_output : unsigned(3 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
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
-- BIN_OP_EQ_uxn_opcodes_h_l1411_c6_1883
BIN_OP_EQ_uxn_opcodes_h_l1411_c6_1883 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1411_c6_1883_left,
BIN_OP_EQ_uxn_opcodes_h_l1411_c6_1883_right,
BIN_OP_EQ_uxn_opcodes_h_l1411_c6_1883_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1411_c2_c4c6
tmp8_MUX_uxn_opcodes_h_l1411_c2_c4c6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond,
tmp8_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue,
tmp8_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse,
tmp8_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6
result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_c4c6
result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_c4c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_c4c6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_c4c6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_c4c6
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_c4c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_c4c6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_c4c6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_c4c6
result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_c4c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_c4c6
result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_c4c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1411_c2_c4c6
result_u16_value_MUX_uxn_opcodes_h_l1411_c2_c4c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond,
result_u16_value_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1411_c2_c4c6
result_u8_value_MUX_uxn_opcodes_h_l1411_c2_c4c6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond,
result_u8_value_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6
result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output);

-- t16_MUX_uxn_opcodes_h_l1411_c2_c4c6
t16_MUX_uxn_opcodes_h_l1411_c2_c4c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond,
t16_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue,
t16_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse,
t16_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1424_c11_2b6c
BIN_OP_EQ_uxn_opcodes_h_l1424_c11_2b6c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1424_c11_2b6c_left,
BIN_OP_EQ_uxn_opcodes_h_l1424_c11_2b6c_right,
BIN_OP_EQ_uxn_opcodes_h_l1424_c11_2b6c_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1424_c7_e28e
tmp8_MUX_uxn_opcodes_h_l1424_c7_e28e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1424_c7_e28e_cond,
tmp8_MUX_uxn_opcodes_h_l1424_c7_e28e_iftrue,
tmp8_MUX_uxn_opcodes_h_l1424_c7_e28e_iffalse,
tmp8_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1424_c7_e28e
result_u16_value_MUX_uxn_opcodes_h_l1424_c7_e28e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1424_c7_e28e_cond,
result_u16_value_MUX_uxn_opcodes_h_l1424_c7_e28e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1424_c7_e28e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_e28e
result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_e28e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_e28e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_e28e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_e28e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_e28e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_e28e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_e28e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_e28e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_e28e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1424_c7_e28e
result_u8_value_MUX_uxn_opcodes_h_l1424_c7_e28e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1424_c7_e28e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1424_c7_e28e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1424_c7_e28e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_e28e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_e28e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_e28e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_e28e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_e28e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_e28e
result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_e28e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_e28e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_e28e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_e28e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output);

-- t16_MUX_uxn_opcodes_h_l1424_c7_e28e
t16_MUX_uxn_opcodes_h_l1424_c7_e28e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1424_c7_e28e_cond,
t16_MUX_uxn_opcodes_h_l1424_c7_e28e_iftrue,
t16_MUX_uxn_opcodes_h_l1424_c7_e28e_iffalse,
t16_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1427_c11_5e1c
BIN_OP_EQ_uxn_opcodes_h_l1427_c11_5e1c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1427_c11_5e1c_left,
BIN_OP_EQ_uxn_opcodes_h_l1427_c11_5e1c_right,
BIN_OP_EQ_uxn_opcodes_h_l1427_c11_5e1c_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1427_c7_579a
tmp8_MUX_uxn_opcodes_h_l1427_c7_579a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1427_c7_579a_cond,
tmp8_MUX_uxn_opcodes_h_l1427_c7_579a_iftrue,
tmp8_MUX_uxn_opcodes_h_l1427_c7_579a_iffalse,
tmp8_MUX_uxn_opcodes_h_l1427_c7_579a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1427_c7_579a
result_u16_value_MUX_uxn_opcodes_h_l1427_c7_579a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1427_c7_579a_cond,
result_u16_value_MUX_uxn_opcodes_h_l1427_c7_579a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1427_c7_579a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1427_c7_579a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_579a
result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_579a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_579a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_579a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_579a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_579a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_579a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_579a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_579a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_579a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_579a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_579a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1427_c7_579a
result_u8_value_MUX_uxn_opcodes_h_l1427_c7_579a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1427_c7_579a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1427_c7_579a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1427_c7_579a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1427_c7_579a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_579a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_579a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_579a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_579a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_579a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_579a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_579a
result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_579a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_579a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_579a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_579a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_579a_return_output);

-- t16_MUX_uxn_opcodes_h_l1427_c7_579a
t16_MUX_uxn_opcodes_h_l1427_c7_579a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1427_c7_579a_cond,
t16_MUX_uxn_opcodes_h_l1427_c7_579a_iftrue,
t16_MUX_uxn_opcodes_h_l1427_c7_579a_iffalse,
t16_MUX_uxn_opcodes_h_l1427_c7_579a_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1429_c3_c353
CONST_SL_8_uxn_opcodes_h_l1429_c3_c353 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1429_c3_c353_x,
CONST_SL_8_uxn_opcodes_h_l1429_c3_c353_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1431_c11_c400
BIN_OP_EQ_uxn_opcodes_h_l1431_c11_c400 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1431_c11_c400_left,
BIN_OP_EQ_uxn_opcodes_h_l1431_c11_c400_right,
BIN_OP_EQ_uxn_opcodes_h_l1431_c11_c400_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1431_c7_73ef
tmp8_MUX_uxn_opcodes_h_l1431_c7_73ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1431_c7_73ef_cond,
tmp8_MUX_uxn_opcodes_h_l1431_c7_73ef_iftrue,
tmp8_MUX_uxn_opcodes_h_l1431_c7_73ef_iffalse,
tmp8_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1431_c7_73ef
result_u16_value_MUX_uxn_opcodes_h_l1431_c7_73ef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1431_c7_73ef_cond,
result_u16_value_MUX_uxn_opcodes_h_l1431_c7_73ef_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1431_c7_73ef_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_73ef
result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_73ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_73ef_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_73ef_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_73ef_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_73ef
result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_73ef : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_73ef_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_73ef_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_73ef_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1431_c7_73ef
result_u8_value_MUX_uxn_opcodes_h_l1431_c7_73ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1431_c7_73ef_cond,
result_u8_value_MUX_uxn_opcodes_h_l1431_c7_73ef_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1431_c7_73ef_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_73ef
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_73ef : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_73ef_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_73ef_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_73ef_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_73ef
result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_73ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_73ef_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_73ef_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_73ef_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output);

-- t16_MUX_uxn_opcodes_h_l1431_c7_73ef
t16_MUX_uxn_opcodes_h_l1431_c7_73ef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1431_c7_73ef_cond,
t16_MUX_uxn_opcodes_h_l1431_c7_73ef_iftrue,
t16_MUX_uxn_opcodes_h_l1431_c7_73ef_iffalse,
t16_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1432_c3_72cd
BIN_OP_OR_uxn_opcodes_h_l1432_c3_72cd : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1432_c3_72cd_left,
BIN_OP_OR_uxn_opcodes_h_l1432_c3_72cd_right,
BIN_OP_OR_uxn_opcodes_h_l1432_c3_72cd_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1433_c30_22de
sp_relative_shift_uxn_opcodes_h_l1433_c30_22de : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1433_c30_22de_ins,
sp_relative_shift_uxn_opcodes_h_l1433_c30_22de_x,
sp_relative_shift_uxn_opcodes_h_l1433_c30_22de_y,
sp_relative_shift_uxn_opcodes_h_l1433_c30_22de_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1436_c11_f21c
BIN_OP_EQ_uxn_opcodes_h_l1436_c11_f21c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1436_c11_f21c_left,
BIN_OP_EQ_uxn_opcodes_h_l1436_c11_f21c_right,
BIN_OP_EQ_uxn_opcodes_h_l1436_c11_f21c_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1436_c7_2996
tmp8_MUX_uxn_opcodes_h_l1436_c7_2996 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1436_c7_2996_cond,
tmp8_MUX_uxn_opcodes_h_l1436_c7_2996_iftrue,
tmp8_MUX_uxn_opcodes_h_l1436_c7_2996_iffalse,
tmp8_MUX_uxn_opcodes_h_l1436_c7_2996_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_2996
result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_2996 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_2996_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_2996_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_2996_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_2996_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_2996
result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_2996 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_2996_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_2996_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_2996_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_2996_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1436_c7_2996
result_u8_value_MUX_uxn_opcodes_h_l1436_c7_2996 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1436_c7_2996_cond,
result_u8_value_MUX_uxn_opcodes_h_l1436_c7_2996_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1436_c7_2996_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1436_c7_2996_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_2996
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_2996 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_2996_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_2996_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_2996_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_2996_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_2996
result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_2996 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_2996_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_2996_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_2996_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_2996_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1439_c11_b87e
BIN_OP_EQ_uxn_opcodes_h_l1439_c11_b87e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1439_c11_b87e_left,
BIN_OP_EQ_uxn_opcodes_h_l1439_c11_b87e_right,
BIN_OP_EQ_uxn_opcodes_h_l1439_c11_b87e_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1439_c7_77f3
tmp8_MUX_uxn_opcodes_h_l1439_c7_77f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1439_c7_77f3_cond,
tmp8_MUX_uxn_opcodes_h_l1439_c7_77f3_iftrue,
tmp8_MUX_uxn_opcodes_h_l1439_c7_77f3_iffalse,
tmp8_MUX_uxn_opcodes_h_l1439_c7_77f3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1439_c7_77f3
result_u8_value_MUX_uxn_opcodes_h_l1439_c7_77f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1439_c7_77f3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1439_c7_77f3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1439_c7_77f3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1439_c7_77f3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_77f3
result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_77f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_77f3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_77f3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_77f3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_77f3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_77f3
result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_77f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_77f3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_77f3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_77f3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_77f3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_77f3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_77f3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_77f3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_77f3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_77f3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_77f3_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1411_c6_1883_return_output,
 tmp8_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output,
 t16_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1424_c11_2b6c_return_output,
 tmp8_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output,
 t16_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1427_c11_5e1c_return_output,
 tmp8_MUX_uxn_opcodes_h_l1427_c7_579a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1427_c7_579a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_579a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_579a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1427_c7_579a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_579a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_579a_return_output,
 t16_MUX_uxn_opcodes_h_l1427_c7_579a_return_output,
 CONST_SL_8_uxn_opcodes_h_l1429_c3_c353_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1431_c11_c400_return_output,
 tmp8_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output,
 t16_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1432_c3_72cd_return_output,
 sp_relative_shift_uxn_opcodes_h_l1433_c30_22de_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1436_c11_f21c_return_output,
 tmp8_MUX_uxn_opcodes_h_l1436_c7_2996_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_2996_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_2996_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1436_c7_2996_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_2996_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_2996_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1439_c11_b87e_return_output,
 tmp8_MUX_uxn_opcodes_h_l1439_c7_77f3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1439_c7_77f3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_77f3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_77f3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_77f3_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c6_1883_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c6_1883_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c6_1883_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1411_c2_c4c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1416_c3_7e2b : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1411_c2_c4c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1421_c3_0d97 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1411_c2_c4c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1411_c2_c4c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1424_c11_2b6c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1424_c11_2b6c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1424_c11_2b6c_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1424_c7_e28e_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1424_c7_e28e_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1427_c7_579a_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1424_c7_e28e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1424_c7_e28e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1424_c7_e28e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1427_c7_579a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1424_c7_e28e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_e28e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_e28e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_579a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_e28e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_e28e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_e28e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_579a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_e28e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1424_c7_e28e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1424_c7_e28e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_579a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1424_c7_e28e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_e28e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1425_c3_2950 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_e28e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_579a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_e28e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_e28e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_e28e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_579a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_e28e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1424_c7_e28e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1424_c7_e28e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1427_c7_579a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1424_c7_e28e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_5e1c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_5e1c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_5e1c_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1427_c7_579a_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1427_c7_579a_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1427_c7_579a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1427_c7_579a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1427_c7_579a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1427_c7_579a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_579a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_579a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_579a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_579a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_579a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_579a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_579a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_579a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_579a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_579a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_579a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_579a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_579a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_579a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_579a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1427_c7_579a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1427_c7_579a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1427_c7_579a_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1429_c3_c353_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1429_c3_c353_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_c400_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_c400_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_c400_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1431_c7_73ef_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1431_c7_73ef_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1436_c7_2996_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1431_c7_73ef_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1431_c7_73ef_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1431_c7_73ef_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1431_c7_73ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_73ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_73ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_2996_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_73ef_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_73ef_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_73ef_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_2996_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_73ef_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1431_c7_73ef_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1431_c7_73ef_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c7_2996_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1431_c7_73ef_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_73ef_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_73ef_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_2996_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_73ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_73ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_73ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_2996_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_73ef_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1431_c7_73ef_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1431_c7_73ef_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1431_c7_73ef_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1432_c3_72cd_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1432_c3_72cd_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1432_c3_72cd_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1433_c30_22de_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1433_c30_22de_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1433_c30_22de_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1433_c30_22de_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_f21c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_f21c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_f21c_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1436_c7_2996_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1436_c7_2996_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1439_c7_77f3_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1436_c7_2996_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_2996_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_2996_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_77f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_2996_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_2996_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1437_c3_bbd3 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_2996_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_2996_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c7_2996_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c7_2996_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_77f3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c7_2996_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_2996_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_2996_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_77f3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_2996_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_2996_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_2996_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_77f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_2996_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_b87e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_b87e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_b87e_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1439_c7_77f3_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1439_c7_77f3_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1439_c7_77f3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_77f3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_77f3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_77f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_77f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_77f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_77f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_77f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_77f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_77f3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_77f3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1442_c3_6de7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_77f3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_77f3_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1411_l1431_l1424_l1427_DUPLICATE_191b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1424_l1411_l1439_l1436_l1431_l1427_DUPLICATE_af1d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1424_l1439_l1436_l1431_l1427_DUPLICATE_9a01_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1424_l1436_l1427_DUPLICATE_6373_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1424_l1439_l1436_l1431_l1427_DUPLICATE_9070_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1432_l1428_DUPLICATE_c63f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1439_l1431_l1436_l1427_DUPLICATE_6fba_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_42c1_uxn_opcodes_h_l1447_l1406_DUPLICATE_7ec9_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1424_c11_2b6c_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_b87e_right := to_unsigned(5, 3);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1442_c3_6de7 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_77f3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1442_c3_6de7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_5e1c_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1433_c30_22de_y := resize(to_signed(-1, 2), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_c400_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1425_c3_2950 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_e28e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1425_c3_2950;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_f21c_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1433_c30_22de_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1421_c3_0d97 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1421_c3_0d97;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_77f3_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c6_1883_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_77f3_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1416_c3_7e2b := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1416_c3_7e2b;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1437_c3_bbd3 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_2996_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1437_c3_bbd3;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1433_c30_22de_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c6_1883_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1424_c11_2b6c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_5e1c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_c400_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_f21c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_b87e_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_77f3_iftrue := VAR_previous_ram_read;
     VAR_tmp8_MUX_uxn_opcodes_h_l1439_c7_77f3_iftrue := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1432_c3_72cd_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1424_c7_e28e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1431_c7_73ef_iffalse := t16;
     VAR_tmp8_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1424_c7_e28e_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1427_c7_579a_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1431_c7_73ef_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1436_c7_2996_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1439_c7_77f3_iffalse := tmp8;
     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1411_c2_c4c6] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1411_c2_c4c6_return_output := result.is_pc_updated;

     -- sp_relative_shift[uxn_opcodes_h_l1433_c30_22de] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1433_c30_22de_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1433_c30_22de_ins;
     sp_relative_shift_uxn_opcodes_h_l1433_c30_22de_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1433_c30_22de_x;
     sp_relative_shift_uxn_opcodes_h_l1433_c30_22de_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1433_c30_22de_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1433_c30_22de_return_output := sp_relative_shift_uxn_opcodes_h_l1433_c30_22de_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1411_c2_c4c6] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1411_c2_c4c6_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1436_c11_f21c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1436_c11_f21c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_f21c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1436_c11_f21c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_f21c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_f21c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1436_c11_f21c_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1424_l1436_l1427_DUPLICATE_6373 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1424_l1436_l1427_DUPLICATE_6373_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1439_c11_b87e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1439_c11_b87e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_b87e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1439_c11_b87e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_b87e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_b87e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1439_c11_b87e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1424_l1439_l1436_l1431_l1427_DUPLICATE_9a01 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1424_l1439_l1436_l1431_l1427_DUPLICATE_9a01_return_output := result.is_opc_done;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1411_c2_c4c6] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1411_c2_c4c6_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1424_l1411_l1439_l1436_l1431_l1427_DUPLICATE_af1d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1424_l1411_l1439_l1436_l1431_l1427_DUPLICATE_af1d_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1431_c11_c400] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1431_c11_c400_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_c400_left;
     BIN_OP_EQ_uxn_opcodes_h_l1431_c11_c400_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_c400_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_c400_return_output := BIN_OP_EQ_uxn_opcodes_h_l1431_c11_c400_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1424_c11_2b6c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1424_c11_2b6c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1424_c11_2b6c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1424_c11_2b6c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1424_c11_2b6c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1424_c11_2b6c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1424_c11_2b6c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1424_l1439_l1436_l1431_l1427_DUPLICATE_9070 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1424_l1439_l1436_l1431_l1427_DUPLICATE_9070_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1411_l1431_l1424_l1427_DUPLICATE_191b LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1411_l1431_l1424_l1427_DUPLICATE_191b_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1411_c6_1883] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1411_c6_1883_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c6_1883_left;
     BIN_OP_EQ_uxn_opcodes_h_l1411_c6_1883_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c6_1883_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c6_1883_return_output := BIN_OP_EQ_uxn_opcodes_h_l1411_c6_1883_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1439_l1431_l1436_l1427_DUPLICATE_6fba LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1439_l1431_l1436_l1427_DUPLICATE_6fba_return_output := result.stack_address_sp_offset;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1411_c2_c4c6] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1411_c2_c4c6_return_output := result.is_vram_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1432_l1428_DUPLICATE_c63f LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1432_l1428_DUPLICATE_c63f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1427_c11_5e1c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1427_c11_5e1c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_5e1c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1427_c11_5e1c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_5e1c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_5e1c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1427_c11_5e1c_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c6_1883_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c6_1883_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c6_1883_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c6_1883_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c6_1883_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c6_1883_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c6_1883_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c6_1883_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c6_1883_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c6_1883_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c6_1883_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c6_1883_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_e28e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1424_c11_2b6c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_e28e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1424_c11_2b6c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_e28e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1424_c11_2b6c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_e28e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1424_c11_2b6c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1424_c7_e28e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1424_c11_2b6c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1424_c7_e28e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1424_c11_2b6c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1424_c7_e28e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1424_c11_2b6c_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1424_c7_e28e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1424_c11_2b6c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_579a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_5e1c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_579a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_5e1c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_579a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_5e1c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_579a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_5e1c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1427_c7_579a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_5e1c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_579a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_5e1c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1427_c7_579a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_5e1c_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1427_c7_579a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_5e1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_73ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_c400_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_73ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_c400_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_73ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_c400_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_73ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_c400_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1431_c7_73ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_c400_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1431_c7_73ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_c400_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1431_c7_73ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_c400_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1431_c7_73ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_c400_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_2996_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_f21c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_2996_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_f21c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_2996_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_f21c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_2996_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_f21c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c7_2996_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_f21c_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1436_c7_2996_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_f21c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_77f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_b87e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_77f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_b87e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_77f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_b87e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_77f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_b87e_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1439_c7_77f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_b87e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1432_c3_72cd_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1432_l1428_DUPLICATE_c63f_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1429_c3_c353_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1432_l1428_DUPLICATE_c63f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_e28e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1424_l1436_l1427_DUPLICATE_6373_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_579a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1424_l1436_l1427_DUPLICATE_6373_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_2996_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1424_l1436_l1427_DUPLICATE_6373_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1411_l1431_l1424_l1427_DUPLICATE_191b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1424_c7_e28e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1411_l1431_l1424_l1427_DUPLICATE_191b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1427_c7_579a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1411_l1431_l1424_l1427_DUPLICATE_191b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1431_c7_73ef_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1411_l1431_l1424_l1427_DUPLICATE_191b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_e28e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1424_l1439_l1436_l1431_l1427_DUPLICATE_9a01_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_579a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1424_l1439_l1436_l1431_l1427_DUPLICATE_9a01_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_73ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1424_l1439_l1436_l1431_l1427_DUPLICATE_9a01_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_2996_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1424_l1439_l1436_l1431_l1427_DUPLICATE_9a01_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_77f3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1424_l1439_l1436_l1431_l1427_DUPLICATE_9a01_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_e28e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1424_l1439_l1436_l1431_l1427_DUPLICATE_9070_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_579a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1424_l1439_l1436_l1431_l1427_DUPLICATE_9070_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_73ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1424_l1439_l1436_l1431_l1427_DUPLICATE_9070_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_2996_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1424_l1439_l1436_l1431_l1427_DUPLICATE_9070_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_77f3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1424_l1439_l1436_l1431_l1427_DUPLICATE_9070_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_579a_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1439_l1431_l1436_l1427_DUPLICATE_6fba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_73ef_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1439_l1431_l1436_l1427_DUPLICATE_6fba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_2996_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1439_l1431_l1436_l1427_DUPLICATE_6fba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_77f3_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1439_l1431_l1436_l1427_DUPLICATE_6fba_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1424_l1411_l1439_l1436_l1431_l1427_DUPLICATE_af1d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1424_c7_e28e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1424_l1411_l1439_l1436_l1431_l1427_DUPLICATE_af1d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_579a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1424_l1411_l1439_l1436_l1431_l1427_DUPLICATE_af1d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1431_c7_73ef_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1424_l1411_l1439_l1436_l1431_l1427_DUPLICATE_af1d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c7_2996_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1424_l1411_l1439_l1436_l1431_l1427_DUPLICATE_af1d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_77f3_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1424_l1411_l1439_l1436_l1431_l1427_DUPLICATE_af1d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1411_c2_c4c6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1411_c2_c4c6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1411_c2_c4c6_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1411_c2_c4c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_73ef_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1433_c30_22de_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1432_c3_72cd] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1432_c3_72cd_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1432_c3_72cd_left;
     BIN_OP_OR_uxn_opcodes_h_l1432_c3_72cd_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1432_c3_72cd_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1432_c3_72cd_return_output := BIN_OP_OR_uxn_opcodes_h_l1432_c3_72cd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1439_c7_77f3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_77f3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_77f3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_77f3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_77f3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_77f3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_77f3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_77f3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_77f3_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1429_c3_c353] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1429_c3_c353_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1429_c3_c353_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1429_c3_c353_return_output := CONST_SL_8_uxn_opcodes_h_l1429_c3_c353_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1436_c7_2996] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_2996_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_2996_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_2996_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_2996_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_2996_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_2996_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_2996_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_2996_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1439_c7_77f3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_77f3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_77f3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_77f3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_77f3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_77f3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_77f3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_77f3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_77f3_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1411_c2_c4c6] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1439_c7_77f3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_77f3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_77f3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_77f3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_77f3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_77f3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_77f3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_77f3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_77f3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1411_c2_c4c6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1411_c2_c4c6] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1439_c7_77f3] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1439_c7_77f3_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1439_c7_77f3_cond;
     tmp8_MUX_uxn_opcodes_h_l1439_c7_77f3_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1439_c7_77f3_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1439_c7_77f3_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1439_c7_77f3_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1439_c7_77f3_return_output := tmp8_MUX_uxn_opcodes_h_l1439_c7_77f3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1439_c7_77f3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1439_c7_77f3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_77f3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1439_c7_77f3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_77f3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1439_c7_77f3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_77f3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_77f3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1439_c7_77f3_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1411_c2_c4c6] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1431_c7_73ef_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1432_c3_72cd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1431_c7_73ef_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1432_c3_72cd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1427_c7_579a_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1429_c3_c353_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_2996_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_77f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_2996_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_77f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_73ef_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_2996_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_2996_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_77f3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c7_2996_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_77f3_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1436_c7_2996_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1439_c7_77f3_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1436_c7_2996] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_2996_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_2996_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_2996_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_2996_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_2996_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_2996_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_2996_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_2996_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1436_c7_2996] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1436_c7_2996_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1436_c7_2996_cond;
     tmp8_MUX_uxn_opcodes_h_l1436_c7_2996_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1436_c7_2996_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1436_c7_2996_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1436_c7_2996_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1436_c7_2996_return_output := tmp8_MUX_uxn_opcodes_h_l1436_c7_2996_return_output;

     -- t16_MUX[uxn_opcodes_h_l1431_c7_73ef] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1431_c7_73ef_cond <= VAR_t16_MUX_uxn_opcodes_h_l1431_c7_73ef_cond;
     t16_MUX_uxn_opcodes_h_l1431_c7_73ef_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1431_c7_73ef_iftrue;
     t16_MUX_uxn_opcodes_h_l1431_c7_73ef_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1431_c7_73ef_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output := t16_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1431_c7_73ef] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1431_c7_73ef_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1431_c7_73ef_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1431_c7_73ef_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1431_c7_73ef_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1431_c7_73ef_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1431_c7_73ef_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output := result_u16_value_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1431_c7_73ef] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_73ef_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_73ef_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_73ef_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_73ef_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_73ef_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_73ef_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1436_c7_2996] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_2996_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_2996_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_2996_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_2996_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_2996_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_2996_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_2996_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_2996_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1436_c7_2996] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_2996_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_2996_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_2996_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_2996_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_2996_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_2996_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_2996_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_2996_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1436_c7_2996] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1436_c7_2996_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c7_2996_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1436_c7_2996_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c7_2996_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1436_c7_2996_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c7_2996_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c7_2996_return_output := result_u8_value_MUX_uxn_opcodes_h_l1436_c7_2996_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_73ef_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_2996_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_73ef_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_2996_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_579a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_73ef_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_2996_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1427_c7_579a_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1431_c7_73ef_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c7_2996_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1427_c7_579a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1431_c7_73ef_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1436_c7_2996_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l1431_c7_73ef] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1431_c7_73ef_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1431_c7_73ef_cond;
     tmp8_MUX_uxn_opcodes_h_l1431_c7_73ef_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1431_c7_73ef_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1431_c7_73ef_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1431_c7_73ef_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output := tmp8_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1431_c7_73ef] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_73ef_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_73ef_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_73ef_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_73ef_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_73ef_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_73ef_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1431_c7_73ef] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_73ef_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_73ef_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_73ef_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_73ef_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_73ef_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_73ef_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1431_c7_73ef] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_73ef_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_73ef_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_73ef_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_73ef_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_73ef_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_73ef_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output;

     -- t16_MUX[uxn_opcodes_h_l1427_c7_579a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1427_c7_579a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1427_c7_579a_cond;
     t16_MUX_uxn_opcodes_h_l1427_c7_579a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1427_c7_579a_iftrue;
     t16_MUX_uxn_opcodes_h_l1427_c7_579a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1427_c7_579a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1427_c7_579a_return_output := t16_MUX_uxn_opcodes_h_l1427_c7_579a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1431_c7_73ef] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1431_c7_73ef_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1431_c7_73ef_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1431_c7_73ef_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1431_c7_73ef_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1431_c7_73ef_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1431_c7_73ef_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output := result_u8_value_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1427_c7_579a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_579a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_579a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_579a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_579a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_579a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_579a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_579a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_579a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1427_c7_579a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1427_c7_579a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1427_c7_579a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1427_c7_579a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1427_c7_579a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1427_c7_579a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1427_c7_579a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1427_c7_579a_return_output := result_u16_value_MUX_uxn_opcodes_h_l1427_c7_579a_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_579a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_579a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_e28e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1427_c7_579a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_579a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1424_c7_e28e_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1427_c7_579a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_579a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1424_c7_e28e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1427_c7_579a_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1427_c7_579a_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1431_c7_73ef_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1427_c7_579a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_579a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_579a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_579a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_579a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_579a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_579a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_579a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_579a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1427_c7_579a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_579a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_579a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_579a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_579a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_579a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_579a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_579a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_579a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1427_c7_579a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1427_c7_579a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_579a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1427_c7_579a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_579a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1427_c7_579a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_579a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_579a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1427_c7_579a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1427_c7_579a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_579a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_579a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_579a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_579a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_579a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_579a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_579a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_579a_return_output;

     -- t16_MUX[uxn_opcodes_h_l1424_c7_e28e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1424_c7_e28e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1424_c7_e28e_cond;
     t16_MUX_uxn_opcodes_h_l1424_c7_e28e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1424_c7_e28e_iftrue;
     t16_MUX_uxn_opcodes_h_l1424_c7_e28e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1424_c7_e28e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output := t16_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1424_c7_e28e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_e28e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_e28e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_e28e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_e28e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_e28e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_e28e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1424_c7_e28e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1424_c7_e28e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1424_c7_e28e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1424_c7_e28e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1424_c7_e28e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1424_c7_e28e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1424_c7_e28e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output := result_u16_value_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1427_c7_579a] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1427_c7_579a_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1427_c7_579a_cond;
     tmp8_MUX_uxn_opcodes_h_l1427_c7_579a_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1427_c7_579a_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1427_c7_579a_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1427_c7_579a_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1427_c7_579a_return_output := tmp8_MUX_uxn_opcodes_h_l1427_c7_579a_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_e28e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_579a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_e28e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_579a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_e28e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_579a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1424_c7_e28e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_579a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1424_c7_e28e_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1427_c7_579a_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1424_c7_e28e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1424_c7_e28e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1424_c7_e28e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1424_c7_e28e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1424_c7_e28e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1424_c7_e28e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1424_c7_e28e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1424_c7_e28e] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1424_c7_e28e_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1424_c7_e28e_cond;
     tmp8_MUX_uxn_opcodes_h_l1424_c7_e28e_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1424_c7_e28e_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1424_c7_e28e_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1424_c7_e28e_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output := tmp8_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1424_c7_e28e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_e28e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_e28e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_e28e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_e28e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_e28e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_e28e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1411_c2_c4c6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1424_c7_e28e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_e28e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_e28e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_e28e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_e28e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_e28e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_e28e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output;

     -- t16_MUX[uxn_opcodes_h_l1411_c2_c4c6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond <= VAR_t16_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond;
     t16_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue;
     t16_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output := t16_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1411_c2_c4c6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output := result_u16_value_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1424_c7_e28e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_e28e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_e28e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_e28e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_e28e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_e28e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_e28e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1424_c7_e28e_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l1411_c2_c4c6] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond;
     tmp8_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output := tmp8_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1411_c2_c4c6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1411_c2_c4c6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1411_c2_c4c6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1411_c2_c4c6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c2_c4c6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c2_c4c6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c2_c4c6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output := result_u8_value_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output;

     -- Submodule level 7
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_42c1_uxn_opcodes_h_l1447_l1406_DUPLICATE_7ec9 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_42c1_uxn_opcodes_h_l1447_l1406_DUPLICATE_7ec9_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_42c1(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1411_c2_c4c6_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_42c1_uxn_opcodes_h_l1447_l1406_DUPLICATE_7ec9_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_42c1_uxn_opcodes_h_l1447_l1406_DUPLICATE_7ec9_return_output;
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
