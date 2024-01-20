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
-- BIN_OP_EQ[uxn_opcodes_h_l1394_c6_54c9]
signal BIN_OP_EQ_uxn_opcodes_h_l1394_c6_54c9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1394_c6_54c9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1394_c6_54c9_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1394_c2_c2e3]
signal t16_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1394_c2_c2e3]
signal tmp8_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1394_c2_c2e3]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1394_c2_c2e3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1394_c2_c2e3]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1394_c2_c2e3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1394_c2_c2e3]
signal result_u8_value_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1394_c2_c2e3]
signal result_u16_value_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1394_c2_c2e3]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1394_c2_c2e3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1394_c2_c2e3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1394_c2_c2e3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1407_c11_1713]
signal BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1713_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1713_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1713_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1407_c7_1cd0]
signal t16_MUX_uxn_opcodes_h_l1407_c7_1cd0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1407_c7_1cd0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1407_c7_1cd0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1407_c7_1cd0]
signal tmp8_MUX_uxn_opcodes_h_l1407_c7_1cd0_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1407_c7_1cd0_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1407_c7_1cd0_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1407_c7_1cd0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1cd0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1cd0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1cd0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1407_c7_1cd0]
signal result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1cd0_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1cd0_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1cd0_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1407_c7_1cd0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1cd0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1cd0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1cd0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1407_c7_1cd0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1cd0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1cd0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1cd0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1407_c7_1cd0]
signal result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1cd0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1cd0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1cd0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1407_c7_1cd0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1cd0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1cd0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1cd0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1410_c11_3efe]
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_3efe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_3efe_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_3efe_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1410_c7_4d9a]
signal t16_MUX_uxn_opcodes_h_l1410_c7_4d9a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1410_c7_4d9a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1410_c7_4d9a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1410_c7_4d9a]
signal tmp8_MUX_uxn_opcodes_h_l1410_c7_4d9a_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1410_c7_4d9a_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1410_c7_4d9a_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1410_c7_4d9a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_4d9a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_4d9a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_4d9a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1410_c7_4d9a]
signal result_u16_value_MUX_uxn_opcodes_h_l1410_c7_4d9a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1410_c7_4d9a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1410_c7_4d9a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1410_c7_4d9a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_4d9a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_4d9a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_4d9a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1410_c7_4d9a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_4d9a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_4d9a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_4d9a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1410_c7_4d9a]
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_4d9a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_4d9a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_4d9a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1410_c7_4d9a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_4d9a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_4d9a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_4d9a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output : unsigned(3 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1412_c3_0006]
signal CONST_SL_8_uxn_opcodes_h_l1412_c3_0006_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1412_c3_0006_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1414_c11_7f42]
signal BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7f42_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7f42_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7f42_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1414_c7_c209]
signal t16_MUX_uxn_opcodes_h_l1414_c7_c209_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1414_c7_c209_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1414_c7_c209_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1414_c7_c209_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1414_c7_c209]
signal tmp8_MUX_uxn_opcodes_h_l1414_c7_c209_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1414_c7_c209_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1414_c7_c209_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1414_c7_c209_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1414_c7_c209]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_c209_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_c209_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_c209_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_c209_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1414_c7_c209]
signal result_u16_value_MUX_uxn_opcodes_h_l1414_c7_c209_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1414_c7_c209_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1414_c7_c209_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1414_c7_c209_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1414_c7_c209]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_c209_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_c209_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_c209_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_c209_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1414_c7_c209]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_c209_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_c209_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_c209_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_c209_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1414_c7_c209]
signal result_u8_value_MUX_uxn_opcodes_h_l1414_c7_c209_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1414_c7_c209_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1414_c7_c209_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1414_c7_c209_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1414_c7_c209]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_c209_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_c209_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_c209_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_c209_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1415_c3_a682]
signal BIN_OP_OR_uxn_opcodes_h_l1415_c3_a682_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1415_c3_a682_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1415_c3_a682_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1416_c30_c0af]
signal sp_relative_shift_uxn_opcodes_h_l1416_c30_c0af_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1416_c30_c0af_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1416_c30_c0af_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1416_c30_c0af_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1419_c11_8495]
signal BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8495_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8495_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8495_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1419_c7_3ccc]
signal tmp8_MUX_uxn_opcodes_h_l1419_c7_3ccc_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1419_c7_3ccc_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1419_c7_3ccc_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1419_c7_3ccc_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1419_c7_3ccc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_3ccc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_3ccc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_3ccc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_3ccc_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1419_c7_3ccc]
signal result_u8_value_MUX_uxn_opcodes_h_l1419_c7_3ccc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1419_c7_3ccc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1419_c7_3ccc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1419_c7_3ccc_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1419_c7_3ccc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_3ccc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_3ccc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_3ccc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_3ccc_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1419_c7_3ccc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_3ccc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_3ccc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_3ccc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_3ccc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1419_c7_3ccc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_3ccc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_3ccc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_3ccc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_3ccc_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1422_c11_8bfe]
signal BIN_OP_EQ_uxn_opcodes_h_l1422_c11_8bfe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1422_c11_8bfe_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1422_c11_8bfe_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1422_c7_7428]
signal tmp8_MUX_uxn_opcodes_h_l1422_c7_7428_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1422_c7_7428_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1422_c7_7428_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1422_c7_7428_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1422_c7_7428]
signal result_u8_value_MUX_uxn_opcodes_h_l1422_c7_7428_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1422_c7_7428_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1422_c7_7428_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1422_c7_7428_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1422_c7_7428]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_7428_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_7428_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_7428_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_7428_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1422_c7_7428]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_7428_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_7428_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_7428_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_7428_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1422_c7_7428]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_7428_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_7428_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_7428_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_7428_return_output : unsigned(3 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_6145( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_ram_write := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.u16_value := ref_toks_6;
      base.is_stack_index_flipped := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.is_opc_done := ref_toks_9;
      base.stack_address_sp_offset := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1394_c6_54c9
BIN_OP_EQ_uxn_opcodes_h_l1394_c6_54c9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1394_c6_54c9_left,
BIN_OP_EQ_uxn_opcodes_h_l1394_c6_54c9_right,
BIN_OP_EQ_uxn_opcodes_h_l1394_c6_54c9_return_output);

-- t16_MUX_uxn_opcodes_h_l1394_c2_c2e3
t16_MUX_uxn_opcodes_h_l1394_c2_c2e3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond,
t16_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue,
t16_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse,
t16_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1394_c2_c2e3
tmp8_MUX_uxn_opcodes_h_l1394_c2_c2e3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond,
tmp8_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue,
tmp8_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse,
tmp8_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3
result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_c2e3
result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_c2e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3
result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_c2e3
result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_c2e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1394_c2_c2e3
result_u8_value_MUX_uxn_opcodes_h_l1394_c2_c2e3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1394_c2_c2e3
result_u16_value_MUX_uxn_opcodes_h_l1394_c2_c2e3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond,
result_u16_value_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_c2e3
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_c2e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_c2e3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_c2e3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_c2e3
result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_c2e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_c2e3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_c2e3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1713
BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1713 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1713_left,
BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1713_right,
BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1713_return_output);

-- t16_MUX_uxn_opcodes_h_l1407_c7_1cd0
t16_MUX_uxn_opcodes_h_l1407_c7_1cd0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1407_c7_1cd0_cond,
t16_MUX_uxn_opcodes_h_l1407_c7_1cd0_iftrue,
t16_MUX_uxn_opcodes_h_l1407_c7_1cd0_iffalse,
t16_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1407_c7_1cd0
tmp8_MUX_uxn_opcodes_h_l1407_c7_1cd0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1407_c7_1cd0_cond,
tmp8_MUX_uxn_opcodes_h_l1407_c7_1cd0_iftrue,
tmp8_MUX_uxn_opcodes_h_l1407_c7_1cd0_iffalse,
tmp8_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1cd0
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1cd0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1cd0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1cd0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1cd0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1cd0
result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1cd0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1cd0_cond,
result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1cd0_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1cd0_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1cd0
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1cd0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1cd0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1cd0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1cd0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1cd0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1cd0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1cd0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1cd0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1cd0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1cd0
result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1cd0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1cd0_cond,
result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1cd0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1cd0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1cd0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1cd0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1cd0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1cd0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1cd0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1410_c11_3efe
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_3efe : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_3efe_left,
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_3efe_right,
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_3efe_return_output);

-- t16_MUX_uxn_opcodes_h_l1410_c7_4d9a
t16_MUX_uxn_opcodes_h_l1410_c7_4d9a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1410_c7_4d9a_cond,
t16_MUX_uxn_opcodes_h_l1410_c7_4d9a_iftrue,
t16_MUX_uxn_opcodes_h_l1410_c7_4d9a_iffalse,
t16_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1410_c7_4d9a
tmp8_MUX_uxn_opcodes_h_l1410_c7_4d9a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1410_c7_4d9a_cond,
tmp8_MUX_uxn_opcodes_h_l1410_c7_4d9a_iftrue,
tmp8_MUX_uxn_opcodes_h_l1410_c7_4d9a_iffalse,
tmp8_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_4d9a
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_4d9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_4d9a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_4d9a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_4d9a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1410_c7_4d9a
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_4d9a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_4d9a_cond,
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_4d9a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_4d9a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_4d9a
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_4d9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_4d9a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_4d9a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_4d9a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_4d9a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_4d9a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_4d9a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_4d9a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_4d9a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1410_c7_4d9a
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_4d9a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_4d9a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_4d9a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_4d9a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_4d9a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_4d9a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_4d9a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_4d9a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_4d9a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1412_c3_0006
CONST_SL_8_uxn_opcodes_h_l1412_c3_0006 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1412_c3_0006_x,
CONST_SL_8_uxn_opcodes_h_l1412_c3_0006_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7f42
BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7f42 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7f42_left,
BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7f42_right,
BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7f42_return_output);

-- t16_MUX_uxn_opcodes_h_l1414_c7_c209
t16_MUX_uxn_opcodes_h_l1414_c7_c209 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1414_c7_c209_cond,
t16_MUX_uxn_opcodes_h_l1414_c7_c209_iftrue,
t16_MUX_uxn_opcodes_h_l1414_c7_c209_iffalse,
t16_MUX_uxn_opcodes_h_l1414_c7_c209_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1414_c7_c209
tmp8_MUX_uxn_opcodes_h_l1414_c7_c209 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1414_c7_c209_cond,
tmp8_MUX_uxn_opcodes_h_l1414_c7_c209_iftrue,
tmp8_MUX_uxn_opcodes_h_l1414_c7_c209_iffalse,
tmp8_MUX_uxn_opcodes_h_l1414_c7_c209_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_c209
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_c209 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_c209_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_c209_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_c209_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_c209_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1414_c7_c209
result_u16_value_MUX_uxn_opcodes_h_l1414_c7_c209 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1414_c7_c209_cond,
result_u16_value_MUX_uxn_opcodes_h_l1414_c7_c209_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1414_c7_c209_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1414_c7_c209_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_c209
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_c209 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_c209_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_c209_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_c209_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_c209_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_c209
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_c209 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_c209_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_c209_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_c209_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_c209_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1414_c7_c209
result_u8_value_MUX_uxn_opcodes_h_l1414_c7_c209 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1414_c7_c209_cond,
result_u8_value_MUX_uxn_opcodes_h_l1414_c7_c209_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1414_c7_c209_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1414_c7_c209_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_c209
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_c209 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_c209_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_c209_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_c209_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_c209_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1415_c3_a682
BIN_OP_OR_uxn_opcodes_h_l1415_c3_a682 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1415_c3_a682_left,
BIN_OP_OR_uxn_opcodes_h_l1415_c3_a682_right,
BIN_OP_OR_uxn_opcodes_h_l1415_c3_a682_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1416_c30_c0af
sp_relative_shift_uxn_opcodes_h_l1416_c30_c0af : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1416_c30_c0af_ins,
sp_relative_shift_uxn_opcodes_h_l1416_c30_c0af_x,
sp_relative_shift_uxn_opcodes_h_l1416_c30_c0af_y,
sp_relative_shift_uxn_opcodes_h_l1416_c30_c0af_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8495
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8495 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8495_left,
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8495_right,
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8495_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1419_c7_3ccc
tmp8_MUX_uxn_opcodes_h_l1419_c7_3ccc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1419_c7_3ccc_cond,
tmp8_MUX_uxn_opcodes_h_l1419_c7_3ccc_iftrue,
tmp8_MUX_uxn_opcodes_h_l1419_c7_3ccc_iffalse,
tmp8_MUX_uxn_opcodes_h_l1419_c7_3ccc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_3ccc
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_3ccc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_3ccc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_3ccc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_3ccc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_3ccc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1419_c7_3ccc
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_3ccc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_3ccc_cond,
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_3ccc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_3ccc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_3ccc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_3ccc
result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_3ccc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_3ccc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_3ccc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_3ccc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_3ccc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_3ccc
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_3ccc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_3ccc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_3ccc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_3ccc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_3ccc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_3ccc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_3ccc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_3ccc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_3ccc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_3ccc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_3ccc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1422_c11_8bfe
BIN_OP_EQ_uxn_opcodes_h_l1422_c11_8bfe : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1422_c11_8bfe_left,
BIN_OP_EQ_uxn_opcodes_h_l1422_c11_8bfe_right,
BIN_OP_EQ_uxn_opcodes_h_l1422_c11_8bfe_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1422_c7_7428
tmp8_MUX_uxn_opcodes_h_l1422_c7_7428 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1422_c7_7428_cond,
tmp8_MUX_uxn_opcodes_h_l1422_c7_7428_iftrue,
tmp8_MUX_uxn_opcodes_h_l1422_c7_7428_iffalse,
tmp8_MUX_uxn_opcodes_h_l1422_c7_7428_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1422_c7_7428
result_u8_value_MUX_uxn_opcodes_h_l1422_c7_7428 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1422_c7_7428_cond,
result_u8_value_MUX_uxn_opcodes_h_l1422_c7_7428_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1422_c7_7428_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1422_c7_7428_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_7428
result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_7428 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_7428_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_7428_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_7428_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_7428_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_7428
result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_7428 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_7428_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_7428_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_7428_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_7428_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_7428
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_7428 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_7428_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_7428_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_7428_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_7428_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1394_c6_54c9_return_output,
 t16_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output,
 tmp8_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1713_return_output,
 t16_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output,
 tmp8_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1410_c11_3efe_return_output,
 t16_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output,
 tmp8_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output,
 CONST_SL_8_uxn_opcodes_h_l1412_c3_0006_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7f42_return_output,
 t16_MUX_uxn_opcodes_h_l1414_c7_c209_return_output,
 tmp8_MUX_uxn_opcodes_h_l1414_c7_c209_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_c209_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1414_c7_c209_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_c209_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_c209_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1414_c7_c209_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_c209_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1415_c3_a682_return_output,
 sp_relative_shift_uxn_opcodes_h_l1416_c30_c0af_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8495_return_output,
 tmp8_MUX_uxn_opcodes_h_l1419_c7_3ccc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_3ccc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1419_c7_3ccc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_3ccc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_3ccc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_3ccc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1422_c11_8bfe_return_output,
 tmp8_MUX_uxn_opcodes_h_l1422_c7_7428_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1422_c7_7428_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_7428_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_7428_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_7428_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_54c9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_54c9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_54c9_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1394_c2_c2e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1394_c2_c2e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1394_c2_c2e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1394_c2_c2e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1399_c3_58b2 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1404_c3_d957 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1713_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1713_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1713_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1407_c7_1cd0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1407_c7_1cd0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1407_c7_1cd0_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_1cd0_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_1cd0_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_1cd0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1cd0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1cd0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1cd0_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1cd0_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1cd0_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1cd0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1cd0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1cd0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1cd0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1cd0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1cd0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1cd0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1cd0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1cd0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1cd0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1cd0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1408_c3_b3c9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1cd0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1cd0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_3efe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_3efe_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_3efe_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1410_c7_4d9a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1410_c7_4d9a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1414_c7_c209_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1410_c7_4d9a_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_4d9a_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_4d9a_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_c209_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_4d9a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_4d9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_4d9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_c209_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_4d9a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_4d9a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_4d9a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_c209_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_4d9a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_4d9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_4d9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_c209_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_4d9a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_4d9a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_4d9a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_c209_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_4d9a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_4d9a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_4d9a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_c209_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_4d9a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_4d9a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_4d9a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_c209_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_4d9a_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1412_c3_0006_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1412_c3_0006_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7f42_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7f42_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7f42_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1414_c7_c209_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1414_c7_c209_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1414_c7_c209_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_c209_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_c209_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_3ccc_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_c209_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_c209_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_c209_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_3ccc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_c209_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_c209_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_c209_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_c209_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_c209_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_c209_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_3ccc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_c209_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_c209_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_c209_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_3ccc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_c209_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_c209_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_c209_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_3ccc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_c209_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_c209_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_c209_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_3ccc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_c209_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_a682_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_a682_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_a682_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_c0af_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_c0af_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_c0af_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_c0af_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8495_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8495_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8495_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_3ccc_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_3ccc_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_7428_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_3ccc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_3ccc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_3ccc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_7428_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_3ccc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_3ccc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_3ccc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_7428_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_3ccc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_3ccc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1420_c3_e6a4 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_3ccc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_3ccc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_3ccc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_3ccc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_7428_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_3ccc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_3ccc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_3ccc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_7428_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_3ccc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_8bfe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_8bfe_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_8bfe_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_7428_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_7428_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_7428_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_7428_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_7428_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_7428_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_7428_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_7428_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_7428_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_7428_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_7428_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_7428_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_7428_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1425_c3_ec4e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_7428_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_7428_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1422_l1419_l1414_l1410_l1407_l1394_DUPLICATE_a624_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1407_l1410_l1394_l1414_DUPLICATE_c1e8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1422_l1419_l1414_l1410_l1407_DUPLICATE_c936_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1422_l1419_l1414_l1410_l1407_DUPLICATE_5ffc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1419_l1410_DUPLICATE_ef31_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1415_l1411_DUPLICATE_e03c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1419_l1410_l1422_l1414_DUPLICATE_4dd7_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6145_uxn_opcodes_h_l1389_l1430_DUPLICATE_a984_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1713_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_7428_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1399_c3_58b2 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1399_c3_58b2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_3efe_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_7428_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8495_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7f42_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_8bfe_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1404_c3_d957 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1404_c3_d957;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1420_c3_e6a4 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_3ccc_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1420_c3_e6a4;
     VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_c0af_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_c0af_y := resize(to_signed(-1, 2), 4);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1408_c3_b3c9 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1cd0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1408_c3_b3c9;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1425_c3_ec4e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_7428_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1425_c3_ec4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_54c9_right := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_c0af_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_54c9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1713_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_3efe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7f42_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8495_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_8bfe_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_7428_iftrue := VAR_previous_ram_read;
     VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_7428_iftrue := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_a682_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1407_c7_1cd0_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1414_c7_c209_iffalse := t16;
     VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_1cd0_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_4d9a_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_c209_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_3ccc_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_7428_iffalse := tmp8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1394_c6_54c9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1394_c6_54c9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_54c9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1394_c6_54c9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_54c9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_54c9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1394_c6_54c9_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1394_c2_c2e3] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1394_c2_c2e3_return_output := result.is_pc_updated;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1415_l1411_DUPLICATE_e03c LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1415_l1411_DUPLICATE_e03c_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1422_l1419_l1414_l1410_l1407_l1394_DUPLICATE_a624 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1422_l1419_l1414_l1410_l1407_l1394_DUPLICATE_a624_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1422_l1419_l1414_l1410_l1407_DUPLICATE_5ffc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1422_l1419_l1414_l1410_l1407_DUPLICATE_5ffc_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1410_c11_3efe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1410_c11_3efe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_3efe_left;
     BIN_OP_EQ_uxn_opcodes_h_l1410_c11_3efe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_3efe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_3efe_return_output := BIN_OP_EQ_uxn_opcodes_h_l1410_c11_3efe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1422_c11_8bfe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1422_c11_8bfe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_8bfe_left;
     BIN_OP_EQ_uxn_opcodes_h_l1422_c11_8bfe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_8bfe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_8bfe_return_output := BIN_OP_EQ_uxn_opcodes_h_l1422_c11_8bfe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1407_c11_1713] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1713_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1713_left;
     BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1713_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1713_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1713_return_output := BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1713_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1394_c2_c2e3] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1394_c2_c2e3_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1422_l1419_l1414_l1410_l1407_DUPLICATE_c936 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1422_l1419_l1414_l1410_l1407_DUPLICATE_c936_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1419_c11_8495] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8495_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8495_left;
     BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8495_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8495_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8495_return_output := BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8495_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1416_c30_c0af] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1416_c30_c0af_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_c0af_ins;
     sp_relative_shift_uxn_opcodes_h_l1416_c30_c0af_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_c0af_x;
     sp_relative_shift_uxn_opcodes_h_l1416_c30_c0af_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_c0af_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_c0af_return_output := sp_relative_shift_uxn_opcodes_h_l1416_c30_c0af_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1394_c2_c2e3] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1394_c2_c2e3_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1419_l1410_l1422_l1414_DUPLICATE_4dd7 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1419_l1410_l1422_l1414_DUPLICATE_4dd7_return_output := result.stack_address_sp_offset;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1394_c2_c2e3] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1394_c2_c2e3_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1407_l1410_l1394_l1414_DUPLICATE_c1e8 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1407_l1410_l1394_l1414_DUPLICATE_c1e8_return_output := result.u16_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1419_l1410_DUPLICATE_ef31 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1419_l1410_DUPLICATE_ef31_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1414_c11_7f42] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7f42_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7f42_left;
     BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7f42_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7f42_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7f42_return_output := BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7f42_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_54c9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_54c9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_54c9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_54c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_54c9_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_54c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_54c9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_54c9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_54c9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_54c9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_54c9_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_54c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1cd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1713_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1cd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1713_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1cd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1713_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1cd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1713_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1cd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1713_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1cd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1713_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1407_c7_1cd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1713_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_1cd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1713_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_4d9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_3efe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_4d9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_3efe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_4d9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_3efe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_4d9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_3efe_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_4d9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_3efe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_4d9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_3efe_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1410_c7_4d9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_3efe_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_4d9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_3efe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_c209_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7f42_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_c209_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7f42_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_c209_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7f42_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_c209_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7f42_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_c209_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7f42_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_c209_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7f42_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1414_c7_c209_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7f42_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_c209_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_7f42_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_3ccc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8495_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_3ccc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8495_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_3ccc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8495_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_3ccc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8495_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_3ccc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8495_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_3ccc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8495_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_7428_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_8bfe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_7428_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_8bfe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_7428_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_8bfe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_7428_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_8bfe_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_7428_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_8bfe_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_a682_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1415_l1411_DUPLICATE_e03c_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1412_c3_0006_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1415_l1411_DUPLICATE_e03c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1cd0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1419_l1410_DUPLICATE_ef31_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_4d9a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1419_l1410_DUPLICATE_ef31_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_3ccc_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1419_l1410_DUPLICATE_ef31_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1407_l1410_l1394_l1414_DUPLICATE_c1e8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1cd0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1407_l1410_l1394_l1414_DUPLICATE_c1e8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_4d9a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1407_l1410_l1394_l1414_DUPLICATE_c1e8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_c209_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1407_l1410_l1394_l1414_DUPLICATE_c1e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1cd0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1422_l1419_l1414_l1410_l1407_DUPLICATE_c936_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_4d9a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1422_l1419_l1414_l1410_l1407_DUPLICATE_c936_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_c209_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1422_l1419_l1414_l1410_l1407_DUPLICATE_c936_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_3ccc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1422_l1419_l1414_l1410_l1407_DUPLICATE_c936_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_7428_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1422_l1419_l1414_l1410_l1407_DUPLICATE_c936_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1cd0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1422_l1419_l1414_l1410_l1407_DUPLICATE_5ffc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_4d9a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1422_l1419_l1414_l1410_l1407_DUPLICATE_5ffc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_c209_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1422_l1419_l1414_l1410_l1407_DUPLICATE_5ffc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_3ccc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1422_l1419_l1414_l1410_l1407_DUPLICATE_5ffc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_7428_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1422_l1419_l1414_l1410_l1407_DUPLICATE_5ffc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_4d9a_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1419_l1410_l1422_l1414_DUPLICATE_4dd7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_c209_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1419_l1410_l1422_l1414_DUPLICATE_4dd7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_3ccc_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1419_l1410_l1422_l1414_DUPLICATE_4dd7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_7428_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1419_l1410_l1422_l1414_DUPLICATE_4dd7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1422_l1419_l1414_l1410_l1407_l1394_DUPLICATE_a624_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1cd0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1422_l1419_l1414_l1410_l1407_l1394_DUPLICATE_a624_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_4d9a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1422_l1419_l1414_l1410_l1407_l1394_DUPLICATE_a624_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_c209_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1422_l1419_l1414_l1410_l1407_l1394_DUPLICATE_a624_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_3ccc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1422_l1419_l1414_l1410_l1407_l1394_DUPLICATE_a624_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_7428_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1422_l1419_l1414_l1410_l1407_l1394_DUPLICATE_a624_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1394_c2_c2e3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1394_c2_c2e3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1394_c2_c2e3_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1394_c2_c2e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_c209_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_c0af_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1422_c7_7428] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1422_c7_7428_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_7428_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1422_c7_7428_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_7428_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1422_c7_7428_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_7428_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_7428_return_output := result_u8_value_MUX_uxn_opcodes_h_l1422_c7_7428_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1394_c2_c2e3] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1415_c3_a682] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1415_c3_a682_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_a682_left;
     BIN_OP_OR_uxn_opcodes_h_l1415_c3_a682_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_a682_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_a682_return_output := BIN_OP_OR_uxn_opcodes_h_l1415_c3_a682_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1394_c2_c2e3] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1422_c7_7428] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_7428_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_7428_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_7428_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_7428_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_7428_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_7428_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_7428_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_7428_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1394_c2_c2e3] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1412_c3_0006] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1412_c3_0006_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1412_c3_0006_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1412_c3_0006_return_output := CONST_SL_8_uxn_opcodes_h_l1412_c3_0006_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1419_c7_3ccc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_3ccc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_3ccc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_3ccc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_3ccc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_3ccc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_3ccc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_3ccc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_3ccc_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1422_c7_7428] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1422_c7_7428_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_7428_cond;
     tmp8_MUX_uxn_opcodes_h_l1422_c7_7428_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_7428_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1422_c7_7428_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_7428_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_7428_return_output := tmp8_MUX_uxn_opcodes_h_l1422_c7_7428_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1394_c2_c2e3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1422_c7_7428] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_7428_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_7428_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_7428_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_7428_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_7428_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_7428_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_7428_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_7428_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1422_c7_7428] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_7428_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_7428_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_7428_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_7428_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_7428_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_7428_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_7428_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_7428_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_c209_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_a682_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1414_c7_c209_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_a682_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1410_c7_4d9a_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1412_c3_0006_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_3ccc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_7428_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_3ccc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_7428_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_c209_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_3ccc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_3ccc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_7428_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_3ccc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_7428_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_3ccc_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_7428_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1419_c7_3ccc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_3ccc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_3ccc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_3ccc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_3ccc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_3ccc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_3ccc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_3ccc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_3ccc_return_output;

     -- t16_MUX[uxn_opcodes_h_l1414_c7_c209] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1414_c7_c209_cond <= VAR_t16_MUX_uxn_opcodes_h_l1414_c7_c209_cond;
     t16_MUX_uxn_opcodes_h_l1414_c7_c209_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1414_c7_c209_iftrue;
     t16_MUX_uxn_opcodes_h_l1414_c7_c209_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1414_c7_c209_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1414_c7_c209_return_output := t16_MUX_uxn_opcodes_h_l1414_c7_c209_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1419_c7_3ccc] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1419_c7_3ccc_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_3ccc_cond;
     tmp8_MUX_uxn_opcodes_h_l1419_c7_3ccc_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_3ccc_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1419_c7_3ccc_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_3ccc_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_3ccc_return_output := tmp8_MUX_uxn_opcodes_h_l1419_c7_3ccc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1419_c7_3ccc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_3ccc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_3ccc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_3ccc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_3ccc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_3ccc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_3ccc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_3ccc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_3ccc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1419_c7_3ccc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_3ccc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_3ccc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_3ccc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_3ccc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_3ccc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_3ccc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_3ccc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_3ccc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1419_c7_3ccc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1419_c7_3ccc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_3ccc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1419_c7_3ccc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_3ccc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1419_c7_3ccc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_3ccc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_3ccc_return_output := result_u8_value_MUX_uxn_opcodes_h_l1419_c7_3ccc_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1414_c7_c209] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1414_c7_c209_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_c209_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1414_c7_c209_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_c209_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1414_c7_c209_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_c209_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_c209_return_output := result_u16_value_MUX_uxn_opcodes_h_l1414_c7_c209_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1414_c7_c209] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_c209_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_c209_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_c209_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_c209_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_c209_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_c209_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_c209_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_c209_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_c209_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_3ccc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_c209_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_3ccc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_4d9a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_c209_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_c209_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_3ccc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_4d9a_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_c209_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_c209_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_3ccc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1410_c7_4d9a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1414_c7_c209_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_c209_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_3ccc_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1414_c7_c209] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_c209_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_c209_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_c209_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_c209_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_c209_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_c209_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_c209_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_c209_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1414_c7_c209] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_c209_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_c209_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_c209_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_c209_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_c209_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_c209_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_c209_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_c209_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1410_c7_4d9a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_4d9a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_4d9a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_4d9a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_4d9a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_4d9a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_4d9a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output;

     -- t16_MUX[uxn_opcodes_h_l1410_c7_4d9a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1410_c7_4d9a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1410_c7_4d9a_cond;
     t16_MUX_uxn_opcodes_h_l1410_c7_4d9a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1410_c7_4d9a_iftrue;
     t16_MUX_uxn_opcodes_h_l1410_c7_4d9a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1410_c7_4d9a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output := t16_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1414_c7_c209] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1414_c7_c209_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_c209_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1414_c7_c209_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_c209_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1414_c7_c209_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_c209_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_c209_return_output := result_u8_value_MUX_uxn_opcodes_h_l1414_c7_c209_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1410_c7_4d9a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1410_c7_4d9a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_4d9a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1410_c7_4d9a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_4d9a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1410_c7_4d9a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_4d9a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output := result_u16_value_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1414_c7_c209] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_c209_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_c209_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_c209_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_c209_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_c209_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_c209_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_c209_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_c209_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1414_c7_c209] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1414_c7_c209_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_c209_cond;
     tmp8_MUX_uxn_opcodes_h_l1414_c7_c209_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_c209_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1414_c7_c209_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_c209_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_c209_return_output := tmp8_MUX_uxn_opcodes_h_l1414_c7_c209_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_4d9a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_c209_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_4d9a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_c209_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1cd0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_4d9a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_c209_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1cd0_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_4d9a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_c209_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1407_c7_1cd0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_4d9a_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_c209_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1410_c7_4d9a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_4d9a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_4d9a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_4d9a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_4d9a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_4d9a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_4d9a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1410_c7_4d9a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1410_c7_4d9a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_4d9a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1410_c7_4d9a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_4d9a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1410_c7_4d9a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_4d9a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1410_c7_4d9a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_4d9a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_4d9a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_4d9a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_4d9a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_4d9a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_4d9a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1407_c7_1cd0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1cd0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1cd0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1cd0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1cd0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1cd0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1cd0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1407_c7_1cd0] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1cd0_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1cd0_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1cd0_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1cd0_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1cd0_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1cd0_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output := result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output;

     -- t16_MUX[uxn_opcodes_h_l1407_c7_1cd0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1407_c7_1cd0_cond <= VAR_t16_MUX_uxn_opcodes_h_l1407_c7_1cd0_cond;
     t16_MUX_uxn_opcodes_h_l1407_c7_1cd0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1407_c7_1cd0_iftrue;
     t16_MUX_uxn_opcodes_h_l1407_c7_1cd0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1407_c7_1cd0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output := t16_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1410_c7_4d9a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_4d9a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_4d9a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_4d9a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_4d9a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_4d9a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_4d9a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1410_c7_4d9a] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1410_c7_4d9a_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_4d9a_cond;
     tmp8_MUX_uxn_opcodes_h_l1410_c7_4d9a_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_4d9a_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1410_c7_4d9a_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_4d9a_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output := tmp8_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1cd0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1cd0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1cd0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1cd0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_1cd0_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_4d9a_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l1407_c7_1cd0] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1407_c7_1cd0_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_1cd0_cond;
     tmp8_MUX_uxn_opcodes_h_l1407_c7_1cd0_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_1cd0_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1407_c7_1cd0_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_1cd0_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output := tmp8_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1394_c2_c2e3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1407_c7_1cd0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1cd0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1cd0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1cd0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1cd0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1cd0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1cd0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output := result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1394_c2_c2e3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output := result_u16_value_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output;

     -- t16_MUX[uxn_opcodes_h_l1394_c2_c2e3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond <= VAR_t16_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond;
     t16_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue;
     t16_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output := t16_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1407_c7_1cd0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1cd0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1cd0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1cd0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1cd0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1cd0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1cd0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1407_c7_1cd0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1cd0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1cd0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1cd0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1cd0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1cd0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1cd0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1407_c7_1cd0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1cd0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1cd0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1cd0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1cd0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1cd0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1cd0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_1cd0_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1394_c2_c2e3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1394_c2_c2e3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1394_c2_c2e3] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond;
     tmp8_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output := tmp8_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1394_c2_c2e3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1394_c2_c2e3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_c2e3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_c2e3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_c2e3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output;

     -- Submodule level 7
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_6145_uxn_opcodes_h_l1389_l1430_DUPLICATE_a984 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6145_uxn_opcodes_h_l1389_l1430_DUPLICATE_a984_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6145(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_c2e3_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6145_uxn_opcodes_h_l1389_l1430_DUPLICATE_a984_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6145_uxn_opcodes_h_l1389_l1430_DUPLICATE_a984_return_output;
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
