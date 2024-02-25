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
-- BIN_OP_EQ[uxn_opcodes_h_l1394_c6_3144]
signal BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3144_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3144_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3144_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1394_c2_2341]
signal t16_MUX_uxn_opcodes_h_l1394_c2_2341_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1394_c2_2341_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1394_c2_2341]
signal tmp8_MUX_uxn_opcodes_h_l1394_c2_2341_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1394_c2_2341_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1394_c2_2341]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_2341_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_2341_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1394_c2_2341]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_2341_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_2341_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1394_c2_2341]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_2341_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_2341_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1394_c2_2341]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_2341_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_2341_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1394_c2_2341]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_2341_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_2341_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1394_c2_2341]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_2341_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_2341_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1394_c2_2341]
signal result_u16_value_MUX_uxn_opcodes_h_l1394_c2_2341_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1394_c2_2341_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1394_c2_2341]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_2341_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_2341_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1394_c2_2341]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_2341_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_2341_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1394_c2_2341]
signal result_u8_value_MUX_uxn_opcodes_h_l1394_c2_2341_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1394_c2_2341_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1407_c11_3cad]
signal BIN_OP_EQ_uxn_opcodes_h_l1407_c11_3cad_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1407_c11_3cad_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1407_c11_3cad_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1407_c7_5957]
signal t16_MUX_uxn_opcodes_h_l1407_c7_5957_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1407_c7_5957_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1407_c7_5957_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1407_c7_5957_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1407_c7_5957]
signal tmp8_MUX_uxn_opcodes_h_l1407_c7_5957_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1407_c7_5957_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1407_c7_5957_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1407_c7_5957_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1407_c7_5957]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_5957_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_5957_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_5957_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_5957_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1407_c7_5957]
signal result_u16_value_MUX_uxn_opcodes_h_l1407_c7_5957_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1407_c7_5957_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1407_c7_5957_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1407_c7_5957_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1407_c7_5957]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_5957_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_5957_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_5957_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_5957_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1407_c7_5957]
signal result_u8_value_MUX_uxn_opcodes_h_l1407_c7_5957_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1407_c7_5957_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1407_c7_5957_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1407_c7_5957_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1407_c7_5957]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_5957_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_5957_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_5957_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_5957_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1407_c7_5957]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_5957_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_5957_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_5957_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_5957_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1410_c11_bccd]
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_bccd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_bccd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_bccd_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1410_c7_fa2e]
signal t16_MUX_uxn_opcodes_h_l1410_c7_fa2e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1410_c7_fa2e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1410_c7_fa2e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1410_c7_fa2e]
signal tmp8_MUX_uxn_opcodes_h_l1410_c7_fa2e_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1410_c7_fa2e_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1410_c7_fa2e_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1410_c7_fa2e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_fa2e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_fa2e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_fa2e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1410_c7_fa2e]
signal result_u16_value_MUX_uxn_opcodes_h_l1410_c7_fa2e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1410_c7_fa2e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1410_c7_fa2e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1410_c7_fa2e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_fa2e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_fa2e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_fa2e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1410_c7_fa2e]
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_fa2e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_fa2e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_fa2e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1410_c7_fa2e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_fa2e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_fa2e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_fa2e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1410_c7_fa2e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_fa2e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_fa2e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_fa2e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1412_c3_0b4e]
signal CONST_SL_8_uxn_opcodes_h_l1412_c3_0b4e_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1412_c3_0b4e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1414_c11_1309]
signal BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1309_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1309_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1309_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1414_c7_8fa1]
signal t16_MUX_uxn_opcodes_h_l1414_c7_8fa1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1414_c7_8fa1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1414_c7_8fa1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1414_c7_8fa1]
signal tmp8_MUX_uxn_opcodes_h_l1414_c7_8fa1_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1414_c7_8fa1_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1414_c7_8fa1_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1414_c7_8fa1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_8fa1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_8fa1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_8fa1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1414_c7_8fa1]
signal result_u16_value_MUX_uxn_opcodes_h_l1414_c7_8fa1_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1414_c7_8fa1_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1414_c7_8fa1_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1414_c7_8fa1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_8fa1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_8fa1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_8fa1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1414_c7_8fa1]
signal result_u8_value_MUX_uxn_opcodes_h_l1414_c7_8fa1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1414_c7_8fa1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1414_c7_8fa1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1414_c7_8fa1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_8fa1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_8fa1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_8fa1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1414_c7_8fa1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_8fa1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_8fa1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_8fa1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1415_c3_3b62]
signal BIN_OP_OR_uxn_opcodes_h_l1415_c3_3b62_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1415_c3_3b62_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1415_c3_3b62_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1416_c30_b008]
signal sp_relative_shift_uxn_opcodes_h_l1416_c30_b008_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1416_c30_b008_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1416_c30_b008_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1416_c30_b008_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1419_c11_646f]
signal BIN_OP_EQ_uxn_opcodes_h_l1419_c11_646f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1419_c11_646f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1419_c11_646f_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1419_c7_c67a]
signal tmp8_MUX_uxn_opcodes_h_l1419_c7_c67a_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1419_c7_c67a_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1419_c7_c67a_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1419_c7_c67a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1419_c7_c67a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c67a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c67a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c67a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c67a_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1419_c7_c67a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c67a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c67a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c67a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c67a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1419_c7_c67a]
signal result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c67a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c67a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c67a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c67a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1419_c7_c67a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c67a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c67a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c67a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c67a_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1419_c7_c67a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c67a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c67a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c67a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c67a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1422_c11_2c5e]
signal BIN_OP_EQ_uxn_opcodes_h_l1422_c11_2c5e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1422_c11_2c5e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1422_c11_2c5e_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1422_c7_0019]
signal tmp8_MUX_uxn_opcodes_h_l1422_c7_0019_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1422_c7_0019_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1422_c7_0019_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1422_c7_0019_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1422_c7_0019]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_0019_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_0019_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_0019_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_0019_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1422_c7_0019]
signal result_u8_value_MUX_uxn_opcodes_h_l1422_c7_0019_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1422_c7_0019_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1422_c7_0019_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1422_c7_0019_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1422_c7_0019]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_0019_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_0019_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_0019_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_0019_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1422_c7_0019]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_0019_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_0019_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_0019_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_0019_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_d736( ref_toks_0 : opcode_result_t;
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
      base.is_pc_updated := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.u16_value := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.is_vram_write := ref_toks_9;
      base.u8_value := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3144
BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3144 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3144_left,
BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3144_right,
BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3144_return_output);

-- t16_MUX_uxn_opcodes_h_l1394_c2_2341
t16_MUX_uxn_opcodes_h_l1394_c2_2341 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1394_c2_2341_cond,
t16_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue,
t16_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse,
t16_MUX_uxn_opcodes_h_l1394_c2_2341_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1394_c2_2341
tmp8_MUX_uxn_opcodes_h_l1394_c2_2341 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1394_c2_2341_cond,
tmp8_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue,
tmp8_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse,
tmp8_MUX_uxn_opcodes_h_l1394_c2_2341_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_2341
result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_2341 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_2341_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_2341_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_2341
result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_2341 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_2341_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_2341_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_2341
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_2341 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_2341_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_2341_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_2341
result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_2341 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_2341_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_2341_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_2341
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_2341 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_2341_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_2341_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_2341
result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_2341 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_2341_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_2341_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1394_c2_2341
result_u16_value_MUX_uxn_opcodes_h_l1394_c2_2341 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1394_c2_2341_cond,
result_u16_value_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1394_c2_2341_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_2341
result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_2341 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_2341_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_2341_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_2341
result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_2341 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_2341_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_2341_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1394_c2_2341
result_u8_value_MUX_uxn_opcodes_h_l1394_c2_2341 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1394_c2_2341_cond,
result_u8_value_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1394_c2_2341_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1407_c11_3cad
BIN_OP_EQ_uxn_opcodes_h_l1407_c11_3cad : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1407_c11_3cad_left,
BIN_OP_EQ_uxn_opcodes_h_l1407_c11_3cad_right,
BIN_OP_EQ_uxn_opcodes_h_l1407_c11_3cad_return_output);

-- t16_MUX_uxn_opcodes_h_l1407_c7_5957
t16_MUX_uxn_opcodes_h_l1407_c7_5957 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1407_c7_5957_cond,
t16_MUX_uxn_opcodes_h_l1407_c7_5957_iftrue,
t16_MUX_uxn_opcodes_h_l1407_c7_5957_iffalse,
t16_MUX_uxn_opcodes_h_l1407_c7_5957_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1407_c7_5957
tmp8_MUX_uxn_opcodes_h_l1407_c7_5957 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1407_c7_5957_cond,
tmp8_MUX_uxn_opcodes_h_l1407_c7_5957_iftrue,
tmp8_MUX_uxn_opcodes_h_l1407_c7_5957_iffalse,
tmp8_MUX_uxn_opcodes_h_l1407_c7_5957_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_5957
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_5957 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_5957_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_5957_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_5957_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_5957_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1407_c7_5957
result_u16_value_MUX_uxn_opcodes_h_l1407_c7_5957 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1407_c7_5957_cond,
result_u16_value_MUX_uxn_opcodes_h_l1407_c7_5957_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1407_c7_5957_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1407_c7_5957_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_5957
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_5957 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_5957_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_5957_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_5957_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_5957_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1407_c7_5957
result_u8_value_MUX_uxn_opcodes_h_l1407_c7_5957 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1407_c7_5957_cond,
result_u8_value_MUX_uxn_opcodes_h_l1407_c7_5957_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1407_c7_5957_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1407_c7_5957_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_5957
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_5957 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_5957_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_5957_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_5957_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_5957_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_5957
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_5957 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_5957_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_5957_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_5957_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_5957_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1410_c11_bccd
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_bccd : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_bccd_left,
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_bccd_right,
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_bccd_return_output);

-- t16_MUX_uxn_opcodes_h_l1410_c7_fa2e
t16_MUX_uxn_opcodes_h_l1410_c7_fa2e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1410_c7_fa2e_cond,
t16_MUX_uxn_opcodes_h_l1410_c7_fa2e_iftrue,
t16_MUX_uxn_opcodes_h_l1410_c7_fa2e_iffalse,
t16_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1410_c7_fa2e
tmp8_MUX_uxn_opcodes_h_l1410_c7_fa2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1410_c7_fa2e_cond,
tmp8_MUX_uxn_opcodes_h_l1410_c7_fa2e_iftrue,
tmp8_MUX_uxn_opcodes_h_l1410_c7_fa2e_iffalse,
tmp8_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_fa2e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_fa2e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_fa2e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_fa2e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_fa2e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1410_c7_fa2e
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_fa2e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_fa2e_cond,
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_fa2e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_fa2e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_fa2e
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_fa2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_fa2e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_fa2e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_fa2e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1410_c7_fa2e
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_fa2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_fa2e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_fa2e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_fa2e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_fa2e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_fa2e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_fa2e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_fa2e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_fa2e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_fa2e
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_fa2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_fa2e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_fa2e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_fa2e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1412_c3_0b4e
CONST_SL_8_uxn_opcodes_h_l1412_c3_0b4e : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1412_c3_0b4e_x,
CONST_SL_8_uxn_opcodes_h_l1412_c3_0b4e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1309
BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1309 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1309_left,
BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1309_right,
BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1309_return_output);

-- t16_MUX_uxn_opcodes_h_l1414_c7_8fa1
t16_MUX_uxn_opcodes_h_l1414_c7_8fa1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1414_c7_8fa1_cond,
t16_MUX_uxn_opcodes_h_l1414_c7_8fa1_iftrue,
t16_MUX_uxn_opcodes_h_l1414_c7_8fa1_iffalse,
t16_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1414_c7_8fa1
tmp8_MUX_uxn_opcodes_h_l1414_c7_8fa1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1414_c7_8fa1_cond,
tmp8_MUX_uxn_opcodes_h_l1414_c7_8fa1_iftrue,
tmp8_MUX_uxn_opcodes_h_l1414_c7_8fa1_iffalse,
tmp8_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_8fa1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_8fa1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_8fa1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_8fa1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_8fa1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1414_c7_8fa1
result_u16_value_MUX_uxn_opcodes_h_l1414_c7_8fa1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1414_c7_8fa1_cond,
result_u16_value_MUX_uxn_opcodes_h_l1414_c7_8fa1_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1414_c7_8fa1_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_8fa1
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_8fa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_8fa1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_8fa1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_8fa1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1414_c7_8fa1
result_u8_value_MUX_uxn_opcodes_h_l1414_c7_8fa1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1414_c7_8fa1_cond,
result_u8_value_MUX_uxn_opcodes_h_l1414_c7_8fa1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1414_c7_8fa1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_8fa1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_8fa1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_8fa1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_8fa1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_8fa1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_8fa1
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_8fa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_8fa1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_8fa1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_8fa1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1415_c3_3b62
BIN_OP_OR_uxn_opcodes_h_l1415_c3_3b62 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1415_c3_3b62_left,
BIN_OP_OR_uxn_opcodes_h_l1415_c3_3b62_right,
BIN_OP_OR_uxn_opcodes_h_l1415_c3_3b62_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1416_c30_b008
sp_relative_shift_uxn_opcodes_h_l1416_c30_b008 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1416_c30_b008_ins,
sp_relative_shift_uxn_opcodes_h_l1416_c30_b008_x,
sp_relative_shift_uxn_opcodes_h_l1416_c30_b008_y,
sp_relative_shift_uxn_opcodes_h_l1416_c30_b008_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1419_c11_646f
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_646f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_646f_left,
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_646f_right,
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_646f_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1419_c7_c67a
tmp8_MUX_uxn_opcodes_h_l1419_c7_c67a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1419_c7_c67a_cond,
tmp8_MUX_uxn_opcodes_h_l1419_c7_c67a_iftrue,
tmp8_MUX_uxn_opcodes_h_l1419_c7_c67a_iffalse,
tmp8_MUX_uxn_opcodes_h_l1419_c7_c67a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c67a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c67a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c67a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c67a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c67a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c67a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c67a
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c67a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c67a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c67a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c67a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c67a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c67a
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c67a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c67a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c67a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c67a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c67a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c67a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c67a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c67a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c67a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c67a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c67a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c67a
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c67a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c67a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c67a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c67a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c67a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1422_c11_2c5e
BIN_OP_EQ_uxn_opcodes_h_l1422_c11_2c5e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1422_c11_2c5e_left,
BIN_OP_EQ_uxn_opcodes_h_l1422_c11_2c5e_right,
BIN_OP_EQ_uxn_opcodes_h_l1422_c11_2c5e_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1422_c7_0019
tmp8_MUX_uxn_opcodes_h_l1422_c7_0019 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1422_c7_0019_cond,
tmp8_MUX_uxn_opcodes_h_l1422_c7_0019_iftrue,
tmp8_MUX_uxn_opcodes_h_l1422_c7_0019_iffalse,
tmp8_MUX_uxn_opcodes_h_l1422_c7_0019_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_0019
result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_0019 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_0019_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_0019_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_0019_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_0019_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1422_c7_0019
result_u8_value_MUX_uxn_opcodes_h_l1422_c7_0019 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1422_c7_0019_cond,
result_u8_value_MUX_uxn_opcodes_h_l1422_c7_0019_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1422_c7_0019_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1422_c7_0019_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_0019
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_0019 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_0019_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_0019_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_0019_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_0019_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_0019
result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_0019 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_0019_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_0019_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_0019_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_0019_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3144_return_output,
 t16_MUX_uxn_opcodes_h_l1394_c2_2341_return_output,
 tmp8_MUX_uxn_opcodes_h_l1394_c2_2341_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_2341_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_2341_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_2341_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_2341_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_2341_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_2341_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1394_c2_2341_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_2341_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_2341_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1394_c2_2341_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1407_c11_3cad_return_output,
 t16_MUX_uxn_opcodes_h_l1407_c7_5957_return_output,
 tmp8_MUX_uxn_opcodes_h_l1407_c7_5957_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_5957_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1407_c7_5957_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_5957_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1407_c7_5957_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_5957_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_5957_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1410_c11_bccd_return_output,
 t16_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output,
 tmp8_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output,
 CONST_SL_8_uxn_opcodes_h_l1412_c3_0b4e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1309_return_output,
 t16_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output,
 tmp8_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1415_c3_3b62_return_output,
 sp_relative_shift_uxn_opcodes_h_l1416_c30_b008_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1419_c11_646f_return_output,
 tmp8_MUX_uxn_opcodes_h_l1419_c7_c67a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c67a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c67a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c67a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c67a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c67a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1422_c11_2c5e_return_output,
 tmp8_MUX_uxn_opcodes_h_l1422_c7_0019_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_0019_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1422_c7_0019_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_0019_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_0019_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3144_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3144_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3144_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1407_c7_5957_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1394_c2_2341_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1394_c2_2341_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_5957_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_2341_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_2341_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1399_c3_5a08 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_5957_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_2341_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_2341_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1394_c2_2341_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_2341_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_2341_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1394_c2_2341_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_2341_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_2341_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_5957_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_2341_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_2341_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1404_c3_83b0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_5957_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_2341_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_2341_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_5957_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_2341_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_2341_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_5957_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_2341_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_2341_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1394_c2_2341_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_2341_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_2341_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1394_c2_2341_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_2341_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_2341_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_5957_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_2341_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_2341_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_3cad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_3cad_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_3cad_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1407_c7_5957_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1407_c7_5957_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1407_c7_5957_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_5957_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_5957_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_5957_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_5957_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_5957_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_5957_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_5957_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_5957_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_5957_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_5957_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_5957_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_5957_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_5957_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_5957_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_5957_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_5957_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1408_c3_35db : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_5957_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_5957_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_5957_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_5957_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_5957_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_bccd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_bccd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_bccd_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1410_c7_fa2e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1410_c7_fa2e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1410_c7_fa2e_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_fa2e_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_fa2e_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_fa2e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_fa2e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_fa2e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_fa2e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_fa2e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_fa2e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_fa2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_fa2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_fa2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_fa2e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_fa2e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_fa2e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_fa2e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_fa2e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_fa2e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_fa2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_fa2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_fa2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_fa2e_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1412_c3_0b4e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1412_c3_0b4e_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1309_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1309_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1309_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1414_c7_8fa1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1414_c7_8fa1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1414_c7_8fa1_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_8fa1_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_8fa1_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_c67a_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_8fa1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_8fa1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_8fa1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c67a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_8fa1_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_8fa1_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_8fa1_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_8fa1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_8fa1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_8fa1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c67a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_8fa1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_8fa1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_8fa1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c67a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_8fa1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_8fa1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_8fa1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c67a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_8fa1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_8fa1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_8fa1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c67a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_8fa1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_3b62_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_3b62_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_3b62_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_b008_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_b008_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_b008_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_b008_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_646f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_646f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_646f_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_c67a_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_c67a_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_0019_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_c67a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c67a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1420_c3_cbb4 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c67a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c67a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c67a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c67a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_0019_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c67a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c67a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c67a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_0019_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c67a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c67a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c67a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_0019_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c67a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c67a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c67a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_0019_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c67a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_2c5e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_2c5e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_2c5e_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_0019_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_0019_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_0019_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_0019_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_0019_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_0019_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_0019_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_0019_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_0019_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_0019_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1425_c3_60ee : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_0019_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_0019_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_0019_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_0019_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_0019_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1407_l1410_l1394_l1414_DUPLICATE_543b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1419_l1414_l1410_l1407_l1394_l1422_DUPLICATE_6d23_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1419_l1410_DUPLICATE_d5f5_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1419_l1414_l1410_l1407_l1422_DUPLICATE_5d15_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1419_l1414_l1410_l1407_l1422_DUPLICATE_f56d_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1415_l1411_DUPLICATE_40d4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1419_l1410_l1422_l1414_DUPLICATE_22e3_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d736_uxn_opcodes_h_l1389_l1430_DUPLICATE_8187_return_output : opcode_result_t;
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
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1399_c3_5a08 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1399_c3_5a08;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_0019_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_3cad_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1420_c3_cbb4 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c67a_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1420_c3_cbb4;
     VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_b008_y := resize(to_signed(-1, 2), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1425_c3_60ee := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_0019_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1425_c3_60ee;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1404_c3_83b0 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1404_c3_83b0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3144_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_2c5e_right := to_unsigned(5, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1309_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_0019_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_bccd_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_b008_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_646f_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1408_c3_35db := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_5957_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1408_c3_35db;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_b008_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3144_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_3cad_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_bccd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1309_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_646f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_2c5e_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_0019_iftrue := VAR_previous_ram_read;
     VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_0019_iftrue := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_3b62_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1407_c7_5957_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1414_c7_8fa1_iffalse := t16;
     VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_5957_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_fa2e_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_8fa1_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_c67a_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_0019_iffalse := tmp8;
     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1419_l1410_l1422_l1414_DUPLICATE_22e3 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1419_l1410_l1422_l1414_DUPLICATE_22e3_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1414_c11_1309] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1309_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1309_left;
     BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1309_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1309_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1309_return_output := BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1309_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1415_l1411_DUPLICATE_40d4 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1415_l1411_DUPLICATE_40d4_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1422_c11_2c5e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1422_c11_2c5e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_2c5e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1422_c11_2c5e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_2c5e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_2c5e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1422_c11_2c5e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1419_l1414_l1410_l1407_l1422_DUPLICATE_5d15 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1419_l1414_l1410_l1407_l1422_DUPLICATE_5d15_return_output := result.is_stack_write;

     -- sp_relative_shift[uxn_opcodes_h_l1416_c30_b008] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1416_c30_b008_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_b008_ins;
     sp_relative_shift_uxn_opcodes_h_l1416_c30_b008_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_b008_x;
     sp_relative_shift_uxn_opcodes_h_l1416_c30_b008_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_b008_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_b008_return_output := sp_relative_shift_uxn_opcodes_h_l1416_c30_b008_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1407_c11_3cad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1407_c11_3cad_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_3cad_left;
     BIN_OP_EQ_uxn_opcodes_h_l1407_c11_3cad_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_3cad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_3cad_return_output := BIN_OP_EQ_uxn_opcodes_h_l1407_c11_3cad_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1419_l1414_l1410_l1407_l1394_l1422_DUPLICATE_6d23 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1419_l1414_l1410_l1407_l1394_l1422_DUPLICATE_6d23_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1419_l1414_l1410_l1407_l1422_DUPLICATE_f56d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1419_l1414_l1410_l1407_l1422_DUPLICATE_f56d_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1407_l1410_l1394_l1414_DUPLICATE_543b LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1407_l1410_l1394_l1414_DUPLICATE_543b_return_output := result.u16_value;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1394_c2_2341] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1394_c2_2341_return_output := result.is_stack_index_flipped;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1394_c2_2341] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1394_c2_2341_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1410_c11_bccd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1410_c11_bccd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_bccd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1410_c11_bccd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_bccd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_bccd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1410_c11_bccd_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1394_c2_2341] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1394_c2_2341_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1394_c6_3144] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3144_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3144_left;
     BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3144_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3144_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3144_return_output := BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3144_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1419_l1410_DUPLICATE_d5f5 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1419_l1410_DUPLICATE_d5f5_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1419_c11_646f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1419_c11_646f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_646f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1419_c11_646f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_646f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_646f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1419_c11_646f_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1394_c2_2341] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1394_c2_2341_return_output := result.is_vram_write;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_2341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3144_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_2341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3144_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_2341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3144_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_2341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3144_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_2341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3144_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_2341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3144_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_2341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3144_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_2341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3144_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_2341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3144_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_2341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3144_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1394_c2_2341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3144_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_2341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3144_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_5957_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_3cad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_5957_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_3cad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_5957_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_3cad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_5957_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_3cad_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_5957_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_3cad_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_5957_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_3cad_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1407_c7_5957_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_3cad_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_5957_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_3cad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_fa2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_bccd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_fa2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_bccd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_fa2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_bccd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_fa2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_bccd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_fa2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_bccd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_fa2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_bccd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1410_c7_fa2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_bccd_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_fa2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_bccd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_8fa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1309_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_8fa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1309_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_8fa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1309_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_8fa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1309_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_8fa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1309_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_8fa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1309_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1414_c7_8fa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1309_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_8fa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_1309_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c67a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_646f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c67a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_646f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c67a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_646f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c67a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_646f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c67a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_646f_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_c67a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_646f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_0019_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_2c5e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_0019_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_2c5e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_0019_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_2c5e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_0019_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_2c5e_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_0019_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_2c5e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_3b62_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1415_l1411_DUPLICATE_40d4_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1412_c3_0b4e_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1415_l1411_DUPLICATE_40d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_5957_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1419_l1410_DUPLICATE_d5f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_fa2e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1419_l1410_DUPLICATE_d5f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c67a_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1419_l1410_DUPLICATE_d5f5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1407_l1410_l1394_l1414_DUPLICATE_543b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_5957_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1407_l1410_l1394_l1414_DUPLICATE_543b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_fa2e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1407_l1410_l1394_l1414_DUPLICATE_543b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_8fa1_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1407_l1410_l1394_l1414_DUPLICATE_543b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_5957_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1419_l1414_l1410_l1407_l1422_DUPLICATE_f56d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_fa2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1419_l1414_l1410_l1407_l1422_DUPLICATE_f56d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_8fa1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1419_l1414_l1410_l1407_l1422_DUPLICATE_f56d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c67a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1419_l1414_l1410_l1407_l1422_DUPLICATE_f56d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_0019_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1419_l1414_l1410_l1407_l1422_DUPLICATE_f56d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_5957_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1419_l1414_l1410_l1407_l1422_DUPLICATE_5d15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_fa2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1419_l1414_l1410_l1407_l1422_DUPLICATE_5d15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_8fa1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1419_l1414_l1410_l1407_l1422_DUPLICATE_5d15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c67a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1419_l1414_l1410_l1407_l1422_DUPLICATE_5d15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_0019_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1419_l1414_l1410_l1407_l1422_DUPLICATE_5d15_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_fa2e_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1419_l1410_l1422_l1414_DUPLICATE_22e3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_8fa1_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1419_l1410_l1422_l1414_DUPLICATE_22e3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c67a_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1419_l1410_l1422_l1414_DUPLICATE_22e3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_0019_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1419_l1410_l1422_l1414_DUPLICATE_22e3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1419_l1414_l1410_l1407_l1394_l1422_DUPLICATE_6d23_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_5957_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1419_l1414_l1410_l1407_l1394_l1422_DUPLICATE_6d23_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_fa2e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1419_l1414_l1410_l1407_l1394_l1422_DUPLICATE_6d23_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_8fa1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1419_l1414_l1410_l1407_l1394_l1422_DUPLICATE_6d23_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c67a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1419_l1414_l1410_l1407_l1394_l1422_DUPLICATE_6d23_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_0019_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1419_l1414_l1410_l1407_l1394_l1422_DUPLICATE_6d23_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1394_c2_2341_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1394_c2_2341_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1394_c2_2341_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1394_c2_2341_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_8fa1_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_b008_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l1394_c2_2341] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_2341_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_2341_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_2341_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_2341_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1422_c7_0019] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1422_c7_0019_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_0019_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1422_c7_0019_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_0019_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1422_c7_0019_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_0019_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_0019_return_output := result_u8_value_MUX_uxn_opcodes_h_l1422_c7_0019_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1394_c2_2341] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_2341_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_2341_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_2341_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_2341_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1412_c3_0b4e] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1412_c3_0b4e_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1412_c3_0b4e_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1412_c3_0b4e_return_output := CONST_SL_8_uxn_opcodes_h_l1412_c3_0b4e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1422_c7_0019] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_0019_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_0019_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_0019_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_0019_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_0019_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_0019_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_0019_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_0019_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1422_c7_0019] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1422_c7_0019_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_0019_cond;
     tmp8_MUX_uxn_opcodes_h_l1422_c7_0019_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_0019_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1422_c7_0019_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_0019_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_0019_return_output := tmp8_MUX_uxn_opcodes_h_l1422_c7_0019_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1419_c7_c67a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c67a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c67a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c67a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c67a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c67a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c67a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c67a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c67a_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1394_c2_2341] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_2341_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_2341_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_2341_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_2341_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1394_c2_2341] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_2341_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_2341_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_2341_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_2341_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1422_c7_0019] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_0019_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_0019_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_0019_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_0019_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_0019_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_0019_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_0019_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_0019_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1415_c3_3b62] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1415_c3_3b62_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_3b62_left;
     BIN_OP_OR_uxn_opcodes_h_l1415_c3_3b62_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_3b62_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_3b62_return_output := BIN_OP_OR_uxn_opcodes_h_l1415_c3_3b62_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1422_c7_0019] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_0019_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_0019_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_0019_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_0019_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_0019_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_0019_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_0019_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_0019_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_8fa1_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_3b62_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1414_c7_8fa1_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_3b62_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1410_c7_fa2e_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1412_c3_0b4e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c67a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_0019_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c67a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_0019_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_8fa1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c67a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c67a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_0019_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c67a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_0019_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_c67a_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_0019_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1419_c7_c67a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c67a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c67a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c67a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c67a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c67a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c67a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c67a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c67a_return_output;

     -- t16_MUX[uxn_opcodes_h_l1414_c7_8fa1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1414_c7_8fa1_cond <= VAR_t16_MUX_uxn_opcodes_h_l1414_c7_8fa1_cond;
     t16_MUX_uxn_opcodes_h_l1414_c7_8fa1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1414_c7_8fa1_iftrue;
     t16_MUX_uxn_opcodes_h_l1414_c7_8fa1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1414_c7_8fa1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output := t16_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1419_c7_c67a] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1419_c7_c67a_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_c67a_cond;
     tmp8_MUX_uxn_opcodes_h_l1419_c7_c67a_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_c67a_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1419_c7_c67a_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_c67a_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_c67a_return_output := tmp8_MUX_uxn_opcodes_h_l1419_c7_c67a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1419_c7_c67a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c67a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c67a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c67a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c67a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c67a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c67a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c67a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c67a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1414_c7_8fa1] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1414_c7_8fa1_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_8fa1_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1414_c7_8fa1_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_8fa1_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1414_c7_8fa1_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_8fa1_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output := result_u16_value_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1414_c7_8fa1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_8fa1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_8fa1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_8fa1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_8fa1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_8fa1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_8fa1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1419_c7_c67a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c67a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c67a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c67a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c67a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c67a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c67a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c67a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c67a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1419_c7_c67a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c67a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c67a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c67a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c67a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c67a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c67a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c67a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c67a_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_8fa1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c67a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_8fa1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c67a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_fa2e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_8fa1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c67a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_fa2e_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_8fa1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c67a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1410_c7_fa2e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_8fa1_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_c67a_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1414_c7_8fa1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_8fa1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_8fa1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_8fa1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_8fa1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_8fa1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_8fa1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1410_c7_fa2e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1410_c7_fa2e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_fa2e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1410_c7_fa2e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_fa2e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1410_c7_fa2e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_fa2e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output := result_u16_value_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output;

     -- t16_MUX[uxn_opcodes_h_l1410_c7_fa2e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1410_c7_fa2e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1410_c7_fa2e_cond;
     t16_MUX_uxn_opcodes_h_l1410_c7_fa2e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1410_c7_fa2e_iftrue;
     t16_MUX_uxn_opcodes_h_l1410_c7_fa2e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1410_c7_fa2e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output := t16_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1410_c7_fa2e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_fa2e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_fa2e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_fa2e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_fa2e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_fa2e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_fa2e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1414_c7_8fa1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_8fa1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_8fa1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_8fa1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_8fa1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_8fa1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_8fa1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1414_c7_8fa1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1414_c7_8fa1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_8fa1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1414_c7_8fa1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_8fa1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1414_c7_8fa1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_8fa1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output := result_u8_value_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1414_c7_8fa1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_8fa1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_8fa1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_8fa1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_8fa1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_8fa1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_8fa1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1414_c7_8fa1] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1414_c7_8fa1_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_8fa1_cond;
     tmp8_MUX_uxn_opcodes_h_l1414_c7_8fa1_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_8fa1_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1414_c7_8fa1_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_8fa1_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output := tmp8_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_fa2e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_fa2e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_5957_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_fa2e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_5957_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_fa2e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1407_c7_5957_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_fa2e_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_8fa1_return_output;
     -- t16_MUX[uxn_opcodes_h_l1407_c7_5957] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1407_c7_5957_cond <= VAR_t16_MUX_uxn_opcodes_h_l1407_c7_5957_cond;
     t16_MUX_uxn_opcodes_h_l1407_c7_5957_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1407_c7_5957_iftrue;
     t16_MUX_uxn_opcodes_h_l1407_c7_5957_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1407_c7_5957_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1407_c7_5957_return_output := t16_MUX_uxn_opcodes_h_l1407_c7_5957_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1410_c7_fa2e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_fa2e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_fa2e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_fa2e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_fa2e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_fa2e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_fa2e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1410_c7_fa2e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1410_c7_fa2e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_fa2e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1410_c7_fa2e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_fa2e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1410_c7_fa2e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_fa2e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1407_c7_5957] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1407_c7_5957_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_5957_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1407_c7_5957_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_5957_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1407_c7_5957_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_5957_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_5957_return_output := result_u16_value_MUX_uxn_opcodes_h_l1407_c7_5957_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1410_c7_fa2e] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1410_c7_fa2e_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_fa2e_cond;
     tmp8_MUX_uxn_opcodes_h_l1410_c7_fa2e_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_fa2e_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1410_c7_fa2e_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_fa2e_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output := tmp8_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1407_c7_5957] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_5957_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_5957_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_5957_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_5957_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_5957_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_5957_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_5957_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_5957_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1410_c7_fa2e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_fa2e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_fa2e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_fa2e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_fa2e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_fa2e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_fa2e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1410_c7_fa2e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_fa2e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_fa2e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_fa2e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_fa2e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_fa2e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_fa2e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_5957_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_5957_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_5957_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_5957_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_5957_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_5957_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1407_c7_5957_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_5957_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_fa2e_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1394_c2_2341] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_2341_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_2341_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_2341_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_2341_return_output;

     -- t16_MUX[uxn_opcodes_h_l1394_c2_2341] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1394_c2_2341_cond <= VAR_t16_MUX_uxn_opcodes_h_l1394_c2_2341_cond;
     t16_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue;
     t16_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1394_c2_2341_return_output := t16_MUX_uxn_opcodes_h_l1394_c2_2341_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1407_c7_5957] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_5957_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_5957_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_5957_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_5957_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_5957_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_5957_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_5957_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_5957_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1407_c7_5957] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_5957_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_5957_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_5957_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_5957_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_5957_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_5957_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_5957_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_5957_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1407_c7_5957] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1407_c7_5957_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_5957_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1407_c7_5957_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_5957_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1407_c7_5957_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_5957_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_5957_return_output := result_u8_value_MUX_uxn_opcodes_h_l1407_c7_5957_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1407_c7_5957] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_5957_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_5957_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_5957_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_5957_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_5957_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_5957_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_5957_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_5957_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1394_c2_2341] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1394_c2_2341_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_2341_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_2341_return_output := result_u16_value_MUX_uxn_opcodes_h_l1394_c2_2341_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1407_c7_5957] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1407_c7_5957_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_5957_cond;
     tmp8_MUX_uxn_opcodes_h_l1407_c7_5957_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_5957_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1407_c7_5957_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_5957_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_5957_return_output := tmp8_MUX_uxn_opcodes_h_l1407_c7_5957_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_5957_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_5957_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_5957_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_5957_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1394_c2_2341_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_5957_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1394_c2_2341] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_2341_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_2341_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_2341_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_2341_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1394_c2_2341] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1394_c2_2341_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_2341_cond;
     tmp8_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_2341_return_output := tmp8_MUX_uxn_opcodes_h_l1394_c2_2341_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1394_c2_2341] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_2341_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_2341_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_2341_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_2341_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1394_c2_2341] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_2341_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_2341_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_2341_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_2341_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1394_c2_2341] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1394_c2_2341_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_2341_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_2341_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_2341_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_2341_return_output := result_u8_value_MUX_uxn_opcodes_h_l1394_c2_2341_return_output;

     -- Submodule level 7
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_2341_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d736_uxn_opcodes_h_l1389_l1430_DUPLICATE_8187 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d736_uxn_opcodes_h_l1389_l1430_DUPLICATE_8187_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d736(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_2341_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_2341_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_2341_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_2341_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_2341_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_2341_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_2341_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_2341_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_2341_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_2341_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d736_uxn_opcodes_h_l1389_l1430_DUPLICATE_8187_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d736_uxn_opcodes_h_l1389_l1430_DUPLICATE_8187_return_output;
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
