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
-- BIN_OP_EQ[uxn_opcodes_h_l1395_c6_6d3a]
signal BIN_OP_EQ_uxn_opcodes_h_l1395_c6_6d3a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1395_c6_6d3a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1395_c6_6d3a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1395_c2_1c7d]
signal t16_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1395_c2_1c7d]
signal result_u16_value_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1395_c2_1c7d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1395_c2_1c7d]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1395_c2_1c7d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1395_c2_1c7d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1395_c2_1c7d]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1395_c2_1c7d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1395_c2_1c7d]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1395_c2_1c7d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1395_c2_1c7d]
signal result_u8_value_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1395_c2_1c7d]
signal tmp8_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1408_c11_c1bb]
signal BIN_OP_EQ_uxn_opcodes_h_l1408_c11_c1bb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1408_c11_c1bb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1408_c11_c1bb_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1408_c7_5c12]
signal t16_MUX_uxn_opcodes_h_l1408_c7_5c12_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1408_c7_5c12_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1408_c7_5c12_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1408_c7_5c12]
signal result_u16_value_MUX_uxn_opcodes_h_l1408_c7_5c12_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1408_c7_5c12_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1408_c7_5c12_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1408_c7_5c12]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_5c12_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_5c12_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_5c12_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1408_c7_5c12]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_5c12_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_5c12_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_5c12_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1408_c7_5c12]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_5c12_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_5c12_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_5c12_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1408_c7_5c12]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_5c12_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_5c12_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_5c12_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1408_c7_5c12]
signal result_u8_value_MUX_uxn_opcodes_h_l1408_c7_5c12_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1408_c7_5c12_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1408_c7_5c12_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1408_c7_5c12]
signal tmp8_MUX_uxn_opcodes_h_l1408_c7_5c12_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1408_c7_5c12_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1408_c7_5c12_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1411_c11_f170]
signal BIN_OP_EQ_uxn_opcodes_h_l1411_c11_f170_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1411_c11_f170_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1411_c11_f170_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1411_c7_81bf]
signal t16_MUX_uxn_opcodes_h_l1411_c7_81bf_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1411_c7_81bf_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1411_c7_81bf_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1411_c7_81bf]
signal result_u16_value_MUX_uxn_opcodes_h_l1411_c7_81bf_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1411_c7_81bf_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1411_c7_81bf_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1411_c7_81bf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_81bf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_81bf_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_81bf_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1411_c7_81bf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_81bf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_81bf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_81bf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1411_c7_81bf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_81bf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_81bf_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_81bf_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1411_c7_81bf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_81bf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_81bf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_81bf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1411_c7_81bf]
signal result_u8_value_MUX_uxn_opcodes_h_l1411_c7_81bf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1411_c7_81bf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1411_c7_81bf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1411_c7_81bf]
signal tmp8_MUX_uxn_opcodes_h_l1411_c7_81bf_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1411_c7_81bf_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1411_c7_81bf_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1413_c3_d8bd]
signal CONST_SL_8_uxn_opcodes_h_l1413_c3_d8bd_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1413_c3_d8bd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1415_c11_25bd]
signal BIN_OP_EQ_uxn_opcodes_h_l1415_c11_25bd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1415_c11_25bd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1415_c11_25bd_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1415_c7_82e3]
signal t16_MUX_uxn_opcodes_h_l1415_c7_82e3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1415_c7_82e3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1415_c7_82e3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1415_c7_82e3]
signal result_u16_value_MUX_uxn_opcodes_h_l1415_c7_82e3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1415_c7_82e3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1415_c7_82e3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1415_c7_82e3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_82e3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_82e3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_82e3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1415_c7_82e3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_82e3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_82e3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_82e3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1415_c7_82e3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_82e3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_82e3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_82e3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1415_c7_82e3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_82e3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_82e3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_82e3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1415_c7_82e3]
signal result_u8_value_MUX_uxn_opcodes_h_l1415_c7_82e3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1415_c7_82e3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1415_c7_82e3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1415_c7_82e3]
signal tmp8_MUX_uxn_opcodes_h_l1415_c7_82e3_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1415_c7_82e3_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1415_c7_82e3_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1416_c3_dc53]
signal BIN_OP_OR_uxn_opcodes_h_l1416_c3_dc53_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1416_c3_dc53_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1416_c3_dc53_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1417_c30_ec09]
signal sp_relative_shift_uxn_opcodes_h_l1417_c30_ec09_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1417_c30_ec09_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1417_c30_ec09_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1417_c30_ec09_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1420_c11_a144]
signal BIN_OP_EQ_uxn_opcodes_h_l1420_c11_a144_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1420_c11_a144_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1420_c11_a144_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1420_c7_0a87]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0a87_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0a87_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0a87_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0a87_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1420_c7_0a87]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0a87_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0a87_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0a87_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0a87_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1420_c7_0a87]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0a87_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0a87_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0a87_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0a87_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1420_c7_0a87]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0a87_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0a87_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0a87_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0a87_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1420_c7_0a87]
signal result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0a87_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0a87_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0a87_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0a87_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1420_c7_0a87]
signal tmp8_MUX_uxn_opcodes_h_l1420_c7_0a87_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1420_c7_0a87_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1420_c7_0a87_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1420_c7_0a87_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1423_c11_f2f6]
signal BIN_OP_EQ_uxn_opcodes_h_l1423_c11_f2f6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1423_c11_f2f6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1423_c11_f2f6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1423_c7_8f52]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_8f52_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_8f52_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_8f52_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_8f52_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1423_c7_8f52]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_8f52_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_8f52_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_8f52_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_8f52_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1423_c7_8f52]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_8f52_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_8f52_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_8f52_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_8f52_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1423_c7_8f52]
signal result_u8_value_MUX_uxn_opcodes_h_l1423_c7_8f52_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1423_c7_8f52_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1423_c7_8f52_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1423_c7_8f52_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1423_c7_8f52]
signal tmp8_MUX_uxn_opcodes_h_l1423_c7_8f52_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1423_c7_8f52_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1423_c7_8f52_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1423_c7_8f52_return_output : unsigned(7 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_a906( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u16_value := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_vram_write := ref_toks_8;
      base.is_pc_updated := ref_toks_9;
      base.u8_value := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1395_c6_6d3a
BIN_OP_EQ_uxn_opcodes_h_l1395_c6_6d3a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1395_c6_6d3a_left,
BIN_OP_EQ_uxn_opcodes_h_l1395_c6_6d3a_right,
BIN_OP_EQ_uxn_opcodes_h_l1395_c6_6d3a_return_output);

-- t16_MUX_uxn_opcodes_h_l1395_c2_1c7d
t16_MUX_uxn_opcodes_h_l1395_c2_1c7d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond,
t16_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue,
t16_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse,
t16_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1395_c2_1c7d
result_u16_value_MUX_uxn_opcodes_h_l1395_c2_1c7d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond,
result_u16_value_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_1c7d
result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_1c7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d
result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_1c7d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_1c7d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_1c7d
result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_1c7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_1c7d
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_1c7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_1c7d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_1c7d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d
result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_1c7d
result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_1c7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1395_c2_1c7d
result_u8_value_MUX_uxn_opcodes_h_l1395_c2_1c7d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1395_c2_1c7d
tmp8_MUX_uxn_opcodes_h_l1395_c2_1c7d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond,
tmp8_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue,
tmp8_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse,
tmp8_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1408_c11_c1bb
BIN_OP_EQ_uxn_opcodes_h_l1408_c11_c1bb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1408_c11_c1bb_left,
BIN_OP_EQ_uxn_opcodes_h_l1408_c11_c1bb_right,
BIN_OP_EQ_uxn_opcodes_h_l1408_c11_c1bb_return_output);

-- t16_MUX_uxn_opcodes_h_l1408_c7_5c12
t16_MUX_uxn_opcodes_h_l1408_c7_5c12 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1408_c7_5c12_cond,
t16_MUX_uxn_opcodes_h_l1408_c7_5c12_iftrue,
t16_MUX_uxn_opcodes_h_l1408_c7_5c12_iffalse,
t16_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1408_c7_5c12
result_u16_value_MUX_uxn_opcodes_h_l1408_c7_5c12 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1408_c7_5c12_cond,
result_u16_value_MUX_uxn_opcodes_h_l1408_c7_5c12_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1408_c7_5c12_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_5c12
result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_5c12 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_5c12_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_5c12_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_5c12_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_5c12
result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_5c12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_5c12_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_5c12_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_5c12_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_5c12
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_5c12 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_5c12_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_5c12_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_5c12_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_5c12
result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_5c12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_5c12_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_5c12_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_5c12_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1408_c7_5c12
result_u8_value_MUX_uxn_opcodes_h_l1408_c7_5c12 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1408_c7_5c12_cond,
result_u8_value_MUX_uxn_opcodes_h_l1408_c7_5c12_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1408_c7_5c12_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1408_c7_5c12
tmp8_MUX_uxn_opcodes_h_l1408_c7_5c12 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1408_c7_5c12_cond,
tmp8_MUX_uxn_opcodes_h_l1408_c7_5c12_iftrue,
tmp8_MUX_uxn_opcodes_h_l1408_c7_5c12_iffalse,
tmp8_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1411_c11_f170
BIN_OP_EQ_uxn_opcodes_h_l1411_c11_f170 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1411_c11_f170_left,
BIN_OP_EQ_uxn_opcodes_h_l1411_c11_f170_right,
BIN_OP_EQ_uxn_opcodes_h_l1411_c11_f170_return_output);

-- t16_MUX_uxn_opcodes_h_l1411_c7_81bf
t16_MUX_uxn_opcodes_h_l1411_c7_81bf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1411_c7_81bf_cond,
t16_MUX_uxn_opcodes_h_l1411_c7_81bf_iftrue,
t16_MUX_uxn_opcodes_h_l1411_c7_81bf_iffalse,
t16_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1411_c7_81bf
result_u16_value_MUX_uxn_opcodes_h_l1411_c7_81bf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1411_c7_81bf_cond,
result_u16_value_MUX_uxn_opcodes_h_l1411_c7_81bf_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1411_c7_81bf_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_81bf
result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_81bf : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_81bf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_81bf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_81bf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_81bf
result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_81bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_81bf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_81bf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_81bf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_81bf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_81bf : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_81bf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_81bf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_81bf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_81bf
result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_81bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_81bf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_81bf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_81bf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1411_c7_81bf
result_u8_value_MUX_uxn_opcodes_h_l1411_c7_81bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1411_c7_81bf_cond,
result_u8_value_MUX_uxn_opcodes_h_l1411_c7_81bf_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1411_c7_81bf_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1411_c7_81bf
tmp8_MUX_uxn_opcodes_h_l1411_c7_81bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1411_c7_81bf_cond,
tmp8_MUX_uxn_opcodes_h_l1411_c7_81bf_iftrue,
tmp8_MUX_uxn_opcodes_h_l1411_c7_81bf_iffalse,
tmp8_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1413_c3_d8bd
CONST_SL_8_uxn_opcodes_h_l1413_c3_d8bd : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1413_c3_d8bd_x,
CONST_SL_8_uxn_opcodes_h_l1413_c3_d8bd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1415_c11_25bd
BIN_OP_EQ_uxn_opcodes_h_l1415_c11_25bd : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1415_c11_25bd_left,
BIN_OP_EQ_uxn_opcodes_h_l1415_c11_25bd_right,
BIN_OP_EQ_uxn_opcodes_h_l1415_c11_25bd_return_output);

-- t16_MUX_uxn_opcodes_h_l1415_c7_82e3
t16_MUX_uxn_opcodes_h_l1415_c7_82e3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1415_c7_82e3_cond,
t16_MUX_uxn_opcodes_h_l1415_c7_82e3_iftrue,
t16_MUX_uxn_opcodes_h_l1415_c7_82e3_iffalse,
t16_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1415_c7_82e3
result_u16_value_MUX_uxn_opcodes_h_l1415_c7_82e3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1415_c7_82e3_cond,
result_u16_value_MUX_uxn_opcodes_h_l1415_c7_82e3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1415_c7_82e3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_82e3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_82e3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_82e3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_82e3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_82e3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_82e3
result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_82e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_82e3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_82e3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_82e3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_82e3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_82e3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_82e3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_82e3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_82e3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_82e3
result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_82e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_82e3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_82e3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_82e3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1415_c7_82e3
result_u8_value_MUX_uxn_opcodes_h_l1415_c7_82e3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1415_c7_82e3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1415_c7_82e3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1415_c7_82e3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1415_c7_82e3
tmp8_MUX_uxn_opcodes_h_l1415_c7_82e3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1415_c7_82e3_cond,
tmp8_MUX_uxn_opcodes_h_l1415_c7_82e3_iftrue,
tmp8_MUX_uxn_opcodes_h_l1415_c7_82e3_iffalse,
tmp8_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1416_c3_dc53
BIN_OP_OR_uxn_opcodes_h_l1416_c3_dc53 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1416_c3_dc53_left,
BIN_OP_OR_uxn_opcodes_h_l1416_c3_dc53_right,
BIN_OP_OR_uxn_opcodes_h_l1416_c3_dc53_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1417_c30_ec09
sp_relative_shift_uxn_opcodes_h_l1417_c30_ec09 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1417_c30_ec09_ins,
sp_relative_shift_uxn_opcodes_h_l1417_c30_ec09_x,
sp_relative_shift_uxn_opcodes_h_l1417_c30_ec09_y,
sp_relative_shift_uxn_opcodes_h_l1417_c30_ec09_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1420_c11_a144
BIN_OP_EQ_uxn_opcodes_h_l1420_c11_a144 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1420_c11_a144_left,
BIN_OP_EQ_uxn_opcodes_h_l1420_c11_a144_right,
BIN_OP_EQ_uxn_opcodes_h_l1420_c11_a144_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0a87
result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0a87 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0a87_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0a87_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0a87_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0a87_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0a87
result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0a87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0a87_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0a87_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0a87_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0a87_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0a87
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0a87 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0a87_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0a87_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0a87_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0a87_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0a87
result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0a87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0a87_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0a87_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0a87_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0a87_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0a87
result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0a87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0a87_cond,
result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0a87_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0a87_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0a87_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1420_c7_0a87
tmp8_MUX_uxn_opcodes_h_l1420_c7_0a87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1420_c7_0a87_cond,
tmp8_MUX_uxn_opcodes_h_l1420_c7_0a87_iftrue,
tmp8_MUX_uxn_opcodes_h_l1420_c7_0a87_iffalse,
tmp8_MUX_uxn_opcodes_h_l1420_c7_0a87_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1423_c11_f2f6
BIN_OP_EQ_uxn_opcodes_h_l1423_c11_f2f6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1423_c11_f2f6_left,
BIN_OP_EQ_uxn_opcodes_h_l1423_c11_f2f6_right,
BIN_OP_EQ_uxn_opcodes_h_l1423_c11_f2f6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_8f52
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_8f52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_8f52_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_8f52_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_8f52_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_8f52_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_8f52
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_8f52 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_8f52_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_8f52_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_8f52_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_8f52_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_8f52
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_8f52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_8f52_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_8f52_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_8f52_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_8f52_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1423_c7_8f52
result_u8_value_MUX_uxn_opcodes_h_l1423_c7_8f52 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1423_c7_8f52_cond,
result_u8_value_MUX_uxn_opcodes_h_l1423_c7_8f52_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1423_c7_8f52_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1423_c7_8f52_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1423_c7_8f52
tmp8_MUX_uxn_opcodes_h_l1423_c7_8f52 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1423_c7_8f52_cond,
tmp8_MUX_uxn_opcodes_h_l1423_c7_8f52_iftrue,
tmp8_MUX_uxn_opcodes_h_l1423_c7_8f52_iffalse,
tmp8_MUX_uxn_opcodes_h_l1423_c7_8f52_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1395_c6_6d3a_return_output,
 t16_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output,
 tmp8_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1408_c11_c1bb_return_output,
 t16_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output,
 tmp8_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1411_c11_f170_return_output,
 t16_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output,
 tmp8_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output,
 CONST_SL_8_uxn_opcodes_h_l1413_c3_d8bd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1415_c11_25bd_return_output,
 t16_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output,
 tmp8_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1416_c3_dc53_return_output,
 sp_relative_shift_uxn_opcodes_h_l1417_c30_ec09_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1420_c11_a144_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0a87_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0a87_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0a87_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0a87_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0a87_return_output,
 tmp8_MUX_uxn_opcodes_h_l1420_c7_0a87_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1423_c11_f2f6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_8f52_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_8f52_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_8f52_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1423_c7_8f52_return_output,
 tmp8_MUX_uxn_opcodes_h_l1423_c7_8f52_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_6d3a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_6d3a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_6d3a_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1395_c2_1c7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1405_c3_e0e0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1395_c2_1c7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1400_c3_244c : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1395_c2_1c7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1395_c2_1c7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_c1bb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_c1bb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_c1bb_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1408_c7_5c12_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1408_c7_5c12_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1408_c7_5c12_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1408_c7_5c12_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1408_c7_5c12_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1408_c7_5c12_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_5c12_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_5c12_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_5c12_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_5c12_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_5c12_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_5c12_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_5c12_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1409_c3_4491 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_5c12_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_5c12_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_5c12_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_5c12_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_5c12_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1408_c7_5c12_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1408_c7_5c12_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1408_c7_5c12_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1408_c7_5c12_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1408_c7_5c12_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1408_c7_5c12_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_f170_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_f170_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_f170_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1411_c7_81bf_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1411_c7_81bf_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1411_c7_81bf_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c7_81bf_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c7_81bf_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c7_81bf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_81bf_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_81bf_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_81bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_81bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_81bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_81bf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_81bf_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_81bf_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_81bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_81bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_81bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_81bf_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c7_81bf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c7_81bf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c7_81bf_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1411_c7_81bf_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1411_c7_81bf_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1411_c7_81bf_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1413_c3_d8bd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1413_c3_d8bd_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_25bd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_25bd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_25bd_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1415_c7_82e3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1415_c7_82e3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1415_c7_82e3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1415_c7_82e3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1415_c7_82e3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1415_c7_82e3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_82e3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_82e3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0a87_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_82e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_82e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_82e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0a87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_82e3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_82e3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_82e3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0a87_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_82e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_82e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_82e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0a87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_82e3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_82e3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_82e3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0a87_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_82e3_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1415_c7_82e3_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1415_c7_82e3_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1420_c7_0a87_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1415_c7_82e3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1416_c3_dc53_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1416_c3_dc53_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1416_c3_dc53_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1417_c30_ec09_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1417_c30_ec09_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1417_c30_ec09_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1417_c30_ec09_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_a144_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_a144_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_a144_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0a87_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1421_c3_3a38 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0a87_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0a87_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0a87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0a87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_8f52_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0a87_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0a87_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0a87_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_8f52_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0a87_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0a87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0a87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_8f52_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0a87_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0a87_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0a87_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_8f52_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0a87_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1420_c7_0a87_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1420_c7_0a87_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1423_c7_8f52_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1420_c7_0a87_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_f2f6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_f2f6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_f2f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_8f52_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_8f52_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_8f52_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_8f52_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1426_c3_b2f8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_8f52_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_8f52_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_8f52_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_8f52_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_8f52_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_8f52_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_8f52_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_8f52_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1423_c7_8f52_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1423_c7_8f52_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1423_c7_8f52_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1415_l1408_l1411_l1395_DUPLICATE_2731_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1423_l1420_l1415_l1411_l1408_l1395_DUPLICATE_055f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1408_l1420_l1411_DUPLICATE_ff6a_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1423_l1420_l1415_l1411_l1408_DUPLICATE_55de_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1423_l1420_l1415_l1411_l1408_DUPLICATE_c63e_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1416_l1412_DUPLICATE_28d5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1415_l1420_l1411_l1423_DUPLICATE_b5f2_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a906_uxn_opcodes_h_l1390_l1431_DUPLICATE_4f5a_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_a144_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1417_c30_ec09_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_6d3a_right := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_8f52_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1417_c30_ec09_y := resize(to_signed(-1, 2), 4);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1409_c3_4491 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_5c12_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1409_c3_4491;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1400_c3_244c := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1400_c3_244c;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1421_c3_3a38 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0a87_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1421_c3_3a38;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1426_c3_b2f8 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_8f52_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1426_c3_b2f8;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_25bd_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_f2f6_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_f170_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1405_c3_e0e0 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1405_c3_e0e0;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_8f52_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_c1bb_right := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1417_c30_ec09_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_6d3a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_c1bb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_f170_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_25bd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_a144_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_f2f6_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_8f52_iftrue := VAR_previous_ram_read;
     VAR_tmp8_MUX_uxn_opcodes_h_l1423_c7_8f52_iftrue := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1416_c3_dc53_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1408_c7_5c12_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1415_c7_82e3_iffalse := t16;
     VAR_tmp8_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1408_c7_5c12_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1411_c7_81bf_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1415_c7_82e3_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1420_c7_0a87_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1423_c7_8f52_iffalse := tmp8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1415_c11_25bd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1415_c11_25bd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_25bd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1415_c11_25bd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_25bd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_25bd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1415_c11_25bd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1423_c11_f2f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1423_c11_f2f6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_f2f6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1423_c11_f2f6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_f2f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_f2f6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1423_c11_f2f6_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1417_c30_ec09] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1417_c30_ec09_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1417_c30_ec09_ins;
     sp_relative_shift_uxn_opcodes_h_l1417_c30_ec09_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1417_c30_ec09_x;
     sp_relative_shift_uxn_opcodes_h_l1417_c30_ec09_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1417_c30_ec09_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1417_c30_ec09_return_output := sp_relative_shift_uxn_opcodes_h_l1417_c30_ec09_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1420_c11_a144] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1420_c11_a144_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_a144_left;
     BIN_OP_EQ_uxn_opcodes_h_l1420_c11_a144_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_a144_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_a144_return_output := BIN_OP_EQ_uxn_opcodes_h_l1420_c11_a144_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1423_l1420_l1415_l1411_l1408_l1395_DUPLICATE_055f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1423_l1420_l1415_l1411_l1408_l1395_DUPLICATE_055f_return_output := result.u8_value;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1395_c2_1c7d] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1395_c2_1c7d_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1423_l1420_l1415_l1411_l1408_DUPLICATE_c63e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1423_l1420_l1415_l1411_l1408_DUPLICATE_c63e_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1411_c11_f170] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1411_c11_f170_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_f170_left;
     BIN_OP_EQ_uxn_opcodes_h_l1411_c11_f170_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_f170_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_f170_return_output := BIN_OP_EQ_uxn_opcodes_h_l1411_c11_f170_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1395_c2_1c7d] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1395_c2_1c7d_return_output := result.is_vram_write;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1395_c2_1c7d] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1395_c2_1c7d_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1408_c11_c1bb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1408_c11_c1bb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_c1bb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1408_c11_c1bb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_c1bb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_c1bb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1408_c11_c1bb_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1415_l1408_l1411_l1395_DUPLICATE_2731 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1415_l1408_l1411_l1395_DUPLICATE_2731_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1395_c6_6d3a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1395_c6_6d3a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_6d3a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1395_c6_6d3a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_6d3a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_6d3a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1395_c6_6d3a_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1416_l1412_DUPLICATE_28d5 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1416_l1412_DUPLICATE_28d5_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1395_c2_1c7d] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1395_c2_1c7d_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1408_l1420_l1411_DUPLICATE_ff6a LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1408_l1420_l1411_DUPLICATE_ff6a_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1415_l1420_l1411_l1423_DUPLICATE_b5f2 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1415_l1420_l1411_l1423_DUPLICATE_b5f2_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1423_l1420_l1415_l1411_l1408_DUPLICATE_55de LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1423_l1420_l1415_l1411_l1408_DUPLICATE_55de_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_6d3a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_6d3a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_6d3a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_6d3a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_6d3a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_6d3a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_6d3a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_6d3a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_6d3a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_6d3a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_6d3a_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c6_6d3a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_5c12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_c1bb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_5c12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_c1bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_5c12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_c1bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_5c12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_c1bb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1408_c7_5c12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_c1bb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1408_c7_5c12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_c1bb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1408_c7_5c12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_c1bb_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1408_c7_5c12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1408_c11_c1bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_81bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_f170_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_81bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_f170_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_81bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_f170_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_81bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_f170_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c7_81bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_f170_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c7_81bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_f170_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1411_c7_81bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_f170_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1411_c7_81bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_f170_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_82e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_25bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_82e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_25bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_82e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_25bd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_82e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_25bd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1415_c7_82e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_25bd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_82e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_25bd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1415_c7_82e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_25bd_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1415_c7_82e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_25bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0a87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_a144_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0a87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_a144_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0a87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_a144_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0a87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_a144_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0a87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_a144_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1420_c7_0a87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_a144_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_8f52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_f2f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_8f52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_f2f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_8f52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_f2f6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_8f52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_f2f6_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1423_c7_8f52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_f2f6_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1416_c3_dc53_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1416_l1412_DUPLICATE_28d5_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1413_c3_d8bd_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1416_l1412_DUPLICATE_28d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_5c12_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1408_l1420_l1411_DUPLICATE_ff6a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_81bf_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1408_l1420_l1411_DUPLICATE_ff6a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0a87_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1408_l1420_l1411_DUPLICATE_ff6a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1415_l1408_l1411_l1395_DUPLICATE_2731_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1408_c7_5c12_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1415_l1408_l1411_l1395_DUPLICATE_2731_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c7_81bf_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1415_l1408_l1411_l1395_DUPLICATE_2731_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1415_c7_82e3_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1415_l1408_l1411_l1395_DUPLICATE_2731_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_5c12_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1423_l1420_l1415_l1411_l1408_DUPLICATE_55de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_81bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1423_l1420_l1415_l1411_l1408_DUPLICATE_55de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_82e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1423_l1420_l1415_l1411_l1408_DUPLICATE_55de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0a87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1423_l1420_l1415_l1411_l1408_DUPLICATE_55de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_8f52_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1423_l1420_l1415_l1411_l1408_DUPLICATE_55de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_5c12_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1423_l1420_l1415_l1411_l1408_DUPLICATE_c63e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_81bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1423_l1420_l1415_l1411_l1408_DUPLICATE_c63e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_82e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1423_l1420_l1415_l1411_l1408_DUPLICATE_c63e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0a87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1423_l1420_l1415_l1411_l1408_DUPLICATE_c63e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_8f52_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1423_l1420_l1415_l1411_l1408_DUPLICATE_c63e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_81bf_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1415_l1420_l1411_l1423_DUPLICATE_b5f2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_82e3_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1415_l1420_l1411_l1423_DUPLICATE_b5f2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0a87_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1415_l1420_l1411_l1423_DUPLICATE_b5f2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_8f52_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1415_l1420_l1411_l1423_DUPLICATE_b5f2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1423_l1420_l1415_l1411_l1408_l1395_DUPLICATE_055f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1408_c7_5c12_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1423_l1420_l1415_l1411_l1408_l1395_DUPLICATE_055f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c7_81bf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1423_l1420_l1415_l1411_l1408_l1395_DUPLICATE_055f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_82e3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1423_l1420_l1415_l1411_l1408_l1395_DUPLICATE_055f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0a87_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1423_l1420_l1415_l1411_l1408_l1395_DUPLICATE_055f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_8f52_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1423_l1420_l1415_l1411_l1408_l1395_DUPLICATE_055f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1395_c2_1c7d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1395_c2_1c7d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1395_c2_1c7d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1395_c2_1c7d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_82e3_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1417_c30_ec09_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1395_c2_1c7d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1413_c3_d8bd] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1413_c3_d8bd_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1413_c3_d8bd_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1413_c3_d8bd_return_output := CONST_SL_8_uxn_opcodes_h_l1413_c3_d8bd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1423_c7_8f52] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_8f52_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_8f52_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_8f52_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_8f52_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_8f52_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_8f52_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_8f52_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_8f52_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1423_c7_8f52] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_8f52_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_8f52_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_8f52_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_8f52_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_8f52_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_8f52_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_8f52_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_8f52_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1395_c2_1c7d] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1420_c7_0a87] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0a87_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0a87_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0a87_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0a87_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0a87_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0a87_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0a87_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0a87_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1395_c2_1c7d] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1423_c7_8f52] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1423_c7_8f52_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1423_c7_8f52_cond;
     tmp8_MUX_uxn_opcodes_h_l1423_c7_8f52_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1423_c7_8f52_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1423_c7_8f52_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1423_c7_8f52_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1423_c7_8f52_return_output := tmp8_MUX_uxn_opcodes_h_l1423_c7_8f52_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1423_c7_8f52] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_8f52_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_8f52_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_8f52_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_8f52_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_8f52_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_8f52_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_8f52_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_8f52_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1416_c3_dc53] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1416_c3_dc53_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1416_c3_dc53_left;
     BIN_OP_OR_uxn_opcodes_h_l1416_c3_dc53_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1416_c3_dc53_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1416_c3_dc53_return_output := BIN_OP_OR_uxn_opcodes_h_l1416_c3_dc53_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1395_c2_1c7d] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1423_c7_8f52] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1423_c7_8f52_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_8f52_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1423_c7_8f52_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_8f52_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1423_c7_8f52_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_8f52_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_8f52_return_output := result_u8_value_MUX_uxn_opcodes_h_l1423_c7_8f52_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1415_c7_82e3_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1416_c3_dc53_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1415_c7_82e3_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1416_c3_dc53_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1411_c7_81bf_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1413_c3_d8bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0a87_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_8f52_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0a87_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_8f52_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_82e3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_0a87_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0a87_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_8f52_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0a87_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_8f52_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1420_c7_0a87_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1423_c7_8f52_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1420_c7_0a87] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0a87_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0a87_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0a87_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0a87_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0a87_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0a87_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0a87_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0a87_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1420_c7_0a87] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0a87_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0a87_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0a87_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0a87_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0a87_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0a87_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0a87_return_output := result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0a87_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1420_c7_0a87] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1420_c7_0a87_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1420_c7_0a87_cond;
     tmp8_MUX_uxn_opcodes_h_l1420_c7_0a87_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1420_c7_0a87_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1420_c7_0a87_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1420_c7_0a87_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1420_c7_0a87_return_output := tmp8_MUX_uxn_opcodes_h_l1420_c7_0a87_return_output;

     -- t16_MUX[uxn_opcodes_h_l1415_c7_82e3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1415_c7_82e3_cond <= VAR_t16_MUX_uxn_opcodes_h_l1415_c7_82e3_cond;
     t16_MUX_uxn_opcodes_h_l1415_c7_82e3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1415_c7_82e3_iftrue;
     t16_MUX_uxn_opcodes_h_l1415_c7_82e3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1415_c7_82e3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output := t16_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1415_c7_82e3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_82e3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_82e3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_82e3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_82e3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_82e3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_82e3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1420_c7_0a87] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0a87_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0a87_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0a87_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0a87_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0a87_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0a87_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0a87_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0a87_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1415_c7_82e3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1415_c7_82e3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1415_c7_82e3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1415_c7_82e3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1415_c7_82e3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1415_c7_82e3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1415_c7_82e3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output := result_u16_value_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1420_c7_0a87] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0a87_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0a87_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0a87_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0a87_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0a87_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0a87_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0a87_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0a87_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_82e3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_0a87_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_82e3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_0a87_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_81bf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_82e3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_0a87_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c7_81bf_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_82e3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1420_c7_0a87_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1411_c7_81bf_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1415_c7_82e3_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1420_c7_0a87_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1415_c7_82e3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_82e3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_82e3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_82e3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_82e3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_82e3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_82e3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1415_c7_82e3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1415_c7_82e3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_82e3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1415_c7_82e3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_82e3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1415_c7_82e3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_82e3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1415_c7_82e3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_82e3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_82e3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_82e3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_82e3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_82e3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_82e3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1411_c7_81bf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_81bf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_81bf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_81bf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_81bf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_81bf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_81bf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output;

     -- t16_MUX[uxn_opcodes_h_l1411_c7_81bf] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1411_c7_81bf_cond <= VAR_t16_MUX_uxn_opcodes_h_l1411_c7_81bf_cond;
     t16_MUX_uxn_opcodes_h_l1411_c7_81bf_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1411_c7_81bf_iftrue;
     t16_MUX_uxn_opcodes_h_l1411_c7_81bf_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1411_c7_81bf_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output := t16_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1415_c7_82e3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_82e3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_82e3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_82e3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_82e3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_82e3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_82e3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1415_c7_82e3] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1415_c7_82e3_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1415_c7_82e3_cond;
     tmp8_MUX_uxn_opcodes_h_l1415_c7_82e3_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1415_c7_82e3_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1415_c7_82e3_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1415_c7_82e3_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output := tmp8_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1411_c7_81bf] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1411_c7_81bf_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c7_81bf_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1411_c7_81bf_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c7_81bf_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1411_c7_81bf_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c7_81bf_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output := result_u16_value_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_81bf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_81bf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_5c12_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_81bf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1408_c7_5c12_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c7_81bf_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1408_c7_5c12_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1411_c7_81bf_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1415_c7_82e3_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1411_c7_81bf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_81bf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_81bf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_81bf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_81bf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_81bf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_81bf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1408_c7_5c12] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_5c12_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_5c12_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_5c12_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_5c12_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_5c12_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_5c12_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1411_c7_81bf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_81bf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_81bf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_81bf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_81bf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_81bf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_81bf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1411_c7_81bf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1411_c7_81bf_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c7_81bf_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1411_c7_81bf_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c7_81bf_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1411_c7_81bf_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c7_81bf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output := result_u8_value_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1411_c7_81bf] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1411_c7_81bf_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1411_c7_81bf_cond;
     tmp8_MUX_uxn_opcodes_h_l1411_c7_81bf_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1411_c7_81bf_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1411_c7_81bf_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1411_c7_81bf_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output := tmp8_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1408_c7_5c12] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1408_c7_5c12_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1408_c7_5c12_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1408_c7_5c12_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1408_c7_5c12_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1408_c7_5c12_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1408_c7_5c12_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output := result_u16_value_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1411_c7_81bf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_81bf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_81bf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_81bf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_81bf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_81bf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_81bf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output;

     -- t16_MUX[uxn_opcodes_h_l1408_c7_5c12] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1408_c7_5c12_cond <= VAR_t16_MUX_uxn_opcodes_h_l1408_c7_5c12_cond;
     t16_MUX_uxn_opcodes_h_l1408_c7_5c12_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1408_c7_5c12_iftrue;
     t16_MUX_uxn_opcodes_h_l1408_c7_5c12_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1408_c7_5c12_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output := t16_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_5c12_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_5c12_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_5c12_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1408_c7_5c12_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1408_c7_5c12_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1411_c7_81bf_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1408_c7_5c12] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_5c12_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_5c12_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_5c12_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_5c12_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_5c12_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_5c12_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1395_c2_1c7d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output := result_u16_value_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1408_c7_5c12] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_5c12_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_5c12_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_5c12_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_5c12_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_5c12_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_5c12_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1408_c7_5c12] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1408_c7_5c12_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1408_c7_5c12_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1408_c7_5c12_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1408_c7_5c12_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1408_c7_5c12_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1408_c7_5c12_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output := result_u8_value_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1395_c2_1c7d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1408_c7_5c12] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1408_c7_5c12_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1408_c7_5c12_cond;
     tmp8_MUX_uxn_opcodes_h_l1408_c7_5c12_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1408_c7_5c12_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1408_c7_5c12_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1408_c7_5c12_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output := tmp8_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output;

     -- t16_MUX[uxn_opcodes_h_l1395_c2_1c7d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond;
     t16_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue;
     t16_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output := t16_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1408_c7_5c12] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_5c12_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_5c12_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_5c12_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_5c12_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_5c12_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_5c12_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1408_c7_5c12_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1395_c2_1c7d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1395_c2_1c7d] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond;
     tmp8_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output := tmp8_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1395_c2_1c7d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1395_c2_1c7d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1395_c2_1c7d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output;

     -- Submodule level 7
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a906_uxn_opcodes_h_l1390_l1431_DUPLICATE_4f5a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a906_uxn_opcodes_h_l1390_l1431_DUPLICATE_4f5a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a906(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1395_c2_1c7d_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a906_uxn_opcodes_h_l1390_l1431_DUPLICATE_4f5a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a906_uxn_opcodes_h_l1390_l1431_DUPLICATE_4f5a_return_output;
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
