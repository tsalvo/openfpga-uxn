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
-- BIN_OP_EQ[uxn_opcodes_h_l1394_c6_efbf]
signal BIN_OP_EQ_uxn_opcodes_h_l1394_c6_efbf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1394_c6_efbf_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1394_c6_efbf_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1394_c2_9c9f]
signal tmp8_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1394_c2_9c9f]
signal t16_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1394_c2_9c9f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1394_c2_9c9f]
signal result_u8_value_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1394_c2_9c9f]
signal result_u16_value_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1394_c2_9c9f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1394_c2_9c9f]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1394_c2_9c9f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1394_c2_9c9f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1394_c2_9c9f]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1394_c2_9c9f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1394_c2_9c9f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1407_c11_dd75]
signal BIN_OP_EQ_uxn_opcodes_h_l1407_c11_dd75_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1407_c11_dd75_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1407_c11_dd75_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1407_c7_b0ef]
signal tmp8_MUX_uxn_opcodes_h_l1407_c7_b0ef_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1407_c7_b0ef_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1407_c7_b0ef_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1407_c7_b0ef]
signal t16_MUX_uxn_opcodes_h_l1407_c7_b0ef_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1407_c7_b0ef_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1407_c7_b0ef_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1407_c7_b0ef]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_b0ef_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_b0ef_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_b0ef_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1407_c7_b0ef]
signal result_u8_value_MUX_uxn_opcodes_h_l1407_c7_b0ef_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1407_c7_b0ef_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1407_c7_b0ef_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1407_c7_b0ef]
signal result_u16_value_MUX_uxn_opcodes_h_l1407_c7_b0ef_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1407_c7_b0ef_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1407_c7_b0ef_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1407_c7_b0ef]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_b0ef_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_b0ef_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_b0ef_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1407_c7_b0ef]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_b0ef_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_b0ef_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_b0ef_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1407_c7_b0ef]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_b0ef_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_b0ef_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_b0ef_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1410_c11_7e62]
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_7e62_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_7e62_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_7e62_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1410_c7_415e]
signal tmp8_MUX_uxn_opcodes_h_l1410_c7_415e_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1410_c7_415e_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1410_c7_415e_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1410_c7_415e_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1410_c7_415e]
signal t16_MUX_uxn_opcodes_h_l1410_c7_415e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1410_c7_415e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1410_c7_415e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1410_c7_415e_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1410_c7_415e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_415e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_415e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_415e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_415e_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1410_c7_415e]
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_415e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_415e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_415e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_415e_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1410_c7_415e]
signal result_u16_value_MUX_uxn_opcodes_h_l1410_c7_415e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1410_c7_415e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1410_c7_415e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1410_c7_415e_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1410_c7_415e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_415e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_415e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_415e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_415e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1410_c7_415e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_415e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_415e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_415e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_415e_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1410_c7_415e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_415e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_415e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_415e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_415e_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1412_c3_a980]
signal CONST_SL_8_uxn_opcodes_h_l1412_c3_a980_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1412_c3_a980_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1414_c11_89a5]
signal BIN_OP_EQ_uxn_opcodes_h_l1414_c11_89a5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1414_c11_89a5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1414_c11_89a5_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1414_c7_bb15]
signal tmp8_MUX_uxn_opcodes_h_l1414_c7_bb15_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1414_c7_bb15_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1414_c7_bb15_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1414_c7_bb15]
signal t16_MUX_uxn_opcodes_h_l1414_c7_bb15_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1414_c7_bb15_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1414_c7_bb15_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1414_c7_bb15]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_bb15_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_bb15_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_bb15_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1414_c7_bb15]
signal result_u8_value_MUX_uxn_opcodes_h_l1414_c7_bb15_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1414_c7_bb15_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1414_c7_bb15_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1414_c7_bb15]
signal result_u16_value_MUX_uxn_opcodes_h_l1414_c7_bb15_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1414_c7_bb15_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1414_c7_bb15_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1414_c7_bb15]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_bb15_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_bb15_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_bb15_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1414_c7_bb15]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_bb15_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_bb15_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_bb15_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1414_c7_bb15]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_bb15_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_bb15_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_bb15_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1415_c3_29a6]
signal BIN_OP_OR_uxn_opcodes_h_l1415_c3_29a6_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1415_c3_29a6_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1415_c3_29a6_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1416_c30_741a]
signal sp_relative_shift_uxn_opcodes_h_l1416_c30_741a_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1416_c30_741a_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1416_c30_741a_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1416_c30_741a_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1419_c11_d7d4]
signal BIN_OP_EQ_uxn_opcodes_h_l1419_c11_d7d4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1419_c11_d7d4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1419_c11_d7d4_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1419_c7_c0df]
signal tmp8_MUX_uxn_opcodes_h_l1419_c7_c0df_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1419_c7_c0df_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1419_c7_c0df_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1419_c7_c0df_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1419_c7_c0df]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c0df_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c0df_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c0df_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c0df_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1419_c7_c0df]
signal result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c0df_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c0df_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c0df_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c0df_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1419_c7_c0df]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c0df_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c0df_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c0df_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c0df_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1419_c7_c0df]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c0df_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c0df_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c0df_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c0df_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1419_c7_c0df]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c0df_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c0df_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c0df_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c0df_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1422_c11_9fdc]
signal BIN_OP_EQ_uxn_opcodes_h_l1422_c11_9fdc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1422_c11_9fdc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1422_c11_9fdc_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1422_c7_1f4d]
signal tmp8_MUX_uxn_opcodes_h_l1422_c7_1f4d_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1422_c7_1f4d_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1422_c7_1f4d_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1422_c7_1f4d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1422_c7_1f4d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_1f4d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_1f4d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_1f4d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_1f4d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1422_c7_1f4d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_1f4d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_1f4d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_1f4d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_1f4d_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1422_c7_1f4d]
signal result_u8_value_MUX_uxn_opcodes_h_l1422_c7_1f4d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1422_c7_1f4d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1422_c7_1f4d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1422_c7_1f4d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1422_c7_1f4d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_1f4d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_1f4d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_1f4d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_1f4d_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_e393( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_ram_write := ref_toks_4;
      base.is_stack_index_flipped := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_vram_write := ref_toks_8;
      base.is_pc_updated := ref_toks_9;
      base.is_opc_done := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1394_c6_efbf
BIN_OP_EQ_uxn_opcodes_h_l1394_c6_efbf : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1394_c6_efbf_left,
BIN_OP_EQ_uxn_opcodes_h_l1394_c6_efbf_right,
BIN_OP_EQ_uxn_opcodes_h_l1394_c6_efbf_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1394_c2_9c9f
tmp8_MUX_uxn_opcodes_h_l1394_c2_9c9f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond,
tmp8_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue,
tmp8_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse,
tmp8_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output);

-- t16_MUX_uxn_opcodes_h_l1394_c2_9c9f
t16_MUX_uxn_opcodes_h_l1394_c2_9c9f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond,
t16_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue,
t16_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse,
t16_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_9c9f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_9c9f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1394_c2_9c9f
result_u8_value_MUX_uxn_opcodes_h_l1394_c2_9c9f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1394_c2_9c9f
result_u16_value_MUX_uxn_opcodes_h_l1394_c2_9c9f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond,
result_u16_value_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f
result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_9c9f
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_9c9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_9c9f
result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_9c9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_9c9f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_9c9f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f
result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_9c9f
result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_9c9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_9c9f
result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_9c9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1407_c11_dd75
BIN_OP_EQ_uxn_opcodes_h_l1407_c11_dd75 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1407_c11_dd75_left,
BIN_OP_EQ_uxn_opcodes_h_l1407_c11_dd75_right,
BIN_OP_EQ_uxn_opcodes_h_l1407_c11_dd75_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1407_c7_b0ef
tmp8_MUX_uxn_opcodes_h_l1407_c7_b0ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1407_c7_b0ef_cond,
tmp8_MUX_uxn_opcodes_h_l1407_c7_b0ef_iftrue,
tmp8_MUX_uxn_opcodes_h_l1407_c7_b0ef_iffalse,
tmp8_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output);

-- t16_MUX_uxn_opcodes_h_l1407_c7_b0ef
t16_MUX_uxn_opcodes_h_l1407_c7_b0ef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1407_c7_b0ef_cond,
t16_MUX_uxn_opcodes_h_l1407_c7_b0ef_iftrue,
t16_MUX_uxn_opcodes_h_l1407_c7_b0ef_iffalse,
t16_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_b0ef
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_b0ef : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_b0ef_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_b0ef_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_b0ef_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1407_c7_b0ef
result_u8_value_MUX_uxn_opcodes_h_l1407_c7_b0ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1407_c7_b0ef_cond,
result_u8_value_MUX_uxn_opcodes_h_l1407_c7_b0ef_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1407_c7_b0ef_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1407_c7_b0ef
result_u16_value_MUX_uxn_opcodes_h_l1407_c7_b0ef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1407_c7_b0ef_cond,
result_u16_value_MUX_uxn_opcodes_h_l1407_c7_b0ef_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1407_c7_b0ef_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_b0ef
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_b0ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_b0ef_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_b0ef_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_b0ef_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_b0ef
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_b0ef : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_b0ef_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_b0ef_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_b0ef_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_b0ef
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_b0ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_b0ef_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_b0ef_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_b0ef_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1410_c11_7e62
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_7e62 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_7e62_left,
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_7e62_right,
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_7e62_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1410_c7_415e
tmp8_MUX_uxn_opcodes_h_l1410_c7_415e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1410_c7_415e_cond,
tmp8_MUX_uxn_opcodes_h_l1410_c7_415e_iftrue,
tmp8_MUX_uxn_opcodes_h_l1410_c7_415e_iffalse,
tmp8_MUX_uxn_opcodes_h_l1410_c7_415e_return_output);

-- t16_MUX_uxn_opcodes_h_l1410_c7_415e
t16_MUX_uxn_opcodes_h_l1410_c7_415e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1410_c7_415e_cond,
t16_MUX_uxn_opcodes_h_l1410_c7_415e_iftrue,
t16_MUX_uxn_opcodes_h_l1410_c7_415e_iffalse,
t16_MUX_uxn_opcodes_h_l1410_c7_415e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_415e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_415e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_415e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_415e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_415e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_415e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1410_c7_415e
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_415e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_415e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_415e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_415e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_415e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1410_c7_415e
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_415e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_415e_cond,
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_415e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_415e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_415e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_415e
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_415e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_415e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_415e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_415e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_415e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_415e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_415e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_415e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_415e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_415e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_415e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_415e
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_415e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_415e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_415e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_415e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_415e_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1412_c3_a980
CONST_SL_8_uxn_opcodes_h_l1412_c3_a980 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1412_c3_a980_x,
CONST_SL_8_uxn_opcodes_h_l1412_c3_a980_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1414_c11_89a5
BIN_OP_EQ_uxn_opcodes_h_l1414_c11_89a5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1414_c11_89a5_left,
BIN_OP_EQ_uxn_opcodes_h_l1414_c11_89a5_right,
BIN_OP_EQ_uxn_opcodes_h_l1414_c11_89a5_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1414_c7_bb15
tmp8_MUX_uxn_opcodes_h_l1414_c7_bb15 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1414_c7_bb15_cond,
tmp8_MUX_uxn_opcodes_h_l1414_c7_bb15_iftrue,
tmp8_MUX_uxn_opcodes_h_l1414_c7_bb15_iffalse,
tmp8_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output);

-- t16_MUX_uxn_opcodes_h_l1414_c7_bb15
t16_MUX_uxn_opcodes_h_l1414_c7_bb15 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1414_c7_bb15_cond,
t16_MUX_uxn_opcodes_h_l1414_c7_bb15_iftrue,
t16_MUX_uxn_opcodes_h_l1414_c7_bb15_iffalse,
t16_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_bb15
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_bb15 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_bb15_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_bb15_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_bb15_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1414_c7_bb15
result_u8_value_MUX_uxn_opcodes_h_l1414_c7_bb15 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1414_c7_bb15_cond,
result_u8_value_MUX_uxn_opcodes_h_l1414_c7_bb15_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1414_c7_bb15_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1414_c7_bb15
result_u16_value_MUX_uxn_opcodes_h_l1414_c7_bb15 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1414_c7_bb15_cond,
result_u16_value_MUX_uxn_opcodes_h_l1414_c7_bb15_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1414_c7_bb15_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_bb15
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_bb15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_bb15_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_bb15_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_bb15_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_bb15
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_bb15 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_bb15_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_bb15_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_bb15_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_bb15
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_bb15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_bb15_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_bb15_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_bb15_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1415_c3_29a6
BIN_OP_OR_uxn_opcodes_h_l1415_c3_29a6 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1415_c3_29a6_left,
BIN_OP_OR_uxn_opcodes_h_l1415_c3_29a6_right,
BIN_OP_OR_uxn_opcodes_h_l1415_c3_29a6_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1416_c30_741a
sp_relative_shift_uxn_opcodes_h_l1416_c30_741a : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1416_c30_741a_ins,
sp_relative_shift_uxn_opcodes_h_l1416_c30_741a_x,
sp_relative_shift_uxn_opcodes_h_l1416_c30_741a_y,
sp_relative_shift_uxn_opcodes_h_l1416_c30_741a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1419_c11_d7d4
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_d7d4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_d7d4_left,
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_d7d4_right,
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_d7d4_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1419_c7_c0df
tmp8_MUX_uxn_opcodes_h_l1419_c7_c0df : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1419_c7_c0df_cond,
tmp8_MUX_uxn_opcodes_h_l1419_c7_c0df_iftrue,
tmp8_MUX_uxn_opcodes_h_l1419_c7_c0df_iffalse,
tmp8_MUX_uxn_opcodes_h_l1419_c7_c0df_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c0df
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c0df : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c0df_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c0df_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c0df_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c0df_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c0df
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c0df : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c0df_cond,
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c0df_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c0df_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c0df_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c0df
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c0df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c0df_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c0df_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c0df_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c0df_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c0df
result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c0df : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c0df_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c0df_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c0df_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c0df_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c0df
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c0df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c0df_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c0df_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c0df_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c0df_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1422_c11_9fdc
BIN_OP_EQ_uxn_opcodes_h_l1422_c11_9fdc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1422_c11_9fdc_left,
BIN_OP_EQ_uxn_opcodes_h_l1422_c11_9fdc_right,
BIN_OP_EQ_uxn_opcodes_h_l1422_c11_9fdc_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1422_c7_1f4d
tmp8_MUX_uxn_opcodes_h_l1422_c7_1f4d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1422_c7_1f4d_cond,
tmp8_MUX_uxn_opcodes_h_l1422_c7_1f4d_iftrue,
tmp8_MUX_uxn_opcodes_h_l1422_c7_1f4d_iffalse,
tmp8_MUX_uxn_opcodes_h_l1422_c7_1f4d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_1f4d
result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_1f4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_1f4d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_1f4d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_1f4d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_1f4d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_1f4d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_1f4d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_1f4d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_1f4d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_1f4d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_1f4d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1422_c7_1f4d
result_u8_value_MUX_uxn_opcodes_h_l1422_c7_1f4d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1422_c7_1f4d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1422_c7_1f4d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1422_c7_1f4d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1422_c7_1f4d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_1f4d
result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_1f4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_1f4d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_1f4d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_1f4d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_1f4d_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1394_c6_efbf_return_output,
 tmp8_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output,
 t16_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1407_c11_dd75_return_output,
 tmp8_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output,
 t16_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1410_c11_7e62_return_output,
 tmp8_MUX_uxn_opcodes_h_l1410_c7_415e_return_output,
 t16_MUX_uxn_opcodes_h_l1410_c7_415e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_415e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1410_c7_415e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1410_c7_415e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_415e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_415e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_415e_return_output,
 CONST_SL_8_uxn_opcodes_h_l1412_c3_a980_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1414_c11_89a5_return_output,
 tmp8_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output,
 t16_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1415_c3_29a6_return_output,
 sp_relative_shift_uxn_opcodes_h_l1416_c30_741a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1419_c11_d7d4_return_output,
 tmp8_MUX_uxn_opcodes_h_l1419_c7_c0df_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c0df_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c0df_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c0df_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c0df_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c0df_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1422_c11_9fdc_return_output,
 tmp8_MUX_uxn_opcodes_h_l1422_c7_1f4d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_1f4d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_1f4d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1422_c7_1f4d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_1f4d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_efbf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_efbf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_efbf_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1404_c3_8f4a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1394_c2_9c9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1394_c2_9c9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1399_c3_a321 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1394_c2_9c9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1394_c2_9c9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_dd75_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_dd75_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_dd75_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_b0ef_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_b0ef_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_415e_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_b0ef_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1407_c7_b0ef_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1407_c7_b0ef_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1410_c7_415e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1407_c7_b0ef_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_b0ef_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1408_c3_333d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_b0ef_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_415e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_b0ef_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_b0ef_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_b0ef_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_415e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_b0ef_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_b0ef_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_b0ef_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_415e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_b0ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_b0ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_b0ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_415e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_b0ef_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_b0ef_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_b0ef_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_415e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_b0ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_b0ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_b0ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_415e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_b0ef_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_7e62_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_7e62_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_7e62_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_415e_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_415e_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_415e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1410_c7_415e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1410_c7_415e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1410_c7_415e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_415e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_415e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_415e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_415e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_415e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_415e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_415e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_415e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_415e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_415e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_415e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_415e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_415e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_415e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_415e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_415e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_415e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_415e_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1412_c3_a980_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1412_c3_a980_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_89a5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_89a5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_89a5_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_bb15_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_bb15_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_c0df_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_bb15_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1414_c7_bb15_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1414_c7_bb15_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1414_c7_bb15_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_bb15_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_bb15_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c0df_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_bb15_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_bb15_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_bb15_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c0df_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_bb15_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_bb15_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_bb15_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_bb15_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_bb15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_bb15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c0df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_bb15_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_bb15_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_bb15_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c0df_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_bb15_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_bb15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_bb15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c0df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_bb15_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_29a6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_29a6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_29a6_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_741a_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_741a_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_741a_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_741a_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_d7d4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_d7d4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_d7d4_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_c0df_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_c0df_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_1f4d_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_c0df_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c0df_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c0df_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_1f4d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c0df_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c0df_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c0df_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_1f4d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c0df_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c0df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c0df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_1f4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c0df_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c0df_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1420_c3_1cc8 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c0df_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c0df_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c0df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c0df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_1f4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c0df_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_9fdc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_9fdc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_9fdc_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_1f4d_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_1f4d_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_1f4d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_1f4d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_1f4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_1f4d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_1f4d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1425_c3_7bc5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_1f4d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_1f4d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_1f4d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_1f4d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_1f4d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_1f4d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_1f4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_1f4d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1394_l1422_l1419_l1414_l1410_l1407_DUPLICATE_5363_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1394_l1414_l1407_l1410_DUPLICATE_c862_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1422_l1419_l1414_l1410_l1407_DUPLICATE_c497_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1419_l1410_DUPLICATE_5199_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1422_l1419_l1414_l1410_l1407_DUPLICATE_4242_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1415_l1411_DUPLICATE_b0c5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1422_l1414_l1419_l1410_DUPLICATE_6e7c_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e393_uxn_opcodes_h_l1430_l1389_DUPLICATE_e672_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_7e62_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_dd75_right := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_741a_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_741a_y := resize(to_signed(-1, 2), 4);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_efbf_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_1f4d_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1425_c3_7bc5 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_1f4d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1425_c3_7bc5;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1408_c3_333d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_b0ef_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1408_c3_333d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1404_c3_8f4a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1404_c3_8f4a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_d7d4_right := to_unsigned(4, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1420_c3_1cc8 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c0df_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1420_c3_1cc8;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_1f4d_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1399_c3_a321 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1399_c3_a321;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_89a5_right := to_unsigned(3, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_9fdc_right := to_unsigned(5, 3);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_741a_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_efbf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_dd75_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_7e62_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_89a5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_d7d4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_9fdc_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_1f4d_iftrue := VAR_previous_ram_read;
     VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_1f4d_iftrue := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_29a6_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1407_c7_b0ef_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1414_c7_bb15_iffalse := t16;
     VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_b0ef_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_415e_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_bb15_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_c0df_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_1f4d_iffalse := tmp8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1422_c11_9fdc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1422_c11_9fdc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_9fdc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1422_c11_9fdc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_9fdc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_9fdc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1422_c11_9fdc_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1422_l1419_l1414_l1410_l1407_DUPLICATE_c497 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1422_l1419_l1414_l1410_l1407_DUPLICATE_c497_return_output := result.is_stack_write;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1394_c2_9c9f] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1394_c2_9c9f_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1410_c11_7e62] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1410_c11_7e62_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_7e62_left;
     BIN_OP_EQ_uxn_opcodes_h_l1410_c11_7e62_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_7e62_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_7e62_return_output := BIN_OP_EQ_uxn_opcodes_h_l1410_c11_7e62_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1394_l1414_l1407_l1410_DUPLICATE_c862 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1394_l1414_l1407_l1410_DUPLICATE_c862_return_output := result.u16_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1394_l1422_l1419_l1414_l1410_l1407_DUPLICATE_5363 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1394_l1422_l1419_l1414_l1410_l1407_DUPLICATE_5363_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1394_c6_efbf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1394_c6_efbf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_efbf_left;
     BIN_OP_EQ_uxn_opcodes_h_l1394_c6_efbf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_efbf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_efbf_return_output := BIN_OP_EQ_uxn_opcodes_h_l1394_c6_efbf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1414_c11_89a5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1414_c11_89a5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_89a5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1414_c11_89a5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_89a5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_89a5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1414_c11_89a5_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1422_l1414_l1419_l1410_DUPLICATE_6e7c LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1422_l1414_l1419_l1410_DUPLICATE_6e7c_return_output := result.stack_address_sp_offset;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1394_c2_9c9f] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1394_c2_9c9f_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1422_l1419_l1414_l1410_l1407_DUPLICATE_4242 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1422_l1419_l1414_l1410_l1407_DUPLICATE_4242_return_output := result.is_opc_done;

     -- sp_relative_shift[uxn_opcodes_h_l1416_c30_741a] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1416_c30_741a_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_741a_ins;
     sp_relative_shift_uxn_opcodes_h_l1416_c30_741a_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_741a_x;
     sp_relative_shift_uxn_opcodes_h_l1416_c30_741a_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_741a_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_741a_return_output := sp_relative_shift_uxn_opcodes_h_l1416_c30_741a_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1394_c2_9c9f] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1394_c2_9c9f_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1419_c11_d7d4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1419_c11_d7d4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_d7d4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1419_c11_d7d4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_d7d4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_d7d4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1419_c11_d7d4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1407_c11_dd75] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1407_c11_dd75_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_dd75_left;
     BIN_OP_EQ_uxn_opcodes_h_l1407_c11_dd75_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_dd75_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_dd75_return_output := BIN_OP_EQ_uxn_opcodes_h_l1407_c11_dd75_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1394_c2_9c9f] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1394_c2_9c9f_return_output := result.is_vram_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1415_l1411_DUPLICATE_b0c5 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1415_l1411_DUPLICATE_b0c5_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1419_l1410_DUPLICATE_5199 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1419_l1410_DUPLICATE_5199_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_efbf_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_efbf_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_efbf_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_efbf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_efbf_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_efbf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_efbf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_efbf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_efbf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_efbf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_efbf_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_efbf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_b0ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_dd75_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_b0ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_dd75_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_b0ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_dd75_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_b0ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_dd75_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_b0ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_dd75_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_b0ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_dd75_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1407_c7_b0ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_dd75_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_b0ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_dd75_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_415e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_7e62_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_415e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_7e62_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_415e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_7e62_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_415e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_7e62_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_415e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_7e62_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_415e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_7e62_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1410_c7_415e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_7e62_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_415e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_7e62_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_bb15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_89a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_bb15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_89a5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_bb15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_89a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_bb15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_89a5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_bb15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_89a5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_bb15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_89a5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1414_c7_bb15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_89a5_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_bb15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_89a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c0df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_d7d4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c0df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_d7d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c0df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_d7d4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c0df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_d7d4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c0df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_d7d4_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_c0df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_d7d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_1f4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_9fdc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_1f4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_9fdc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_1f4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_9fdc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_1f4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_9fdc_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_1f4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_9fdc_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_29a6_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1415_l1411_DUPLICATE_b0c5_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1412_c3_a980_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1415_l1411_DUPLICATE_b0c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_b0ef_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1419_l1410_DUPLICATE_5199_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_415e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1419_l1410_DUPLICATE_5199_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c0df_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1419_l1410_DUPLICATE_5199_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1394_l1414_l1407_l1410_DUPLICATE_c862_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_b0ef_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1394_l1414_l1407_l1410_DUPLICATE_c862_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_415e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1394_l1414_l1407_l1410_DUPLICATE_c862_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_bb15_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1394_l1414_l1407_l1410_DUPLICATE_c862_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_b0ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1422_l1419_l1414_l1410_l1407_DUPLICATE_4242_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_415e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1422_l1419_l1414_l1410_l1407_DUPLICATE_4242_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_bb15_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1422_l1419_l1414_l1410_l1407_DUPLICATE_4242_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c0df_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1422_l1419_l1414_l1410_l1407_DUPLICATE_4242_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_1f4d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1422_l1419_l1414_l1410_l1407_DUPLICATE_4242_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_b0ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1422_l1419_l1414_l1410_l1407_DUPLICATE_c497_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_415e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1422_l1419_l1414_l1410_l1407_DUPLICATE_c497_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_bb15_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1422_l1419_l1414_l1410_l1407_DUPLICATE_c497_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c0df_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1422_l1419_l1414_l1410_l1407_DUPLICATE_c497_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_1f4d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1422_l1419_l1414_l1410_l1407_DUPLICATE_c497_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_415e_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1422_l1414_l1419_l1410_DUPLICATE_6e7c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_bb15_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1422_l1414_l1419_l1410_DUPLICATE_6e7c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c0df_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1422_l1414_l1419_l1410_DUPLICATE_6e7c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_1f4d_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1422_l1414_l1419_l1410_DUPLICATE_6e7c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1394_l1422_l1419_l1414_l1410_l1407_DUPLICATE_5363_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_b0ef_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1394_l1422_l1419_l1414_l1410_l1407_DUPLICATE_5363_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_415e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1394_l1422_l1419_l1414_l1410_l1407_DUPLICATE_5363_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_bb15_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1394_l1422_l1419_l1414_l1410_l1407_DUPLICATE_5363_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c0df_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1394_l1422_l1419_l1414_l1410_l1407_DUPLICATE_5363_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_1f4d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1394_l1422_l1419_l1414_l1410_l1407_DUPLICATE_5363_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1394_c2_9c9f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1394_c2_9c9f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1394_c2_9c9f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1394_c2_9c9f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_bb15_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_741a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1422_c7_1f4d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_1f4d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_1f4d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_1f4d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_1f4d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_1f4d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_1f4d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_1f4d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_1f4d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1422_c7_1f4d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1422_c7_1f4d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_1f4d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1422_c7_1f4d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_1f4d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1422_c7_1f4d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_1f4d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_1f4d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1422_c7_1f4d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1394_c2_9c9f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1422_c7_1f4d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_1f4d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_1f4d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_1f4d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_1f4d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_1f4d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_1f4d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_1f4d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_1f4d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1422_c7_1f4d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_1f4d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_1f4d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_1f4d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_1f4d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_1f4d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_1f4d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_1f4d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_1f4d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1394_c2_9c9f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1415_c3_29a6] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1415_c3_29a6_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_29a6_left;
     BIN_OP_OR_uxn_opcodes_h_l1415_c3_29a6_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_29a6_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_29a6_return_output := BIN_OP_OR_uxn_opcodes_h_l1415_c3_29a6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1419_c7_c0df] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c0df_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c0df_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c0df_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c0df_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c0df_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c0df_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c0df_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c0df_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1394_c2_9c9f] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1412_c3_a980] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1412_c3_a980_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1412_c3_a980_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1412_c3_a980_return_output := CONST_SL_8_uxn_opcodes_h_l1412_c3_a980_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1422_c7_1f4d] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1422_c7_1f4d_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_1f4d_cond;
     tmp8_MUX_uxn_opcodes_h_l1422_c7_1f4d_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_1f4d_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1422_c7_1f4d_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_1f4d_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_1f4d_return_output := tmp8_MUX_uxn_opcodes_h_l1422_c7_1f4d_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1394_c2_9c9f] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_bb15_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_29a6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1414_c7_bb15_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_29a6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1410_c7_415e_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1412_c3_a980_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c0df_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_1f4d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c0df_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_1f4d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_bb15_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c0df_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c0df_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_1f4d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c0df_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_1f4d_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_c0df_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_1f4d_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1414_c7_bb15] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_bb15_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_bb15_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_bb15_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_bb15_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_bb15_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_bb15_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1419_c7_c0df] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c0df_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c0df_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c0df_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c0df_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c0df_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c0df_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c0df_return_output := result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c0df_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1419_c7_c0df] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c0df_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c0df_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c0df_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c0df_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c0df_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c0df_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c0df_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c0df_return_output;

     -- t16_MUX[uxn_opcodes_h_l1414_c7_bb15] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1414_c7_bb15_cond <= VAR_t16_MUX_uxn_opcodes_h_l1414_c7_bb15_cond;
     t16_MUX_uxn_opcodes_h_l1414_c7_bb15_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1414_c7_bb15_iftrue;
     t16_MUX_uxn_opcodes_h_l1414_c7_bb15_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1414_c7_bb15_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output := t16_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1419_c7_c0df] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1419_c7_c0df_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_c0df_cond;
     tmp8_MUX_uxn_opcodes_h_l1419_c7_c0df_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_c0df_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1419_c7_c0df_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_c0df_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_c0df_return_output := tmp8_MUX_uxn_opcodes_h_l1419_c7_c0df_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1414_c7_bb15] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1414_c7_bb15_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_bb15_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1414_c7_bb15_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_bb15_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1414_c7_bb15_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_bb15_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output := result_u16_value_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1419_c7_c0df] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c0df_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c0df_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c0df_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c0df_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c0df_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c0df_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c0df_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c0df_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1419_c7_c0df] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c0df_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c0df_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c0df_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c0df_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c0df_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c0df_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c0df_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c0df_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_bb15_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c0df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_bb15_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c0df_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_415e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_bb15_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c0df_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_415e_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_bb15_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c0df_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1410_c7_415e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_bb15_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_c0df_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l1414_c7_bb15] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1414_c7_bb15_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_bb15_cond;
     tmp8_MUX_uxn_opcodes_h_l1414_c7_bb15_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_bb15_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1414_c7_bb15_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_bb15_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output := tmp8_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1410_c7_415e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_415e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_415e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_415e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_415e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_415e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_415e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_415e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_415e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1414_c7_bb15] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_bb15_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_bb15_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_bb15_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_bb15_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_bb15_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_bb15_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1414_c7_bb15] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1414_c7_bb15_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_bb15_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1414_c7_bb15_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_bb15_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1414_c7_bb15_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_bb15_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output := result_u8_value_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1414_c7_bb15] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_bb15_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_bb15_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_bb15_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_bb15_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_bb15_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_bb15_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1414_c7_bb15] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_bb15_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_bb15_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_bb15_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_bb15_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_bb15_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_bb15_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output;

     -- t16_MUX[uxn_opcodes_h_l1410_c7_415e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1410_c7_415e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1410_c7_415e_cond;
     t16_MUX_uxn_opcodes_h_l1410_c7_415e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1410_c7_415e_iftrue;
     t16_MUX_uxn_opcodes_h_l1410_c7_415e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1410_c7_415e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1410_c7_415e_return_output := t16_MUX_uxn_opcodes_h_l1410_c7_415e_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1410_c7_415e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1410_c7_415e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_415e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1410_c7_415e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_415e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1410_c7_415e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_415e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_415e_return_output := result_u16_value_MUX_uxn_opcodes_h_l1410_c7_415e_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_415e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_415e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_b0ef_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_415e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_415e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_b0ef_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_415e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_415e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1407_c7_b0ef_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1410_c7_415e_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_415e_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_bb15_return_output;
     -- t16_MUX[uxn_opcodes_h_l1407_c7_b0ef] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1407_c7_b0ef_cond <= VAR_t16_MUX_uxn_opcodes_h_l1407_c7_b0ef_cond;
     t16_MUX_uxn_opcodes_h_l1407_c7_b0ef_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1407_c7_b0ef_iftrue;
     t16_MUX_uxn_opcodes_h_l1407_c7_b0ef_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1407_c7_b0ef_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output := t16_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1410_c7_415e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_415e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_415e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_415e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_415e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_415e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_415e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_415e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_415e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1410_c7_415e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_415e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_415e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_415e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_415e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_415e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_415e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_415e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_415e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1407_c7_b0ef] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_b0ef_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_b0ef_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_b0ef_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_b0ef_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_b0ef_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_b0ef_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1407_c7_b0ef] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1407_c7_b0ef_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_b0ef_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1407_c7_b0ef_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_b0ef_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1407_c7_b0ef_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_b0ef_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output := result_u16_value_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1410_c7_415e] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1410_c7_415e_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_415e_cond;
     tmp8_MUX_uxn_opcodes_h_l1410_c7_415e_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_415e_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1410_c7_415e_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_415e_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_415e_return_output := tmp8_MUX_uxn_opcodes_h_l1410_c7_415e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1410_c7_415e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1410_c7_415e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_415e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1410_c7_415e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_415e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1410_c7_415e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_415e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_415e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1410_c7_415e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1410_c7_415e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_415e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_415e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_415e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_415e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_415e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_415e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_415e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_415e_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_b0ef_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_415e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_b0ef_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_415e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_b0ef_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_415e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_b0ef_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_415e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_b0ef_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_415e_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1407_c7_b0ef] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_b0ef_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_b0ef_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_b0ef_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_b0ef_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_b0ef_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_b0ef_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1394_c2_9c9f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output;

     -- t16_MUX[uxn_opcodes_h_l1394_c2_9c9f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond;
     t16_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue;
     t16_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output := t16_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1407_c7_b0ef] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_b0ef_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_b0ef_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_b0ef_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_b0ef_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_b0ef_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_b0ef_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1407_c7_b0ef] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1407_c7_b0ef_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_b0ef_cond;
     tmp8_MUX_uxn_opcodes_h_l1407_c7_b0ef_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_b0ef_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1407_c7_b0ef_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_b0ef_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output := tmp8_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1394_c2_9c9f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output := result_u16_value_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1407_c7_b0ef] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_b0ef_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_b0ef_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_b0ef_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_b0ef_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_b0ef_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_b0ef_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1407_c7_b0ef] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1407_c7_b0ef_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_b0ef_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1407_c7_b0ef_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_b0ef_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1407_c7_b0ef_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_b0ef_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output := result_u8_value_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_b0ef_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1394_c2_9c9f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1394_c2_9c9f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1394_c2_9c9f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1394_c2_9c9f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1394_c2_9c9f] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_9c9f_cond;
     tmp8_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_9c9f_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_9c9f_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output := tmp8_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output;

     -- Submodule level 7
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e393_uxn_opcodes_h_l1430_l1389_DUPLICATE_e672 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e393_uxn_opcodes_h_l1430_l1389_DUPLICATE_e672_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e393(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_9c9f_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e393_uxn_opcodes_h_l1430_l1389_DUPLICATE_e672_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e393_uxn_opcodes_h_l1430_l1389_DUPLICATE_e672_return_output;
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
